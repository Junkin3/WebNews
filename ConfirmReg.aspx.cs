using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection connect = new SqlConnection(conn);
        if (!string.IsNullOrEmpty(concode.Value))
        {

            string secretKey = "6Lfv2Q4lAAAAAFi2yWzYvJQZmrIKbpQpGyrls-8S";
            string response = Request.Form["g-recaptcha-response"];
            var client = new WebClient();
            string result = client.DownloadString(
            string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
            var obj = JObject.Parse(result);
            var status = (bool)obj.SelectToken("success");
            if (status)
            {
                string Confirm = concode.Value.Trim();

                using (SqlCommand command = new SqlCommand("UPDATE NguoiDung SET isConfirm = 1 WHERE MaXacNhan = @ConfirmationCode", connect))
                {
                    connect.Open();
                    command.Parameters.Clear();
                    command.Parameters.AddWithValue("@ConfirmationCode", Confirm);
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Redirect("~/DangNhap.aspx");
                    }
                    else
                    {
                        lbConcodeerror.Text = "Mã xác nhận không hợp lệ";
                    }
                }
            }
            else
            {
                Thongbao.Text = "Vui lòng xác nhận captcha";
            }
        }
        else
        {
            lbConcodeerror.Text = "Vui lòng nhập code xác nhận";
        }
    }
}
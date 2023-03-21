using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Helpers;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DoiMatKhau : System.Web.UI.Page
{
    
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        string manguoidung = Request.QueryString["idnguoidung"];
        //string manguoidung = "1";
        idnguoidung.InnerText = manguoidung;
    }

    public bool IsStrongPassword(string password)
    {

        if (password.Length < 8)
        {
            return false;
        }


        Regex regex = new Regex(@"[!@#$%^&*()_+=\[{\]};:<>|./?,-]");
        if (!regex.IsMatch(password))
        {
            return false;
        }

        return true;
    }

    protected void btndoipass_Click(object sender, EventArgs e)
    {
        lbPassCuError.Text = lbPassMoiCfError.Text = lbPassCuError.Text= lbPassMoiError.Text= lbPassMoiCfError.Text=string.Empty;

        if (!string.IsNullOrEmpty(passcu.Value))
        {
            if (!string.IsNullOrEmpty(passmoi.Value))
            {
                if (!string.IsNullOrEmpty(passmoicf.Value))
                {
                    if (!IsStrongPassword(passmoi.Value))
                    { lbPassMoiError.Text = "Mật khẩu chứa 8 kí tự hoặc chưa đủ mạnh"; }
                    else
                    {
                        string secretKey = "6Lfv2Q4lAAAAAFi2yWzYvJQZmrIKbpQpGyrls-8S";
                        string response = Request.Form["g-recaptcha-response"];
                        var client = new WebClient();
                        string result = client.DownloadString(
                        string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
                        var obj = JObject.Parse(result);
                        var status = (bool)obj.SelectToken("success");
                        if (status == true)
                        {
                            conn.Open();
                            using (SqlCommand command = new SqlCommand("SELECT MatKhau FROM NguoiDung WHERE IDNguoiDung = @IDNguoiDung", conn))
                            {
                                command.Parameters.AddWithValue("@IDNguoiDung", idnguoidung.InnerText.Trim());
                                SqlDataReader reader = command.ExecuteReader();
                                if (reader.Read())
                                {
                                    if (passmoi.Value == passmoicf.Value)
                                    {
                                        string pass = passcu.Value.Trim();
                                        string kiemtrapasscu = reader["MatKhau"].ToString();
                                        if (passmoi.Value != passcu.Value)
                                        {
                                            string hashedPassword = BCrypt.Net.BCrypt.HashPassword(passmoi.Value.Trim(), 10);
                                            if (BCrypt.Net.BCrypt.Verify(pass, kiemtrapasscu))
                                            {
                                                reader.Close();
                                                SqlCommand setpass = new SqlCommand("UPDATE NguoiDung SET MatKhau = @MatKhau WHERE IDNguoiDung = @IDNguoiDung", conn);
                                                setpass.Parameters.AddWithValue("@MatKhau", hashedPassword);
                                                setpass.Parameters.AddWithValue("@IDNguoiDung", idnguoidung.InnerText.Trim());
                                                setpass.ExecuteNonQuery();
                                                Thongbao.Text = "Đổi mật khẩu thành công";

                                            } else { Thongbao.Text = "Mật khẩu cũ không đúng"; }
                                        }
                                        else { Thongbao.Text = "Mật khẩu mới trùng với mật khẩu cũ"; }
                                    }
                                    else { lbPassMoiCfError.Text = "Mật khẩu xác nhận không trùng khớp"; }
                                }
                            }

                        }else { Thongbao.Text = "Vui lòng tick chọn captcha"; }
                    }
                    
                }
                else { lbPassMoiCfError.Text = "Mật khẩu không được bỏ trống"; }
            }
            else { lbPassMoiError.Text = "Mật khẩu không được bỏ trống"; }
        }
        else { lbPassCuError.Text = "Mật khẩu không được bỏ trống"; }
    }
}
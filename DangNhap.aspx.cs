using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using BCrypt.Net;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;
using System.Drawing.Imaging;
using SendGrid.Helpers.Mail;
using SendGrid;

public partial class DangNhap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbUsererror.Text = string.Empty;
        lbPasserror.Text = string.Empty;
    }

    protected async void SendMail(string confirmationCode, string mail)
    {
        string apiKey = "API";
        var client2 = new SendGridClient(apiKey);
        var from = new EmailAddress("mailconfirm589@mail.com", "Confirm");
        var subject = "Xác nhận đăng kí";
        var to = new EmailAddress(mail, "");
        var plainTextContent = "Mã xác nhận của bạn là: " + confirmationCode;
        var htmlContent = "Mã xác nhận của bạn là: <strong>" + confirmationCode + "</strong>";
        var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
        var response2 = await client2.SendEmailAsync(msg);
    }

    protected void btnlogin_ServerClick(object sender, EventArgs e)
    {
        string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;

        if (!string.IsNullOrEmpty(username.Value))
        {
            if (!string.IsNullOrEmpty(password.Value))
            {
                string email = username.Value.Trim();
                string pass = password.Value.Trim();

                string secretKey = "6Lfv2Q4lAAAAAFi2yWzYvJQZmrIKbpQpGyrls-8S";
                string response = Request.Form["g-recaptcha-response"];
                var client = new WebClient();
                string result = client.DownloadString(
                string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
                var obj = JObject.Parse(result);
                var status = (bool)obj.SelectToken("success");

                if (status == true)
                {
                    using (SqlConnection connection = new SqlConnection(conn))
                    {
                        connection.Open();
                        using (SqlCommand command = new SqlCommand("SELECT MatKhau,isConfirm,MaXacNhan,IDNguoiDung FROM NguoiDung WHERE Email = @Email", connection))
                        {
                            command.Parameters.AddWithValue("@Email", email);
                            using (SqlDataReader reader = command.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    string hashedPassword = reader.GetString(0);
                                    int isConfirm = reader.GetInt32(1);
                                    string code = reader.GetString(2);
                                    int ID = reader.GetInt32(3);

                                    if (BCrypt.Net.BCrypt.Verify(pass, hashedPassword))
                                    {
                                        if (isConfirm == 0)
                                        {
                                            Thongbao.Text = "Tài khoản chưa được xác nhận";
                                            Response.Redirect("~/ConfirmReg.aspx");
                                            SendMail(email, code);
                                        }
                                        else
                                        {
                                            string id = ID.ToString();
                                            //int endcodeID = Server.UrlEncode(id);
                                            Response.Redirect("~/Default.aspx?idnguoidung=" + id);
                                            FormsAuthentication.RedirectFromLoginPage(email, true);
                                        }
                                    }
                                    else { lbPasserror.Text = "Sai mật khẩu"; }
                                }
                                else { lbUsererror.Text = "Tài khoản không tồn tại"; }
                            }
                        }
                    }
                }
                else { Thongbao.Text = "Vui lòng tick chọn captcha"; }
            }
            else { lbPasserror.Text = "Mật khẩu không được bỏ trống"; }
        }
        else { lbUsererror.Text = "Email không được bỏ trống"; }
    }

    protected void forgot_ServerClick(object sender, EventArgs e)
    {

    }
}
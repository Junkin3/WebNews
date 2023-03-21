using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Net.Mail;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;
using System.Text.RegularExpressions;
public partial class Dangki : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        lbFnameError.Text = string.Empty;
        lbLnameError.Text = string.Empty;
        lblEmailError.Text = string.Empty;
        lbPhoneError.Text = string.Empty;
        lbBirthdayError.Text = string.Empty;
        lbPassError.Text = string.Empty;
        lbPasscon.Text = string.Empty;
    }

    private bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
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

    private bool IsVaildNum(string num)
    {
        if (num.Length > 10)
        {
            return false;
        }
        if (!Regex.IsMatch(num, @"^[\d]+$"))
        {
            return false;
        }
        return true;
    }

    protected async void btnsignup_ServerClick(object sender, EventArgs e)
    {
        string conn = ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString;
        SqlConnection connect = new SqlConnection(conn);

        if (!string.IsNullOrEmpty(fname.Value))
        {
            if (!string.IsNullOrEmpty(lname.Value))
            {
                if (!string.IsNullOrEmpty(email.Value))
                {
                    if (!string.IsNullOrEmpty(phone.Value))
                    {
                        if (!string.IsNullOrEmpty(birthday.Value))
                        {
                            if (!string.IsNullOrEmpty(pass.Value))
                            {
                                if (!string.IsNullOrEmpty(passconfirm.Value))
                                {

                                    string firstn = fname.Value.Trim();
                                    string lastn = lname.Value.Trim();
                                    string mail = email.Value.Trim();
                                    string num = phone.Value.Trim();
                                    string birth = birthday.Value;
                                    string gt = male.Checked ? "Nam" : "Nữ";


                                    string password = pass.Value.Trim();
                                    string confirmpass = passconfirm.Value.Trim();
                                    string confirmationCode = Guid.NewGuid().ToString("N");
                                    string hashedPassword = BCrypt.Net.BCrypt.HashPassword(password, 10);

                                    string secretKey = "6Lfv2Q4lAAAAAFi2yWzYvJQZmrIKbpQpGyrls-8S";
                                    string response = Request.Form["g-recaptcha-response"];
                                    var client = new WebClient();
                                    string result = client.DownloadString(
                                    string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", secretKey, response));
                                    var obj = JObject.Parse(result);
                                    var status = (bool)obj.SelectToken("success");

                                    if (!IsValidEmail(mail)) { lblEmailError.Text = "Email không hợp lệ"; }
                                    else 
                                    {
                                        if (!IsVaildNum(num)) { lbPhoneError.Text = "Số điện thoại không hợp lệ"; }
                                        else 
                                        {
                                            if (!IsStrongPassword(password)) { lbPassError.Text = "Mật khẩu chứa 8 kí tự hoặc chưa đủ mạnh"; }
                                            else
                                            {
                                                if (password != confirmpass)
                                                {
                                                    Thongbao.Text = "Mật khẩu xác nhận chưa đúng";
                                                }
                                                else
                                                {
                                                    if (status == true)
                                                    {
                                                        using (SqlConnection connection = new SqlConnection(conn))
                                                        {
                                                            connection.Open();

                                                            using (SqlCommand command = new SqlCommand("SELECT Email FROM NguoiDung WHERE Email = @Email", connection))
                                                            {
                                                                command.Parameters.AddWithValue("@Email", mail);

                                                                using (SqlDataReader reader = command.ExecuteReader())
                                                                {
                                                                    if (reader.HasRows)
                                                                    {
                                                                        lblEmailError.Text = "Email đã tồn tại";
                                                                    }
                                                                    else
                                                                    {
                                                                        reader.Close();
                                                                        using (SqlCommand command2 = new SqlCommand("INSERT INTO [dbo].[NguoiDung] ([TenNguoiDung] ,[HoNguoiDung] ,[Email] ,[SoDienThoai] ,[MatKhau] ,[NgaySinh] ,[GioiTinh] ,[MaXacNhan]) VALUES  (@ten,@ho,@mail,@sdt,@hashpass,@birth,@gt,@maxacnhan)", connection))
                                                                        {
                                                                            command2.Parameters.AddWithValue("@ten", lastn);
                                                                            command2.Parameters.AddWithValue("@ho", firstn);
                                                                            command2.Parameters.AddWithValue("@mail", mail);
                                                                            command2.Parameters.AddWithValue("@sdt", num);
                                                                            command2.Parameters.AddWithValue("@hashpass", hashedPassword);
                                                                            command2.Parameters.AddWithValue("@birth", birth);
                                                                            command2.Parameters.AddWithValue("@gt", gt);
                                                                            command2.Parameters.AddWithValue("@maxacnhan", confirmationCode);
                                                                            command2.ExecuteNonQuery();
                                                                        }
                                                                        string apiKey = "API";
                                                                        var client2 = new SendGridClient(apiKey);
                                                                        var from = new EmailAddress("confirmmail588@mail.com", "Confirm");
                                                                        var subject = "Xác nhận đăng kí";
                                                                        var to = new EmailAddress(mail, lastn);
                                                                        var plainTextContent = "Mã xác nhận của bạn là: " + confirmationCode;
                                                                        var htmlContent = "Mã xác nhận của bạn là: <strong>" + confirmationCode + "</strong>";
                                                                        var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                                                                        var response2 = await client2.SendEmailAsync(msg);

                                                                        if (response2.StatusCode == System.Net.HttpStatusCode.Accepted)
                                                                        {

                                                                            Response.Redirect("~/ConfirmReg.aspx");
                                                                        }
                                                                        else
                                                                        {
                                                                            lblEmailError.Text = "Có lỗi xảy ra khi gửi email xác nhận.";
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        Thongbao.Text = "Vui lòng tick chọn captcha";
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                else { lbPasscon.Text = "Vui lòng xác nhận mật khẩu"; }
                            }
                            else { lbPassError.Text = "Mật khẩu không được bỏ trống"; }
                        }
                        else { lbBirthdayError.Text = "Ngày sinh không được bỏ trống"; }
                    }
                    else { lbPhoneError.Text = "Số điện thoại không được bỏ trống"; }
                }
                else { lblEmailError.Text = "Email không được bỏ trống"; }
            }
            else { lbLnameError.Text = "Họ không được bỏ trống!"; }
        }
        else { lbFnameError.Text = "Tên không được bỏ trống!"; }
    }
}
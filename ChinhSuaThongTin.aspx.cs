using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChinhSuaThongTin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        string manguoidung = Request.QueryString["idnguoidung"];
        if (manguoidung != null)
        {
            SqlCommand layten = new SqlCommand("select d.*, TenQuyenHan" +
                                                " from NguoiDung d, Quyenhan q " +
                                                " where d.IDQuyenHan = q.IDQuyenHan and d.IDNguoiDung = @IDNguoiDung", conn);
            layten.Parameters.AddWithValue("@IDNguoiDung", manguoidung);
            SqlDataReader reader = layten.ExecuteReader();
            if (reader.Read())
            {
                lbFnameError.Text = reader["TenNguoiDung"].ToString();
                lbLnameError.Text = reader["HoNguoiDung"].ToString();
                lblEmailError.Text = reader["Email"].ToString();
                lbPhoneError.Text = reader["SoDienThoai"].ToString();
                lbBirthdayError.Text = reader["NgaySinh"].ToString();
                if (reader["GioiTinh"].ToString() == "Nam")
                {
                    male.Checked = true;
                }
                else { female.Checked = true; }
                idnguoidung.InnerText = reader["IDNguoiDung"].ToString();
            }
            reader.Close();
        }
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

    protected void btnsave_ServerClick(object sender, EventArgs e)
    {
        SqlCommand layten = new SqlCommand("UPDATE NguoiDung" +
                                            " SET TenNguoiDung = @TenNguoiDung, HoNguoiDung = @HoNguoiDung, Email = @Email, SoDienThoai = @SoDienThoai, NgaySinh = @NgaySinh, GioiTinh = @GioiTinh" +
                                            " WHERE IDNguoiDung = @IDNguoiDung;", conn);
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
                            if (!IsValidEmail(email.Value.Trim())) { lblEmailError.Text = "Email không hợp lệ"; }
                            else
                            {
                                if (!IsVaildNum(phone.Value.Trim())) { lbPhoneError.Text = "Số điện thoại không hợp lệ"; }
                                else
                                {
                                    string id = idnguoidung.InnerText.Trim();
                                    string firstn = fname.Value.Trim();
                                    string lastn = lname.Value.Trim();
                                    string mail = email.Value.Trim();
                                    string num = phone.Value.Trim();
                                    string birth = birthday.Value;
                                    string gt = male.Checked ? "Nam" : "Nữ";

                                    layten.Parameters.AddWithValue("@TenNguoiDung", firstn);
                                    layten.Parameters.AddWithValue("@HoNguoiDung", lastn);
                                    layten.Parameters.AddWithValue("@Email", mail);
                                    layten.Parameters.AddWithValue("@SoDienThoai", num);
                                    layten.Parameters.AddWithValue("@NgaySinh", birth);
                                    layten.Parameters.AddWithValue("@GioiTinh", gt);
                                    layten.Parameters.AddWithValue("@IDNguoiDung", id);
                                    layten.ExecuteNonQuery();

                                    ThongBao.Text = "Sửa thông tin thành công";
                                }
                            }
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
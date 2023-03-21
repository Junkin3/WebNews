using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        string manguoidung = Request.QueryString["idnguoidung"];
        //string manguoidung = "0";
        if (manguoidung != null)
        {
            SqlCommand layten = new SqlCommand("select d.*, TenQuyenHan" +
                                                " from NguoiDung d, Quyenhan q " +
                                                " where d.IDQuyenHan = q.IDQuyenHan and d.IDNguoiDung = @IDNguoiDung", conn);
            layten.Parameters.AddWithValue("@IDNguoiDung", manguoidung);
            SqlDataReader reader = layten.ExecuteReader();
            if (reader.Read())
            {
                quyenhan.InnerText = reader["TenQuyenHan"].ToString();
                tennguoidung.InnerText = reader["TenNguoiDung"].ToString();
                honguoidung.InnerText = reader["HoNguoiDung"].ToString() ;
                email.InnerText = reader["Email"].ToString();
                phone.InnerText = reader["SoDienThoai"].ToString();
                birth.InnerText = reader["NgaySinh"].ToString();
                gioitinh.InnerText = reader["GioiTinh"].ToString();
                idnguoidung.InnerText = reader["IDNguoiDung"].ToString();
            }
        }
        if(manguoidung == "2")
        {
            upnews.Visible = false;
            editnews.Visible = false;
        }
        else
        {
            upnews.Visible = true;
            editnews.Visible = true;
        }
    }

    protected void editinfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ChinhSuaThongTin.aspx?iduser=" + idnguoidung.InnerText);
    }

    protected void upnews_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DangTin.aspx?idnguoidung=" + idnguoidung.InnerText);
    }

    protected void editnews_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ChinhSuaTin.aspx?idnguoidung=" + idnguoidung.InnerText);
    }

    protected void passchange_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/DoiMatKhau.aspx?idnguoidung=" + idnguoidung.InnerText);
    }

    protected void logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Default.aspx");
    }
}
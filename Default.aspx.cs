using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.Helpers;

public partial class Default : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        string manguoidung = Request.QueryString["idnguoidung"];
        //string manguoidung = "3";

        idnguoidung.InnerText = manguoidung;
        string end = Server.UrlEncode(manguoidung);
        editinfo.Attributes.Add("href", "~/ChinhSuaThongTin.aspx?idnguoidung=" + end);
        upnews.Attributes.Add("href", "~/DangTin.aspx?idnguoidung=" + end);
        editnews.Attributes.Add("href", "~/ChinhSuaTin.aspx?idnguoidung=" + end);
        changepass.Attributes.Add("href", "~/DoiMatKhau.aspx?idnguoidung=" + end);
        adminlink.Attributes.Add("href", "~/admin.aspx?idnguoidung=" + end);

        if (manguoidung != null)
        {
            
            SqlCommand layten = new SqlCommand("select IDQuyenHan, TenNguoiDung from NguoiDung where IDNguoiDung = @IDNguoiDung", conn);
            layten.Parameters.AddWithValue("@IDNguoiDung", manguoidung);
            SqlDataReader readid = layten.ExecuteReader();
            if (readid.Read())
            {
                tennguoidung.InnerText = readid["TenNguoiDung"].ToString();
                btndangnhap.Style.Add("display", "none");
                btndangky.Style.Add("display", "none");
                if (readid["IDQuyenHan"].ToString() == "0")
                {
                    upnews.Visible = true;
                    editnews.Visible = true;
                }
                else
                {
                    upnews.Visible = false;
                    editnews.Visible = false;
                }
            }
            readid.Close();        }
        else
        {
            tennguoidung.Visible = false;
        }

        SqlCommand laytheloaicmd = new SqlCommand("select * from TheLoai", conn);
        SqlDataReader laytheloaidr = laytheloaicmd.ExecuteReader();
        while (laytheloaidr.Read())
        {
            
            menutheloai1.InnerText = menutheloaibottom1.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai2.InnerText = menutheloaibottom2.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai3.InnerText = menutheloaibottom3.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai4.InnerText = menutheloaibottom4.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai5.InnerText = menutheloaibottom5.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai6.InnerText = menutheloaibottom6.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai7.InnerText = menutheloaibottom7.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai8.InnerText = menutheloaibottom8.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
            menutheloai9.InnerText = menutheloaibottom9.InnerText = laytheloaidr["TenTheLoai"].ToString(); laytheloaidr.Read();
        }
        laytheloaidr.Close();

        //lấy dữ liệu ngược từ cơ sở dữ liệu theo IDTin(lấy từ mới tới cũ)
        string laytin = "select top 20 t.IDTin, TuaTin, NoiDung, HinhAnh, NgayTao, TenTheLoai, TenNguoiDung" +
                        " from Tin t, TheLoai l, NguoiDung n" +
                        " where t.IDTheLoai = l.IDTheLoai and t.IDNguoiDang = n.IDNguoiDung" +
                        " order by t.IDTin desc";
        SqlCommand laytincmd = new SqlCommand(laytin, conn);
        SqlDataReader laytindr = laytincmd.ExecuteReader();
        while (laytindr.Read())//kiểm tra còn hàng dữ liệu trong SqlDataReader hay không
        {
            idtin1.InnerText = laytindr["IDTin"].ToString();
            tuatin1.InnerText = tuatinbottom1.InnerText = laytindr["TuaTin"].ToString();
            theloai1.InnerText = theloaibottom1.InnerText = laytindr["TenTheLoai"].ToString();

            

            byte[] imagedata1 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata1))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image1.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata1);
            }
            ngaydang1.InnerText = ngaydangbottom1.InnerText = laytindr["NgayTao"].ToString(); 

            laytindr.Read();//đọc hàng dữ liệu tiếp theo
            idtin2.InnerText = laytindr["IDTin"].ToString();
            tuatin2.InnerText = tuatinbottom2.InnerText = laytindr["TuaTin"].ToString();
            theloai2.InnerText = theloaibottom2.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata2 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata2))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image2.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata2);
            }
            ngaydang2.InnerText = ngaydangbottom2.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin3.InnerText = laytindr["IDTin"].ToString();
            tuatin3.InnerText = laytindr["TuaTin"].ToString();
            theloai3.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata3 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata3))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image3.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata3);
            }
            ngaydang3.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin4.InnerText = laytindr["IDTin"].ToString();
            tuatin4.InnerText = laytindr["TuaTin"].ToString();
            theloai4.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata4 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata4))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image4.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata4);
            }
            ngaydang4.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin5.InnerText = laytindr["IDTin"].ToString();
            tuatin5.InnerText = laytindr["TuaTin"].ToString();
            theloai5.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata5 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata5))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image5.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata5);
            }
            ngaydang5.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin6.InnerText = laytindr["IDTin"].ToString();
            tuatin6.InnerText = laytindr["TuaTin"].ToString();
            theloai6.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata6 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata6))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image6.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata6);
            }
            ngaydang6.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin7.InnerText = laytindr["IDTin"].ToString();
            tuatin7.InnerText = laytindr["TuaTin"].ToString();
            theloai7.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata7 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata7))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image7.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata7);
            }
            ngaydang7.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin8.InnerText = laytindr["IDTin"].ToString();
            tuatin8.InnerText = laytindr["TuaTin"].ToString();
            theloai8.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata8 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata8))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image8.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata8);
            }
            ngaydang8.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin9.InnerText = laytindr["IDTin"].ToString();
            tuatin9.InnerText = laytindr["TuaTin"].ToString();
            theloai9.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata9 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata9))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image9.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata9);
            }
            ngaydang9.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin10.InnerText = laytindr["IDTin"].ToString();
            tuatin10.InnerText = laytindr["TuaTin"].ToString();
            theloai10.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata10 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata10))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image10.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata10);
            }
            ngaydang10.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin11.InnerText = laytindr["IDTin"].ToString();
            tuatin11.InnerText = laytindr["TuaTin"].ToString();
            theloai11.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata11 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata11))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image11.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata11);
            }
            ngaydang11.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin12.InnerText = laytindr["IDTin"].ToString();
            tuatin12.InnerText = laytindr["TuaTin"].ToString();
            theloai12.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata12 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata12))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image12.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata12);
            }
            ngaydang12.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin13.InnerText = laytindr["IDTin"].ToString();
            tuatin13.InnerText = laytindr["TuaTin"].ToString();
            theloai13.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata13 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata13))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image13.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata13);
            }
            ngaydang13.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin14.InnerText = laytindr["IDTin"].ToString();
            tuatin14.InnerText = laytindr["TuaTin"].ToString();
            theloai14.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata14 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata14))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image14.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata14);
            }
            ngaydang14.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin15.InnerText = laytindr["IDTin"].ToString();
            tuatin15.InnerText = laytindr["TuaTin"].ToString();
            theloai15.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata15 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata15))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image15.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata15);
            }
            ngaydang15.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin16.InnerText = laytindr["IDTin"].ToString();
            tuatin16.InnerText = laytindr["TuaTin"].ToString();
            theloai16.InnerText = laytindr["TenTheLoai"].ToString();
            byte[] imagedata16 = (byte[])laytindr["HinhAnh"];
            using (MemoryStream ms = new MemoryStream(imagedata16))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                image16.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata16);
            }
            ngaydang16.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin17.InnerText = laytindr["IDTin"].ToString();
            tuatin17.InnerText = laytindr["TuaTin"].ToString();
            theloai17.InnerText = laytindr["TenTheLoai"].ToString();
            ngaydang17.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin18.InnerText = laytindr["IDTin"].ToString();
            tuatin18.InnerText = laytindr["TuaTin"].ToString();
            theloai18.InnerText = laytindr["TenTheLoai"].ToString();
            ngaydang18.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin19.InnerText = laytindr["IDTin"].ToString();
            tuatin19.InnerText = laytindr["TuaTin"].ToString();
            theloai19.InnerText = laytindr["TenTheLoai"].ToString();
            ngaydang19.InnerText = laytindr["NgayTao"].ToString();

            laytindr.Read();
            idtin20.InnerText = laytindr["IDTin"].ToString();
            tuatin20.InnerText = laytindr["TuaTin"].ToString();
            theloai20.InnerText = laytindr["TenTheLoai"].ToString();
            ngaydang20.InnerText = laytindr["NgayTao"].ToString();


            break;//thoát ra dù còn dữ liệu trong SqlDataReader
        }
        laytindr.Close();


    }


    protected void btnsearch_ServerClick(object sender, EventArgs e)
    {

    }



    protected void tuatin1_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin1.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin2_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin2.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin3_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin3.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin4_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin4.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin5_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin5.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin6_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin6.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin7_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin7.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin8_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin8.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin9_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin9.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin10_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin10.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin11_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin11.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin12_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin12.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin13_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin13.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin14_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin14.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin15_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin15.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin16_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin16.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin17_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin17.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin18_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin18.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin19_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin19.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void tuatin20_ServerClick(object sender, EventArgs e)
    {
        string idtin = idtin20.InnerText;
        Response.Redirect("~/Single.aspx?id=" + idtin);
    }

    protected void menutheloai1_ServerClick(object sender, EventArgs e)
    {
       
    }

    protected void menutheloai2_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai3_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai4_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai5_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai6_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai7_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai8_ServerClick(object sender, EventArgs e)
    {

    }

    protected void menutheloai9_ServerClick(object sender, EventArgs e)
    {

    }

    protected void editinfo_ServerClick(object sender, EventArgs e)
    {

    }

    protected void upnews_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("test.aspx");
    }

    protected void editnews_ServerClick(object sender, EventArgs e)
    {

    }

    protected void changepass_ServerClick(object sender, EventArgs e)
    {

    }

    protected void logout_ServerClick(object sender, EventArgs e)
    {
        Session.Clear(); // Xóa toàn bộ thông tin của phiên đăng nhập hiện tại
        Response.Redirect("~/Default.aspx"); // Chuyển hướng về trang đăng nhập
    }
}
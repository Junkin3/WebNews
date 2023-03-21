using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangTin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        btnback.Visible = false;
        string manguoidung = Request.QueryString["idnguoidung"];
        //string manguoidung = "0";
        idnguoidung.InnerText = manguoidung;
    }

    protected void btnupload_ServerClick(object sender, EventArgs e)
    {
        conn.Open();
        string theloai;
        if(Radio0.Checked == true){ theloai = Radio0.Value; }
        else if(Radio1.Checked == true) { theloai = Radio1.Value; }
        else if(Radio2.Checked == true) { theloai = Radio2.Value; }
        else if(Radio3.Checked == true) { theloai = Radio3.Value; }
        else if(Radio4.Checked == true) { theloai = Radio4.Value; }
        else if(Radio5.Checked == true) { theloai = Radio5.Value; }
        else if(Radio6.Checked == true) { theloai = Radio6.Value; }
        else if(Radio7.Checked == true) { theloai = Radio7.Value; }
        else { theloai = Radio8.Value; }

        HttpPostedFile file = Request.Files["fileToUpload"];
        if (file != null && file.ContentLength > 0)
        {
            string filename = Path.GetFileName(file.FileName);
            //gán đường dẫn cho hình
            string filepath = Server.MapPath("~/Uploads/") + filename;
            //lấy data hình
            byte[] filedata = File.ReadAllBytes(filepath);
            SqlCommand cmd = new SqlCommand("insert into Tin(TuaTin, NoiDung, NgayTao, HinhAnh,  IDTheLoai,IDNguoiDang)" +
                                                " values (@TuaTin, @NoiDung, @NgayTao, @HinhAnh, @IDTheLoai, @IDNguoiDang)", conn);
            cmd.Parameters.AddWithValue("@IDNguoiDang", idnguoidung.InnerText);
            cmd.Parameters.AddWithValue("@TuaTin", tieude.Value.Trim());
            cmd.Parameters.AddWithValue("@NoiDung", noidung.Value.Trim());
            cmd.Parameters.AddWithValue("@NgayTao", DateTime.Now);
            cmd.Parameters.AddWithValue("@IDTheLoai", theloai);
            cmd.Parameters.AddWithValue("@HinhAnh", filedata);
            cmd.ExecuteNonQuery();
            ThongBao.InnerText = "Thành công";
            btnupload.Visible = false;
            btnback.Visible = true;
        }
            conn.Close();
    }

    protected void btnback_ServerClick(object sender, EventArgs e)
    {

    }
}
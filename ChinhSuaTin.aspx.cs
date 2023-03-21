using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChinhSuaTin : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        btnback.Visible = false;
        conn.Open();
        string matin = Request.QueryString["idtin"];

        //string matin = "0";
        idtin.InnerText = matin;
        SqlCommand cmd = new SqlCommand("select TuaTin, NoiDung, HinhAnh, IDTheLoai from Tin where IDTin = @IDTin", conn);
        cmd.Parameters.AddWithValue("IDTin", matin);
        SqlDataReader laytincu = cmd.ExecuteReader();
        if (laytincu.Read())
        {
            tieude.InnerText = laytincu["TuaTin"].ToString();
            noidung.InnerText = laytincu["NoiDung"].ToString();
            byte[] imagedata = (byte[])laytincu["HinhAnh"];
            switch ((int)laytincu["IDTheLoai"])
            {
                case 0:
                    Radio0.Checked = true;
                    break;
                case 1:
                    Radio1.Checked = true;
                    break;
                case 2:
                    Radio2.Checked = true;
                    break;
                case 3:
                    Radio3.Checked = true;
                    break;
                case 4:
                    Radio4.Checked = true;
                    break;
                case 5:
                    Radio5.Checked = true;
                    break;
                case 6:
                    Radio6.Checked = true;
                    break;
                case 7:
                    Radio7.Checked = true;
                    break;
                case 8:
                    Radio8.Checked = true;
                    break;
            }
            using (MemoryStream ms = new MemoryStream(imagedata))
            {
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                imagetincu.Src = "data:image/png;base64," + Convert.ToBase64String(imagedata);
            }
        }
        laytincu.Close();
    }

    protected void btnupload_ServerClick(object sender, EventArgs e)
    {
        string theloai;
        if (Radio0.Checked == true) { theloai = Radio0.Value; }
        else if (Radio1.Checked == true) { theloai = Radio1.Value; }
        else if (Radio2.Checked == true) { theloai = Radio2.Value; }
        else if (Radio3.Checked == true) { theloai = Radio3.Value; }
        else if (Radio4.Checked == true) { theloai = Radio4.Value; }
        else if (Radio5.Checked == true) { theloai = Radio5.Value; }
        else if (Radio6.Checked == true) { theloai = Radio6.Value; }
        else if (Radio7.Checked == true) { theloai = Radio7.Value; }
        else { theloai = Radio8.Value; }

        HttpPostedFile file = Request.Files["fileToUpload"];
        if (file != null && file.ContentLength > 0)
        {
            string filename = Path.GetFileName(file.FileName);
            //gán đường dẫn cho hình
            string filepath = Server.MapPath("~/Uploads/") + filename;
            //lấy data hình
            byte[] filedata = File.ReadAllBytes(filepath);
            SqlCommand cmd = new SqlCommand("update Tin " +
                                                " set TuaTin = @TuaTin, NoiDung = @NoiDung, NgayTao = @NgayTao, HinhAnh = @HinhAnh,  IDTheLoai = @IDTheLoai" +
                                                "where IDTin = @IDTin)", conn);
            cmd.Parameters.AddWithValue("@IDTin", idtin.InnerText);
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
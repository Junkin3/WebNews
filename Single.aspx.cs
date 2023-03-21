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



public partial class Single : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Lấy giá trị của tham số "TuaTin"
            string matin = Request.QueryString["id"];
            
                // Kết nối đến cơ sở dữ liệu và lấy thông tin chi tiết về tin tức
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString"].ConnectionString);
            {
                conn.Open();
                string sql = "select t.*, TenNguoiDung, TenTheLoai " +
                    " from Tin t, NguoiDung d, TheLoai l " +
                    " where t.IDNguoiDang = d.IDNguoiDung and t.IDTheLoai = l.IDTheLoai and IDTin = @idtin";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@idtin", matin);
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        // Điền thông tin vào các điều khiển trên trang
                        titlenew.InnerText = reader["Tuatin"].ToString();
                        noidungtin.InnerText = reader["NoiDung"].ToString();
                        ngaydang.InnerText = reader["NgayTao"].ToString();
                        theloai.InnerText = reader["TenTheLoai"].ToString() ;
                        nguoidang.InnerText = "Tác giả: " + reader["TenNguoiDung"].ToString();

                        byte[] imagetin = (byte[])reader["HinhAnh"];
                        if (imagetin != null && imagetin.Length > 0)
                        {
                            string base64Image = Convert.ToBase64String(imagetin);
                            string imgSrc = string.Format("data:image/png;base64,{0}", base64Image);
                            imagetin1.Attributes.Add("src", imgSrc);
                        }
                    }
                    reader.Close();


                    string layphanhoi = "select top 3 p.NgayDang, p.NoiDung, TenNguoiDung" +
                        " from Tin t, PhanHoi p, NguoiDung n " +
                        " where t.IDTin = p.IDTin and p.IDNguoiDung = n.IDNguoiDung and t.IdTin = @idtin" +
                        " order by p.IDPhanHoi DESC";

                    SqlCommand layphanhoicmd = new SqlCommand(layphanhoi, conn);
                    layphanhoicmd.Parameters.AddWithValue("@idtin", matin);
                    SqlDataReader layphanhoidr = layphanhoicmd.ExecuteReader();
                    if (layphanhoidr.Read())
                    {
                        nguoiphanhoi1.InnerText = layphanhoidr["TenNguoiDung"].ToString();
                        noidungphanhoi1.InnerText = layphanhoidr["NoiDung"].ToString();
                        ngayphanhoi1.InnerText = layphanhoidr["NgayDang"].ToString();
                        if (layphanhoidr.Read())
                        {
                            nguoiphanhoi2.InnerText = layphanhoidr["TenNguoiDung"].ToString();
                            noidungphanhoi2.InnerText = layphanhoidr["NoiDung"].ToString();
                            ngayphanhoi2.InnerText = layphanhoidr["NgayDang"].ToString();
                            if (layphanhoidr.Read())
                            {
                                nguoiphanhoi3.InnerText = layphanhoidr["TenNguoiDung"].ToString();
                                noidungphanhoi3.InnerText = layphanhoidr["NoiDung"].ToString();
                                ngayphanhoi3.InnerText = layphanhoidr["NgayDang"].ToString();
                            }
                            else
                            {
                                nguoiphanhoi3.Style.Clear();
                            }
                        }
                        else
                        {
                            nguoiphanhoi2.Style.Clear();
                            nguoiphanhoi3.Style.Clear();
                        }
                    }
                    else
                    {
                        nguoiphanhoi1.Style.Clear();
                        nguoiphanhoi2.Style.Clear();
                        nguoiphanhoi3.Style.Clear();
                    }
                    layphanhoidr.Close();
                }
            }
        }
    }
    



    protected void btnphanhoi_ServerClick(object sender, EventArgs e)
    {

    }
}
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DangTin.aspx.cs" Inherits="DangTin" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title id="TuaTin" runat="server"></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center bg-dark px-lg-5">
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-sm bg-dark p-0">
                    <ul class="navbar-nav ml-n2">
                        <li class="nav-item border-right border-secondary">
                            <a class="nav-link text-body small" id = "date" ></a>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="row align-items-center bg-white py-3 px-lg-5">
            <div class="col-lg-4">
                <a href="Default.aspx" class="navbar-brand p-0 d-none d-lg-block">
                    <h1 class="m-0 display-4 text-uppercase text-primary">N<span class="text-secondary font-weight-normal">ews</span></h1>
                </a>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid p-0">
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-2 py-lg-0 px-lg-5">
            <a href="Default.html" class="navbar-brand d-block d-lg-none">
                <h1 class="m-0 display-4 text-uppercase text-primary">N<span class="text-white font-weight-normal">ews</span></h1>
            </a>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Breaking News Start -->
    <div class="container-fluid mt-5 mb-3 pt-3">
        <div class="container">
        </div>
    </div>
    <!-- Breaking News End -->


    <!-- News With Sidebar Start -->
    <div class="container-fluid">
        <div class="container">
                    <!-- News Detail Start -->
            <div class="mb-3">
                        <div class="section-title mb-0">
                            <h4 class="m-0 text-uppercase font-weight-bold">Thêm tin mới</h4>
                        </div>
                        <div class="bg-white border border-top-0 p-4">
                            <form>
                                <div class="form-group">
                                    <label for="message">Tiêu đề *</label>
                                    <textarea id="tieude" cols="30" rows="3" class="form-control" required="required" runat="server"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="message">Thể loại *</label>
                                    <div id="theloai" runat="server">
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Chính trị</label>
                                        <input type="radio" id="Radio0" name="theloai" value="0" runat="server" checked/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Doanh nghiệp</label>
                                        <input type="radio" id="Radio1" name="theloai" value="1" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Thức ăn</label>
                                        <input type="radio" id="Radio2" name="theloai" value="2" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Giải trí</label>
                                        <input type="radio" id="Radio3" name="theloai" value="3" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Du lịch</label>
                                        <input type="radio" id="Radio4" name="theloai" value="4" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Đời sống</label>
                                        <input type="radio" id="Radio5" name="theloai" value="5" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Sức khỏe</label>
                                        <input type="radio" id="Radio6" name="theloai" value="6" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Giáo dục</label>
                                        <input type="radio" id="Radio7" name="theloai" value="7" runat="server"/>
                                        </span>
                                        <span class="sex-radio" style="padding: 0 10px 0 10px; font-size: 16px;" runat="server">
                                        <label>Khoa học</label>
                                        <input type="radio" id="Radio8" name="theloai" value="8" runat="server"/>
                                        </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="message">Nội dung *</label>
                                    <textarea id="noidung" cols="30" rows="30" class="form-control" required="required" runat="server"></textarea>
                                </div>
                                <div action="upload.php" method="post" enctype="multipart/form-data">
                                  Chọn hình ảnh *:
                                  <input type="file" name="fileToUpload" id="fileToUpload" required="required" runat="server">
                                </div>
                                <div class="form-group mb-0" style="margin-top:30px">
                                    <button
                                        class="btn btn-primary font-weight-semi-bold py-2 px-3" id="btnupload" runat="server" onserverclick="btnupload_ServerClick">
                                        Đăng tin
                                    </button>
                                </div>
                                <div class="form-group mb-0" style="margin-top:30px">
                                    <button
                                        class="btn btn-primary font-weight-semi-bold py-2 px-3" id="btnback" runat="server" onserverclick="btnback_ServerClick">
                                        Quay lại trang chủ
                                    </button>
                                </div>
                                <div>
                                    <a id="ThongBao" runat="server">

                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- News Detail End -->
                </div>
            </div>
    <!-- News With Sidebar End -->


    <!-- Footer Start -->
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111;">
        <p class="m-0 text-center">  All Rights Reserved. Design by Nhóm 8</p><a id="idnguoidung" runat="server" visible="true"></a>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary btn-square back-to-top"><i class="fa fa-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>

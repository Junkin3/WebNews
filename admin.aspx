<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>News</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    
  

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap" rel="stylesheet">  

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>

<body>
    <!-- Topbar Start -->
    <div class="row align-items-center bg-white py-3 px-lg-5">
        <div class="col-lg-4">
            <a href="Default.aspx" class="navbar-brand p-0 d-none d-lg-block">
                <h1 class="m-0 display-4 text-uppercase text-primary">N<span class="text-secondary font-weight-normal">ews</span></h1>
            </a>
        </div>
    </div>
    <!-- Topbar End -->
    <!-- Navbar Start -->
    <!-- Navbar End -->
    <!-- Sign Up Start -->
    <div class="container-fluid mt-5 pt-3">
        <div class="container">
                    <div class="section-title mb-0">
                        <h4 class="m-0 text-uppercase font-weight-bold" id="quyenhan" runat="server">Quyền hạn</h4>
                    </div>
                    <div class="bg-white border border-top-0 p-4 mb-3">
                        <div class="row">
                            <form runat="server">
                                    <div class="col-lg-3">
                                        <div class="row"> 
                                            <asp:Button ID="editinfo" runat="server"  OnClick="editinfo_Click" CssClass="font-weight-semi-bold" Text="Chỉnh sửa thông tin" />
                                        </div>
                                        <div class="row"> 
                                            <asp:Button ID="upnews" runat="server" OnClick="upnews_Click" CssClass="font-weight-semi-bold" Text="Đăng tin" />
                                        </div>
                                        <div class="row"> 
                                            <asp:Button ID="editnews" runat="server" OnClick="editnews_Click" CssClass="font-weight-semi-bold" Text="Chỉnh sửa tin" />
                                        </div>
                                        <div class="row"> 
                                            <asp:Button ID="passchange" runat="server" OnClick="passchange_Click" CssClass="font-weight-semi-bold" Text="Đổi mật khẩu" />
                                        </div>
                                        <div class="row"> 
                                            <asp:Button ID="logout" runat="server" OnClick="logout_Click" CssClass="font-weight-semi-bold" Text="Đăng xuất" />
                                        </div>
                                    </div>
                                </form>
                            <div class="col-lg-9">
                                <h4 class="text-center">Thông tin cá nhân</h4>
                                <div class="row" style="margin-top:40px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Tên</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="tennguoidung" runat="server">Tên người dùng</a>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Họ</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="honguoidung" runat="server">Họ người dùng</a>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Email</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="email" runat="server">Email người dùng</a>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Số điện thoại</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="phone" runat="server">Số điện thoại người dùng</a>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Ngày sinh</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="birth" runat="server">Ngày sinh người dùng</a>
                                    </div>
                                </div>
                                <div class="row" style="margin-top:10px">
                                    <div class="col-lg-4">  
                                        <a style="font-weight:600; color:black">Giới tính</a>
                                    </div>
                                    <div class="col-lg-8">
                                        <a id="gioitinh" runat="server">Giới tính người dùng</a>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    <!-- Sign Up End -->

    <!-- Footer Start -->
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111; position: absolute; bottom: 0; align-self:end">
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
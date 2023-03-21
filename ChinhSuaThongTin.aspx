﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChinhSuaThongTin.aspx.cs" Inherits="ChinhSuaThongTin" %>

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
                        <h4 class="m-0 text-uppercase font-weight-bold">Chỉnh sửa thông tin</h4>
                    </div>
                    <div class="bg-white border border-top-0 p-4 mb-3">
                        <form id="signup" runat="server">
                            <div class="form-row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lbFnameError" runat="server" Text=""></asp:Label>
                                        <input type="text" class="form-control p-4" placeholder="Tên" id="fname" name="fname" required runat="server"/>
                                        
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <asp:Label ID="lbLnameError" runat="server" Text=""></asp:Label>
                                        <input type="text" class="form-control p-4" placeholder="Họ" id="lname" name="lname" required runat="server"/>
                                        
                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <asp:Label ID="lblEmailError" runat="server" Text=""></asp:Label>
                                <input type="text" class="form-control p-4" placeholder="Email" id="email" name="email" required runat="server"/>
                                
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbPhoneError" runat="server" Text=""></asp:Label>
                                <input type="number" class="form-control p-4" placeholder="Phone" id="phone" name="phone" required runat="server"/>
                                
                            </div>
                            <div class="form-group">
                                <asp:Label ID="lbBirthdayError" runat="server" Text=""></asp:Label>
                                <input type="date" class="form-control p-4" placeholder="Ngày sinh" id="birthday" name="birthday" required runat="server"/>
                                
                            </div>
                            <div style="text-align:center">
                                <span class="sex-radio" style="padding: 0 17px 0 10px; font-size: 21px; margin-left:20px;" runat="server">
                                    <label>Male</label>
                                    <input type="radio" id="male" name="gioitinh" value="male" runat="server" checked/>
                                </span>
                                <span class="sex-radio" style="padding: 0 28px 0 10px; font-size: 21px;" runat="server">
                                    <label>Female</label>
                                    <input type="radio" name="gioitinh" value="female" id="female" runat="server" />
                                </span>
                            </div>
                            <div style="margin-top:20px; text-align:center">
                                <button class="btn btn-primary font-weight-semi-bold px-4" style="height: 40px;margin-top:10px"
                                        type="submit" runat="server" id="btnsave" onserverclick="btnsave_ServerClick">
                                    Save</button>
                                <asp:Label ID="ThongBao" runat="server"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
        </div>
    <!-- Sign Up End -->

    <!-- Footer Start -->
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111;align-self:end">
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

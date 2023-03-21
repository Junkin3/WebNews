<%@ Page Language="C#" Async="true" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>
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

    <!-- Log in Start -->
    <div class="container-fluid mt-5 pt-3">
        <div class="container">
            <div class="section-title mb-0">
                <h4 class="m-0 text-uppercase font-weight-bold">Log in</h4>
            </div>
            <div class="bg-white border border-top-0 p-4 mb-3">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <asp:Label ID="lbUsererror" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        <input type="text" class="form-control p-4" placeholder="Email" required="required" id="username" runat="server" />
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lbPasserror" runat="server" Text="" CssClass="text-danger"></asp:Label>
                        <input type="password" id="password" class="form-control p-4" placeholder="Password" required="required" style="margin-top:11px" runat="server"/>
                    </div>
                    <asp:Label ID="Thongbao" runat="server" CssClass="text-danger"></asp:Label>
                    <div class="g-recaptcha" data-sitekey="6Lfv2Q4lAAAAAN8olC3FlxnpBeNt1ukHpd8e4hsv" style="margin-bottom:15px"></div>
                    <div style="text-align:center">
                        <button class="btn btn-primary font-weight-semi-bold px-4" id="btnlogin" runat="server" onserverclick="btnlogin_ServerClick" style="height: 50px;"
                                type="submit">
                            Log in
                        </button>
                         <button class="btn btn-primary font-weight-semi-bold px-4" id="forgot" runat="server" onserverclick="forgot_ServerClick" style="height: 50px;"
                                type="submit">
                            Forgot
                        </button>
                    </div>
                    
                    
                </form>
            </div>
        </div>
    </div>
    <!-- Sign Up End -->

    <!-- Footer Start -->
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111; position: absolute; bottom: 0; width: 100%; height: 70px;">
        <p class="m-0 text-center">  All Rights Reserved. Design by Nhóm 8</p>
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
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Single.aspx.cs" Inherits="Single" %>

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
            <a href="index.html" class="navbar-brand d-block d-lg-none">
                <h1 class="m-0 display-4 text-uppercase text-primary">N<span class="text-white font-weight-normal">ews</span></h1>
            </a>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Breaking News Start -->
    <div class="container-fluid mt-5 mb-3 pt-3">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12">
                    <div class="d-flex justify-content-between">
                        <div class="owl-carousel tranding-carousel position-relative d-inline-flex align-items-center bg-white border border-left-0"
                            style="width: calc(100%); padding-right: 20px; height:auto;">
                            <h1 class="text-secondary text-uppercase font-weight-semi-bold" style="margin-left:20px; word-wrap:break-word; margin-top:12px" id="titlenew" runat="server">
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breaking News End -->


    <!-- News With Sidebar Start -->
    <div class="container-fluid">
        <div class="container">
                    <!-- News Detail Start -->
                    <div class="position-relative mb-3">
                        <img class="img-fluid w-100" id="imagetin1" runat="server" style="object-fit: cover;">
                        <div class="bg-white border border-top-0 p-4">
                            <div class="mb-3">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2"
                                    id="theloai" runat="server">Business</a>
                                <a class="text-body" id="ngaydang" runat="server"></a>
                            </div>
                            <p class="text-secondary font-weight-semi-bold" id="noidungtin" runat="server">
                                
                            </p>
                        </div>
                        <div class="d-flex justify-content-between bg-white border border-top-0 p-4">
                            <div class="d-flex align-items-center">
                                <span id="nguoidang" runat="server"></span>
                            </div>
                        </div>
                    </div>
                    <!-- News Detail End -->

                    <!-- Comment List Start -->
                    <div class="mb-3">
                        <div class="section-title mb-0">
                            <h4 class="m-0 text-uppercase font-weight-bold">Phản hồi mới nhất</h4>
                        </div>
                        <div class="bg-white border border-top-0 p-4">
                            <div class="media mb-4">
                                <div class="media-body">
                                    <h6><a class="text-secondary font-weight-bold p-2 mr-2" style="background-color: #ffe682;" id="nguoiphanhoi1" runat="server"></a> <small><i id="ngayphanhoi1" runat="server"></i></small></h6>
                                    <p id="noidungphanhoi1" runat="server"></p>
                                </div>
                            </div>
                            <div class="media mb-4">
                                <div class="media-body">
                                    <h6><a class="text-secondary font-weight-bold p-2 mr-2" style="background-color: #ffe682;" id="nguoiphanhoi2" runat="server"></a> <small><i id="ngayphanhoi2" runat="server"></i></small></h6>
                                    <p id="noidungphanhoi2" runat="server"></p>
                                </div>
                            </div>
                            <div class="media mb-4">
                                <div class="media-body">
                                    <h6><a class="text-secondary font-weight-bold p-2 mr-2" style="background-color: #ffe682;" id="nguoiphanhoi3" runat="server"></a> <small><i id="ngayphanhoi3" runat="server"></i></small></h6>
                                    <p id="noidungphanhoi3" runat="server"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Comment List End -->

                    <!-- Comment Form Start -->
                    <div class="mb-3">
                        <div class="section-title mb-0">
                            <h4 class="m-0 text-uppercase font-weight-bold">Leave a comment</h4>
                        </div>
                        <div class="bg-white border border-top-0 p-4">
                            <form>
                                <div class="form-group">
                                    <label for="message">Nội dung phản hồi *</label>
                                    <textarea id="message" cols="30" rows="3" class="form-control"></textarea>
                                </div>
                                <div class="form-group mb-0">
                                    <button
                                        class="btn btn-primary font-weight-semi-bold py-2 px-3" id="btnphanhoi" runat="server" onserverclick="btnphanhoi_ServerClick">
                                        Phản hồi
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Comment Form End -->
                </div>
            </div>
    <!-- News With Sidebar End -->


    <!-- Footer Start -->
    <div class="container-fluid bg-dark pt-5 px-sm-3 px-md-5 mt-5">
        <div class="row py-4">
            <div class="col-lg-3 col-md-6 mb-5">
                <h5 class="mb-4 text-white text-uppercase font-weight-bold">Liên hệ chúng tôi</h5>
                <p class="font-weight-medium"><i class="fa fa-map-marker-alt mr-2"></i>371 Nguyễn Kiệm, Gò Vấp, Tp.Hồ Chí Minh</p>
                <p class="font-weight-medium"><i class="fa fa-phone-alt mr-2"></i>+84123456789</p>
                <p class="font-weight-medium"><i class="fa fa-envelope mr-2" ></i >ou.edu.vn</p>
            </div>
        </div>
    </div>
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111;">
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
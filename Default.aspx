<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

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
</head>

<body>
    <form id="form1" runat="server">
    <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center bg-dark px-lg-5">
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-sm bg-dark p-0">
                    <ul class="navbar-nav ml-n2">
                        <li class="nav-item border-right border-secondary">
                            <a class="nav-link text-body small" id = "date" ></a>
                        </li>
                        <li>
                            <a href="Dangnhap.aspx" class="nav-link text-body small" id="btndangnhap" runat="server">Đăng nhập</a>
                        </li>
                        <li>
                            <a href="Dangki.aspx" class="nav-link text-body small" id="btndangky" runat="server">Đăng ký</a>
                        </li>
                    </ul>
                </nav>
            </div>
           <div class="col-lg-2 text-right d-none d-md-block">
                <nav class="navbar navbar-expand-sm bg-dark p-0">
                    <ul class="navbar-nav ml-auto mr-n2">
                        <li class="nav-item" style="position: relative;">
                            <a class="nav-link dropdown-toggle text-body" data-toggle="dropdown" id="tennguoidung" runat="server"></a>
                            <div class="dropdown-menu rounded-0 m-0">
                                <a class="dropdown-item" id="adminlink" runat="server">Thông tin người dùng</a>
                                <a class="dropdown-item" id="editinfo" runat="server">Chỉnh sửa thông tin</a>
                                <a class="dropdown-item" id="upnews" runat="server">Đăng tin</a>
                                <a class="dropdown-item" id="editnews" runat="server">Chỉnh sửa tin</a>
                                <a class="dropdown-item" id="changepass" runat="server">Đổi mật khẩu</a>
                                <a class="dropdown-item" id="logout" runat="server" onserverclick="logout_ServerClick">Đăng xuất</a>

                            </div>
                        </li>
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
            <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-between px-0 px-lg-3" id="navbarCollapse">
                <div class="navbar-nav mr-auto py-0">
                    <a href="index.html" class="nav-item nav-link active">Trang chủ</a>
                    <div class="nav-item" style="position: relative;">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown">Thể loại</a>
                        <div class="dropdown-menu" id="menutheloai">
                            <a class="dropdown-item" id="menutheloai1" runat="server" onserverclick="menutheloai1_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai2" runat="server" onserverclick="menutheloai2_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai3" runat="server" onserverclick="menutheloai3_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai4" runat="server" onserverclick="menutheloai4_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai5" runat="server" onserverclick="menutheloai5_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai6" runat="server" onserverclick="menutheloai6_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai7" runat="server" onserverclick="menutheloai7_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai8" runat="server" onserverclick="menutheloai8_ServerClick"></a>
                            <a class="dropdown-item" id="menutheloai9" runat="server" onserverclick="menutheloai9_ServerClick"></a>
                            
                        </div>
                    </div>
                  
                </div>
                <div class="input-group ml-auto d-none d-lg-flex" style="width: 100%; max-width: 300px;">
                     <input id="search_text" type="text" class="form-control border-0" runat="server" placeholder="Search..." name="search_text">
                        <button class="input-group-text bg-primary text-dark border-0 px-3" type="submit" id="btnsearch" name="btnsearch" runat="server" onserverclick="btnsearch_ServerClick">
                            <i class="fa fa-search"></i></button>
                </div>
            </div>
        </nav>
    </div>
    <!-- Navbar End -->


    <!-- Main News Slider Start -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-7 px-0">
                <div class="owl-carousel main-carousel position-relative">
                    <div class="position-relative overflow-hidden" style="height: 500px;">
                        <img class="img-fluid h-100" id="image1" runat="server" style="object-fit: cover;">
                        <div class="overlay">
                            <div class="mb-2">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" id="theloai1" runat="server"></a>
                                <a class="text-white" id="ngaydang1" runat="server"></a>
                            </div>
                            <a class="h2 m-0 text-white text-uppercase font-weight-bold" id="tuatin1" runat="server" onserverclick="tuatin1_ServerClick" ></a>
                            <a id="idtin1" runat="server" hidden></a>
                        </div>
                    </div>
                    <div class="position-relative overflow-hidden" style="height: 500px;">
                        <img class="img-fluid h-100" id="image2" runat="server" style="object-fit: cover;">
                        <div class="overlay">
                            <div class="mb-2">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai2"></a>
                                <a class="text-white" id="ngaydang2" runat="server"></a>
                            </div>
                            <a class="h2 m-0 text-white text-uppercase font-weight-bold" id="tuatin2" runat="server" onserverclick="tuatin2_ServerClick"></a>
                            <a id="idtin2" runat="server" hidden></a>
                        </div>
                    </div>
                    <div class="position-relative overflow-hidden" style="height: 500px;">
                        <img class="img-fluid h-100" id="image3" runat="server" style="object-fit: cover;">
                        <div class="overlay">
                            <div class="mb-2">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai3"></a>
                               
                                <a class="text-white" id="ngaydang3" runat="server"></a>
                            </div>
                            <a class="h2 m-0 text-white text-uppercase font-weight-bold" id="tuatin3" runat="server" onserverclick="tuatin3_ServerClick"></a>
                            <a id="idtin3" runat="server" hidden></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 px-0">
                <div class="row mx-0">
                    <div class="col-md-6 px-0">
                        <div class="position-relative overflow-hidden" style="height: 250px;">
                            <img class="img-fluid w-100 h-100" id="image4" runat="server" style="object-fit: cover;">
                            <div class="overlay">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai4"></a>
                                    <a class="text-white"><small id="ngaydang4" runat="server"></small></a>
                                </div>
                                <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin4" runat="server" onserverclick="tuatin4_ServerClick"></a>
                                <a id="idtin4" runat="server" hidden></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 px-0">
                        <div class="position-relative overflow-hidden" style="height: 250px;">
                            <img class="img-fluid w-100 h-100" id="image5" runat="server" style="object-fit: cover;">
                            <div class="overlay">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai5"></a>
                                    <a class="text-white"><small id="ngaydang5" runat="server"></small></a>
                                </div>
                                <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin5" runat="server" onserverclick="tuatin5_ServerClick"></a>
                                <a id="idtin5" runat="server" hidden></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 px-0">
                        <div class="position-relative overflow-hidden" style="height: 250px;">
                            <img class="img-fluid w-100 h-100" id="image6" runat="server" style="object-fit: cover;">
                            <div class="overlay">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai6"></a>
                                    <a class="text-white"><small id="ngaydang6" runat="server"></small></a>
                                </div>
                                <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" runat="server" id="tuatin6" onserverclick="tuatin6_ServerClick"></a>
                                <a id="idtin6" runat="server" hidden></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 px-0">
                        <div class="position-relative overflow-hidden" style="height: 250px;">
                            <img class="img-fluid w-100 h-100" id="image7" runat="server" style="object-fit: cover;">
                            <div class="overlay">
                                <div class="mb-2">
                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai7"></a>
                                    <a class="text-white"><small runat="server" id="ngaydang7"></small></a>
                                </div>
                                <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" runat="server" id="tuatin7" onserverclick="tuatin7_ServerClick"></a>
                                <a id="idtin7" runat="server" hidden></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main News Slider End -->


   


    <!-- Featured News Slider Start -->
    <div class="container-fluid pt-5 mb-3">
        <div class="container">
            <div class="section-title">
                <h4 class="m-0 text-uppercase font-weight-bold">Featured News</h4>
            </div>
            <div class="owl-carousel news-carousel carousel-item-4 position-relative">
                <div class="position-relative overflow-hidden" style="height: 300px;">
                    <img class="img-fluid h-100" id="image8" runat="server" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai8"></a>
                            <a class="text-white"><small id="ngaydang8" runat="server"></small></a>
                        </div>
                        <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin8" runat="server" onserverclick="tuatin8_ServerClick"></a>
                        <a id="idtin8" runat="server" hidden></a>
                    </div>
                </div>
                <div class="position-relative overflow-hidden" style="height: 300px;">
                    <img class="img-fluid h-100" id="image9" runat="server" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" id="theloai9" runat="server"></a>
                            <a class="text-white"><small id="ngaydang9" runat="server"></small></a>
                        </div>
                        <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin9" runat="server" onserverclick="tuatin9_ServerClick"></a>
                        <a id="idtin9" runat="server" hidden></a>
                    </div>
                </div>
                <div class="position-relative overflow-hidden" style="height: 300px;">
                    <img class="img-fluid h-100" id="image10" runat="server" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai10"></a>
                            <a class="text-white"><small runat="server" id="ngaydang10" ></small></a>
                        </div>
                        <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin10" runat="server" onserverclick="tuatin10_ServerClick"></a>
                        <a id="idtin10" runat="server" hidden></a>
                    </div>
                </div>
                <div class="position-relative overflow-hidden" style="height: 300px;">
                    <img class="img-fluid h-100" id="image11" runat="server" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2"> 
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai11"></a>
                            <a id="idtin11" runat="server" hidden></a>
                            <a class="text-white"><small runat="server" id="ngaydang11" ></small></a>
                        </div>
                        <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin11" runat="server" onserverclick="tuatin11_ServerClick"></a>
                    </div>
                </div>
                <div class="position-relative overflow-hidden" style="height: 300px;">
                    <img class="img-fluid h-100" id="image12" runat="server" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai12"></a>
                            <a class="text-white"><small runat="server" id="ngaydang12" ></small></a>
                        </div>
                        <a class="h6 m-0 text-white text-uppercase font-weight-semi-bold" id="tuatin12" runat="server" onserverclick="tuatin12_ServerClick"></a>
                        <a id="idtin12" runat="server" hidden></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured News Slider End -->


    <!-- News With Sidebar Start -->
    <div class="container-fluid">
        <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="section-title">
                                <h4 class="m-0 text-uppercase font-weight-bold">Latest News</h4>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="position-relative mb-3">
                                <img class="img-fluid w-100" id="image13" runat="server" style="object-fit: cover;">
                                <div class="bg-white border border-top-0 p-4">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai13"></a>
                                        
                                        <a class="text-body"><small runat="server" id="ngaydang13" ></small></a>
                                    </div>
                                    <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" id="tuatin13" runat="server" onserverclick="tuatin13_ServerClick"></a>
                                    <a id="idtin13" runat="server" hidden></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="position-relative mb-3">
                                <img class="img-fluid w-100" id="image14" runat="server" style="object-fit: cover;">
                                <div class="bg-white border border-top-0 p-4">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai14"></a>
                                        <a class="text-body"><small id="ngaydang14" runat="server" ></small></a>
                                    </div>
                                    <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" id="tuatin14" runat="server" onserverclick="tuatin14_ServerClick"></a>
                                    <a id="idtin14" runat="server" hidden></a>
                                </div>
                            </div>
                        </div>
                      
                        <div class="col-lg-6">
                            <div class="position-relative mb-3">
                                <img class="img-fluid w-100"  id="image15" runat="server" style="object-fit: cover;">
                                <div class="bg-white border border-top-0 p-4">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai15"></a>
                                        <a id="idtin15" runat="server" hidden></a>
                                        <a class="text-body" ><small id="ngaydang15" runat="server" ></small></a>
                                    </div>
                                    <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" id="tuatin15" runat="server" onserverclick="tuatin15_ServerClick"></a>
                                </div>
                            </div>
                        </div>
                      
                        <div class="col-lg-6">
                            <div class="position-relative mb-3">
                                <img class="img-fluid w-100"  id="image16" runat="server" style="object-fit: cover;">
                                <div class="bg-white border border-top-0 p-4">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" runat="server" id="theloai16"></a>
                                        <a class="text-body" ><small id="ngaydang16" runat="server" ></small></a>
                                    </div>
                                    <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" id="tuatin16" runat="server" onserverclick="tuatin16_ServerClick"></a>
                                    <a id="idtin16" runat="server" hidden></a>
                                </div>
                            </div>
                        </div>
                      
                        <div class="col-lg-6">
                            <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
                                <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloai17"></a>
                                        <a class="text-body" ><small id="ngaydang17" runat="server" ></small></a>
                                    </div>
                                    <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" id="tuatin17" runat="server" onserverclick="tuatin17_ServerClick"></a>
                                    <a id="idtin17" runat="server" hidden></a>
                                </div>
                            </div>

                            <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
                                <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloai18"></a>
                                        
                                        <a class="text-body" ><small id="ngaydang18" runat="server" ></small></a>
                                    </div>
                                    <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" id="tuatin18" runat="server" onserverclick="tuatin18_ServerClick"></a>
                                    <a id="idtin18" runat="server" hidden></a>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
                                <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloai19"></a>
                                        <a class="text-body" ><small id="ngaydang19" runat="server" ></small></a>
                                    </div>
                                    <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" id="tuatin19" runat="server" onserverclick="tuatin19_ServerClick"></a>
                                    <a id="idtin19" runat="server" hidden></a>
                                </div>
                            </div>

                            <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
                                <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
                                    <div class="mb-2">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloai20"></a>
                                        <a class="text-body" ><small id="ngaydang20" runat="server" ></small></a>
                                    </div>
                                    <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" id="tuatin20" runat="server" onserverclick="tuatin20_ServerClick"></a>
                                    <a id="idtin20" runat="server" hidden></a>
                                </div>
                            </div>
                        </div>  
                        
                    </div>
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
            <div class="col-lg-3 col-md-6 mb-5">
                
            </div>
            <div class="col-lg-3 col-md-6 mb-5">
                <h5 class="mb-4 text-white text-uppercase font-weight-bold">Popular News</h5>
                <div class="mb-3">
                    <div class="mb-2">
                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloaibottom1"></a>
                        <a class="text-body" ><small id="ngaydangbottom1" runat="server" ></small></a>
                    </div>
                    <a class="small text-body text-uppercase font-weight-medium" id="tuatinbottom1" runat="server" onserverclick="tuatin1_ServerClick"></a>
                </div>
                <div class="mb-3">
                    <div class="mb-2">
                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" runat="server" id="theloaibottom2"></a>
                        <a class="text-body" ><small id="ngaydangbottom2" runat="server" ></small></a>
                    </div>
                    <a class="small text-body text-uppercase font-weight-medium" id="tuatinbottom2" runat="server" onserverclick="tuatin2_ServerClick"></a>
                </div>
            </div>
            
            <div class="col-lg-3 col-md-6 mb-5">
                <h5 class="mb-4 text-white text-uppercase font-weight-bold">Thể loại</h5>
                <div class="m-n1">
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom1" runat="server" onserverclick="menutheloai1_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom2" runat="server" onserverclick="menutheloai2_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom3" runat="server" onserverclick="menutheloai3_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom4" runat="server" onserverclick="menutheloai4_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom5" runat="server" onserverclick="menutheloai5_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom6" runat="server" onserverclick="menutheloai6_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom7" runat="server" onserverclick="menutheloai7_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom8" runat="server" onserverclick="menutheloai8_ServerClick"></a>
                    <a class="btn btn-sm btn-secondary m-1" id="menutheloaibottom9" runat="server" onserverclick="menutheloai9_ServerClick"></a>
                    
                </div>
            </div>
          
        </div>
    </div>
    <div class="container-fluid py-4 px-sm-3 px-md-5" style="background: #111111;">
        <p class="m-0 text-center">  All Rights Reserved. Design by Nhóm 8</p><a id="idnguoidung" runat="server" visible="false"></a>
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
    </form>
</body>

</html>
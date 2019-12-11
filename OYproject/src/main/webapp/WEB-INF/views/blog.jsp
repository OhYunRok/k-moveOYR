<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.oyr.webapp.dto.*" %>
<%
	UserDto userDto = (UserDto) session.getAttribute("userDto");
	String userName = "";
	
	String tcount= String.valueOf(session.getAttribute("cartCount"));
	
	
	if(userDto != null){
		System.out.println(userDto.getUserSeq());
		userName = userDto.getUserName();
	
	}
%>

<!doctype html>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>OEshop - Blog</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/favicon.png">
    <!-- Place favicon.ico in the root directory -->
    <!-- all css here -->
    <!-- bootstrap v3.3.7 css -->
    <link rel="stylesheet" href="/resources/assets/css/bootstrap.min.css">
    <!-- owl.carousel.2.0.0-beta.2.4 css -->
    <link rel="stylesheet" href="/resources/assets/css/owl.carousel.min.css">
    <!-- font-awesome v4.6.3 css -->
    <link rel="stylesheet" href="/resources/assets/css/font-awesome.min.css">
    <!-- flaticon.css -->
    <link rel="stylesheet" href="/resources/assets/css/flaticon.css">
    <!-- jquery-ui.css -->
    <link rel="stylesheet" href="/resources/assets/css/jquery-ui.css">
    <!-- metisMenu.min.css -->
    <link rel="stylesheet" href="/resources/assets/css/metisMenu.min.css">
    <!-- swiper.min.css -->
    <link rel="stylesheet" href="/resources/assets/css/swiper.min.css">
    <!-- style css -->
    <link rel="stylesheet" href="/resources/assets/css/styles.css">
    <!-- responsive css -->
    <link rel="stylesheet" href="/resources/assets/css/responsive.css">
    <!-- modernizr css -->
    <script src="/resources/assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->
    <!--Start Preloader-->
    <div class="preloader-wrap">
        <div class="spinner"></div>
    </div>
    <!-- search-form here -->
    <div class="search-area flex-style">
        <span class="closebar">Close</span>
        <div class="container">
            <div class="row">
                <div class="col-md-8 offset-md-2 col-12">
                    <div class="search-form">
                        <form action="search">
                            <input type="text" placeholder="Search Here...">
                            <button><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- search-form here -->
    <header class="header-area">
        <div class="header-top bg-2">
            <div class="fluid-container">
                <div class="row">
                    <div class="col-md-6 col-12">
                        <ul class="d-flex header-contact">
                            <li><i class="fa fa-phone"></i> 02)760-1234</li>
                            <li><i class="fa fa-envelope"></i> oy3375@gmail.com</li>
                            <li>
                            	<c:set var="name" value="${userDto.userName}" />
                            	<c:if test="${name != null}">
                            	<p><strong><%=userName %></strong> 님이 로그인중입니다.</p>
                            	</c:if>
                            </li>
                            <li>
                            <c:set var="admin" value="${userDto.auCode}" />
                           		<c:if test="${admin eq 'ADMIN'}">
                            		<a href="/product">상품등록</a>
                            	</c:if>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-6 col-12">
                        <ul class="d-flex account_login-area">
                            <li>
                                <a href="javascript:void(0);"><i class="fa fa-user"></i> My Account <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown_style">
                                    <li><a href="/logout">Logout</a></li>
                                    <li><a href="/cart">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="wishlist.html">wishlist</a></li>
                                </ul>
                            </li>
                            <li><a href="/register"> Login/Register </a></li>
                            <li>
                                <a href="javascript:void(0);"> KOR <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown_style right">
                                    <li><a href="javascript:void(0);">USD</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="fluid-container">
                <div class="row">
                    <div class="col-lg-3 col-md-7 col-sm-6 col-6">
                        <div class="logo">
                            <a href="/">
                        <img src="/resources/assets/images/logo2.png" alt="">
                        </a>
                        </div>
                    </div>
                    <div class="col-lg-7 d-none d-lg-block">
                        <nav class="mainmenu">
                            <ul class="d-flex">
                                <li class="active">
                                    <a href="/">Home</a>
                                </li>
                                <li><a href="/about">About</a></li>
                                <li>
                                    <a href="javascript:void(0);">Shop <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_style">
                                        <li><a href="/shop">Shop Page</a></li>
                                        <li><a href="/cart">Shopping cart</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Blog <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_style">
                                        <li><a href="/blog">blog Page</a></li>
                                        <li><a href="/blogDetail">blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="/contact">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-4 col-lg-2 col-sm-5 col-4">
                        <ul class="search-cart-wrapper d-flex">
                            <li class="search-tigger"><a href="javascript:void(0);"><i class="flaticon-search"></i></a></li>

                            <li>
                                <a href="javascript:void(0);"><i class="flaticon-shop"></i>
                                 <c:set var="name" value="${userDto.userName}" />
                               	<c:set var="count" value="${tcount}" />
                               	
                            	<c:if test="${name == null}">
                            	<span></span>
                            	</c:if>
                            	<c:if test="${name != null}">
                            		<c:if test="${count != null}">
                            		<span><%= tcount %></span>
                            		</c:if>
                            		<c:if test="${count == null}">
                            		<span></span>
                            		</c:if>
                            	</c:if>
                            	</a>
                                <ul class="cart-wrap dropdown_style">
                                    <li>
                                        <a href="/cart">My Cart</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="col-md-1 col-sm-1 col-2 d-block d-lg-none">
                        <div class="responsive-menu-tigger">
                            <a href="javascript:void(0);">
                        <span class="first"></span>
                        <span class="second"></span>
                        <span class="third"></span>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- responsive-menu area start -->
            <div class="responsive-menu-area">
                <div class="container">
                    <div class="row">
                        <div class="col-12 d-block d-lg-none">
                            <ul class="metismenu">
                                <li class="sidemenu-items">
                                    <a class="has-arrow" aria-expanded="false" href="javascript:void(0);">Home</a>
                                    <ul aria-expanded="false">
                                        <li><a href="/">Home Main</a></li>
                                    </ul>
                                </li>
                                <li><a href="/about">About</a></li>
                                <li class="sidemenu-items">
                                    <a class="has-arrow" aria-expanded="false" href="javascript:void(0);">Shop </a>
                                    <ul aria-expanded="false">
                                        <li><a href="/shop">Shop Page</a></li>
                                        <li><a href="/cart">Shopping cart</a></li>
                                    </ul>
                                </li>
                                <li class="sidemenu-items">
                                    <a class="has-arrow" aria-expanded="false" href="javascript:void(0);">Blog</a>
                                    <ul aria-expanded="false">
                                        <li><a href="/blog">Blog</a></li>
                                        <li><a href="/blogDetail">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="/contact">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- responsive-menu area start -->
        </div>
    </header>
    <!-- header-area end -->
    
    <!-- .breadcumb-area start -->
    <div class="breadcumb-area bg-img-4 ptb-100" style="background-image: url(/resources/assets/images/banner/networks.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-wrap text-center">
                        <h2>Blog Page</h2>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><span>Blog</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- .breadcumb-area end -->
    <!-- blog-area start -->
    <div class="blog-area">
        <div class="container">
            <div class="col-lg-12">
                <div class="section-title  text-center">
                    <h2>Latest News</h2>
                    <img src="/resources/assets/images/section-title.png" alt="">
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4  col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/1.jpg" alt="">
                            <ul>
                                <li>20</li>
                                <li>Janu</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i> Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 15 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="/blogDetail">British military courts use aginst protesters busines cultural...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/2.jpg" alt="">
                            <ul>
                                <li>20</li>
                                <li>Janu</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i>1 Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 12 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="blog-gallary.html">South korea’s moon jae in sworn vowing to address north...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/3.jpg" alt="">
                            <ul>
                                <li>25</li>
                                <li>Jun</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i> 5 Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 18 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="/blogDetail">Man looking at his note remember to daily tasks...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/8.jpg" alt="">
                            <ul>
                                <li>15</li>
                                <li>April</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i>15 Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 08 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="blog-video.html">Robots helped inspire and deep learning might become...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/9.jpg" alt="">
                            <ul>
                                <li>25</li>
                                <li>May</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i> 5 Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i> 30 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="/blogDetail">Defying the traditional and mainstream parties...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-12">
                    <div class="blog-wrap">
                        <div class="blog-image">
                            <img src="/resources/assets/images/blog/12.jpg" alt="">
                            <ul>
                                <li>01</li>
                                <li>Feb</li>
                            </ul>
                        </div>
                        <div class="blog-content">
                            <div class="blog-meta">
                                <ul>
                                    <li><a href="#"><i class="fa fa-user"></i> Admin</a></li>
                                    <li><a href="#"><i class="fa fa-heart"></i> 16 Love</a></li>
                                    <li><a href="#"><i class="fa fa-comments"></i>8 Comments</a></li>
                                </ul>
                            </div>
                            <h3><a href="blog-audio.html">Packing macron anddis insted about vote against chat...</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati nulla veniam autem veritatis, adipisci officia? Tempora necessitatibus, iusto minima maxime ipsum quae dolore repellat quaerat.</p>
                        </div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="pagination-wrapper text-center mb-30">
                        <ul class="page-numbers">
                            <li><a class="prev page-numbers" href="#"><i class="fa fa-arrow-left"></i></a></li>
                            <li><span class="page-numbers current">1</span></li>
                            <li><a class="page-numbers" href="#">2</a></li>
                            <li><a class="page-numbers" href="#">3</a></li>
                            <li><a class="next page-numbers" href="#"><i class="fa fa-arrow-right"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- blog-area end -->
    <!-- start social-newsletter-section -->
    <section class="social-newsletter-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="newsletter text-center">
                        <h3>Subscribe  Newsletter</h3>
                        <div class="newsletter-form">
                            <form>
                                <input type="text" class="form-control" placeholder="Enter Your Email Address...">
                                <button type="submit"><i class="fa fa-send"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end container -->
    </section>
    <!-- end social-newsletter-section -->
    <!-- .footer-area start -->
    <div class="footer-area">
        <div class="footer-top">
            <div class="container">
                <div class="footer-top-item">
                    <div class="row">
                        <div class="col-lg-12 col-12">
                            <div class="footer-top-text text-center">
                                <ul>
                                    <li><a href="home.html">home</a></li>
                                    <li><a href="#">our story</a></li>
                                    <li><a href="#">feed shop</a></li>
                                    <li><a href="/blog">how to eat blog</a></li>
                                    <li><a href="contact.html">contact</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="container">
                <div class="row">
                    <div class="col-lg-2 col-md-3 col-sm-12">
                        <div class="footer-icon">
                            <ul class="d-flex">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-8 col-sm-12">
                        <div class="footer-content">
                            <p>On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure righteous indignation and dislike</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-8 col-sm-12">
                        <div class="footer-adress">
                            <ul>
                                <li><a href="#"><span>Email:</span> domain@gmail.com</a></li>
                                <li><a href="#"><span>Tel:</span> 0131234567</a></li>
                                <li><a href="#"><span>Adress:</span> 52 Web Bangale , Adress line2 , ip:3105</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-12">
                        <div class="footer-reserved">
                            <ul>
                                <li>Copyright 2019 Tohoney All rights reserved.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- .footer-area end -->
    <!-- jquery latest version -->
    <script src="/resources/assets/js/vendor/jquery-2.2.4.min.js"></script>
    <!-- bootstrap js -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <!-- owl.carousel.2.0.0-beta.2.4 css -->
    <script src="/resources/assets/js/owl.carousel.min.js"></script>
    <!-- mouse_scroll.js -->
    <script src="/resources/assets/js/mouse_scroll.js"></script>
    <!-- scrollup.js -->
    <script src="/resources/assets/js/scrollup.js"></script>
    <!-- isotope.pkgd.min.js -->
    <script src="/resources/assets/js/isotope.pkgd.min.js"></script>
    <!-- imagesloaded.pkgd.min.js -->
    <script src="/resources/assets/js/imagesloaded.pkgd.min.js"></script>
    <!-- jquery.zoom.min.js -->
    <script src="/resources/assets/js/jquery.zoom.min.js"></script>
    <!-- swiper.min.js -->
    <script src="/resources/assets/js/swiper.min.js"></script>
    <!-- metisMenu.min.js -->
    <script src="/resources/assets/js/metisMenu.min.js"></script>
    <!-- mailchimp.js -->
    <script src="/resources/assets/js/mailchimp.js"></script>
    <!-- jquery-ui.min.js -->
    <script src="/resources/assets/js/jquery-ui.min.js"></script>
    <!-- main js -->
    <script src="/resources/assets/js/scripts.js"></script>
</body>

</html>
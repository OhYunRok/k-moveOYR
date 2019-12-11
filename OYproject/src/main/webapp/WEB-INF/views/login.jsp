<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import = "com.oyr.webapp.dto.*" %>
<%
	UserDto userDto = (UserDto) session.getAttribute("userDto");
	String userName = "";
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
<title>OEshop - Login</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/png"
	href="/resources/assets/images/favicon.png">
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

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
							<button>
								<i class="fa fa-search"></i>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- search-form here -->
	<!-- header-area start -->
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
							<li><a href="javascript:void(0);"><i class="fa fa-user"></i>
									My Account <i class="fa fa-angle-down"></i></a>
								<ul class="dropdown_style">
								    <c:set var="name" value="${userDto.userName}" />
                            			<c:if test="${name != null}">
                            			<li><a href="/logout">Logout</a></li>
                            			</c:if>
                            			<c:if test="${name == null}">
                            			<li><a href="/login">LogIn</a></li>
                            		</c:if>
									<li><a href="/cart">Cart</a></li>
									<li><a href="checkout.html">Checkout</a></li>
									<li><a href="/wishlist">wishlist</a></li>
								</ul></li>
								<c:set var="name" value="${userDto.userName}" />
								<c:if test="${name != null}">
                            			<li><a href="/logout"> Logout </a></li>
                            			</c:if>
                            			<c:if test="${name == null}">
                            			<li><a href="/register"> Login/Register </a></li>
                            			</c:if>
							<li><a href="javascript:void(0);"> KOR <i
									class="fa fa-angle-down"></i></a>
								<ul class="dropdown_style right">
									<li><a href="javascript:void(0);">USD</a></li>
								</ul></li>
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
							<a href="/"> <img
								src="/resources/assets/images/logo2.png" alt="">
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
								<li><a href="javascript:void(0);">Shop <i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown_style">
										<li><a href="/shop">Shop Page</a></li>
										<li><a href="/cart">Shopping cart</a></li>
									</ul></li>
								<li><a href="javascript:void(0);">Blog <i
										class="fa fa-angle-down"></i></a>
									<ul class="dropdown_style">
										<li><a href="/blog">blog Page</a></li>
										<li><a href="/blogDetail">blog Details</a></li>
									</ul></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>
					<div class="col-md-4 col-lg-2 col-sm-5 col-4">
						<ul class="search-cart-wrapper d-flex">
							<li class="search-tigger"><a href="javascript:void(0);"><i
									class="flaticon-search"></i></a></li>
							
							<li><a href="javascript:void(0);"><i
									class="flaticon-shop"></i></a>
									
							</li>
						</ul>
					</div>
					<div class="col-md-1 col-sm-1 col-2 d-block d-lg-none">
						<div class="responsive-menu-tigger">
							<a href="javascript:void(0);"> <span class="first"></span> <span
								class="second"></span> <span class="third"></span>
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
								<li class="sidemenu-items"><a class="has-arrow"
									aria-expanded="false" href="javascript:void(0);">Home</a>
									<ul aria-expanded="false">
										<li><a href="/">Home Main</a></li>
									</ul></li>
								<li><a href="/about">About</a></li>
								<li class="sidemenu-items"><a class="has-arrow"
									aria-expanded="false" href="javascript:void(0);">Shop </a>
									<ul aria-expanded="false">
										<li><a href="/shop">Shop Page</a></li>
										<li><a href="/cart">Shopping cart</a></li>
									</ul></li>
								<li class="sidemenu-items"><a class="has-arrow"
									aria-expanded="false" href="javascript:void(0);">Blog</a>
									<ul aria-expanded="false">
										<li><a href="/blog">Blog</a></li>
										<li><a href="/blogDetail">Blog Details</a></li>
									</ul></li>
								<li><a href="contact.html">Contact</a></li>
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
	<div class="breadcumb-area bg-img-4 ptb-100" style="background-image: url(/resources/assets/images/banner/reg.jpg);">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcumb-wrap text-center">
						<h2>Account</h2>
						<ul>
							<li><a href="/">Home</a></li>
							<li><span>Login</span></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .breadcumb-area end -->
	<!-- checkout-area start -->
	<div class="account-area ptb-100">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
					<div class="account-form form-style">
						<p>User Email Address *</p>
						<input type="email" id=userEmail>
						<p>Password *</p>
						<input type="Password" id=userPassword>
						<div class="row">
							<div class="col-lg-6">
								<input id="password" type="checkbox"> <label
									for="password">Save Password</label>
							</div>
							<div class="col-lg-6 text-right">
								<a href="#">Forget Your Password?</a>
							</div>
						</div>
						<button id="btn_login_do">SIGN IN</button>

						<script>
					         $(document).ready(function(){
					            $("#btn_login_do").click(function() {
				             	     login();
        					    });
       						  });
					         function login(){
					             $.ajax(
					             {
					                  type : 'post',
					                  url : '/login',
					                  dataType : 'json',
					                  data : 
					                {
					                   userEmail: $("#userEmail").val(),
					                   userPassword: $("#userPassword").val(),
					                },
					                  beforeSend : function(xhr){
					                      //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
					                      xhr.setRequestHeader("AJAX", true);
					                  },
					                  success : function(data, status, xhr) { // alertify or another welcome page 이동
					                     console.log(data);
					                     console.log(status);
					                     
					                     if( data ){
					                        window.location.href="/";
					                        
					                     }else{
					                        alertify.notify(
					                            'Opps!! 이메일 또는 비밀번호가 올바르지 않습니다.', 
					                            'error', //'error','warning','message'
					                            3
					                         );
					                     }
					                  }, 
					                  error: function(jqXHR, textStatus, errorThrown) 
					                  { 
					                     console.log(jqXHR);
					                     console.log(textStatus);
					                     console.log(errorThrown);
					                     alertify.notify(
					                        'Opps!! 로그인 과정에 문제가 생겼습니다.', 
					                        'error', //'error','warning','message'
					                        3, //-1
					                        function(){
					                           console.log(jqXHR.responseText); 
					                        }
					                     );
					                  }
					              });
					          }
					     </script>
                        
                        <div class="text-center">
                            <a href="/register">Or Creat an Account</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- checkout-area end -->
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
                                    <li><a href="/">home</a></li>
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
                                <li><a href="#"><span>Email:</span> oy3375@gmail.com</a></li>
                                <li><a href="#"><span>Tel:</span> 010 4201 7005</a></li>
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
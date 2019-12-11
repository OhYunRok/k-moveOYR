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
    <title>OEshop - Shop</title>
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

<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/alertify.min.js"></script>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/alertify.min.css" />
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.12.0/build/css/themes/default.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
<script src="/resources/assets/js/util.js"></script>
	
</head>

<body>
<script>
	var LIST_ROW_COUNT = 12;   //limit
	var OFFSET = 0;
	var PAGE_COUNT_PER_BLOCK = 10;   // pagination link 갯수
	var TOTAL_LIST_ITEM_COUNT = 0;
	var CURRENT_PAGE_INDEX = 1;
	var USER_SEQ= <%=userDto.getUserSeq()%>;
	
	$(document).ready(function(){
		
		boardList();
		
 		$("#addCart").click(function() {
            console.log('addCartStart');
            //if (validate()) {
            	cartInsert();
            //}
         });
	});
	
/* 	function validate() {
		var isProductIdValid = false;
        var isUserSeqValid = false;
        var isAmountValid = false;
        	
        var productId = $('#boardDetailModal').val();
        var productIdLength = productId.length;
        console.log(productId);
        if (productIdLength > 0) {
        	isProductIdValid = true;
       	 	console.log(isProductIdValid);
         }
		
        var userSeq = USER_SEQ;
        var userSeqLength = userSeq.length;
        console.log(userSeq);
        if (userSeqLength > 0) {
        	isUserSeqValid = true;
       	 	console.log(isUserSeqValid);
         }
        
        var amout = $('#amount').val();
        var amountLength = amount.length;
        console.log(amount);
        if (amountLength > 0) {
        	isAmountValid = true;
       	 	console.log(isAmountValid);
         }
        
         if (isProductIdValid && isUserSeqValid && isAmountValid) {
           return true;
         } else {
         	return false;
         } 
	} */
       
     	function cartInsert(){
  	      
  	    	console.log(USER_SEQ);  
  	    	console.log($("#detailProductId").val());  
  	    	console.log($("#amountValue").val());  
		
  	      $.ajax(
  	      {
  	           type : 'post',
  	           url : '/cart/insert',
  	           dataType : 'json',
  	           data : {
  	            	userSeq : USER_SEQ,
  	            	productId : $("#detailProductId").val(),
  	            	amount : $("#amountValue").val()
  	             },
  	             beforeSend : function(xhr) {
  	                //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
  	                xhr.setRequestHeader("AJAX", true);
  	             },
  	              success : function(data, status, xhr) { // alertify or another welcome page 이동
  	                 		
  	              	if(data){
  	            			  alertify.success('장바구니 등록');
  	              	}
  	             },
  	             error: function(jqXHR, textStatus, errorThrown) 
  	             { 
  	                if( jqXHR.responseText == "timeout" ){
  	                   window.location.href = "/login"
  	                }else{
  	                   alertify.notify(
  	                       '장바구니 등록과정에 문제가 생겼습니다.', 
  	                       'error', //'error','warning','message'
  	                       3, //-1
  	                       function(){
  	                          console.log(jqXHR.responseText); 
  	                       }
  	                    );
  	                }
  	             }
  	         });
  	  	}
	 
	function boardList() {
        $.ajax({
           type : 'get',
           url : '/product/list',
           dataType : 'json',
           data : {
           		limit : LIST_ROW_COUNT,
           		offset : OFFSET
           },
           beforeSend : function(xhr) {
              //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
              xhr.setRequestHeader("AJAX", true);
           },
            success : function(data, status, xhr) { // alertify or another welcome page 이동
               		
            	makeListHtml(data);
            
           },
           error: function(jqXHR, textStatus, errorThrown) 
           { 
              if( jqXHR.responseText == "timeout" ){
                 window.location.href = "/login"
              }else{
                 alertify.notify(
                     'Opps!! 글 상세 조회 과정에 문제가 생겼습니다.', 
                     'error', //'error','warning','message'
                     3, //-1
                     function(){
                        console.log(jqXHR.responseText); 
                     }
                  );
              }
           }
       });
	}
	
	function makeListHtml(list){
		
		//내용이 들어가야할부분 id
		$("#boardTbody").html("");
		
		//var boardArray = JSON.parse(data); @ResponseBody 자동으로 json변환 
		 for( var i=0; i<list.length; i++){
	         
	         var productId = list[i].productId;
	         var userName = list[i].userName;
	         var title = list[i].title;
	         var price = list[i].price;
	        //var quantity = list[i].quantity;
	         var content = list[i].content;
	         var fileUrl = list[i].fileUrl;
	         var regDt = list[i].regDt;
	         var readCount = list[i].readCount;
	         

		     var listHtml =
		    '<li class="col-xl-3 col-lg-4 col-sm-6 col-12 liProduct" data-productId=' + productId +'><div class="product-wrap"><div class="product-img">'+
			'<img src="/'+ fileUrl +'" alt=""><div class="product-icon flex-style">'+
			'<ul><li><a class="aProductDetail">'+
			'<i class="fa fa-eye"></i></a></li>'+ 
			'<li><a href="/cart"><i class="fa fa-shopping-bag"></i></a></li></ul>'+'</div></div>'+
			'<div class="product-content"><h3><a href="Single-product.html">'+title+'</a></h3>'+
			'<p class="pull-left">'+price+"원"+'</p><ul class="pull-right d-flex">'+
			'<li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star">'+
			'</i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star-half-o"></i></li></ul>'+
			'</div></div></li>';

			$("#boardTbody").append(listHtml);
	      }
	      
	      makeListHtmlEventHandler();
	      
	      boardListTotalCnt();
		}
	
	function addPagination(){

	      makePaginationHtml(LIST_ROW_COUNT, PAGE_COUNT_PER_BLOCK, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper", boardList );
	   }
	
	function movePage(pageIndex){
	      OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
	      CURRENT_PAGE_INDEX = pageIndex;
	      boardList();
	   }
	
	 function makeListHtmlEventHandler(){
	        $("#boardTbody .aProductDetail").click(function(e){
	        	e.preventDefault();
	           var productId = $(this).closest(".liProduct").attr("data-productId")
	           console.log(productId);
	           boardDetail(productId);
	           //alert(productId);
	        });
	     }
	 
		function boardListTotalCnt(){
		      
		      $.ajax(
		      {
		           type : 'get',
		           url : '/product/list/totalCnt',
		           dataType : 'json',
		           beforeSend : function(xhr){
		               //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
		               xhr.setRequestHeader("AJAX", true);
		           },
		           success : function(data, status, xhr) {
		              TOTAL_LIST_ITEM_COUNT = data;
		              addPagination();
		           }, 
		           error: function(jqXHR, textStatus, errorThrown) 
		           { 
		              if( jqXHR.responseText == "timeout" ){
		                 window.location.href = "/login"
		              }else{
		                 alertify.notify(
		                     'Opps!! 글 전체 갯수 조회 과정에 문제가 생겼습니다.', 
		                     'error', //'error','warning','message'
		                     3, //-1
		                     function(){
		                        console.log(jqXHR.responseText); 
		                     }
		                  );
		              }
		           }
		       });
		   }
		
		function boardDetail(productId){
			$.ajax({
			   	type : 'get',
		           url : '/product/detail',
		           dataType : 'json',
		           data : {
		           		productId: productId
		           },
		           beforeSend : function(xhr) {
		              //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
		              xhr.setRequestHeader("AJAX", true);
		           },
		            success : function(data, status, xhr) { // alertify or another welcome page 이동
		               		
		            	makeDetailHtml(data);
		            
		           },
		           error: function(jqXHR, textStatus, errorThrown) 
		           { 
		              if( jqXHR.responseText == "timeout" ){
		                 window.location.href = "/login"
		              }else{
		                 alertify.notify(
		                     'Opps!! 글 디테일 조회 과정에 문제가 생겼습니다.', 
		                     'error', //'error','warning','message'
		                     3, //-1
		                     function(){
		                        console.log(jqXHR.responseText); 
		                     }
		                  );
		              }
		           }
		          });
		   	}
		
		function makeDetailHtml(detail){
		      
	        var productId = detail.productId;
	        console.log('productID: '+productId);
	        var userSeq = detail.userSeq;
	        var userName = detail.userName;
	        var title = detail.title;
	        var price = detail.price;
	        var quantity = detail.quantity;
	        var content = detail.content;
	        var regDt = detail.regDt;
	        var readCount = detail.readCount;
	        var fileList = detail.fileList;
	        var fileUrl = detail.fileUrl;
	        console.log(fileList);
	        console.log(productId);
	        
	        
	        $("#boardDetailModal").attr("data-productId", productId);
	       //$("#userSeqDetail").attr("data-userSeq", userSeq);
	       // $("#productId").html(productId);
	        $("#titleDetail").html(title);
	        $("#priceDetail").html(price);
	        //$("#quantityDetail").html(quantity);
	        $("#contentDetail").html(content);
	        //$("#userNameDetail").html(userName);
	        //$("#regDtDetail").html(regDt);
	        //$("#readCountDetail").html(readCount);
	        $("#fileUrlDetail").attr("src",fileUrl);
	        $("#detailProductId").val(productId);
	        
	        $("#boardDetailModal").modal("show");
	        
	     //makeDetailHtmlEventHandler();
	  }
	
</script>
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
                            <li>
                                <a href="javascript:void(0);"><i class="fa fa-user"></i> My Account <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown_style">
                                    <li><a href="/logout">Logout</a></li>
                                    <li><a href="/cart">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="/wishlist">wishlist</a></li>
                                </ul>
                            </li>
                            	<c:set var="name" value="${userDto.userName}" />
								<c:if test="${name != null}">
                            			<li><a href="/logout"> Logout </a></li>
                            	</c:if>
                            	<c:if test="${name == null}">
                            			<li><a href="/register"> Login/Register </a></li>
                            	</c:if>
                            <li>
                                <a href="javascript:void(0);"> KOR <i class="fa fa-angle-down"></i></a>
                                <ul class="dropdown_style right">
                                    <li><a href="javascript:void(0);">USD</a></li>
                                    <li><a href="javascript:void(0);">AUD </a></li>
                                    <li><a href="javascript:void(0);">CAD </a></li>
                                    <li><a href="javascript:void(0);">CHF </a></li>
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
                                <li><a href="contact.html">Contact</a></li>
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
                                <li>
                                        <a href="/">Home</a>
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
    <div class="breadcumb-area bg-img-4 ptb-100" style="background-image: url(/resources/assets/images/banner/table.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcumb-wrap text-center">
                        <h2>Shop Page</h2>
                        <ul>
                            <li><a href="/">Home</a></li>
                            <li><span>Shop</span></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- .breadcumb-area end -->
    <!-- product-area start -->
    <div class="product-area pt-100">
        <div class="container">
            <div class="row">
                <div class="col-sm-9 col-lg-10">
                    <div class="product-menu">
                        <ul class="nav">
                            <li>
                                <a class="active" data-toggle="tab" href="#all">All product</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#chair">Vegetable</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#table">Fruit</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#bed">Rice</a>
                            </li>
                            <li>
                                <a data-toggle="tab" href="#decorative">Meat</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-sm-3 col-lg-2">
                    <div class="filter-menu text-right">
                        <a href="javascript:void(0);">Filter</a>
                    </div>
                </div>
            </div>
            <div class="row filter-active">
                <div class="col-12">
                    <div class="filter-wrap">
                        <div class="row">
                            <div class="product-filter col-lg-3 col-sm-6 col-12">
                                <h3 class="filter-title">Sort by</h3>
                                <ul class="sort-by">
                                    <li><a href="#">Default</a></li>
                                    <li><a href="#">Popularity</a></li>
                                    <li><a href="#">Average rating</a></li>
                                    <li><a href="#">Newness</a></li>
                                    <li><a href="#">Price: Low to High</a></li>
                                    <li><a href="#">Price: High to Low</a></li>
                                </ul>
                            </div>
                            <!-- Product Filter -->
                            <div class="product-filter col-lg-3 col-sm-6 col-12">
                                <h3 class="filter-title">color filters</h3>
                                <ul class="color-filter">
                                    <li><a href="#">Black</a></li>
                                    <li><a href="#">Brown</a></li>
                                    <li><a href="#">Orange</a></li>
                                    <li><a href="#">red</a></li>
                                    <li><a href="#">Yellow</a></li>
                                </ul>
                            </div>
                            <!-- Product Filter -->
                            <div class="product-filter col-lg-3 col-sm-6 col-12">
                                <h3 class="filter-title">product tags</h3>
                                <ul class="product-tags">
                                    <li><a href="#">New</a></li>
                                    <li><a href="#">brand</a></li>
                                    <li><a href="#">black</a></li>
                                    <li><a href="#">white</a></li>
                                    <li><a href="#">Honey</a></li>
                                    <li><a href="#">table</a></li>
                                    <li><a href="#">Lorem</a></li>
                                    <li><a href="#">ipsum</a></li>
                                    <li><a href="#">dolor</a></li>
                                    <li><a href="#">sit</a></li>
                                    <li><a href="#">amet</a></li>
                                </ul>
                            </div>
                            <div class="product-filter col-lg-3 col-sm-6 col-12">
                                <h3 class="filter-title">Filter by Price</h3>
                                <div class="filter-price">
                                    <form action="#">
                                        <div id="slider-range"></div>
                                        <div class="row">
                                            <div class="col-7">
                                                <p>Price :
                                                    <input type="text" id="amount">
                                                </p>
                                            </div>
                                            <div class="col-5 text-right">
                                                <button>filter</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			<div class="tab-content">
			
			    <div class="tab-pane active" id="all">
                    <ul class="row" id="boardTbody">
                    </ul>
                </div>
                
				<div id="paginationWrapper">
 				</div>
 				
			</div>
			
        </div>
    </div>
    <!-- product-area end -->
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
    <!-- Modal area start -->
    <div class="modal fade" id="boardDetailModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal-body d-flex">
                    <div class="product-single-img w-50">
                        <img id="fileUrlDetail" src="#" alt="">
                    </div>
                    <div class="product-single-content w-50">
                        <h3 id="titleDetail">#</h3>
                        <div class="rating-wrap fix">
                            <span class="pull-left" id="priceDetail">#</span><p>원</p>
                            	<input type="hidden" id="detailProductId" />
                            <ul class="rating pull-right">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li>(05 Customar Review)</li>
                            </ul>
                        </div>
                        <p id="contentDetail">#</p>
                        <ul class="input-style">
                            <li class="quantity cart-plus-minus">
                                <input type="text" id="amountValue" value="1" />
                            </li>
                            <li><a id="addCart" href="#">Add to Cart</a></li>
                        </ul>
                        <ul class="socil-icon">
                            <li>Share :</li>
                            <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                            <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal area End -->
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
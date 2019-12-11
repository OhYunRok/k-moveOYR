<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.oyr.webapp.dto.*"%>
<%
	UserDto userDto = (UserDto) session.getAttribute("userDto");
	String userName = "";
	int userSeq = 0;

	if (userDto != null) {
		System.out.println(userDto.getUserSeq());
		userName = userDto.getUserName();
		userSeq = userDto.getUserSeq();
	}
%>

<!doctype html>
<html class="no-js" lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>OEshop Admin_product</title>
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
<!-- <link rel="stylesheet" href="/resources/assets/css/metisMenu.min.css"> -->
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




<!-- <link rel="stylesheet" href="/resources/assets/css/common.css">
 -->
</head>

<body>

	<script>
	var LIST_ROW_COUNT = 10;   //limit
	var OFFSET = 0;
	var PAGE_COUNT_PER_BLOCK = 10;   // pagination link ����
	var TOTAL_LIST_ITEM_COUNT = 0;
	var CURRENT_PAGE_INDEX = 1;
	
	$(document).ready(function(){
		
		boardList();
		
		$("#btnBoardInsert").click(function() {

             console.log('insert');
             if (validate()) {
                boardInsert();
             }
          });
		
		$("#chkFileUploadInsert").click(function(){
			console.log(1);
	         if( $(this).prop("checked")){
	        	 console.log(2);
	            $("#imgFileUploadInsertWrapper").show();
	         }else{
	        	 console.log(3);
	            $("#inputFileUploadInsert").val("");
	            $("#imgFileUploadInsert").attr("src", "");
	            $("#imgFileUploadInsertWrapper").hide();
	         }
	      });
		//Update
	      $("#chkFileUploadUpdate").change(function(){
	         if( $(this).prop("checked")){
	            $("#imgFileUploadUpdateWrapper").show();
	         }else{
	            $("#inputFileUploadUpdate").val("");
	            $("#imgFileUploadUpdate").attr("src", "");
	            $("#imgFileUploadUpdateWrapper").hide();
	         }
	      });
	      
	      $("#inputFileUploadUpdate").change(function(e){

	         if( this.files && this.files[0] ){
	            var reader = new FileReader();
	            reader.onload = function(e){
	               $("#imgFileUploadUpdate").attr("src", e.target.result);
	            }
	            reader.readAsDataURL(this.files[0]);
	         }
	      });
		
		$("#inputFileUploadInsert").change(function(e){
	         if( this.files && this.files[0] ){
	             var reader = new FileReader();
	             reader.onload = function(e){
	                $("#imgFileUploadInsert").attr("src", e.target.result);
	             }
	             reader.readAsDataURL(this.files[0]);
	          }
	       });
		
		$("#btnBoardInsertForm").click(function(){
	         $("#title").val("");
	         $("#price").val("");
	         $("#quantity").val("");
	         $("#content").val("");
	         $("#chkFileUploadInsert").prop("checked", false);
	         $("#inputFileUploadInsert").val("");
	         $("#imgFileUploadInsert").removeAttr("src");
	         //$("#imgFileUploadInsert").attr("src", "");
	         $("#imgFileUploadInsertWrapper").hide();
	         
	         $("#boardInsertModal").modal("show");
	      });
		
		$("#btnBoardUpdateForm").click(function() {
				
			console.log('update');
	           var productId = $("#boardDetailModal").attr("data-productId");
	           $("#boardUpdateModal").attr("data-productId", productId);
	           
	           $("#titleUpdate").val($("#titleDetail").html());
	           $("#priceUpdate").val($("#priceDetail").html());
	           $("#quantityUpdate").val($("#quantityDetail").html());
	           $("#contentUpdate").val($("#contentDetail").html());
	           
	           var fileName = $("#fileListDetail").find(".fileName").html();
	           $("#fileListUpdate").html( '<span class="fileName">' + fileName + '</span>');
	           
	           $("#chkFileUploadUpdate").prop("checked", false);
	           $("#inputFileUploadUpdate").val("");
	           $("#imgFileUploadUpdate").attr("src", "");
	           //$("#imgFileUploadUpdate").removeAttr("src");
	           $("#imgFileUploadUpdateWrapper").hide();
	           
	           $("#boardDetailModal").modal("hide");
	           $("#boardUpdateModal").modal("show");
	          });
			
		$("#btnBoardUpdate").click(function() {

	           if(validateUpdate()){
	        	   boardUpdate();
	           }
	          });

		$("#btnBoardDeleteConfirm").click(function() {
			alertify.confirm(
			'Upwiden',
			'�� ���� ����?',
					function(){
				boardDelete();
			},
			function(){
				console.log('cancel');
				}
			);
	     });

	});
	
	function validate() {
		 var isTitleValid = false;
         var isPriceValid = false;
         var isQuantityValid = false;
         var isContentValid = false;
         	
         var title = $('#title').val();
         var titleLength = title.length;
         console.log(title);
         if (titleLength > 0) {
        	 isTitleValid = true;
        	 console.log(isTitleValid);
          }

         var price = $('#price').val();
         var priceLength = price.length;
         console.log(price);
         if (priceLength > 0) {
        	 isPriceValid = true;
        	 console.log(isPriceValid);
          }
         var quantity = $('#quantity').val();
         var quantityLength = quantity.length;
         console.log(quantity);
         if (quantityLength > 0) {
        	 isQuantityValid = true;
        	 console.log(isQuantityValid);
          }
         
         var content = $('#content').val();
         var contentLength = content.length;
         console.log(content);
         if (contentLength > 0) {
        	 isContentValid = true;
        	 console.log(isContentValid);
          }
         
          if (isTitleValid && isContentValid && isPriceValid && isQuantityValid) {
            // $("#titleInsert").removeClass("is-invalid");
            return true;
          } else {
             //$("#titleInsert").addClass("is-invalid");
          	return false;
          }
          

          /* if (isContentValid) {
             $("#contentInsert").removeClass("is-invalid");
          } else {
             $("#contentInsert").addClass("is-invalid");
          } */
       }
	
	function boardInsert(){
	      
	      var formData = new FormData();
	      formData.append("userSeq", '<%=userDto.getUserSeq()%>');
	      formData.append("title", $("#title").val());
	      formData.append("price", $("#price").val());
	      formData.append("quantity", $("#quantity").val());
	      formData.append("content", $("#content").val());
	      formData.append("file", $("#inputFileUploadInsert")[0].files[0]);
	      
	      $.ajax(
	      {
	           type : 'post',
	           url : '/product/insertFile',
	           dataType : 'json',
	           data : formData,
	           contentType: false,   // forcing jQuery not to add a Content-Type header for you, otherwise, the boundary string will be missing from it
	           processData: false, // otherwise, jQuery will try to convert your FormData into a string, which will fail.
	           beforeSend : function(xhr){
	               //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
	               xhr.setRequestHeader("AJAX", true);
	           },
	           success : function(data, status, xhr) { 
	         
	              if( data ){
	                 alertify.success('���� ��ϵǾ����ϴ�.');
	                 boardList();
	              }
	           }, 
	           error: function(jqXHR, textStatus, errorThrown) 
	           { 
	              if( jqXHR.responseText == "timeout" ){
	                 window.location.href = "/login"
	              }else{
	                 alertify.notify(
	                        'Opps!! �� ��� ������ ������ ������ϴ�.', 
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
	
	function validateUpdate(){
        var isTitleValid = false;
        var isContentValid = false;
        var isQuantityValid = false;
        var isContentValid = false;
        
        var title = $("#titleUpdate").val();
        var titleLength = title.length;
        
        if( titleLength > 0){
           isTitleValid = true;
        }   
        
        var contentValue = $("#contentUpdate").val();
        var contentLength = contentValue.length;
        
        if( contentLength > 0){
           isContentValid = true;
        }
        
        var price = $('#priceUpdate').val();
        var priceLength = price.length;
        
        if (priceLength > 0) {
       	 isPriceValid = true;
         }
        
        var quantity = $('#quantityUpdate').val();
        var quantityLength = quantity.length;
        
        if (quantityLength > 0) {
       	 isQuantityValid = true;
         }
        
        console.log(isTitleValid);
        console.log(isContentValid);
        
        if(isContentValid && isTitleValid && isPriceValid && isQuantityValid ){
            return true;
         }else{
            return false;
         }
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
            success : function(data, status, xhr) { // alertify or another welcome page �̵�
               		
            	makeListHtml(data);
            
           },
           error: function(jqXHR, textStatus, errorThrown) 
           { 
              if( jqXHR.responseText == "timeout" ){
                 window.location.href = "/login"
              }else{
                 alertify.notify(
                     'Opps!! �� �� ��ȸ ������ ������ ������ϴ�.', 
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
	                     'Opps!! �� ��ü ���� ��ȸ ������ ������ ������ϴ�.', 
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
		
		//������ �����Һκ� id
		$("#boardTbody").html("");
		
		//var boardArray = JSON.parse(data); @ResponseBody �ڵ����� json��ȯ 
		 for( var i=0; i<list.length; i++){
	         
	         var productId = list[i].productId;
	         var userName = list[i].userName;
	         var title = list[i].title;
	         var price = list[i].price;
	         var quantity = list[i].quantity;
	         var content = list[i].content;
	         var regDt = list[i].regDt;
	         var readCount = list[i].readCount;
	         
	         var listHtml =
	            '<tr style="cursor:pointer" data-productId=' + productId +'><td>' + productId + '</td><td>' + title + '</td><td>' + userName + '</td><td>' + regDt + '</td><td>' + readCount + '</td></tr>';

/* 		         var listHtml =
		            '<li class="col-xl-3 col-lg-4 col-sm-6 col-12"><div class="product-wrap"><div class="product-img">'+
			'<img src="/resources/assets/images/product/15.jpg" alt=""><div class="product-icon flex-style">'+
			'<ul><li><a data-toggle="modal" data-target="#exampleModalCenter" href="javascript:void(0);">'+
			'<i class="fa fa-eye"></i></a></li>'+'<li><a href="/wishlist"><i class="fa fa-heart"></i></a></li>'+
			'<li><a href="/cart"><i class="fa fa-shopping-bag"></i></a></li></ul>'+'</div></div>'+
			'<div class="product-content"><h3><a href="Single-product.html">'+title+'</a></h3>'+
			'<p class="pull-left">'+price+'</p><ul class="pull-right d-flex">'+
			'<li><i class="fa fa-star"></i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star">'+
			'</i></li><li><i class="fa fa-star"></i></li><li><i class="fa fa-star-half-o"></i></li></ul>'+
			'</div></div></li>' */
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
	        $("#boardTbody tr").click(function(){
	           var productId = $(this).attr("data-productId")
	           console.log(productId);
	           boardDetail(productId);
	           //alert(productId);
	        });
	     }


	
	
	function boardDetail(productId){
		   <!-- $("#boardDetailModal").modal("show"); -->
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
	            success : function(data, status, xhr) { // alertify or another welcome page �̵�
	               		
	            	makeDetailHtml(data);
	            
	           },
	           error: function(jqXHR, textStatus, errorThrown) 
	           { 
	              if( jqXHR.responseText == "timeout" ){
	                 window.location.href = "/login"
	              }else{
	                 alertify.notify(
	                     'Opps!! �� �� ��ȸ ������ ������ ������ϴ�.', 
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
        var userSeq = detail.userSeq;
        var userName = detail.userName;
        var title = detail.title;
        var price = detail.price;
        var quantity = detail.quantity;
        var content = detail.content;
        var regDt = detail.regDt;
        var readCount = detail.readCount;
        var fileList = detail.fileList;
        console.log(fileList);
        console.log(productId);
        
        
        $("#boardDetailModal").attr("data-productId", productId);
        $("#productId").html(productId);
        $("#titleDetail").html(title);
        $("#priceDetail").html(price);
        $("#quantityDetail").html(quantity);
        $("#contentDetail").html(content);
        $("#userNameDetail").html(userName);
        $("#regDtDetail").html(regDt);
        $("#readCountDetail").html(readCount);
        
        //FileList
        $("#fileListDetail").html("");
        
        if( fileList.length > 0 ){
           for(var i=0; i<fileList.length; i++){
              var imageId = fileList[i].imageId;
              var fileName = fileList[i].fileName;
              var fileUrl = fileList[i].fileUrl;
              
              $("#fileListDetail").append(
                    '<span class="fileName">' + fileName + '</span>');
              $("#fileListDetail").append(
                    '&nbsp;&nbsp;<a type="button" class="btn btn-outline btn-default btn-xs" ' +
                    'data-imageId="' + imageId + '" ' +
                    'href="' + fileUrl + '" ' +
                    'download="' + fileName + '">�����ޱ�</a>');
           }
        }
        
        if( userSeq != '<%=userDto.getUserSeq()%>' ){
           $("#btnBoardUpdateForm").hide();
           $("#btnBoardDeleteConfirm").hide();
        }else{
           $("#btnBoardUpdateForm").show();
           $("#btnBoardDeleteConfirm").show();
        }
        
        $("#boardDetailModal").modal("show");
        
     //makeDetailHtmlEventHandler();
  }
	

	function boardUpdate(){
	      
	      var formData = new FormData();
	      formData.append("productId", $("#boardUpdateModal").attr("data-productId"));
	      formData.append("userSeq", '<%=userDto.getUserSeq()%>');
	      formData.append("title", $("#titleUpdate").val());
	      formData.append("price", $("#priceUpdate").val());
	      formData.append("quantity", $("#quantityUpdate").val());
	      formData.append("content", $("#contentUpdate").val());
	      formData.append("file", $("#inputFileUploadUpdate")[0].files[0]);
	      
	      $.ajax(
	      {
	           type : 'post',
	           url : '/product/updateFile',
	           dataType : 'json',
	           data : formData,
	           contentType: false,   // forcing jQuery not to add a Content-Type header for you, otherwise, the boundary string will be missing from it
	           processData: false, // otherwise, jQuery will try to convert your FormData into a string, which will fail.
	           beforeSend : function(xhr){
	               //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
	               xhr.setRequestHeader("AJAX", true);
	           },
	           success : function(data, status, xhr) { 
	         
	              if( data ){
	                 alertify.success('���� �����Ǿ����ϴ�.');
	                 boardList();
	              }
	           }, 
	           error: function(jqXHR, textStatus, errorThrown) 
	           {
	              if( jqXHR.responseText == "timeout" ){
	                 window.location.href = "/login"
	              }else{
	                 alertify.notify(
	                    'Opps!! �� ���� ������ ������ ������ϴ�.', 
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
	
	function boardDelete() {
        $.ajax({
           type : 'post',
           url : '/product/delete',
           dataType : 'json',
           data : {
        	   productId: $("#boardDetailModal").attr("data-productId")
           },
           beforeSend : function(xhr) {
              //xhr.setRequestHeader("ApiKey", "asdfasxdfasdfasdf");
              xhr.setRequestHeader("AJAX", true);
           },
            success : function(data, status, xhr) { // alertify or another welcome page �̵�
               		
            	if(data){
          			  alertify.success('���� �����Ǿ����ϴ�.');
          			  boardList();
            	}
           },
           error: function(jqXHR, textStatus, errorThrown) 
           { 
              if( jqXHR.responseText == "timeout" ){
                 window.location.href = "/login"
              }else{
                 alertify.notify(
                     'Opps!! �� �� ��ȸ ������ ������ ������ϴ�.', 
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
							<li><i class="fa fa-phone"></i> +82 010 4201 7005</li>
							<li><i class="fa fa-envelope"></i> oy3375@gmail.com</li>
							<li>
								<p>
									<strong><%=userName%></strong><%=userSeq%>
									���� �α������Դϴ�.
								</p>
							</li>
						</ul>
					</div>
					<div class="col-md-6 col-12">
						<ul class="d-flex account_login-area">
							<li><a href="javascript:void(0);"><i class="fa fa-user"></i>
									My Account <i class="fa fa-angle-down"></i></a>
								<ul class="dropdown_style">
                                    <li><a href="/logout">Logout</a></li>
                                    <li><a href="/cart">Cart</a></li>
                                    <li><a href="checkout.html">Checkout</a></li>
                                    <li><a href="wishlist.html">wishlist</a></li>
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
                                </ul>
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
							<a href="/"> <img src="/resources/assets/images/logo2.png"
								alt="">
							</a>
						</div>
					</div>
					<div class="col-lg-7 d-none d-lg-block">
						<nav class="mainmenu">
                            <ul class="d-flex">
                                <li class="active">
                                	<a href="/">Home</a>
                                </li>
                                <li><a href="about.html">About</a></li>
                                <li>
                                    <a href="javascript:void(0);">Shop <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_style">
                                        <li><a href="/shop">Shop Page</a></li>
                                        <li><a href="shop-sidebar.html">Shop Sidebar</a></li>
                                        <li><a href="Single-product.html">Product Details</a></li>
                                        <li><a href="/cart">Shopping cart</a></li>
                                        <li><a href="checkout.html">Checkout</a></li>
                                        <li><a href="wishlist.html">Wishlist</a></li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="javascript:void(0);">Blog <i class="fa fa-angle-down"></i></a>
                                    <ul class="dropdown_style">
                                        <li><a href="blog.html">blog Page</a></li>
                                        <li><a href="blog-details.html">blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
						</nav>
					</div>
					<div class="col-md-4 col-lg-2 col-sm-5 col-4">
						<ul class="search-cart-wrapper d-flex">
							<li class="search-tigger"><a href="javascript:void(0);"><i
									class="flaticon-search"></i></a></li>
							<li><a href="javascript:void(0);"><i
									class="flaticon-like"></i> <span>2</span></a>
								<ul class="cart-wrap dropdown_style">
									<li class="cart-items">
										<div class="cart-img">
											<img src="/resources/assets/images/cart/1.jpg" alt="">
										</div>
										<div class="cart-content">
											<a href="cart.html">Pure Nature Product</a> <span>QTY
												: 1</span>
											<p>$35.00</p>
											<i class="fa fa-times"></i>
										</div>
									</li>
									<li class="cart-items">
										<div class="cart-img">
											<img src="/resources/assets/images/cart/3.jpg" alt="">
										</div>
										<div class="cart-content">
											<a href="cart.html">Pure Nature Product</a> <span>QTY
												: 1</span>
											<p>$35.00</p>
											<i class="fa fa-times"></i>
										</div>
									</li>
									<li>Subtotol: <span class="pull-right">$70.00</span></li>
									<li>
										<button>Check Out</button>
									</li>
								</ul></li>
							<li><a href="javascript:void(0);"><i
									class="flaticon-shop"></i> <span>3</span></a>
								<ul class="cart-wrap dropdown_style">
									<li class="cart-items">
										<div class="cart-img">
											<img src="/resources/assets/images/cart/1.jpg" alt="">
										</div>
										<div class="cart-content">
											<a href="cart.html">Pure Nature Product</a> <span>QTY
												: 1</span>
											<p>$35.00</p>
											<i class="fa fa-times"></i>
										</div>
									</li>
									<li class="cart-items">
										<div class="cart-img">
											<img src="/resources/assets/images/cart/3.jpg" alt="">
										</div>
										<div class="cart-content">
											<a href="cart.html">Pure Nature Product</a> <span>QTY
												: 1</span>
											<p>$35.00</p>
											<i class="fa fa-times"></i>
										</div>
									</li>
									<li class="cart-items">
										<div class="cart-img">
											<img src="/resources/assets/images/cart/2.jpg" alt="">
										</div>
										<div class="cart-content">
											<a href="cart.html">Pure Nature Product</a> <span>QTY
												: 1</span>
											<p>$35.00</p>
											<i class="fa fa-times"></i>
										</div>
									</li>
									<li>Subtotol: <span class="pull-right">$70.00</span></li>
									<li>
										<button>Check Out</button>
									</li>
								</ul></li>
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
								<li><a href="about.html">About</a></li>
								<li class="sidemenu-items"><a class="has-arrow"
									aria-expanded="false" href="javascript:void(0);">Shop </a>
									<ul aria-expanded="false">
										<li><a href="shop.html">Shop Page</a></li>
										<li><a href="shop-sidebar.html">Shop Sidebar</a></li>
										<li><a href="Single-product.html">Product Details</a></li>
										<li><a href="cart.html">Shopping cart</a></li>
										<li><a href="checkout.html">Checkout</a></li>
										<li><a href="wishlist.html">Wishlist</a></li>
									</ul></li>
								<li class="sidemenu-items"><a class="has-arrow"
									aria-expanded="false" href="javascript:void(0);">Blog</a>
									<ul aria-expanded="false">
										<li><a href="blog.html">Blog</a></li>
										<li><a href="blog-details.html">Blog Details</a></li>
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

	<!-- blog-area start -->
	<div class="blog-area">
		<div class="container">
			<div class="col-lg-12">
				<div class="section-title  text-center">
					<h2>Product list</h2>
					<img src="/resources/assets/images/section-title.png" alt="">
				</div>
			</div>
			<div>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>����</th>
							<th>�ۼ���</th>
							<th>�ۼ� ����</th>
							<th>��ȸ��</th>
						</tr>
					</thead>
					<tbody id="boardTbody">

					</tbody>
				</table>
				
				<div id="paginationWrapper">

 				</div>
 				
</div>

			<div class="container">
				<!-- Button to Open the Modal -->
				<ul class="input-style">
					<li><a href="#" style="margin-left: 0px; margin-top: 10px;"
						id="btnBoardInsertForm" data-toggle="modal" data-target="#myModal">���</a></li>
				</ul>
				<!-- 			<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">report</button> -->
				<!-- style="padding:8px 40px; border:1px solid #ef4836; font-weight:500; color:#ef4836; margin:30px 0 0;" -->

      <!-- Modal area start -->
    <div class="modal fade" id="myModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">��</span>
                </button>
                <div class="modal-body">

                    <div class="product-single-content">
                        <h3>��ǰ ���</h3>
                        <div class="checkout-form form-style">
                        <form action="checkout">
                            <div class="row">
                                <div class="col-12">
                                    <label>��ǰ�� *</label>
                                    <input type="text" id="title">
                                </div>
                                <div class="col-12">
                                    <label>���� *</label>
                                    <input type="text" id="price">
                                </div>
                                <div class="col-12">
                                    <label>���� *</label>
                                    <input type="text" id="quantity">
                                </div>
                                <div class="col-12">
                                    <input id="chkFileUploadInsert" type="checkbox">
                                    <label for="select1">���� �߰�</label>
                                </div>
                                <div class="col-12">
                                    <label>���� *</label>
                                    <textarea name="massage" id="content" placeholder="��ǰ �� ������ �Է��ϼ���"></textarea>
                                </div>
                                <div class="col-xl-12 form-group" style="display:none;" id="imgFileUploadInsertWrapper">
                              		<input type="file" id="inputFileUploadInsert">
                              		<div class="thumbnail-wrapper">
                                      <img id="imgFileUploadInsert">
                                    </div>
                          		</div>
                            </div>
                        </form>
						<ul class="input-style">
                            <li><a href="#" style="margin-left: 0px; margin-top: 10px;" id="btnBoardInsert">���</a></li>
                        </ul>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		</div>
				<!-- The Modal update -->
				<div class="modal fade" id="boardUpdateModal" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">��</span>
							</button>
							<div class="modal-body">
							   <div class="product-single-content">
								<div class="checkout-form form-style">
                      			<form action="checkout">
							
								<div class="row">
									<div class="col-xl-12 form-group">
										<input id="titleUpdate" type="text" class="form-control"
											name="title" placeholder="����">
									</div>
									<div class="col-xl-12 form-group">
										<textarea id="priceUpdate" class="form-control"
											 placeholder="����"></textarea>
									</div>
									<div class="col-xl-12 form-group">
										<textarea id="quantityUpdate" class="form-control"
											 placeholder="����"></textarea>
									</div>
									<div class="col-xl-12 form-group">
										<textarea id="contentUpdate"  class="form-control"
											 placeholder="����"></textarea>
									</div>
									<div class="col-xl-12 form-group">
										÷������ : <span id="fileListUpdate"></span>
									</div>
									<div class="col-xl-12 form-group">
										<div class="checkbox-custom checkbox-primary">
											<input type="checkbox" id="chkFileUploadUpdate" /> <label
												for="chkFileUploadUpdate">���� ����</label>
										</div>
									</div>
									<div class="col-xl-12 form-group" style="display: none;"
										id="imgFileUploadUpdateWrapper">
										<input type="file" id="inputFileUploadUpdate">
										<div class="thumbnail-wrapper">
											<img id="imgFileUploadUpdate">
										</div>
									</div>
								</div>
								</form>
										<ul class="input-style">
											<li><a href="#"
												style="margin-left: 0px; margin-top: 10px;"
												id="btnBoardUpdate">����</a></li>
										</ul>
								</div>
								</div>
							</div>

						</div>
					</div>
				</div>


            <!-- End Modal -->

  <!-- Modal area start -->
    <div class="modal fade" id="boardDetailModal" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <button type="button" id="close" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <div class="modal-body d-flex">
                    <div class="product-single-content">
                        <h4 class="modal-title" id="boardDetailModalTitle" id="">��ǰ ��</h4>
                    <table class="table table-hover">
                      <tbody>
                        <tr><td width="100px">�۹�ȣ</td><td id="productId">#</td></tr>
                        <tr><td>����</td><td id="titleDetail">#</td></tr>
                        <tr><td>����</td><td id="priceDetail">#</td></tr>
                        <tr><td>����</td><td id="quantityDetail">#</td></tr>
                        <tr><td>����</td><td id="contentDetail">#</td></tr>
                        <tr><td>�ۼ���</td><td id="userNameDetail">#</td></tr>
                        <tr><td>�ۼ��Ͻ�</td><td id="regDtDetail">#</td></tr>
                        <tr><td>��ȸ��</td><td id="readCountDetail">#</td></tr>
                        <tr><td>÷������</td><td id="fileListDetail">#</td></tr>
                      </tbody>
                     </table>
<!--                      <a id="btnBoardUpdateForm" href="#">�� �����ϱ� </a>
                     <a id="btnBoardDeleteConfirm" href="#"> �� �����ϱ�</a> -->
                      <ul class="input-style">
<!--                         <button id="btnBoardUpdateForm" class="btn btn-sm btn-primary btn-outline" type="button" style="z-index: 2050;">�� �����ϱ�</button>
                        <button id="btnBoardDeleteConfirm" class="btn btn-sm btn-warning btn-outline" type="button">�� �����ϱ�</button>
                        <button id="btnBoardCommentForm" class="btn btn-sm btn-info" type="button">���� ����</button>
					 -->
	                     <li><a id="btnBoardUpdateForm" href="#">�� �����ϱ�</a></li>
    	                 <li><a id="btnBoardDeleteConfirm" href="#">�� �����ϱ�</a></li>
                     	 <li><a href="btnBoardCommentForm">��� ����</a></li>
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

			<!-- start social-newsletter-section -->
			<section class="social-newsletter-section">
				<div class="container">
					<div class="row">
						<div class="col-lg-12">
							<div class="newsletter text-center">
								<h3>Subscribe Newsletter</h3>
								<div class="newsletter-form">
									<form>
										<input type="text" class="form-control"
											placeholder="Enter Your Email Address...">
										<button type="submit">
											<i class="fa fa-send"></i>
										</button>
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
											<li><a href="blog.html">how to eat blog</a></li>
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
									<p>On the other hand, we denounce with righteous
										indignation and dislike men who are so beguiled and
										demoralized by the charms of pleasure righteous indignation
										and dislike</p>
								</div>
							</div>
							<div class="col-lg-3 col-md-8 col-sm-12">
								<div class="footer-adress">
									<ul>
										<li><a href="#"><span>Email:</span> domain@gmail.com</a></li>
										<li><a href="#"><span>Tel:</span> 0131234567</a></li>
										<li><a href="#"><span>Adress:</span> 52 Web Bangale ,
												Adress line2 , ip:3105</a></li>
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
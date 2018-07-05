<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

  	  <script>
  	   $(document).ready(function() { 		   
 		   
  		 $( "#_searchBox" ).autocomplete({
  	        source : function( request, response ) {
  	             $.ajax({
  	                    type: 'post',
  	                    url: "autocomplete.do",
  	                    dataType: "json",
  	                    //request.term = $("#autocomplete").val()
  	                    data: { searchBox : request.term },
  	                    success: function(data) {
  	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
  	                        response(
  	                            $.map(data, function(item) {
  	                                return {
  	                                    label: item.data, 
  	                                    value: item.data
  	                                }
  	                            })
  	                        );
  	                    }
  	               });
  	            },
  	        //조회를 위한 최소글자수
  	        minLength: 1,
  	        select: function( event, ui ) {
  	            // 만약색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
  	            $('#_searchBox').focus();
				
  	        }
  	    });
	   	
	  });
	 </script> 
       
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-chevron-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->


  <!-- Start header section -->
  <header id="aa-header">
    <!-- start header top  -->
    <div class="aa-header-top">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-top-area">
              <!-- start header top left -->
              <div class="aa-header-top-left">
                <!-- start language -->
                <div class="aa-language">

                </div>
                <!-- / language -->

                <!-- start cellphone -->
                <div class="cellphone hidden-xs">
                  <p><span class="fa fa-phone"></span>010-7234-9760 &nbsp; &nbsp; <span class="fa fa-phone"></span>010-3035-1858</p>
                </div>
                <!-- / cellphone -->
              </div>
              <!-- / header top left -->
              <div class="aa-header-top-right">
                <ul class="aa-head-top-nav-right">
                
                <c:if test="${sessionScope.id eq 'hjs9760'}">
                	<ul class="aa-head-top-nav-right">         
	                  <li class="hidden-xs"><a href="admin.do">관리자 페이지</a></li>
	                  <li class="hidden-xs"><a href="logout.do" onClick="return logout();">로그아웃</a></li>
              	  </ul>              
                </c:if>
                  
  
 				 <c:if test="${sessionScope.id ne 'hjs9760'}">
              	   <c:if test="${sessionScope.id ne null}">	
	                 	<ul class="aa-head-top-nav-right">
		                  <li><a href="mypage.do"> 내 정보 </a></li>         
		                  <li class="hidden-xs"><a href="viewWishList.do">장바구니</a></li>
		                  <li class="hidden-xs"><a href="checkout.do?id=${sessionScope.id}">결제 상품</a></li>
		                  <li class="hidden-xs"><a href="logout.do" onClick="return logout();">로그아웃</a></li>		                	   					   	     
	               		 </ul>
                	 </c:if>
                 </c:if>                 
                  
                   <c:if test="${sessionScope.id eq null}">
                  	 <ul class="aa-head-top-nav-right">
                 		 <li><a href="" data-toggle="modal" data-target="#login-modal">로그인</a></li>
                 		 <li class="hidden-xs"><a href="regi.do">회원가입</a></li>
                 	 </ul>
                  </c:if>
			  
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header top  -->

    <!-- start header bottom  -->
    <div class="aa-header-bottom">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="aa-header-bottom-area">
              <!-- logo  -->
              <div class="aa-logo">
                <!-- Text based logo -->
                <a href="main.do">
                  <span class="fa fa-shopping-cart"></span>
                  Any<strong>Shop</strong>
                </a>
              </div>       
          
	 <!-- cart box -->    

             <c:if test="${!empty sessionScope.id }">             
              	<div class="aa-cartbox">
                	<span class="fa fa-shopping-basket"></span>            	 
               	 	<div> 
               	 		<span style="font-weight:bold;">${sessionScope.loginInfo.name }</span> 님 반갑습니다. 
               	 	</div> 
	             	<div> 내 포인트: ${sessionScope.loginInfo.point} 점  </div>          	 
               	</div>	
			 </c:if>			 	 
	<!-- / cart box -->
              
              
           	<!-- search box -->
              <div class="aa-search-box">
                <form id="_search" action="searchBoxClick.do" method="get" onSubmit="return checkSearchBox();">
                	<input type="hidden" name="id" value="${sessionScope.id}">
                	<input type="hidden" name="age" value="${sessionScope.age}">
                	<input type="hidden" name="gender" value="${sessionScope.gender}">
                  	<input type="text" name="searchBox" id="_searchBox" placeholder="찾으시는 것을 검색하세요.">
                	<button type="submit"><span class="fa fa-search"></span></button> 
                </form>
              </div>   
              
              <script>       	   
	         	   function checkSearchBox() {
	         		   if($('input[name=id]' ).val() == null ) {
	         			   alert('AnyShop 이용은 로그인 후 이용 가능 합니다.');
	         			   return false;
	         		   } else {
	         			   return true;
	         		   }
	         	   }
              </script>                         
            <!-- / search box -->   
                        
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- / header bottom  -->
  </header>
  <!-- / header section -->	  
  
  
  <!-- menu -->
<section id="menu">
    <div class="container">
      <div class="menu-area">
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>          
          </div>
          <div class="navbar-collapse collapse">
            <!-- Left nav -->
            <ul class="nav navbar-nav">
              <li><a href="main.do">Home</a></li>
              <li><a href="product_kindsAllList.do?product_kinds=man">남자 <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="productDetailAllList.do?product_kinds=man&product_detail=shoes">신발</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=man&product_detail=top">상의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=man&product_detail=bottom">하의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=man&product_detail=outerwear">아우터</a></li>                                                
                </ul>
              </li>
              <li><a href="product_kindsAllList.do?product_kinds=women">여자 <span class="caret"></span></a>
                <ul class="dropdown-menu">  
                  <li><a href="productDetailAllList.do?product_kinds=women&product_detail=shoes">신발</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=women&product_detail=top">상의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=women&product_detail=bottom">하의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=women&product_detail=skirt">치마</a></li> 
                  <li><a href="productDetailAllList.do?product_kinds=women&product_detail=outerwear">아우터</a></li>                                                                  
                 </ul>
               </li>                   

              <li><a href="product_kindsAllList.do?product_kinds=kids">어린이 <span class="caret"></span></a>
                <ul class="dropdown-menu">                
                  <li><a href="productDetailAllList.do?product_kinds=kids&product_detail=shoes">신발</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=kids&product_detail=top">상의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=kids&product_detail=bottom">하의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=kids&product_detail=skirt">치마</a></li> 
                  <li><a href="productDetailAllList.do?product_kinds=kids&product_detail=outerwear">아우터</a></li>                                                 
                </ul>
              </li>
              
             <li><a href="product_kindsAllList.do?product_kinds=sports">운동 <span class="caret"></span></a>
                <ul class="dropdown-menu"> 
                  <li><a href="productDetailAllList.do?product_kinds=sports&product_detail=shoes">신발</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=sports&product_detail=top">상의</a></li>
                  <li><a href="productDetailAllList.do?product_kinds=sports&product_detail=bottom">하의</a></li> 
                  <li><a href="productDetailAllList.do?product_kinds=sports&product_detail=outerwear">아우터</a></li>                                                                            
                </ul>
              </li>
            
            </ul>
          </div>
        </div>
      </div>       
    </div>
  </section>
  <!-- / menu -->
  
  
  
  
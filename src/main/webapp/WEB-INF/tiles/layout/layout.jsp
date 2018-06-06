<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">    
    <title>Any Shop | Home</title>
    
    <!-- Font awesome -->
    <link href="resources/bootstrap/css/font-awesome.css" rel="stylesheet">
    <!-- Bootstrap -->
    <link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">   
    <!-- SmartMenus jQuery Bootstrap Addon CSS -->
    <link href="resources/bootstrap/css/jquery.smartmenus.bootstrap.css" rel="stylesheet">
    <!-- Product view slider -->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/jquery.simpleLens.css">    
    <!-- slick slider -->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/slick.css">
    <!-- price picker slider -->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/css/nouislider.css">
    <!-- Theme color -->
    <link id="switcher" href="resources/bootstrap/css/theme-color/default-theme.css" rel="stylesheet">
    <!-- Top Slider CSS -->
    <link href="resources/bootstrap/css/sequence-theme.modern-slide-in.css" rel="stylesheet" media="all">

    <!-- Main style sheet -->
    <link href="resources/bootstrap/css/style.css" rel="stylesheet">    

    <!-- Google Font -->
    <link href='https://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
   	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  	
  	<!-- autocomplete -->
  	 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	 <!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
 
    
     
<!-- jQuery library -->
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="resources/bootstrap/js/bootstrap.js"></script>  
  <!-- SmartMenus jQuery plugin -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.smartmenus.js"></script>
  <!-- SmartMenus jQuery Bootstrap Addon -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.smartmenus.bootstrap.js"></script>  
  <!-- To Slider JS -->
  <script src="resources/bootstrap/js/sequence.js"></script>
  <script src="resources/bootstrap/js/sequence-theme.modern-slide-in.js"></script>  
  <!-- Product view slider -->
  <script type="text/javascript" src="resources/bootstrap/js/jquery.simpleGallery.js"></script>
  <script type="text/javascript" src="resources/bootstrap/js/jquery.simpleLens.js"></script>
  <!-- slick slider -->
  <script type="text/javascript" src="resources/bootstrap/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="resources/bootstrap/js/nouislider.js"></script>
  <!-- Custom js -->
  <script src="resources/bootstrap/js/custom.js"></script> 
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  </head>
 

 <body>
 
  	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="body" /> 
	
  <!-- 배너 섹션-->
<section id="aa-banner">
    <div class="container">
      <div class="row">
        <div class="col-md-12">        
          <div class="row">
            <div class="aa-banner-area">           	
            <img src="resources/product/banner.png" style="text-align:center; width:600px; height:auto; background-color:lavender;" alt="fashion banner img">
          		<span> Any Shop에 오신걸 환영합니다. </span>
          </div>
          </div>
        </div>
      </div>
    </div>
  </section>     
     
     		<table class="table">
                      <tr>
                      </tr>	
                        <tr>
                          <th>CUSTOMER</th>
                          <th>DELIVERY</th>
                          <th>ACCOUNT</th>
                        </tr>
                      <tbody>
                        <tr>
                          <th scope="row">010-7234-9760</th>
                          <th>반품주소</th>
                          <th>농협 356-7234-9760-33</th>
                        </tr>
                        <tr>
                          <th scope="row">WEEK AM 10:00 ~ PM 17:00</th>
                          <th>경기도 남양주시 화도읍</th>
                          <th>신한 110-7234-9760-33</th>
                        </tr>
                        <tr>
                          <th scope="row">LUNCH PM 12:00 ~ PM 13:00</th>
                          <th>수레로 Any Shop</th>
                          <th>국민 123-4567-8901-33</th>
                        </tr>
                        <tr>
                          <th scope="row"> DAY OFF(SAT, SUN, HOLIDAY)</th>
                        </tr>
                      </tbody>
                    </table>
	
	
	<!-- Login Modal -->
  <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">                      
        <div class="modal-body">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
         <span class="fa fa-shopping-cart"> AnyShop Login </span> 
          <form class="aa-login-form" action="loginAfter.do" method="post" onSubmit="return checkIdPw();">
            <label for="">ID</label>
           	 	<input type="text" name="id" id="_id">
            <label for="">Password</label> 
            	<input type="password" name="pw" id="_pw">
            	<input class="aa-browse-btn" type="submit" value="로그인">
          </form> 
          
   <script>
    	function checkIdPw() {
    		var id=$('#_id').val();
    		var pw=$('#_pw').val();
    		var res;
    		
    		if( id == "" ) {
    			alert('아이디를 입력해주세요');
    			return false;
    		} else if (pw == ""){
    			alert('암호를 입력해주세요.');
    			return false;
    		} else {    			
    			$.ajax ({
    	            type: 'POST',
    	            url: 'checkIdPw.do',
    	            data: {id:id, pw:pw},
    	            async: false,
    	            success: function(msg) {
    	                if(msg.result == 0 ) {
							alert('일치하는 회원정보가 없습니다.');
							res= false;
    	               } else {
							res= true;
    	               } 
    	            },
    	            error : function(request,status,error) {
    	            	alert('실패');
    	                alert(request.status);
    	                alert(error);
    	            }
    	         });   			
    		}
    		if(res == true) {
    			return true;
    		} else {
    			return false;
    		}
    	}
    	
    	function logout() {
    		if(confirm("정말 로그아웃 하시겠습니까?") == true) {
    			alert("성공적으로 로그아웃 되었습니다.");
    			return true;
    		} else {
    			return false;
    		}
    	}
   </script>        
            
        <label for="rememberme" class="rememberme"></label>
          <p class="aa-lost-password"><a href="findId.do">아이디를 잊어버리셨나요?</a></p>
          <p class="aa-lost-password"><a href="findPw.do">암호를 잊어버리셨나요?</a></p>
            
           <div class="aa-register-now">
             	아직 회원이 아니신가요?<a href="regi.do">회원가입</a>
           </div>
        </div>                        
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div>
  <hr>

</body>

</html>


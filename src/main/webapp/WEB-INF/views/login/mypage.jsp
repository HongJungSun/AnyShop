<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
     
          
        
<section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                <h4>내정보</h4>
                  <form action="update_info.do" name="userInfo" class="aa-login-form">    
                 	<input type="hidden" name="pw" value="${sessionScope.loginInfo.pw}">
                 	<input type="hidden" name="gender" value="${sessionScope.loginInfo.gender}">       
                    <input type="hidden" name="id" value="${sessionScope.loginInfo.id}">
                    
                                         이름:  <input type="text" name="name" id="_name" value="${sessionScope.loginInfo.name}" disabled>
                         <span id="_name1"></span>
						 <input type="hidden" id="nameCheck" value="nameUnCheck">
                                         
               	    번호:  <input type="text" name="phone" id="_phone" value="${sessionScope.loginInfo.phone}" disabled>
               	   		 <span id='_phone1'></span> 
                  		 <input type="hidden" id="phoneCheck" value="phoneUnCheck">
               	           
       			 이메일:  <input type="text" name="email" id="_email" value="${sessionScope.loginInfo.email}" disabled>
       			 		 <span id='_email1'></span>
			 			 <input type="hidden" id="emailCheck" value="emailUnCheck">
			 			                 
       			    주소:  <input type="text" name="address" id="_address" value="${sessionScope.loginInfo.address}" disabled>
       			   		 <span id='_address1'></span>
           				 <input type="hidden" id="addressCheck" value="addressUnCheck">                
                                        
                    <input type="submit" class="aa-browse-btn" value="내 정보 수정하기">
                    </form>  
                </div>
              </div>

	<script>
		function check(){
			location.href="update_info.do";
		}

	</script>

              <div class="col-md-6">
                <div class="aa-myaccount-register">                 
                 <h4>오늘 본 내 상품(*)</h4>
                 <form action="" class="aa-login-form">
                    <label for="">Username or Email address<span>*</span></label>
                    <input type="text" placeholder="Username or email">
                    <label for="">Password<span>*</span></label>
                    <input type="password" placeholder="Password">
                    <button type="submit" class="aa-browse-btn">Register</button>                    
                  </form>
                </div>
              </div>
            </div>          
         </div>
       </div>
     </div>
   </div>
 </section>
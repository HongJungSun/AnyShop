<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/regijs/bootstrap.min.js"></script>
     
          
        
<section id="aa-myaccount">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
        <div class="aa-myaccount-area">         
            <div class="row">
              <div class="col-md-6">
                <div class="aa-myaccount-login">
                <h4>내정보</h4>
                  <form action="updateAfter.do" name="userInfo" class="aa-login-form" onSubmit="return check();">    
                 	<input type="hidden" name="pw" value="${sessionScope.loginInfo.pw}">
                 	<input type="hidden" name="gender" value="${sessionScope.loginInfo.gender}">       
                    <input type="hidden" name="id" value="${sessionScope.loginInfo.id}">
                    
                                         이름:   <span id="_name1"></span>
                         <input type="text" name="name" id="_name" value="${sessionScope.loginInfo.name}" >                        
						 <input type="hidden" id="nameCheck" value="nameUnCheck">
                                         
               	    번호:  <span id='_phone1'></span>
               	   	    <input type="text" name="phone" id="_phone" value="${sessionScope.loginInfo.phone}" > 
                  		<input type="hidden" id="phoneCheck" value="phoneUnCheck">
               	           
       			 이메일:   <span id='_email1'></span>
       				     <input type="text" name="email" id="_email" value="${sessionScope.loginInfo.email}" >
			 			 <input type="hidden" id="emailCheck" value="emailUnCheck">
			 			                 
       			    주소:  <span id='_address1'></span>
       			   	    <input type="text" name="address" id="_address" value="${sessionScope.loginInfo.address}" >
           				<input type="hidden" id="addressCheck" value="addressUnCheck">                
                                        
                    <input type="submit" class="aa-browse-btn" value="내 정보 수정하기">
                    </form>  
                </div>
              </div>
              							
									<script>						
							        	
							            $("#_name").keyup(function () {
									        regexp = /^[가-힣a-zA-Z]+$/;
									        v = $(this).val();
									        
									        if ( regexp.test(v)) {   
									            $('#_name1').css('color','green');
									            $('#_name1').html("올바른 이름입니다.");
									            $('#nameCheck').attr('value','nameCheck');
									        } else {
									        	$('#_name1').css('color','red');
									            $('#_name1').html("이름을 특수문자 또는 ㄱ,ㄴ,ㄷ 으로는 사용할 수 없습니다.");
									            $('#nameCheck').attr('value','nameUnCheck');
									          
									        }
									    });
							            
									    $("#_phone").keyup(function () {
									        regexp = /[0-9]{11}/;
									        v = $(this).val();
									        if ( ! regexp.test(v)) {
									            $('#_phone1').css('color','red');
									            $('#_phone1').html("올바르지 않은 번호입니다.");
									            $('#phoneCheck').attr('value','phoneUnCheck');
									        } else {
									           $('#_phone1').css('color','green');
									            $('#_phone1').html("올바른 번호입니다.");
									            $('#phoneCheck').attr('value','phoneCheck');
									        }
									    });

								     
								      $("#_email").keyup(function () {
								         regexp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
								         v = $(this).val();
								         if ( regexp.test(v)) {   
								             $('#_email1').css('color','green');
								             $('#_email1').html("올바른 이메일입니다.");
								             $('#emailCheck').attr('value','emailCheck');
								         } else {
								         	$('#_email1').css('color','red');
								             $('#_email1').html("이메일 형식으로 입혁하시기 바랍니다.");
								             $('#emailCheck').attr('value','emailUnCheck');
								           
								         }
								     }); 
								</script>     
								
							<script>
								function check(){		
									
						        	var nameCheck=$('#nameCheck').val();
						        	var emailCheck= $('#emailCheck').val();
						        	var phoneCheck=$('#phoneCheck').val();
						        	var addressCheck=$('#addressCheck').val();	
     
						            if(nameCheck != "nameCheck") {
						                alert('이름을 확인 하시기 바랍니다.');
						                return false;
						             }
						            
						            else if(phoneCheck != "phoneCheck") {
						                alert('번호를 확인 하시기 바랍니다.');
						                return false;
						             }
						            
						            else if(emailCheck != "emailCheck") {
						                alert('이메일을 확인 하시기 바랍니다.');
						                return false;
						             } 
						              						        	
						            
						            else if(!document.userInfo.name.value){
						                alert("이름을 입력하세요.");
						                return false;
						            }
						            
						            else if(!document.userInfo.phone.value){
						                alert("전화번호를 입력하세요.");
						                return false;
						            }
						            
						            else if(!document.userInfo.email.value){
						                alert("이메일을 입력하세요.");
						                return false;
						            }						        
						                      
						            else if(!document.userInfo.address.value){
						                alert("주소를 입력하세요.");
						                return false;
						            }
									
						            else if(confirm("정말 정보를 수정하시겠습니까?") == true){
											alert('정상적으로 수정되었습니다.');
											alert('다시 로그인 해주세요.');
											return true;
										}
									else {
										return false;
										}										
									}							
								</script>
	
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
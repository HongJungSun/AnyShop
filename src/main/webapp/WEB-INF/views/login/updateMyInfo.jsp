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
                 	<input type="hidden" name="gender" value="${sessionScope.loginInfo.gender}">       
                    <input type="hidden" name="id" value="${sessionScope.loginInfo.id}">
                    
                                         이름:   <span id="_name1"></span>
                         <input type="text" name="name" id="_name" value="${sessionScope.loginInfo.name}" >                        
						 <input type="hidden" id="nameCheck" value="nameCheck">
                                         
               	    번호:  <span id='_phone1'></span>
               	   	    <input type="text" name="phone" id="_phone" value="${sessionScope.loginInfo.phone}" > 
                  		<input type="hidden" id="phoneCheck" value="phoneCheck">
               	           
       			 이메일:   <span id='_email1'></span>
       				     <input type="text" name="email" id="_email" value="${sessionScope.loginInfo.email}" >
			 			 <input type="hidden" id="emailCheck" value="emailCheck">
			 			                 
       			    주소: 
       			   	    <input type="text" name="address" id="sample4_postcode" value="${sessionScope.loginInfo.address}" placeholder="우편번호" >          			
						<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기"><br>
						<input type="text" name="address" class="form-control" id="sample4_roadAddress" placeholder="기본 주소">
						<input type="text" name="address" class="form-control" id="sample4_jibunAddress" placeholder="상세주소">
						<input type="hidden" id="addressCheck" value="addressCheck">              
                                        
   				 비밀번호:  <span id='_pw1'></span>
       			   	    <input type="password" name="pw" id="_pw">               
                
   				 비밀번호 확인:  <span id='_pw3'></span>
       			   	    <input type="password" name="pw2" id="_pw2">                   
                
                
                    <input type="submit" class="aa-browse-btn" value="내 정보 수정하기">
                    </form>  
                </div>
              </div>
              
              <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;


                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
              							
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
						        	var pwCheck=$('#_pw').val();
						        	var pw2Check=$('#_pw2').val();
						        	
						        	
						        	if(pwCheck != pw2Check) {
						        		alert('비밀번호가 서로 다릅니다.');
						        		return false;
						        	}
						        	
     
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
						            } else if(!document.userInfo.pw.value){
						                alert("비밀번호를 입력하세요.");
						                return false;
						            } else if(!document.userInfo.pw2.value){
						                alert("비밀번호 확인을 입력하세요.");
						                return false;
						            } else if(confirm("정말 정보를 수정하시겠습니까?") == true){
											alert('정상적으로 수정되었습니다.');
											alert('다시 로그인 해주세요.');
											return true;
									} else {
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
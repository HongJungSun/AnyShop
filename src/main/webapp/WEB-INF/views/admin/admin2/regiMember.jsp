<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/regijs/bootstrap.min.js"></script>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
 <script>

	function idCheck() {
	    
	    var id = $('#_id').val();
	    	 
	     if( !id ) {
	        alert("아이디를 입력하지 않았습니다.");
	        return false;
	        
	     } else if( (id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z") ) { 
	        $('#checkMessage').css('color','brown');
	        $('#checkMessage').html('한글 및 특수 문자는 아이디로 사용하실 수 없습니다.');   
	        alert('한글 및 특수 문자는 아이디로 사용하실 수 없습니다.');
	        return false;
	        
	     } else if (id.length < 4) {
	   		  $('#checkMessage').css('color','orange');
	   		  $('#checkMessage').html('아이디 길이는 4자 이상으로 입력해주세요.'); 
	   		  alert('아이디 길이는 4자 이상으로 입력해주세요.');
	      	  return false;
	      	  
	 	 } else{
	        $.ajax ({
	            type: 'POST',
	            url: 'UserCheckServlet.do',
	            data: {id: id},
	            success: function(msg) {

	                if(msg.result == 0 ) {
	                  $('#checkMessage').css('color','green');
	                  $('#checkMessage').html('사용할 수 있는 아이디입니다.');
	                  $('#idDuplication').attr("value","idCheck");
	               } else {
	                  $('#checkMessage').css('color','red');
	                  $('#checkMessage').html('이미 사용중인 아이디입니다.');
	                  $('#idDuplication').attr("value","idUnCheck");
	               } 
	            },
	            error : function(request,status,error) {
	            	alert('실패');
	                alert(request.status);
	                alert(error);
	            }
	         });
	     }     
	 }
</script> 

    <div class="x_panel">
                  <div class="x_title">
                    <h2> 회원 등록 </h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <br>
                    <form name="userInfo" action="regiMember.do" method="post" onSubmit="return checkValue();" class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">아이디 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="_id" name="id" required="required" class="form-control col-md-7 col-xs-12">
                          <input type="button" value="중복 확인"  class="btn btn-dark" onClick="idCheck()">
                        </div>
                        <div id="checkMessage"></div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="last-name">암호 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="_pw" name="pw" required="required" class="form-control col-md-7 col-xs-12">
                          <span id="_pw1"></span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >암호 확인 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="_pw2" name="pw2" required="required" class="form-control col-md-7 col-xs-12">
                           <span id="_pw3"></span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="middle-name" class="control-label col-md-3 col-sm-3 col-xs-12"> 이름 </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="_name" name="name" class="form-control col-md-7 col-xs-12" type="text" name="middle-name">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div id="gender" class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default" data-toggle-class="btn-primary">
                              <input type="radio" name="gender" id="_gender" value="남자" data-parsley-multiple="gender"> &nbsp; Male &nbsp;
                            </label>
                            <label class="btn btn-primary" data-toggle-class="btn-primary">
                              <input type="radio" name="gender" id="_gender2" value="여자" data-parsley-multiple="gender"> Female
                            </label>
                          </div>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 번호 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="_phone" name="phone" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 키 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="_height" name="height" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 나이 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="_age" name="age" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 몸무게 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="_weight" name="weight" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                        </div>
                      </div>
                      
                       <div class="form-group">
                      <label class="control-label col-md-3 col-sm-3 col-xs-12"> 이메일 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                       	 <input id="_email" name="email" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                     	</div>
                      </div>
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 주소 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <div class="col-md-6 col-sm-6 col-xs-12">
                            <input type="text" name="address1" id="sample4_postcode" placeholder="우편번호"> 
                          </div>
                           <div class="col-md-6 col-sm-6 col-xs-12">
								<input type="button" onclick="sample4_execDaumPostcode()" value="주소 찾기" class="btn btn-info"><br>
							</div>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="address" class="form-control" id="sample4_roadAddress" placeholder="기본 주소">
							</div>
							 <div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" name="address" class="form-control" id="sample4_jibunAddress" placeholder="상세주소">
                        	</div>
                        </div>
                      </div>
                      
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
 
                       <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"> 포인트 <span class="required"></span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" name="point" class="date-picker form-control col-md-7 col-xs-12" required="required" type="text">
                        </div>
                      </div>
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button id="cancel" class="btn btn-primary" type="button" onClick="back();">Cancel</button>
                          
                          <script>
                          	function back() {
                          		history.back();
                          	}
                          
                          </script>
						  <input class="btn btn-primary" type="reset">
                          <input type="submit" value="등록" class="btn btn-success">
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
                
                
                
                <script>

       // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
        function checkValue()
        {
        	
         if(!document.userInfo.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.pw.value){
                alert("비밀번호를 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.pw2.value){
                alert("비밀번호확인란을 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.name.value){
                alert("이름을 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.email.value){
                alert("이메일을 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.phone.value){
                alert("전화번호를 입력하세요.");
                return false;
            }
                      
            else if(!document.userInfo.address1.value){
                alert("주소를 입력하세요.");
                return false;
            }
            
            else if(!document.userInfo.gender.value){
                alert("성별을 선택하세요.");
                return false;
            }
            // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
            else if(document.userInfo.pw.value != document.userInfo.pw2.value ){
                alert("비밀번호를 동일하게 입력하세요.");
                return false;
            } else {            
            	alert('회원등록이 정상적으로 이뤄졌습니다.');
            }
            
        }       
    </script>
    
    <script>
    
      $("#_pw").keyup(function () {
           regexp = /[0-9,a-z,A-Z, \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\\]/;
          v = $(this).val();
          if (! regexp.test(v)) {
             $('#_pw1').css('color','red');
              $('#_pw1').html('불완전한 비밀번호 입니다.');
              $('#pwCheck').attr('value','pwUnCheck');
          } else if( v.length < 8) {
             $('#_pw1').css('color','orange');
              $('#_pw1').html('비밀번호 길이는 8자 이상입니다.');
              $('#pwCheck').attr('value','pwUnCheck');
          } else {
             $('#_pw1').css("color","green");
             $('#_pw1').html("안정적인 비밀번호 입니다.");
             $('#pwCheck').attr('value','pwCheck');
            
          }
      });
       
     $("#_pw2").keyup(function () {
       v = $(this).val();
       v2 = $('#_pw').val();
       
       if ( v != v2 ) {
          $('#_pw3').css('color','red');
           $('#_pw3').html('비밀번호가 서로 일치하지 않습니다.');
           $('#pw2Check').attr('value','pw2UnCheck');
       } else if( v.length < 8) {
          $('#_pw1').css('color','orange');
          $('#_pw1').html('비밀번호 길이는 8자 이상입니다.');
          $('#pw2Check').attr('value','pw2UnCheck');
      } else {
          $('#_pw3').css("color","green");
          $('#_pw3').html("비밀번호가 서로 일치합니다.");
         $('#pw2Check').attr('value','pw2Check');
        
       }
   })
   </script>
    
   <script>

      var result = true;
      var msg = "";
      
       $("#_id").keyup(function () {
              regexp = /[0-9,a-z,A-Z]/;
             v = $(this).val();
             if (! regexp.test(v)) {
                $('#checkMessage').css('color','red');
                 $('#checkMessage').html('적합하지 않은 아이디 입니다.');
             } else if( v.length < 4) {
                $('#checkMessage').css('color','orange');
                 $('#checkMessage').html('아이디 길이는 4자 이상으로 입력해주세요.');
             } else {
                $('#checkMessage').css("color","green");
                $('#checkMessage').html("적합한 아이디 입니다.");
               
             }
         });
      
       $("#_pw").keyup(function () {
           regexp = /[0-9,a-z,A-Z, \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\\]/;
          v = $(this).val();
          if (! regexp.test(v)) {
             $('#_pw1').css('color','red');
              $('#_pw1').html('불완전한 비밀번호 입니다.');
              $('#pwCheck').attr('value','pwUnCheck');
          } else if( v.length < 8) {
             $('#_pw1').css('color','orange');
              $('#_pw1').html('비밀번호 길이는 8자 이상입니다.');
              $('#pwCheck').attr('value','pwUnCheck');
          } else {
             $('#_pw1').css("color","green");
             $('#_pw1').html("안정적인 비밀번호 입니다.");
             $('#pwCheck').attr('value','pwCheck');
            
          }
      });
       
     $("#_pw2").keyup(function () {
       v = $(this).val();
       v2 = $('#_pw').val();
       
       if ( v != v2 ) {
          $('#_pw3').css('color','red');
           $('#_pw3').html('비밀번호가 서로 일치하지 않습니다.');
           $('#pw2Check').attr('value','pw2UnCheck');
       } else if( v.length < 8) {
          $('#_pw1').css('color','orange');
          $('#_pw1').html('비밀번호 길이는 8자 이상입니다.');
          $('#pw2Check').attr('value','pw2UnCheck');
      } else {
          $('#_pw3').css("color","green");
          $('#_pw3').html("비밀번호가 서로 일치합니다.");
         $('#pw2Check').attr('value','pw2Check');
        
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
       
     $("#sample4_jibunAddress").keyup(function () {
        v = $(this).val();
        if ( v.length == 0 ) {
        	 $('#_address1').css('color','red');
             $('#_address1').html("상세주소를 입력해주세요.");
             $('#addressCheck').attr('value','addressUnCheck');
        } else {
        	$('#_address1').css('color','green');
        	$('#_address1').html("상세주소 입력확인");
            $('#addressCheck').attr('value','addressCheck');
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
          
</script>
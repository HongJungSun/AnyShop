<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="col-md-12 mt">
   <div class="content-panel">
      <h4>
         <i class="fa fa-angle-right"></i> 암호변경
      </h4>
      <hr>

         <div class="row mt">
            <div class="col-lg-12">
                  <section id="unseen">               
                     <c:if test="${pw ne null }">
	                     <form action="updatePw.do"  name="userInfo" method="post" onSubmit="return checkPw();">
	                     	<input type="hidden" name="id" value="${id}">
	                    	 <table class="table table-hover" id="tablezz">
		                         <tr>
		                        	 <td>변경할 암호</td>
			                         <td>
			                         	<input type="password" name="pw" id="_pw">
			                         </td>
			                         <td>
			                         	<span id="_pw1"></span> 
			                         	<input type="hidden" id="pwCheck" value="pwUnCheck">
			                         </td>
		                         </tr>
		                         <tr>
			                         <td>변경할 암호 확인</td>
			                         <td>
			                        	 <input type="password" name="pw2" id="_pw2">
			                         </td>
			                         <td>	 
			                         	 <span id="_pw3"></span> 
			                         	 <input type="hidden" id="pw2Check" value="pW2UnCheck">
			                         </td>
								 </tr>
		                         <tr>
		                         	 <td></td>
		                         	 <td><input type="submit" class="aa-browse-btn" value="암호 변경"></td>
		                         </tr>
	                   		</table>
	                 	  </form>
	                 	  
	                 	  	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
						    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	                 	  
	                 	  
	                 	  <script>
		                 	 jQuery("#_pw").keyup(function () {
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
	          		       
		                  	jQuery("#_pw2").keyup(function () {
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
	                 </script>
	                 	  
	                 	  
	                 	  <script>
                        		function checkPw() {
                        			
                        			var pwCheck= $('#pwCheck').val();
                                	var pw2Check= $('#pw2Check').val();                                	
                                	
                                	
                        		     
                        		     if(pwCheck != "pwCheck") {
                        	                alert('비밀번호를 확인 하시기 바랍니다.');
                        	                return false;
                        	             }
                        	            
                        	            else if(pw2Check != "pw2Check") {
                        	                alert('비밀번호 확인란을 확인 하시기 바랍니다.');
                        	                return false;
                        	             }
                        		     // 비밀번호와 비밀번호 확인에 입력된 값이 동일한지 확인
                        	            else if(document.userInfo.pw.value != document.userInfo.pw2.value ){
                        	                alert("비밀번호를 동일하게 입력하세요.");
                        	                return false;
                        	            } else {            
                        	            	alert('암호가 정상적으로 바뀌었습니다.');
                        	            }    
                        		}
                        	</script>
	                 	  	  
                      </c:if>  
                   </section>
                </div>
            </div>
       </div>
 </div>
                     
                     
                      <c:if test="${pw eq null }">
                         <tr><td>입력하신 정보가 없습니다.</td></tr>
                         <tr><td colspan="2"><button type="submit" class="aa-browse-btn" name="Submit" onClick="return main();">메인 페이지 이동</button></td>
                     </c:if>
                      
                      <script>
                      	function main() {
                      		location.href="main.do";
                      	}  
                      </script>
                                       

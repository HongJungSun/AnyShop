<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/bootstrap/regijs/bootstrap.min.js"></script>



<script>
		
		function check() {
			var id = $('input[name=id]').val();
			var pw = $('input[name=pw]').val();
			
	             $.ajax({
	                    type: 'post',
	                    url: "checkIdPw.do",
	                    data: {id: id,
	                    	   pw: pw},
     	            success: function(msg) {
     	            	if(msg.result ==1 ){
     	            			location.href="update_infoCheck.do"; 	
     	            	} else {
     	            		alert('비밀번호가 틀립니다.');
     	            		return false;
     	            	}
     	            	
     	            },
	               });					
		}
		
		function back() {
			location.href="mypage.do";
		}
		


</script>

<div style="margin:0 auto;">
	<h2> 비밀번호 재확인</h2>
</div>

<div style="width:300px; height:300px; margin:0 auto;">
	<div>
		<div>
			<div>아이디</div>
			<div><input type="text" name="id"  value="${sessionScope.loginInfo.id }" readonly>  </div>
		</div>
		
		<div>
			<div>비밀번호</div>
			<div><input type="password" name="pw"></div>
		</div>
	</div>
	
	<div> 
		<button class="btn" onclick="return check();"> 확인 </button>  
		<button class="btn" onclick="return back();"> 취소 </button>	
	
	</div>
</div>


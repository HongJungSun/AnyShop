<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
    <script type="text/javascript">
 
        function setParentText(id){
        	
            var cancelPayment = $('#cInput').val(); 
            var imp_uid= $("#imp_uid").val();
               
            alert(imp_uid);
        	
	             $.ajax({
	                    type: 'post',
	                    url: "cancelPayment.do",
	                    data: { cancelPayment: cancelPayment,
	                    		id : id, 
	                    		imp_uid: imp_uid
	                    	},
	                    
     	            success: function(msg) {
     	            	if(msg.result ==1 ){
     	            		alert('인증에  성공하셨습니다.');
     	            		
     	            		if( confirm('정말로 결제를 취소하시겠습니까?') == true) {
     	            			$.ajax({
     	            				type: 'post',
	     	   	                    url: "cancelPaymentComplete.do",
	     	   	                    data: { cancelPayment: cancelPayment,
	     	   	                    		id : id,
	     	   	                    		imp_uid: imp_uid
	     	   	                    	},
	     	   	                    
	     	   	                    success: function(msg) {
	     	   	                    	if(msg.result == 1){
	     	   	                    		alert('결제가 성공적으로 취소 되었습니다.');
	     	   	                    		opener.parent.reload();
	     	        	            		window.close();
	     	        	          
	     	   	                    	}
	     	   	                    },		
     	            			});
     	            		} else {
     	            			alert('취소 되었습니다.');
     	            			return false;
     	            		}   	            		
     	            	} else {
     	            		alert('인증번호가 일치하지 않습니다.');
     	            		return false;
     	            	}
     	            },
     	            
	               });
        }
   </script>
 
</head>
<body>
    <br>
    <b><font size="5" color="gray"> 결제 취소 인증 단계(상품 번호: ${imp_uid })</font></b>
    <br><br>
    <div> 결제시 이메일로 전송된 결제 승인번호를  입력해주세요.</div>
    
    <input type="hidden" id="imp_uid" value="${imp_uid}" readonly>
    
 	
    <input type="text" id="cInput"> 
    <input type="button" class="btn btn-round btn-warning" value="인증하기" onclick="setParentText('${sessionScope.id}');" class="btn btn-success">
    <br><br>
    <input type="button" class="btn btn-round btn-warning" value="창 닫기" onclick="window.close();" class="btn btn-success">
</body>
</html>

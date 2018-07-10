<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	
       //기존 체크된 값 가져오기
       $('input:hidden[name="product_color1"]').each(function(index, item){   	  
    	   
    	   if($(this).val() == "red") {
    		   $('#_red').prop("checked", true);
    	   } 
    	   
    	   else if($(this).val() == "green") {
    		   $('#_green').prop("checked", true);
    		   
    	   } else if($(this).val() == "blue") {
    		   $('#_blue').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "black") {
    		   $('#_black').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "white") {
    		   $('#_white').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "yellow") {
    		   $('#_yellow').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "brown") {
    		   $('#_brown').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "purple") {
    		   $('#_purple').prop("checked", true);
    	   }
    	   
    	   else if($(this).val() == "pink") {
    		   $('#_pink').prop("checked", true);
    	   }
    	   
    	   else {
    		   $('#_Indigo').prop("checked", true);
    	   }	   
       });
	
	
	
	
     //상품 대분류 클릭시 소분류 보여주기
	$('#_product_kinds').on("change", function(){
		
		var obj = $(this).val();
		
	    if(obj == "T-shirts") {
	    	
	    	$('#_size2').css("display", "");
	    	$('#_shoes2').css("display", "none");
	        $('#_T-shirts').css("display", "");
	        $('#_outerwear').css("display", "none");
	        $('#_shirts').css("display", "none");
	        $('#_pants').css("display", "none");
	        $('#_shoes').css("display", "none");
	        $('#_training').css("display", "none");

	    } else if (obj == "outerwear" ){
	    	
	    	$('#_size2').css("display", "");
	    	$('#_shoes2').css("display", "none");
	    	  $('#_T-shirts').css("display", "none");
	          $('#_outerwear').css("display", "");
	          $('#_shirts').css("display", "none");
	          $('#_pants').css("display", "none");
	          $('#_shoes').css("display", "none");
	          $('#_training').css("display", "none");

	     } else if (obj == "shirts" ){
	    	 
	    	 $('#_size2').css("display", "");
	    	 $('#_shoes2').css("display", "none");
	    	  $('#_T-shirts').css("display", "");
	          $('#_outerwear').css("display", "none");
	          $('#_shirts').css("display", "");
	          $('#_pants').css("display", "none");
	          $('#_shoes').css("display", "none");
	          $('#_training').css("display", "none");

	      } else if (obj == "pants" ){
	    	  
	    	  $('#_size2').css("display", "");
	    	  $('#_shoes2').css("display", "none");
	    	  $('#_T-shirts').css("display", "");
	          $('#_outerwear').css("display", "none");
	          $('#_shirts').css("display", "none");
	          $('#_pants').css("display", "");
	          $('#_shoes').css("display", "none");
	          $('#_training').css("display", "none");

	       } else if (obj == "shoes" ){
	    	   
	    	   $('#_size2').css("display", "none");
	    	   $('#_shoes2').css("display", "");
	    	   $('#_T-shirts').css("display", "");
	           $('#_outerwear').css("display", "none");
	           $('#_shirts').css("display", "none");
	           $('#_pants').css("display", "none");
	           $('#_shoes').css("display", "");
	           $('#_training').css("display", "none");

	        } else {
	        	
	        	$('#_size2').css("display", "");
	        	$('#_shoes2').css("display", "none");
	        	  $('#_T-shirts').css("display", "");
	              $('#_outerwear').css("display", "none");
	              $('#_shirts').css("display", "none");
	              $('#_pants').css("display", "none");
	              $('#_shoes').css("display", "none");
	              $('#_training').css("display", "");

	         }

	});
	
});

// 편집 submit
function checkEditForm() {
	
		var colorResult;
		var sizeResult;
			
	 $('input:checkbox[name="product_color"]').each(function() {
	      if(this.checked == true){    //checked 처리된 항목의 값
	    	  colorResult= true;
	      	  return false;
	      } else {
	    	  colorResult= false;
	      }
	 });
	 
	 $('input:checkbox[name="product_size"]').each(function() {
	      if(this.checked == true){    //checked 처리된 항목의 값
	    	  sizeResult= true;
	    	  return false;
	      } else {
	    	  sizeResult= false;
	      }
	 });

	 
		
		
        // 상품 수정 폼 유효성 검사
        if($('#_productImg0').val() == null) {
        	alert('상품 대표이미지를 선택하세요.');
        	return false;
        } else if($('#_keyword').val() == null) {
        	alert('상품 키워드를 선택하세요.');
        	return false;
        } else if($('#_product_kinds').val() == null) {
        	alert('상품 대분류를 선택하세요.');
        	return false;
        } else if($('#_T-shirts').val() == "" && $('#_outerwear').val() == "" && $('#_shirts').val() == "" && $('#_pants').val() == "" && $('#_shoes').val() == "" && $('#_training').val() == "") {
        	alert('상품 소분류를 선택하세요.');
        	return false;
        } else if($('#_product_name').val() == null) {
        	alert('상품명을 입력하세요.');
        	return false;
        } else if($('#_product_price').val() == null) {
        	alert('상품 가격을 입력하세요.');
        	return false;
        } else {
        	if( colorResult == false ){
        		alert('상품 색상을 1가지 이상 선택하세요.');
        		return false;
        	} else if (sizeResult == false) {
        		alert('상품 사이즈를 1가지 이상 선택하세요.');
        		return false;
        	} else {
        		alert('성공적으로 수정되었습니다.');
        		return true;
        	}
        }      
    }
    

</script>

<script>
// 상품 이미지 버튼 클릭 이벤트
function readURL(input, index) { 

	if (input.files && input.files[0]) { 		
		var reader = new FileReader(); 
		reader.onload = function (e) { 
				$('#_productImg'+index).attr('src', e.target.result); 
			}
		reader.readAsDataURL(input.files[0]);
		} 	
	}
	
function back() {
	location.href="selectProductList.do";
}

</script>


<h2>상품 정보 수정</h2>
<form id="_editForm" name="editForm" method="post" action="editProductCommit.do" onsubmit= "return checkEditForm()">
	<input type="hidden" name="product_id" id="_product_id" value="${productInfo.product_id}">
	<c:forEach items="${productInfo.product_color }" var="product_color">
		<input type="hidden" name="product_color1" id="_product_color1" value="${product_color}">		
	</c:forEach>
	
    <table class="table table-striped projects">
        <tr>
            <td>상품 이미지</td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg0">
                <br>
                <input type="file" id="_productPhoto0" name="product_img" onchange="readURL(this,0);">
            </td>
        </tr>
        <tr>
        	<td> 키워드 </td>
        	<td>
        		<select name="keyword" id="_keyword">
        			<c:if test="${productInfo.keyword eq 'spring'}">
            			<option value="spring" selected> 봄 </option>
            		</c:if>
            		<c:if test="${productInfo.keyword ne 'spring'}">
            			<option value="spring"> 봄 </option>
            		</c:if>
            		
            		<c:if test="${productInfo.keyword eq 'spring'}">
            			<option value="spring" selected> 여름 </option>
            		</c:if>
            		<c:if test="${productInfo.keyword ne 'spring'}">
            			<option value="spring"> 여름 </option>
            		</c:if>
            		
            		<c:if test="${productInfo.keyword eq 'autumn'}">
            			<option value="autumn" selected> 가을 </option>
            		</c:if>
            		<c:if test="${productInfo.keyword ne 'autumn'}">
            			<option value="autumn"> 가을 </option>
            		</c:if>
            		
            		<c:if test="${productInfo.keyword eq 'winter'}">
            			<option value="winter" selected> 겨울 </option>
            		</c:if>
            		<c:if test="${productInfo.keyword ne 'winter'}">
            			<option value="winter"> 겨울 </option>
            		</c:if>
            	</select>
        	</td>
        </tr>
        <tr>
            <td>상품 대분류 </td>
            <td>
            	<select name="product_kinds" id="_product_kinds">
            		<option value="">-- 대분류를 선택해주세요.--</option>
            		<option value="T-shirts"> T-shirts</option>
            		<option value="outerwear"> 아우터 </option>
            		<option value="shirts"> 셔츠 </option>
            		<option value="pants"> 팬츠 </option>
            		<option value="shoes"> 신발 </option>
            		<option value="training"> 트레이닝 </option>
            	</select>
            </td>
        </tr>
        <tr>
            <td>상품 소분류</td>
            <td>
            	<select name="product_detail" id="_T-shirts" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="shortSleeveTee"> 반팔&7부티 </option>
            		<option value="vest"> 조끼&나시티 </option>
            		<option value="longSleeveTee"> 긴팔티 </option>
            		<option value="manToMan"> 맨투맨 </option>
            		<option value="hoodT-shirt"> 후드티 </option>
            	</select>

            	<select name="product_detail" id="_outerwear" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="jacket"> 자켓 </option>
            		<option value="cardigan"> 가디건 </option>
            		<option value="padding"> 패딩 </option>
            		<option value="zipUp"> 집업 </option>
            	</select>

            	<select name="product_detail" id="_shirts" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="basicShirts"> 베이직&데님 </option>
            		<option value="shortShirts"> 반팔&7부 </option>
            		<option value="checkShirts"> 체크&패턴 </option>
            		<option value="longShirts"> 긴팔 </option>
            	</select>

            	<select name="product_detail" id="_pants" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="shoes"> 신발 </option>
            		<option value="top"> 상의 </option>
            		<option value="bottom"> 하의 </option>
            		<option value="outerwear"> 아우터 </option>
            		<option value="skirt"> 치마 </option>
            	</select>

            	<select name="product_detail" id="_shoes" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="sandal"> 샌들&쪼리 </option>
            		<option value="runningShoes"> 운동화 </option>
            		<option value="slimShoes"> 슬립온 </option>
            		<option value="shoesShoes"> 구두 </option>
            		<option value="walker"> 워커 </option>
            	</select>

            	<select name="product_detail" id="training" style="display:none ;">
            		<option value=""> --소분류를 선택해주세요.--</option>
            		<option value="set"> 세트 </option>
            		<option value="top"> 상의 </option>
            		<option value="bottom"> 하의 </option>

            	</select>
            </td>            
                     
        </tr>
        <tr>
            <td>상품명</td>
            <td><input type="text" id="_product_name" name="product_name" value="${productInfo.product_name}"></td>
        </tr>
        <tr>
            <td>컬러</td>
            <td>
            	<input type="checkbox" name="product_color" value="red" id="_red"> 빨강
            	<input type="checkbox" name="product_color" value="green" id="_green"> 초록
            	<input type="checkbox" name="product_color" value="blue" id="_blue"> 파랑
            	<input type="checkbox" name="product_color" value="black" id="_black"> 검정
            	<input type="checkbox" name="product_color" value="white" id="_white"> 화이트
            	<input type="checkbox" name="product_color" value="yellow" id="_yellow"> 노랑
            	<input type="checkbox" name="product_color" value="brown" id="_brown"> 갈색
            	<input type="checkbox" name="product_color" value="purple" id="_purple"> 보라
            	<input type="checkbox" name="product_color" value="pink" id="_pink"> 분홍
            	<input type="checkbox" name="product_color" value="Indigo" id="_Indigo"> 남색
            </td>
        </tr>
        <tr style="display:none;" id="_size2">
            <td> 사이즈</td>
 
            <td>           
	            <input type="checkbox" name="product_size" value="s"> small
	            <input type="checkbox" name="product_size" value="m"> middle
	            <input type="checkbox" name="product_size" value="l"> large
	            <input type="checkbox" name="product_size" value="xl"> X-large
	            <input type="checkbox" name="product_size" value="free"> Free         	          	
            </td>
        </tr>
        <tr style="display:none;" id="_shoes2">
            <td> 신발 사이즈</td>
            <td>           
	            <input type="checkbox" name="product_size" value="220mm"> 220mm
	            <input type="checkbox" name="product_size" value="230mm"> 230mm
	            <input type="checkbox" name="product_size" value="240mm"> 240mm
	            <input type="checkbox" name="product_size" value="250mm"> 250mm
	           	<input type="checkbox" name="product_size" value="260mm"> 260mm
	            <input type="checkbox" name="product_size" value="270mm"> 270mm
	            <input type="checkbox" name="product_size" value="280mm"> 280mm           	          	
            </td>
        </tr>
        <tr>
            <td>가격</td>
            <td><input type="number" id="_product_price" name="product_price" value="${productInfo.product_price}">원</td>
        </tr>
        <tr>
            <td>상품소개</td>
            <td><textarea id="_product_info" name="product_info" rows="10" cols="100"> ${productInfo.product_info}</textarea></td>
        </tr>
     </table>
        
        <!--  product Option 수정 정보 -->
     <table>
        <tr>
        	<td> <h3> 상품 이미지<small>(10개까지 저장 가능)</small> </h3> </td>
        </tr>
        <tr> 
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg1">
                <input type="file" id="_productPhoto1" name="moreProductInfo1" onchange="readURL(this,1);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg2">
                <input type="file" id="_productPhoto2" name="moreProductInfo2" onchange="readURL(this,2);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg3">
                <input type="file" id="_productPhoto3" name="moreProductInfo3" onchange="readURL(this,3);">
            </td>
         </tr>   
         <tr>   
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg4">
                <input type="file" id="_productPhoto4" name="moreProductInfo4" onchange="readURL(this,4);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg5">
                <input type="file" id="_productPhoto5" name="moreProductInfo5" onchange="readURL(this,5);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg6">
                <input type="file" id="_productPhoto6" name="moreProductInfo6" onchange="readURL(this,6);">
            </td>
         </tr>
         <tr>   
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg7">
                <input type="file" id="_productPhoto7" name="moreProductInfo7" onchange="readURL(this,7);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg8">
                <input type="file" id="_productPhoto8" name="moreProductInfo8" onchange="readURL(this,8);">
            </td>
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg9">                
                <input type="file" id="_productPhoto9" name="moreProductInfo9" onchange="readURL(this,9);">
            </td>
         </tr>
         <tr>   
            <td>
                <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg10">  
                <input type="file" id="_productPhoto10" name="moreProductInfo10" onchange="readURL(this,10);">
            </td>
          </tr>
          <tr>
         	 <td>  </td>
          </tr>
          <tr>
         	 <td>  </td>
          </tr>
	</table>
          
     <table>
        <tr>
        	<td> <h3> 사이즈 정보 이미지<small>(3개까지 저장 가능)</small> </h3> </td>
        </tr>
        <tr>
           <td>
               <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg11">
               <input type="file" id="_productPhoto11" name="sizeInfo1" onchange="readURL(this,11);">
           </td>
           <td>
               <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg12">
               <input type="file" id="_productPhoto12" name="sizeInfo2" onchange="readURL(this,12);">
           </td>
           <td>
               <img src="resources/product/default.gif" height="250px" width="260px" id="_productImg13">
               <input type="file" id="_productPhoto13" name="sizeInfo3" onchange="readURL(this,13);">
           </td> 
        </tr>   
    </table>
    
               	<input style="float:right;"type="button" onClick="return back();" value="상품 목록 보기">
                <input style="float:right;" type="reset" value="초기화">
                <input style="float:right;" type="submit" value="상품 수정">  	
 	
</form>
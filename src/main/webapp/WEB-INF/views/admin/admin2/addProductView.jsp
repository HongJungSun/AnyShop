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

//상품 대분류 클릭시 소분류 보여주기
$(document).ready(function(){
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



// 상품 등록시 상품명 중복검사
function checkProduct() {
	var product_name= $('#_product_name').val();
	var res;
	
	if( $('#_productPhoto0').val() == "") {
		alert('상품 이미지를 선택해주세요.');
		return false;
	} else if( $('#_keyword').val() == "" ) {
		alert('상품 키워드를 선택 해주세요.');
		return false;		
	} else if ( $('#_product_kinds').val() == "" ) {
		alert('상품 대분류를 선택해 주세요.');
		return false;
	} else if ( $('#_product_detail').val() == "" ) {
		alert('상품 소분류를 선택해 주세요.');
		return false;
	} else if ( $('#_product_name').val() == "" ) {
		alert('상품명을 입력해주세요.');
		return false;
	} else if ( $('input[name=product_color]').val() == "" ) {
		alert('상품 컬러를 1가지 이상 선택해 주세요.');
		return false;
	} else if ( $('input[name=product_size]').val() == "" ) { 
		alert('상품 사이즈를 1가지 이상 선택해 주세요.');
		return false;
	} else if ( $('#_product_price').val() == "" ) {
		alert('상품 가격을 입력해주세요.');
		return false;
	} else if ( $('#_product_price').val() <= 0 ) {
		alert('상품 가격은 0원 이하로 등록 하실 수 없습니다.');
		return false;
		
	} else {
			
	    $.ajax ({
	        type: 'POST',
	        url: 'checkProduct.do',
	        async: false,
	        data: {product_name:product_name},
	        success: function(msg) {
	    	    if(msg.result != 0 ) {
	    			alert('이미 등록된 상품명이 있습니다.');
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
	    
	    if(res == true) {
	    	return true;
	    } else {
	    	return false;
	    }
	}
       	
}


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
</script>

<h2>상품 등록</h2>
<form id="_addForm" name="addForm"  method="post" action="addProductCommit.do" onsubmit="return checkProduct();">
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
            		<option value="spring"> 봄 </option>
            		<option value="spring"> 여름 </option>
            		<option value="autumn"> 가을 </option>
            		<option value="winter"> 겨울 </option>
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
            <td><input type="text" id="_product_name" name="product_name"></td>
        </tr>
        <tr>
            <td>컬러</td>
            <td>
            	<input type="checkbox" name="product_color" value="red"> 빨강
            	<input type="checkbox" name="product_color" value="green"> 초록
            	<input type="checkbox" name="product_color" value="blue"> 파랑
            	<input type="checkbox" name="product_color" value="black"> 검정
            	<input type="checkbox" name="product_color" value="white"> 화이트
            	<input type="checkbox" name="product_color" value="yellow"> 노랑
            	<input type="checkbox" name="product_color" value="brown"> 갈색
            	<input type="checkbox" name="product_color" value="purple"> 보라
            	<input type="checkbox" name="product_color" value="pink"> 분홍
            	<input type="checkbox" name="product_color" value="Indigo"> 남색
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
            <td><input type="number" id="_product_price" name="product_price">원</td>
        </tr>
        <tr>
            <td>상품소개</td>
            <td><textarea id="_product_info" name="product_info" rows="10" cols="100"></textarea></td>
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
    			<input style="float:right;" type="reset" value="초기화">
                <input style="float:right;" type="submit" value="상품 등록">                
 	
</form>
            

                
                
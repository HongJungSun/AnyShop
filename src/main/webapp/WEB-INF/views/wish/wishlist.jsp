<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    
 <script>	
	
	$(document).ready(function(){
		
		//전체 장바구니 상품 가격
		$('.price').each(function(i){			
			var price = $(".price:eq("+i+")").val();
			var totalPrice= $('#_totalPrice').val();
						
			totalPrice = totalPrice*1 + price*1;	
			$('#_totalPrice').val(totalPrice);
						
		});
		
		//선택된 장바구니 상품 가격
		$('.select').click(function() {

				var n = $(this).val();
				var state =$(".select:eq("+n+")").prop('checked');
				
			if(state == true) {					
				var price = $(".price:eq("+n+")").val();
				var selectedPrice= $('#_selectedPrice').val();
							
				selectedPrice = selectedPrice*1 + price*1;			
				$('#_selectedPrice').val(selectedPrice);
				
			} else {
				var price = $(".price:eq("+n+")").val();
				var selectedPrice= $('#_selectedPrice').val();
							
				selectedPrice = selectedPrice*1 - price*1;			
				$('#_selectedPrice').val(selectedPrice);
			}
					
		});
			
		
		// 장바구니 품목 제거
		$('.remove').click(function(){
			var wishlist_idx = $('#_wishlist_idx').val();
			
			if(confirm('정말로 장바구니에서 지우시겠습니까?') == true) {
    			$.ajax ({
    	            type: 'POST',
    	            url: "deleteWishList.do",
    	            data: {wishlist_idx: wishlist_idx},
    	            
    	            success: function(msg) {
    	            	if(msg.result ==1 ){
    	            		alert('성공적으로 장바구니 품목을 제거하였습니다.');
    	            		return true;
    	            	}
    	            },
    	            error : function(request,status,error) {
    	            	alert('장바구니 제거 실패');
    	                alert(request.status);
    	                alert(error);
    	            }
    	         });
			} else {
				return false;
			}
		});		
		
		


	});
		 	

</script> 



<section id="cart-view">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
             <form action="">
               <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>  
                      	<th> 선택 </th>
                      	<th> 번호 </th>                     
                        <th> 이미지 </th>
                        <th> 상품명 </th>
                        <th> 수량 </th>
                        <th> 가격 </th>
                        <th>상품 삭제</th>
                      </tr>
                    </thead>
                    <tbody>                    	
	                    <c:if test="${wishListInfo ne null }">	    	                                   	
		                    <c:forEach var="wishListInfo" items="${wishListInfo}" varStatus="status">
		                    <input type="hidden" id="_wishlist_idx" class="wishlist_idx" name="wishlist_idx" value="${wishListInfo.wishlist_idx}"> 	
		                    <input type="hidden" id="_id" value="${sessionScope.loginInfo.id }">			                                        
			                   <tr>
			                   	  <td>
			                      	<input type="checkbox" name="select" class="select" value="${status.index }">
			                      </td>
			                      <td class="status">
			                        ${status.count}
			                      </td>		                        
			                      <td>
			                      	<a href="viewProduct.do?product_id=${wishListInfo.product_id}"><img src="resources/product/${wishListInfo.product_img}" alt="img"></a>
			                      </td>
			                      <td>
			                        <a class="aa-cart-title" href="viewProduct.do?product_id=${wishListInfo.product_id}">${wishListInfo.product_name}</a> <br>
			                        <span style="font-size:13px;">사이즈: ${wishListInfo.product_size}  , 색상: ${wishListInfo.product_color}  </span>
			                      </td>
			                      <td>
			                        <input class="aa-cart-quantity" type="text" value="${wishListInfo.product_quantity}" readonly style="border:0; background-color:#F5F5F5; text-align:center;">
			                      </td>
			                      <td>
			                        <fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${wishListInfo.product_price }" /> 원
			                        <input type="hidden" class="price" name="price" id="_price"	value="${wishListInfo.product_price}">				                        
			                      </td>
			                      <td>
				                     <a class="remove" href="viewWishList.do" onClick="return checkDelete();">
				                     	<fa class="fa fa-close"></fa>
				                     </a>
			                      </td>
			                   </tr>
			                </c:forEach>
	                    </c:if>    
	                 </tbody>
                  </table>
                </div>
                
                <div style="float:right;">
        			<input type="text" name="selectedPrice" id="_selectedPrice" value="0" readonly style="border:0; text-align:center; background-color: #F5F5F5;">원
        		</div>
        		<div style="float:right;"> * 선택 상품 구매금액 </div>
        		<hr>
        		<div style="float:right;">
        			<input type="text" name="totalPrice" id="_totalPrice" value="0" readonly style="border:0; text-align:center; background-color: #F5F5F5;"> 원
        		</div>
        		<div style="float:right;"> * 총 구매금액 </div>
        		<hr>  
   
          	</form>
           </div>
     	 </div>
       </div>

     </div>
   </div>             
</section>            
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
	
	      var openWin;
	       
	      function openChild(imp_uid) {	  
	    	  
	    	 var id = $('#_id').val();

	            // window.name = "부모창 이름"; 
	            window.name = "parentForm";
	            
	            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
	            openWin = window.open("child.do?imp_uid=" + imp_uid ,
	                    "childForm", "width=570, height=350, resizable = no, scrollbars = no"); 
	            
	        }
	      
          
          function reload() {
          	window.location.reload();
          }

	</script>


 <section id="cart-view">
   <div class="container">
     <div class="row">
       <div class="col-md-12">
         <div class="cart-view-area">
           <div class="cart-view-table">
               <div class="table-responsive">
                  <table class="table">
                    <thead>
                      <tr>  
                      	<th> 상품 번호 </th>                     
                        <th> 이미지 </th>
                        <th> 상품명 </th>
                        <th> 수량 </th>
                        <th> 가격 </th>
                        <th> 배송 상태 </th>
                        <th> 결제 취소 </th>
                      </tr>
                    </thead>
                    <tbody>
	                    <c:if test="${paymentList ne null }">	    	                                   	
		                    <c:forEach var="paymentList" items="${paymentList}" varStatus="status">
		                    	<input type="hidden" id="_id" value="${paymentList.id }">		                    		                    
			                   <tr>
			                      <td class="status">
			                        ${paymentList.imp_uid}
			                      </td>		                        
			                      <td>
			                      	<a href="viewProduct.do?product_id=${paymentList.product_id}"><img src="resources/product/${productList[status.index]}" alt="img"></a>
			                      </td>
			                      <td>
			                        <a class="aa-cart-title" href="viewProduct.do?product_id=${paymentList.product_id}">${paymentList.product_name}</a> <br>
			                        <span style="font-size:13px;">사이즈: ${paymentList.product_size}  , 색상: ${paymentList.product_color}  </span>
			                      </td>
			                      <td>
			                        <input class="aa-cart-quantity" type="text" value="${paymentList.product_quantity}" readonly style="border:0; background-color:#F5F5F5; text-align:center;">
			                      </td>
			                      <td>
			                        <fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${paymentList.product_price }" /> 원
			                        <input type="hidden" class="price" name="price" id="_price"	value="${paymentList.product_price}">				                        
			                      </td>			                      
			                      <c:if test="${paymentList.delivery_state eq 'Y'}">
			                      <td>
			                      	배송 완료
			                      </td>
			                      </c:if>
			                      <c:if test="${paymentList.delivery_state eq 'N'}">
			                      <td>
			                      	배송 준비 중
			                      </td>
			                      </c:if>
			                      <td>
				                     	<a class="fa fa-close" onClick="return openChild('${paymentList.imp_uid}');"> </a>
			                      </td>
			                   </tr>
			                </c:forEach>
	                    </c:if> 
	                    <c:if test="${paymentList eq null}">
	                    	결제된 상품이 없습니다.
	                    
	                    </c:if>
	                       
	                 </tbody>
                  </table>
                </div>

           </div>
     	 </div>
       </div>

     </div>
   </div>             
</section>             
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="aa-catg-head-banner-content">
       <h2>Fashion</h2>
        <ol class="breadcrumb">
          <li><a href="main.do">Home</a></li>         
          <li class="active"> 인기 상품 </li>
        </ol>
</div> 

<div class="aa-product-catg-body">
	<ul class="aa-product-catg">
	<c:if test="${productList ne null}">
		<c:forEach items="${productList}" var="productList">   
	    	<li>
	           <figure>
	               <a class="aa-product-img" href="viewProduct.do?product_id=${productList.product_id}"><img src="resources/product/${productList.product_img}" style="width: 300px; height: 300px;"></a>
	               	
	               		<script>
	               			function addWishList(productListInfo) {

	               				$.ajax ({
	               		            type: 'POST',
	               		            url: 'addWishList.do',
	               		            data: productListInfo,
	               		            success: function(msg) {

	               		                if(msg.result == 1 ) {
											alert('장바구니에 추가되었습니다.');
											
											if(fconfirm('장바구니 페이지로 이동하시겠습니까?')== true) {
												return true;
											} else {
												return false;
											}
											
	               		               } else {
	               		               		
	               		               		if(msg.result == 0 ) {
	               		               			alert('취소 되었습니다.');
	               		               			return false;
	               		               		} 
	               		               } 
	               		            },
	               		            error : function(request,status,error) {
	               		            	alert('실패');
	               		                alert(request.status);
	               		                alert(error);
	               		            }
	               		         });
	               			}
	               		</script>
	               			          
	                   <figcaption>
	                   		<h4 class="aa-product-title"><a href="#">${productList.product_name}</a></h4>
	                     	 <span class="aa-product-price">
	                      	<fmt:formatNumber type= "number" maxFractionDigits= "3" value= "${productList.product_price}" /> 원
	                      </span>
	                    </figcaption>
	                  </figure>

			</li>                                     
		</c:forEach> 
		</c:if>
		<c:if test="${productList eq null }">
			<img src="resources/product/default.gif">
				<h3> 관련된 상품이 없습니다.</h3>
		</c:if>
	</ul>
</div>	                               	            
<hr>



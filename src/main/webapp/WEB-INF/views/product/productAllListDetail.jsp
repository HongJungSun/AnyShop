<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<script>
function page(idx) {
	var pageNum = idx;
	var contentNum = 12;
	var product_kinds = $('.active').val();
	var product_detail = $('#_detail').val();
	
	location.href="product_kindsAllListDetail.do?product_kinds="+ product_kinds + "product_detail=" + product_detail + "pageNum1="+ pageNum +"&contentNum1="+ contentNum;
}

</script>

<div class="aa-catg-head-banner-content">
       <h2>Fashion</h2>
        <ol class="breadcrumb">
          <li><a href="main.do">Home</a></li>         
          <li class="active">${product_kinds}</li>
          <li class="active" id="_detail">${product_detail}</li>
        </ol>
</div> 

<div class="">
	<ul class="aa-product-catg">
	<c:if test="${list ne null}">
		<c:forEach items="${list}" var="productList">   
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
	</ul>
	
						<!-- 페이징 처리 -->  
							<footer>
                      			<ul class="pagination" id="res">
	                      			<c:if test="${page.prev }">
	                      				<li class="page"> <a href="javascript:page(${page.getStartPage() -1 });" >&laquo;</a> </li>
	                      			</c:if>
	                      			
	                      			<c:forEach begin="${page.getStartPage() }" end="${page.getEndPage() }" var="idx">
	                      				<li class="page"> <a href="product_kindsAllListDetail.do?product_kinds=${product_kinds }&product_detail=${product_detail }&pageNum1=${idx}&contentNum1=${page.contentNum}"> ${idx }</a>	</li>
	                      			
	                      			</c:forEach>
	                      			                    			
	                      			<c:if test="${page.next }">
	                      				<li class="page"> <a href="javascript:page(${page.getEndPage() +1 });" >&raquo;</a> </li>
	                      			</c:if>
                      			</ul>
 							</footer>
 						<!-- / 페이징 처리 --> 
		
</div>

					                          	            
<hr>




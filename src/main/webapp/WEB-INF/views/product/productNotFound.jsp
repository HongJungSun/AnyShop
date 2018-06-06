<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="aa-catg-head-banner-content">
       <h2>Fashion</h2>
        <ol class="breadcrumb">
          <li><a href="main.do">Home</a></li>         
          <li class="active">${product_kinds}</li>
        </ol>
</div> 

<div class="aa-product-catg-body">
	<ul class="aa-product-catg">
		<c:if test="${productList ne null }">
			<img src="resources/product/default.gif">
				<h3> 아직 등록된 상품이 없습니다.</h3>
				<h4> 상품을 준비중입니다.</h4>		
		</c:if>
	</ul>
</div>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script>
$(document).ready(function(){
    $("#btnAdd").click(function(){
        location.href="addProductView.do";
    });
});
	
	function deleteProduct() {
		if(confirm('정말 이 상품을 제거하시겠습니까?')== true) {
			alert('정상적으로 제거 하였습니다.');
			return true;
		} else {
			return false;
		}
	}
	

</script>

<div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>상품 목록</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <!-- start product list -->
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 1%">id</th>
                          <th>상품 대분류</th>
					      <th>상품 소분류</th>
					      <th>상품이미지</th>
					      <th>상품명</th>
					      <th>가격</th>
                          <th style="width: 20%">Edit</th>
                        </tr>
                      </thead>
                      <tbody>
                          <c:forEach var="productList" items="${productList}">
	                        <tr>
	                          <td>${productList.product_id}</td>
	                          <td>${productList.product_kinds}</td>
	                          <td>${productList.product_detail}</td>
	                          <td>
	                            <ul class="list-inline">
	                              <li>
	                                <img src="resources/product/${productList.product_img}" style="width:150px; height:150px;">
	                              </li>
	                            </ul>
	                          </td>
	                          <td class="project_progress">
						          <a href="">${productList.product_name}</a><br>
						        </td>
	                          <td>
	                             <fmt:formatNumber value="${productList.product_price}" pattern="###,###,###"/>원
	                          </td>
	                          <td>
	                            <a href="editProduct.do?product_name=${productList.product_name }" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i> Edit </a>
	                            <a href="deleteProduct.do?product_name=${productList.product_name }" class="btn btn-danger btn-xs" onClick="return deleteProduct();"><i class="fa fa-trash-o"></i> Delete </a>
	                          </td>
	                        </tr> 
                        </c:forEach>                      
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>

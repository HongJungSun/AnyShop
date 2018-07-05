<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> 배송 해야 할 상품 목록 </h2>
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
                          <th>상품 번호</th>
					      <th>상품이미지</th>
					      <th>상품명</th>
					      <th>상품 사이즈</th>
					      <th>상품  컬러</th>
					      <th>상품 수량</th>
                          <th style="width: 20%">배송 하기</th>
                        </tr>
                      </thead>
                      <tbody>
                          <c:forEach var="deliveryList" items="${deliveryList}" varStatus="status">
	                        <tr>
	                          <td>${status.count}</td>
	                          <td>
	                            <ul class="list-inline">
	                              <li>
	                                <img src="resources/product/${product_img_list[status.index]}" style="width:150px; height:150px;">
	                              </li>
	                            </ul>
	                          </td>
	                          <td class="project_progress">
						          <a href="">${deliveryList.product_name}</a><br>
						        </td>
	                          <td>
	                             ${deliveryList.product_size}
	                          </td>
	                           <td>
	                             ${deliveryList.product_color}
	                          </td>
	                            <td>
	                             ${deliveryList.product_quantity}
	                          </td>
	                          <td>
	                           <a class="btn btn-app" href="deliveryStart.do?apply_num=${deliveryList.apply_num }" onClick="return checkDelivery();">
	                           	  <i class="fa fa-play"> 배송 하기</i>
	                           	</a> 
	                          </td>
	                        </tr> 
                        </c:forEach>                      
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>

<script>
	function checkDelivery() {
		if( confirm('배송 하시겠습니까?') == true) {
			alert('배송 하셨습니다.');
			return true;
		} else {
			return false;
		}
	}

</script>


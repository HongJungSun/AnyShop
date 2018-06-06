<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> 배송 된 상품  </h2>
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
                          <th> 배송 받는 사람</th>
					      <th>상품명</th>
					      <th>상품 사이즈</th>
					      <th>상품  컬러</th>
					      <th>상품 수량</th>
                          <th style="width: 20%">배송 주소</th>
                        </tr>
                      </thead>
                      <tbody>
                          <c:forEach var="deliveryList" items="${deliveryList}" varStatus="status">
	                        <tr>
	                          <td>${deliveryList.name}</td>
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
								${address[status.index]}
	                          </td>
	                        </tr> 
                        </c:forEach>                      
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>




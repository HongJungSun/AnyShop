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
    	function allPaymentExcel() {
   		
    		$.ajax({
    			type: "post",
    			url: "allPaymentExcel.do", 			
    			success: function(msg) {
    				if(msg.result ==1){
    					alert('엑셀 파일을 만들었습니다.');
    				}
    			},
    			error: function(error) {
     	           	alert('엑셀 파일 만들기 error');
     	            alert(error);
     	            }   			
    		});
    	}
    
    
    </script>

<div class="row">
              <div class="col-md-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>매출 통계(분석)</h2>
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

                    <p style="color:red;">사용자 들이 구입한 상품 전체 입니다.</p>
                    <div style="float:right;">
                    	<a class="btn btn-success" onClick="return allPaymentExcel();"> excel 파일로 만들기 </a>
                    </div>
                    <div style="float:right;">
                    	<a class="btn btn-success" href="paymentStatistics.do"> 팔린 상품 등수로 보기 </a>
                    </div>

                    <!-- start project list -->
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 5%">번호</th>
                          <th style="width: 15%">상품 이름</th>
                          <th style="width: 30%">상품 이미지</th>
                          <th style="width: 30%"> 수량</th>
                          <th style="width: 20%"> 상품 가격</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${paymentList}" var="paymentList" varStatus="status">                     
                        <tr>
                          <td> ${status.count}</td>
                          <td>
                            ${paymentList.product_name}
                          </td>
                          <td>
                            <ul class="list-inline">
                              <li>
                                <a>
                            		<img src="resources/product/${productImgList[status.index]}" style="width:200px;">
                            	</a>
                              </li>
                            </ul>
                          </td>                          
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${paymentList.product_quantity}" aria-valuenow="0" style="width: 57%;"></div>
                            </div>                                                			
                           			<small>${paymentList.product_quantity} 개 </small>
                          </td>                                                 
                          <td>
                            ${paymentList.product_price} 원
                          </td>
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>
            </div>
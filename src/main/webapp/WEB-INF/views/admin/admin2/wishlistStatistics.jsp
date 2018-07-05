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
    	function wishListExcel() {
		
    		$.ajax({
    			type: "post",
    			url: "wishListExcel.do", 			
    			success: function(msg) {
    				if(msg.result ==1){
    					alert('엑셀파일을 만들었습니다.');
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
                    <h2>장바구니 통계(분석)</h2>
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

                    <p style="color:red;">사용자 들이 많이 찜해 놓은 상품 순서입니다.</p>
                    <div style="float:right;">
                    	<button class="btn btn-success" onClick="return wishListExcel();"> excel 파일로 만들기 </button>
                    </div>

                    <!-- start project list -->
                    <table class="table table-striped projects">
                      <thead>
                        <tr>
                          <th style="width: 5%">등수</th>
                          <th style="width: 15%">상품 이름</th>
                          <th style="width: 30%">상품 이미지</th>
                          <th>담긴 횟수</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach items="${wishList}" var="wishList" varStatus="status">                     
                        <tr>
                          <td> ${status.count}</td>
                          <td>
                            ${wishList.product_name}
                          </td>
                          <td>
                            <ul class="list-inline">
                              <li>
                                <a>
                            		<img src="resources/product/${wishList.product_img}" style="width:200px;">
                            	</a>
                              </li>
                            </ul>
                          </td>
                       <c:forEach items="${wishListCount}" var="wishListCount" varStatus="i">
                        <c:if test="${i.count eq status.count}">
                          <td class="project_progress">
                            <div class="progress progress_sm">
                              <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="${wishListCount}" aria-valuenow="0" style="width: 57%;"></div>
                            </div>                                                			
                           			<small>${wishListCount} 번 </small>
                          </td>                         
                         </c:if>
                       </c:forEach>                          
                        </tr>
                       </c:forEach>
                      </tbody>
                    </table>
                    <!-- end project list -->

                  </div>
                </div>
              </div>
            </div>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
	function page(idx) {
		var pageNum = idx;
		var contentNum = 10;
		
		location.href="showAllMember.do?pageNum1="+ pageNum +"&contentNum1="+ contentNum;
	}

</script>


            <div class="page-title">
              <div class="title_left">
                <h3>Any Shop </h3>
              </div>

              <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
	                  <form action="searchMember.do" method="post">
	                  <span> 
	                  	<input type="text" id="_searchName" name="id" class="form-control" placeholder="검색할 회원 아이디를 입력하세요.">
	                    <input type="submit" class="btn btn-default" value="검색">
	                  </span>
		                    <span class="input-group-btn">		   	                      
		                    </span>
	                    </form>
                  </div>
                </div>
              </div>
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>회원 리스트</h2>
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
                    <div id="datatable_wrapper" class="dataTables_wrapper form-inline dt-bootstrap no-footer">
                   		
                   		 <div class="row"><div class="col-sm-12">
                   		 <table id="datatable" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="datatable_info">
                      <thead>
                        <tr role="row">
                        <th class="sorting_asc" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" >이름</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" >아이디</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" >번호</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending" style="width: 75px;">이메일</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending">마일리지</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" >성별</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" >키</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending" >나이</th>
                        <th class="sorting" tabindex="0" aria-controls="datatable" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" >몸무게</th>  
                        </tr>
                      </thead>


                     <tbody>       
                     	<c:forEach items="${list}" var="list" begin="0" varStatus="i">                                                                        
	                      <tr role="row" class="odd">
	                          <td class="sorting_1">${list.name}</td>
	                          <td> <a href="searchMember.do?id=${list.id}"> ${list.id} </a></td>
	                          <td>${list.phone}</td>
	                          <td>${list.email}</td>
	                          <td>${list.point}</td>
	                          <td>${list.gender}</td>
	                          <td>${list.height}</td>
	                          <td>${list.age}</td>
	                          <td>${list.weight}</td>
	                        </tr>
                        </c:forEach>                                                
                      </tbody>
                   </table>
                 	 <!-- 페이징 처리 -->  
                    		<nav>
                      			<ul class="pagination" id="res">
	                      			<c:if test="${page.prev }">
	                      				<li class="page"> <a href="javascript:page(${page.getStartPage() -1 });" >&laquo;</a> </li>
	                      			</c:if>
	                      			
	                      			<c:forEach begin="${page.getStartPage() }" end="${page.getEndPage() }" var="idx">
	                      				<li class="page"> <a href="showAllMember.do?pageNum1=${idx}&contentNum1=${page.contentNum}"> ${idx }</a>	</li>
	                      			
	                      			</c:forEach>
	                      			                    			
	                      			<c:if test="${page.next }">
	                      				<li class="page"> <a href="javascript:page(${page.getEndPage() +1 });" >&raquo;</a> </li>
	                      			</c:if>
                      			</ul>
 							</nav>
 						<!-- / 페이징 처리 -->                   
                   
                 </div>
               </div>
               
            </div>
         </div>
       </div>

     </div>
 </div>
             

     



  

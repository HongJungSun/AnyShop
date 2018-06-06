<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<c:if test="${userInfo ne null }">
    <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>${userInfo.name} (${userInfo.id})</h2> 
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
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                        </div>
                      </div>
                      <h3>${userInfo.name}</h3>

                      <a class="btn btn-success" href="updateMember.do?id=${userInfo.id}" ><i class="fa fa-edit m-right-xs"></i>회원 정보 수정하기</a>
                      <br>
                      

                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">

                      <div class="profile_title">
                        <div class="col-md-6">
                          <h2>회원 정보 </h2>
                        </div>

                      </div>

                      <div id="graph_bar" style="width: 100%; height: 280px; position: relative; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
                      <ul class="list-unstyled user_data">
                        <li>
                        	아이디: ${userInfo.id}
                        </li>
                        <li>
                        	아이디: ${userInfo.phone}
                        </li>
                        <li>
                        	성별: ${userInfo.gender}
                        </li>
                        <li>
                        	주소: ${userInfo.address}
                        </li>
                        <li>
                          	번호: ${userInfo.phone }
                        </li>
                        <li>
                          	키: ${userInfo.height }
                        </li>
                        <li>
                          	나이: ${userInfo.age }
                        </li>
                        <li>
                          	몸무게: ${userInfo.weight }
                        </li>
                        

                        <li class="m-top-xs">
                          E-mail: ${userInfo.email}
                        </li>
                      </ul>
                      
					  </div>
                  
                   </div>                       
               </div>
          </div>
       </div>
  </div>
 </c:if>
 
 <c:if test="${userInfo eq null }">
 	<script>
 		alert('일치하는 회원 정보가 없습니다.');
 	</script>
 	<div class="row">
 		<h3 style="color:red;"> 등록되지 않은 회원 아이디 입니다.</h3>
 	</div>
 
 
 </c:if> 

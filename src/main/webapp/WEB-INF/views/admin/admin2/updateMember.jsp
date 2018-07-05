<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
    <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2> 회원 정보 수정</h2>
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

			<!-- 회원 정보 수정 form -->
                    <form class="form-horizontal form-label-left" action="updateMemberAfter.do" method="post">
                    	<input type="hidden" name="pw" value="${userInfo.pw}">
                    	<input type="hidden" name="id" value="${userInfo.id}">
                      <span class="section">${userInfo.name }</span>

                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Name <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="name" value="${userInfo.name}" class="form-control col-md-7 col-xs-12" data-validate-length-range="6" data-validate-words="2" name="name" placeholder="both name(s) e.g Jon Doe" required="required" type="text">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="phone">Phone <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="phone" name="phone" value="${userInfo.phone}" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="gender">Gender <span class="required">*</span>
                        </label>
                        <div>
                       	  <c:if test="${userInfo.gender eq '남자' }">
                      	   	 <input type="radio" id="gender" name="gender" value="남자" checked required="required">남자 
                      	   	 <input type="radio" id="gender" name="gender" value="여자" required="required">여자
          				  </c:if>  
          				  <c:if test="${userInfo.gender eq '여자' }">
          				  	 <input type="radio" id="gender" name="gender" value="남자" required="required"> 남자
          				   	 <input type="radio" id="gender" name="gender" value="여자" checked required="required"> 여자
                          </c:if>
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">E-mail <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input type="text" id="email" name="email" value="${userInfo.email }" required="required" class="form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" for="address">Address <span class="required">*</span>
                        </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="address" type="text" name="address" value="${userInfo.address }" data-validate-length-range="5,20" class="optional form-control col-md-7 col-xs-12">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Point</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.point }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3"> Height*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.height }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Age*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.age }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      <div class="item form-group">
                        <label for="point" class="control-label col-md-3">Weight*</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input id="point" type="text" name="point" value="${userInfo.weight }" data-validate-length="6,8" class="form-control col-md-7 col-xs-12" required="required">
                        </div>
                      </div>
                      
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-md-offset-3">
                          <input type="reset" class="btn btn-primary">
                          <input type="submit" class="btn btn-success">
                        </div>
                      </div>
                    </form> 
                  <!-- /end form -->
                    <button type="button" class="btn btn-primary" onClick="back();"> Cancel </button>                          
                          <script>
                          	function back() {
                          		history.back();
                          	}
                          
                          </script>
                    
                  </div>
                </div>
              </div>
            </div>
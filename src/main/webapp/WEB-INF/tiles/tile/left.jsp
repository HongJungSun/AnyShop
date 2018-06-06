<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


            
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="admin.do" class="site_title"><i class="fa fa-paw"></i> <span>AnyShop 관리자 페이지</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_info">
                <span>환영합니다.</span>
                <h2> ${sessionScope.name} 관리자님</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br>

            <!--  sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section active">
                <h3>관리자 기능</h3>
                <ul class="nav side-menu" style="">
                  <li class="active"><a><i class="fa fa-user"></i> 회원관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu" style="display: block;">
                      <li class="current-page"><a href="showAllMember.do">회원리스트</a></li>
                      <li><a href="regiMember.do">회원등록</a></li>
                    </ul>
                  </li>
                   <li><a><i class="fa fa-shopping-cart"></i> 상품관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="selectProductList.do">상품 목록(관리)</a></li>
                      <li><a href="addProductView.do">상품 등록</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-shopping-cart"></i> 주문관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="delivery.do">배송 준비 상품</a></li>
                      <li><a href="showDeliveryStart.do">배송 된 상품 </a></li>
                      <li><a href="cancelDelivery.do"> 주문 취소 상품</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>통계 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="reviewStatistics.do">상품 review 통계(분석)</a></li>
                      <li><a href="wishlistStatistics.do">장바구니 통계(분석)</a></li>
                      <li><a href="searchBoxStatistics.do">연관 검색 통계(분석)</a></li>
                      <li><a href="paymentStatistics.do"> 매출 통계(분석) </a></li>
                      <li><a href="allStatistics.do"> 전체 통계(분석) </a></li>
                    </ul>
                  </li>
                </ul>
              </div>               
            </div>
            <!-- /sidebar menu -->
          </div>
        </div>
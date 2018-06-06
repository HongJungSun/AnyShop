<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>      
       
       
      <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
            <nav>
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
				<div style="float:right; font-size:20px"><a href="logout.do" onClick="return logout();"><i class="fa fa-sign-out pull-right"></i> 로그아웃</a> </div>
				<div style="font-size:20px"><a href="#" onClick="return home();"> Any Shop 돌아가기</a> </div>
							<script>
								function logout() {
									if(confirm('정말 로그아웃 하시겠습니까?') == true) {
										alert('정상적으로 로그아웃 되었습니다.');
										return true;
									} else {
										return false;
									}
								}
								
								function home(){
									location.href="main.do";
								}

							</script>
            </nav>
            
          </div>
        </div>
       <!-- /top navigation -->
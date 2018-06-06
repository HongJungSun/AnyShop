<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<div class="col-md-12 mt">
   <div class="content-panel">
      <h4>
         <i class="fa fa-angle-right"></i> 아이디 찾기
      </h4>
      <hr>
">
         <div class="row mt">
            <div class="col-lg-12">
                  <section id="unseen">
                     <table class="table table-hover" id="tablezz">
                     <c:if test="${id ne null }">
                        	회원님의 아이디는  <span style="color:red; font-size:50px"> ${id} </span> 입니다.
                     </c:if>  
                      <c:if test="${id eq null }">
                        <tr><td>입력하신 정보로 일치하는 아이디가 없습니다.</td></tr>
                     </c:if>
                       
                        <tr><td colspan="2"><button type="submit" class="aa-browse-btn" name="Submit" onClick="return findPw();">비밀번호  찾기</button>
                        	<script>
                        		function findPw() {
                        			location.href="findPw.do";
                        		}
                        	
                        	</script>
                                                
                     </table>
                  </section>
               </div>
            </div>
   </div>
</div>
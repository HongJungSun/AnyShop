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
    	function allSearchBoxExcel() {
		
    		$.ajax({
    			type: "post",
    			url: "allSearchBoxExcel.do", 			
    			success: function(msg) {
    				if(msg.result ==1){
    					alert('AWS EC2 인스턴스에 엑셀파일을 생성하였습니다.');
    				}
    			},
    			error: function(error) {
     	           	alert('엑셀 파일 만들기 error');
     	            alert(error);
     	            }   			
    		});
    	}
    
    
    </script>


<div style="float:right;">
	<button class="btn btn-success" onClick="return allSearchBoxExcel();"> excel 파일로 만들기 </button>
</div>

<!-- 여자 통계 -->
<div class="x_content">
                  <table class="">
                    <tbody>
                    <tr>
                      <th style="width:500px;">
                        <p>여성 고객들이 많이 검색한 키워드 Top 10</p>
                      </th>
                    </tr>
                    <tr>
                      
                      <td>
                        <table class="tile_info">
                          <tbody>
                          <c:forEach items="${womenSearchBoxList}" var="womenSearchBoxList" varStatus="status">
                          <tr>                         
                          	<td style="width:500px;">
                              <p>
	                              ${status.count}. <span class="p"> ${womenSearchBoxList } </span>
                              </p>
                            </td>                          
                            <td class="td" style="width:30%;">  ${womenSearchBoxCountList[status.index] } 번 </td> 
                           </tr>
                          </c:forEach>
                        </tbody>
                       </table>
                      </td>
                    </tr>
                  </tbody>
             </table>
	</div>
<hr>	
<!-- 남자 통계 -->
<div class="x_content">
                  <table class="">
                    <tbody>
                    <tr>
                      <th style="width:500px;">
                        <p>남성 고객들이 많이 검색한 키워드 Top 10</p>
                      </th>
                    </tr>
                    <tr>
                      
                      <td>
                        <table class="tile_info">
                          <tbody>
                          <c:forEach items="${manSearchBoxList}" var="manSearchBoxList" varStatus="status">
                          <tr>                         
                          	<td style="width:500px;">
                              <p>
	                              ${status.count}. <span class="p1"> ${manSearchBoxList } </span>
                              </p>
                            </td>                          
                            <td class="td1" style="width:30%;">  ${manSearchBoxCountList[status.index] } 번 </td> 
                           </tr>
                          </c:forEach>
                        </tbody>
                       </table>
                      </td>
                    </tr>
                  </tbody></table>
	</div>
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
	function deleteBoard(){
		if(confirm('정말 삭제하시겠습니까?') == true) {
			alert('정상적으로 삭제 되었습니다.');
			return true;
		} else {
			return false;
		} 
		
	}

</script>



<form id="frm3" action="updateBoardCommit.do" method="post">
		<input type="hidden" name="idx" value="${board.idx}">
		<input type="hidden" name="product_id" value="${board.product_id}">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
                <col width="*"/>
            </colgroup>
            <i> 상품 문의</i>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="_title" name="title" value="${board.title}" class="wdp_90"></input></td>
                </tr>
                <tr>
                	<th scope="row"> 작성자 </th>
                	<td><input type="text" name="regi_id" value="${sessionScope.id}" readonly></td>             
                </tr>	
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="20" cols="100" title="contents" id="_contents" name="contents"> ${board.contents }</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="float:right; margin-right: 500px;"> 
        	 <a href="#" class="btn" onclick="history.back(-1)">뒤로가기</a>
        	 <c:if test="${sessionScope.id eq board.regi_id }">
        	 	<a href="#" class="btn" onClick="frm3.submit();alert('수정이 완료 되었습니다.');">수정 완료</a>
        	 	<a href="deleteBoard.do?idx=${board.idx}" class="btn" onClick="return deleteBoard();">삭제 하기</a>
        	 </c:if>
        </div>
    </form>
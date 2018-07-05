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

	$(document).ready(function() {
		
		$('.replyDialog').hide();
		
	});

	function deleteBoard(){
		if(confirm('정말 삭제하시겠습니까?') == true) {
			alert('정상적으로 삭제 되었습니다.');
			return true;
		} else {
			return false;
		} 
		
	}
</script>

<!-- 상품 문의글 읽기 -->
<form id="frm2" action="insertQuestionBoard.do" method="post">
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
                    <td><input type="text" id="_title" name="title" value="${board.title}" class="wdp_90" style="border:none;" readonly></input></td>
                </tr>
                <tr>
                	<th scope="row"> 작성자 </th>
                	<td><input type="text" name="regi_id" value="${board.regi_id}" style="border:none;" readonly></td>             
                </tr>
                 <tr>
                	<th scope="row"> 작성일자 </th>
                	<td><input type="text" name="regi_date" value="${board.regi_date}" style="border:none;" readonly></td>             
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="10" cols="100" title="contents" id="_contents" name="contents" readonly> ${board.contents }</textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="float:right; margin-right: 500px;"> 
        	 <a href="viewProduct.do?product_id=${board.product_id}" class="btn btn-primary">목록으로</a>
        	 <c:if test="${sessionScope.id eq board.regi_id }">
        	 	<a href="updateBoard.do?idx=${board.idx}" class="btn btn-primary" >수정 하기</a>
        	 	<a href="deleteBoard.do?idx=${board.idx}&product_id=${board.product_id}" class="btn" onClick="return deleteBoard();" >삭제 하기</a>
        	 </c:if>
        </div>
    </form>

<!-- /상품문의 글 읽기 -->

<!-- 댓글 작성하기 -->    
<div style="border: 1px solid; width: 750px; padding: 5px; background-color:lavender;">
    <form name="replyForm" action="regiReply.do" method="post" onSubmit="return replyForm1();">
        <input type="hidden" name="board_no" value="${board.idx}"> 
   		작성자: <input type="text" name="reply_writer" value="${sessionScope.id}" style="border:none; background-color:lavender;" size="20" maxlength="20" readonly> <br/>
        <textarea name="reply_contents" id="_reply_contents" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <input type="submit" class="btn" value="댓글 달기">
    </form>
</div>
<!-- /댓글 작성하기-->

<script>
	 function replyForm1() {
		 var reply_contents = $("#_reply_contents").val(); 
			
		if(reply_contents != null && reply_contents !="") {
			alert('성공적으로 댓글 입력 되었습니다.');
			return true;
		} else {
			alert('댓글 내용을 입력해 주세요.');
			return false;
		}	
	}	 
</script>


<!-- 작성된 댓글-->
<c:if test="${replyBoardList ne null }">
	<c:forEach var="replyBoardList" items="${replyBoardList}" varStatus="status">
	    <div style="border:1px solid gray; width: 750px; padding:5px; margin-top:5px; background-color:lavender; margin-left:${20*replyBoardList.redepth}px;">  
	       	 작성자: <input type="text" name="reply_writer" class="reply_writer" value="${replyBoardList.reply_writer}" style="border:none; background-color:lavender;"> 
	        	작성일자: <input type="text" name="reply_regi_date" value="${replyBoardList.reply_regi_date}" style="border:none; background-color:lavender;">
	    <c:if test="${sessionScope.id eq replyBoardList.reply_writer }">     	        
	        	<a href="deleteReplyBoard.do?reply_no=${replyBoardList.reply_no}&idx=${board.idx}&reparent=${replyBoardList.reparent}&board_no=${replyBoardList.board_no}&redepth=${replyBoardList.redepth}&reparent2=${replyBoardList.reparent2}&reorder=${replyBoardList.reorder}" onClick="return deleteReplyBoard();" class="btn" style="float:right;">삭제</a>
	        	<button type="button" name="update" class="btn-primary" style="float:right;"> 수정 </button>
	    </c:if>
	    <!-- class가 btn-prmary인 index를  jquery 함수에서 찾기위해서 사용 -->
	    <c:if test="${sessionScope.id ne replyBoardList.reply_writer }">     	        	        	
	        <input type="hidden" class="btn-primary">
	    </c:if>
	    <!-- /class가 btn-prmary인 index를   jquery 함수에서 찾기위해서 사용 -->
	    <c:if test="${sessionScope.id ne null }">
	    	<button type="button" name="regiReplyContents" class="btn-xs" style="float:right;"> 답글 달기</button>
	    </c:if>     
	        <br/>
	        <div class="reply">
	        <input type="hidden" name="board_no" class="board_no" value="${replyBoardList.board_no}">
	        <input type="hidden" class="reply_no" name="reply_no" value="${replyBoardList.reply_no}">
	        	<textarea name="reply_contents" class="_update_contents" style="text-align:left; background-color:lavender; border:0px"  rows="3" cols="60" maxlength="500" readonly>
	        		${replyBoardList.reply_contents} 	        		
	        	</textarea>	     	        	  	
	        </div>
	        <div class="loadButton"></div>
	        	        
	        <!-- 답글달기 버튼 클릭시 보여질 form -->
		        <div id="_replyDialog" class="replyDialog">
				    <form name="form3" action="regiReply.do" method="post">
				        <input type="hidden" name="board_no" value="<c:out value="${replyBoardList.board_no}"/>"> 
				        <input type="hidden" name="reply_no" value=""> 
				        <input type="hidden" name="reparent" value="${replyBoardList.reply_no}">
				        <input type="hidden" name="reparent2" value="${replyBoardList.reparent2}"> 
				       	 댓글 작성자: <input type="text" name="reply_writer" size="20" maxlength="20" value="${sessionScope.id}" style="border:0px; background-color:lavender;" readonly > <br/>
				        <textarea name="reply_contents" rows="2" cols="30" maxlength="500" style="margin: 0px; width: 660px; height: 100px;"></textarea>
				        <input type="submit" value="답글저장" class="btn">
				        <a href="#" onClick="return cancelReplyDialog(${status.index});" >취소</a>
				    </form>
				</div>
			<!-- /답글달기 버튼 클릭시 보여질 form -->	
	    </div>
	</c:forEach>
</c:if>
<!-- /작성된 댓글 -->
	

<script>

	// 작성된 댓글 삭제
	function deleteReplyBoard() {
		if(confirm("정말 삭제 하시겠습니까?") == true) {
			alert('정상적으로 삭제 되었습니다.');
			return true;
		} else {
			return false;
		}
	}
	
	// 작성된 댓글 수정시 수정폼 보여주기
	$('.btn-primary').click(function() {
		
		var n = $('.btn-primary').index(this);
		var reply_writer = $(".reply_writer:eq("+n+")").val();
		var reply_contents = $("._update_contents:eq("+ n +")").val();
		
		$("._update_contents:eq("+ n +")").removeAttr("readonly").focus().val(reply_contents);
		$("._update_contents:eq("+ n +")").css('background-color', 'white');
				
		var tag = "<a class=btn" + " onClick='updateReply("+ n + ");'> 저장 </a>"
				+ "<a class=btn" + " onClick='cancelReply("+ n + ");'> 취소 </a>";

		$(".loadButton:eq("+n+")").append(tag);
	});
	 	
	// 수정된 폼에서 저장 누르면  댓글 update 하기 
	function updateReply(n) {
		
		var board_no = $(".board_no:eq("+n+")").val();
		var reply_no=  $(".reply_no:eq("+ n +")").val();
		var _update_contents= $("._update_contents:eq("+ n +")").val();
		
		if(confirm('정말로 수정하시겠습니까?')== true) {
			alert('정상적으로 수정되었습니다.');
			location.href="regiReply.do?board_no=" + board_no + "&reply_no=" + reply_no + "&reply_contents=" + _update_contents;
		}
		
	}
	
	// update replyform 취소하기
	function cancelReply(n) {	
		
		$("._update_contents:eq("+ n +")").attr("readonly", "true");
		$("._update_contents:eq("+ n +")").css('background-color', 'lavender');		
		$(".loadButton:eq("+n+")").remove();
		
		history.go(0);
	}
	
	// 대댓글(답글달기) 버튼 클릭시
	$('.btn-xs').click(function(){
		
		var n= $('.btn-xs').index(this);
		
		$(".replyDialog:eq("+n+")").show();

	});
	
	function cancelReplyDialog(n) {
		$(".replyDialog:eq("+n+")").hide();
	}
	
	
	
</script>







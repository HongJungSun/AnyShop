<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    
   
 <script>
    
    $(document).ready(function(){
    	
		// 상품문의 글 확인
		$('#_checkForm').click(function(){
			var title= $('input[name=title]').val();
			var contents = $('textarea[name=contents]').val();
			
			
			if(title == ""){
				alert('제목을 입력해 주세요.');
				$(this).focus();
				return false;
			}
			if(contents == "") {
				alert('내용을 입력해주세요.');
				$(this).focus();
				return false;
			}
			alert('글 입력이 완료 되었습니다.');
			frm.submit();
		});   
    }); 
    
    </script>
	

<!-- 상품문의글 쓰기 -->
	<form id="frm" action="insertQuestionBoard.do" method="post">
		<input type="hidden" name="product_id" value="${productInfo.product_id}">
        <table class="board_view">
            <colgroup>
                <col width="15%">
                <col width="*"/>
            </colgroup>
            <h2> ${productInfo.product_name} </h2>
            <i> 상품 문의</i>
            <tbody>
                <tr>
                    <th scope="row">제목</th>
                    <td><input type="text" id="_title" name="title"></input></td>
                </tr>
                <tr>
                	<th scope="row"> 작성자 </th>
                	<td><input type="text" name="regi_id" value="${sessionScope.id}" readonly></td>             
                </tr>
                <tr>
                    <td colspan="2" class="view_text">
                        <textarea rows="10" cols="100" title="contents" id="_contents" name="contents"></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div style="float:right; margin-right: 500px;"> 
        	<a href="#" class="btn btn-primary" id="_checkForm">작성하기</a>
        	<a href="viewProduct.do?product_id=${productInfo.product_id}" class="btn btn-primary" id="list" >목록으로</a>
        </div>
    </form> 
<!-- / 상품문의글 쓰기 폼 -->
   
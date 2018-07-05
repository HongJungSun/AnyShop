<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"  %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





					<table style="border:1px solid #ccc; margin-left: auto; margin-right: auto; width: 1000px;">
							    <colgroup>
							        <col width="10%"/>
							        <col width="*"/>
							        <col width="15%"/>
							        <col width="15%"/>
							        <col width="20%"/>
							    </colgroup>
							    <thead>
							        <tr>
							            <th scope="col" style="text-align:center;">글번호</th>
							            <th scope="col" style="text-align:center;">제목</th>
							            <th scope="col" style="text-align:center;">작성자</th>
							            <th scope="col" style="text-align:center;">조회수</th>
							            <th scope="col" style="text-align:center;">작성일</th>
							        </tr>
							    </thead>
							    <tbody>
							        <c:choose>
							            <c:when test="${fn:length(list) > 0}">
							                <c:forEach items="${list}" var="row" varStatus="status">
							                    <tr>
							                        <td>${paging.totalRow-((paging.page-1)*paging.rowCount + status.index)}</td>
							                        <td><a href="readBoard.do?idx=${row.idx}">${row.title }</a></td>
							                        <td>${row.regi_id }</td>
							                        <td>${row.hit_cnt }</td>
							                        <td>${row.regi_date }</td>
							                    </tr>
							                </c:forEach>
							            </c:when>
							            <c:otherwise>
							                <tr>
							                    <td colspan="4">조회된 결과가 없습니다.</td>
							                </tr>
							            </c:otherwise>
							        </c:choose>							        							        
							    </tbody>
							</table>
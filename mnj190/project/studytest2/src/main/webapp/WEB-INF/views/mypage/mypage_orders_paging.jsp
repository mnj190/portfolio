<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.paging_area {
	padding: 10px 0;
	margin: 10px;
	text-align: center;
}

.paging_area a {
	display: inline-block;
	width: 32px;
	height: 18px;
	padding: 7px 0;
	margin: 0 3px;
	font-size: 15px;
	font-weight: bold;
	line-height: 1.2;
}

.paging_area a.selected {
	color: #1f8ce6;
}

.paging_area a :hover {
	background-color: lightgray;
	opacity: 1;
}
</style>
</head>
<body>
	<div class="paging_area">
		<div>
			<c:if test="${requestScope.paging.prev eq true }">
				<a href="" class="link_previous_page">이전</a>
			</c:if>
			<c:set var="page" value="${requestScope.paging.startPage }" />
			<c:forEach begin="${requestScope.paging.startPage }"
				end="${requestScope.paging.endPage}">
				<span><a
					href="
	${pageContext.request.contextPath}/mypage/myorders?term=${requestScope.term }&page=${page }"
					<c:if test="${page eq requestScope.page }">class="selected"</c:if>>${page }</a></span>
				<c:set var="page" value="${page+1}" />
			</c:forEach>
			<c:if test="${requestScope.paging.next eq true }">
				<a href="" class="link_next_page">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>
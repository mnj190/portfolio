<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 페이지</title>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout_common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}"
</script>
<style>
main {
	width: 100%;
	min-width: 1000px;
	margin: auto;
	display: block;
}
</style>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<main>
		<c:if test="${requestScope.type eq 'A' }">
			<%@ include file="/WEB-INF/views/shop/category_Atype.jsp"%>
		</c:if>


		<c:if test="${requestScope.type == 'B' }">
			<%@ include file="/WEB-INF/views/shop/category_Btype.jsp"%>
		</c:if>

		<!-- paging -->
		<%@ include file="/WEB-INF/views/shop/category_paging.jsp"%>
	</main>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 페이지</title>
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
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<main>

		<sidemenu> <!-- sidemenu --> <%@ include
			file="/WEB-INF/views/seller/seller_sidemenu.jsp"%>
		</sidemenu>

		<content> <!-- modification --> <c:if
			test="${requestScope.request eq 'registrationFrm' }"><%@ include
				file="/WEB-INF/views/seller/product_ registrationFrm.jsp"%>
		</c:if> </content>

	</main>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>마이 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous"> -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout_common.css">
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<main>

		<aside>

			<!-- sidemenu -->
			<%@ include file="/WEB-INF/views/mypage/mypage_sidemenu.jsp"%>

		</aside>

		<article>
			<!-- home -->
			<c:if test="${requestScope.request == null }"><%@ include
					file="/WEB-INF/views/mypage/mypage_modificationFrm.jsp"%></c:if>

			<!-- modification -->
			<c:if test="${requestScope.request == 'modification' }"><%@ include
					file="/WEB-INF/views/mypage/mypage_modificationFrm.jsp"%></c:if>

			<!-- orderlist -->
			<c:if test="${requestScope.request == 'orderlist' }"><%@ include
					file="/WEB-INF/views/mypage/mypage_order_list.jsp"%></c:if>

		</article>

	</main>

</body>
</html>
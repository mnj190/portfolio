<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
	<div class="from900">
		<div class="content_title">전체 주문 내역</div>
		<form action="" class="order_list_page">
			<div class="order_list_btn_box">
				<input type="button" class="btn week_btn term_btn" value="1주일"
					data="7"> <input type="button"
					class="btn month_btn term_btn" value="1개월" data="30"> <input
					type="button" class="btn 3months_btn term_btn" value="3개월"
					data="60"> <input type="button"
					class="btn 6months_btn term_btn" value="6개월" data="180"> <input
					type="button" class="btn 12months_btn term_btn" value="12개월"
					data="360">
			</div>
			<table class="order_list_table blue_table">
				<colgroup>
					<col width="1000">
					<col width="2500">
					<col width="300">
					<col width="300">
				</colgroup>
				<thead>
					<tr>
						<th>주문일</th>
						<th>상품명</th>
						<th>판매자</th>
						<th>주문상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="order" items="${requestScope.orders}">
						<tr>
							<input type="hidden" class="prod_num" value="${order.prod_num}">
							<input type="hidden" class="orders_num"
								value="${order.orders_num}">
							<td class="payment">
								<div class="order_date">
									<fmt:formatDate value="${order.orders_date}"
										pattern="yyyy년 MM월 dd일" />
								</div>
								<div class="payment_amount">
									결재 금액 :
									<fmt:formatNumber value="${order.orders_payment}"
										pattern="#,###,###,###" />
								</div>
							</td>
							<td>
								<div class="product_info">
									<img class="product_img"
										src="${pageContext.request.contextPath}/prod_img/${order.prod_thumb0}"
										alt="">
									<div class="product_name">
										<a
											href="${pageContext.request.contextPath}/shop/product?num=${order.prod_num}">${order.prod_name }</a>
									</div>
								</div>
							</td>
							<td class="seller_name">${order.seller_id }</td>
							<td class="order_state">${order.orders_state }<c:if
									test="${order.orders_state eq '거래완료' }">
									<div class="review_btn_box">
										<c:if test="${order.review_num eq null }">
											<input type="button" class="btn review_btn" value="구매후기">
										</c:if>
										<c:if test="${order.review_num ne null }">
											<div class="size10">후기 작성 완료</div>
											<input type="hidden" class="review_num"
												value="${order.review_num}">
										</c:if>
									</div>
								</c:if>

							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- paging -->
			<%@ include file="/WEB-INF/views/mypage/mypage_orders_paging.jsp"%>
		</form>
	</div>
</body>
<script type="text/javascript">
	const order_list_page = document.querySelector('.order_list_page');
	
	order_list_page.addEventListener('click', (e)=>{
		if(e.target.classList.contains('term_btn')){
			const term = e.target.getAttribute('data');
			location.href=contextPath+'/mypage/myorders?term='+term+'&page=1';
			}

		if(e.target.classList.contains('review_btn')){
			const prod_num = e.target.closest('tr').querySelector('.prod_num').value;
			const orders_num = e.target.closest('tr').querySelector('.orders_num').value;
			window.open(contextPath+"/mypage/reviewFrm?num="+prod_num+"&orders="+orders_num,"_blank","height=430px,width=380px, top=200px, left=200px, status=yes,toolbar=no,menubar=no,location=no");
			}
		})
		
</script>
<style>
.order_list_page .order_list_btn_box {
	margin-bottom: 5px;
}

.order_list_page .order_list_btn_box input[type=button], .review_btn {
	background-color: white;
	border: 1px solid #c5c5c5;
	border-radius: 4px;
	outline: none;
	padding: 5px 10px;
}

.review_btn {
	margin-top: 10px;
}

.order_list_page .order_list_table thead tr th {
	text-align: center;
	padding: 5px 0;
	border-bottom: 2px #0077d9 solid;
}

.order_list_page .order_list_table thead tr th:last-child {
	border-right: 1px #0077d9 solid;
}

.order_list_page .order_list_table thead tr th:first-child {
	border-left: 1px #0077d9 solid;
}

.order_list_page .order_list_table tbody td {
	padding: 20px;
	border-bottom: 1px solid black;
}

.order_list_page .order_list_table .payment {
	padding: 0;
	vertical-align: baseline;
	border-left: 1px #c5c5c5 solid;
}

.order_list_page .order_list_table .payment .order_date {
	box-sizing: border-box;
	padding: 20px 0;
	padding-left: 10px;
	border-bottom: 1px solid #c5c5c5;
	font-size: 12px;
}

.order_list_page .order_list_table .payment .payment_amount {
	box-sizing: border-box;
	padding-top: 10px;
	padding-left: 10px;
	font-size: 12px;
}

.order_list_page .order_list_table .product_info {
	display: flex;
}

.order_list_page .order_list_table .product_info .product_name {
	margin-left: 10px;
}

.order_list_page .order_list_table .product_info .product_img {
	width: 60px;
	height: 60px;
}

.order_list_page .order_list_table .order_number {
	margin-top: 10px;
	font-size: 12px;
}

.order_list_page .order_list_table .order_state, .order_list_page .order_list_table .seller_name
	{
	text-align: center;
}

.size10 {
	font-size: 11px;
	margin-top: 10px;
}
</style>

</html>
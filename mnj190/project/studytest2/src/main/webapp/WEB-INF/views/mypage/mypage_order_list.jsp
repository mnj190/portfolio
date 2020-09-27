<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="from900">
		<div class="content_title">전체 주문 내역</div>
		<form action="" class="order_list_page">
			<div class="order_list_btn_box">
				<input type="button" class="btn today_btn" value="오늘"> <input
					type="button" class="btn week_btn" value="1주일"> <input
					type="button" class="btn month_btn" value="1개월"> <input
					type="button" class="btn 3months_btn" value="3개월"> <input
					type="button" class="btn 6months_btn" value="6개월"> <input
					type="button" class="btn 12months_btn" value="12개월">
			</div>
			<table class="order_list_table blue_table">
				<colgroup>
					<col width="800">
					<col width="2500">
					<col width="400">
					<col width="400">
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
					<tr>
						<td class="payment">
							<div class="order_date">2019-03-20</div>
							<div class="payment_amount">결재 금액 : 284,120</div>
						</td>
						<td>
							<div class="product_info">
								<img class="product_img"
									src="http://image.iacstatic.co.kr/itemimage/12/ab/6e/12ab6ec6b0.jpg"
									alt="">
								<div class="product_name">
									<a href="">SONY 소니 WI-1000X 블루투스 이어셋/이어폰/무선/헤드셋</a>
								</div>
							</div>
							<div class="order_number">주문번호 | 15151515</div>
						</td>
						<td class="seller_name">앰피나비</td>
						<td class="order_state">거래완료</td>
					</tr>
					<tr>
						<td class="payment">
							<div class="order_date">2019-03-20</div>
							<div class="payment_amount">결재 금액 : 284,120</div>
						</td>
						<td>
							<div class="product_info">
								<img class="product_img"
									src="http://image.iacstatic.co.kr/itemimage/12/ab/6e/12ab6ec6b0.jpg"
									alt="">
								<div class="product_name">SONY 소니 WI-1000X 블루투스
									이어셋/이어폰/무선/헤드셋</div>
							</div>
							<div class="order_number">주문번호 | 15151515</div>
						</td>
						<td class="seller_name">앰피나비</td>
						<td class="order_state">거래완료</td>
					</tr>
					<tr>
						<td class="payment">
							<div class="order_date">2019-03-20</div>
							<div class="payment_amount">결재 금액 : 284,120</div>
						</td>
						<td>
							<div class="product_info">
								<img class="product_img"
									src="http://image.iacstatic.co.kr/itemimage/12/ab/6e/12ab6ec6b0.jpg"
									alt="">
								<div class="product_name">SONY 소니 WI-1000X 블루투스
									이어셋/이어폰/무선/헤드셋</div>
							</div>
							<div class="order_number">주문번호 | 15151515</div>
						</td>
						<td class="seller_name">앰피나비</td>
						<td class="order_state">거래완료</td>
					</tr>
					<tr>
						<td class="payment">
							<div class="order_date">2019-03-20</div>
							<div class="payment_amount">결재 금액 : 284,120</div>
						</td>
						<td>
							<div class="product_info">
								<img class="product_img"
									src="http://image.iacstatic.co.kr/itemimage/12/ab/6e/12ab6ec6b0.jpg"
									alt="">
								<div class="product_name">SONY 소니 WI-1000X 블루투스
									이어셋/이어폰/무선/헤드셋</div>
							</div>
							<div class="order_number">주문번호 | 15151515</div>
						</td>
						<td class="seller_name">앰피나비</td>
						<td class="order_state">거래완료</td>
					</tr>
					<tr>
						<td class="payment">
							<div class="order_date">2019-03-20</div>
							<div class="payment_amount">결재 금액 : 284,120</div>
						</td>
						<td>
							<div class="product_info">
								<img class="product_img"
									src="http://image.iacstatic.co.kr/itemimage/12/ab/6e/12ab6ec6b0.jpg"
									alt="">
								<div class="product_name">SONY 소니 WI-1000X 블루투스
									이어셋/이어폰/무선/헤드셋</div>
							</div>
							<div class="order_number">주문번호 | 15151515</div>
						</td>
						<td class="seller_name">앰피나비</td>
						<td class="order_state">거래완료</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>

<style>
.order_list_page .order_list_btn_box {
	margin-bottom: 5px;
}

.order_list_page .order_list_btn_box input[type=button] {
	background-color: white;
	border: 1px solid #c5c5c5;
	border-radius: 4px;
	outline: none;
	padding: 5px 10px;
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
</style>

</html>
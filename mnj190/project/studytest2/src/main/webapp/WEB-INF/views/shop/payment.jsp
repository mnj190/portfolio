<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>주문서</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}"
</script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/webtoolkit.base64.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
a:link, a:visited {
	text-decoration: none;
}

main {
	width: 1000px;
	margin: auto;
	dispaly: block
}

.prod_info {
	display: flex;
}

.thumb_area {
	width: 60px;
	margin: 0 10px;
}

.thumb_area .thumb {
	width: 60px;
	height: 60px;
}

.info_area {
	width: 540px;
	margin: 0 10px;
}

.info_area .prod_option_area {
	border: #c5c5c5 solid 1px;
	margin-top: 15px;
	margin-left: 15px;
	width: max-content;
}

.info_area .prod_option {
	display: flex;
	margin: 0 15px;
	padding: 15px 0;
	border-bottom: 1px #c5c5c5 solid;
}

.info_area .prod_option:last-child {
	border: none;
}

.info_area .prod_option .option_name {
	width: 300px;
}

.info_area .prod_option .option_quantity {
	text-align: center;
	width: 50px;
}

.info_area .prod_option .option_price {
	text-align: center;
	width: 100px;
}

.price_area, .delivery_charge {
	text-align: center;
}

.order_sheet_table {
	width: 1000px;
	border-collapse: separate;
}

.order_sheet_table thead tr th {
	text-align: center;
	border-top: 1px #c5c5c5 solid;
	border-bottom: 1px #c5c5c5 solid;
	padding-top: 10px;
	padding-bottom: 10px;
	background-color: #1F8CE6;
	color: white;
	font-size: 18px;
}

.order_sheet_table tbody tr td {
	min-height: 100px;
	vertical-align: top;
	padding: 15px 0;
	border-bottom: solid #c5c5c5 1px;
}

.step_title {
	font-size: 20px;
	font-weight: bold;
	margin-top: 25px;
	margin-bottom: 10px;
}

.destination_area {
	width: 550px;
}

.payment_area {
	width: 350px;
}

.total_price {
	font-size: 30px;
	font-weight: bolder;
}

.destination_input_area, .payment_submit_area {
	border: 1px solid #c5c5c5;
	padding: 15px 15px;
}

.payment_submit_area {
	text-align: center;
}

.payment_submit_area .total_price {
	margin-bottom: 20px;
}

.destination_input_area input[type="text"] {
	height: 30px;
	border: 1px #c5c5c5 solid;
	border-radius: 3px;
	outline: none;
	padding-left: 5px;
	box-sizing: border-box;
	margin: 10px 0;
}

#sample6_detailAddress, #sample6_extraAddress {
	width: 200px;
}

#sample6_address {
	width: 400px;
}

.flex_box {
	display: flex;
	justify-content: space-between;
}
</style>

<body>

	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<main>
		<div class="order_sheet_title content_title">주문서</div>
		<div>
			<div class="step_title">주문 상품</div>
			<table class="order_sheet_table ">
				<colgroup>
					<col width="600">
					<col width="250">
					<col width="150">
				</colgroup>
				<thead>
					<tr>
						<th>상품 정보</th>
						<th>금액</th>
						<th>배송비</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="flex_box">
			<div class="destination_area">
				<div class="step_title">배송지 정보</div>
				<div class="destination_input_area">
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" class="blue_btn_mini"
						onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목">
				</div>
			</div>
			<div class="payment_area">
				<div>
					<div class="step_title">결제</div>
					<div class="payment_submit_area">
						<div class="total_price">123456원</div>
						<button class="blue_btn payment_btn">결제하기</button>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- footer -->
	<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
</body>
<script defer="defer">
	const data = Base64.decode('${requestScope.data}');
	const data_object = JSON.parse(data);
	const tbody = document.querySelector('.order_sheet_table').querySelector(
			'tbody');
	console.log(data_object);
	const tr = document.createElement('tr');
	const td = document.createElement('td');
	const div = document.createElement('div');
	const div2 = document.createElement('div');
	tr.classList.add('product');
	td.classList.add('prod_info');
	div.classList.add('info_area');
	div2.classList.add('prod_option_area');

	td.innerHTML = '<div class="thumb_area"> <img class="thumb" src="'+data_object.prod_thumb+'"alt=""></div>';
	
	div.innerHTML += '<div class="prod_name_area">'+ data_object.prod_name +'</div>';

	if (data_object.order_details.length == 0) {
			div2.innerHTML += '<div class="prod_option"> <div class="option_name">본품</div> <div class="option_quantity">'+ data_object.orders_quantity +'개</div> <div class="option_price">'+ data_object.orders_payment +'원</div> </div>';
	 } else {
	 	data_object.order_details.forEach((e)=>{			
		 div2.innerHTML += '<div class="prod_option"> <div class="option_name">'+e.op_name+'</div> <div class="option_quantity">'+ e.details_quantity +'</div> <div class="option_price">'+ e.op_price + '</div> </div>';			
		 });
	 }
	 
	div.append(div2);
	td.append(div);
	tr.append(td);
	tr.innerHTML += '<td> <div class="price_area">'
			+ data_object.orders_payment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			+ '원</div> </td> <td> <div class="delivery_charge">무료</div> </td>';
	tbody.append(tr);

	document.querySelector('.total_price').innerHTML = data_object.orders_payment.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
	
	const payment_btn= document.querySelector('.payment_btn');
	payment_btn.addEventListener('click', (e) => {
		if(document.querySelector('#sample6_address').value==''){
			alert('주소를 입력해주세요.')
			return;
			} else {
				const address = document.querySelector('#sample6_postcode').value + document.querySelector('#sample6_address').value + document.querySelector('#sample6_detailAddress').value + document.querySelector('#sample6_extraAddress').value
				
				const ajax = new XMLHttpRequest();
		    	
				ajax.onreadystatechange = function(e) {
					if (ajax.readyState === ajax.DONE) {
						if (ajax.status === 200 || ajax.status === 201) {
							console.log(ajax.responseText);
							if(ajax.responseText == 'fail'){
								window.open(contextPath+"/loginFrm?reqURI=seccess","_blank","height=500,width=500, status=yes,toolbar=no,menubar=no,location=no");

										} else if (ajax.responseText == 'success'){		
										alert('주문이 완료되었습니다.')
										location.href=contextPath;
									}
					}
				}}

				const result = JSON.stringify({
					prod_num : data_object.prod_num,
					seller : data_object.seller,
					orders_address : address,
					orders_payment : data_object.orders_payment,
					orders_quantity : data_object.orders_quantity,
					orders_option : data_object.orders_option,
					order_details : data_object.order_details
					});

				console.log(result);

			  	ajax.open("POST", contextPath + "/shop/order", false);
				ajax.setRequestHeader("Content-Type", "application/json;charset=utf-8");			
			    ajax.send(result);
			    
				}
		})

	var login_result = () => {
		payment_btn.click();
  	}
	
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>
</html>
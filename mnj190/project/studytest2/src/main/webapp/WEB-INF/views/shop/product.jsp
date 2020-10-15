<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 페이지</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/layout_common.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script type="text/javascript">
	const prod_option = "${requestScope.product.prod_option}"
	const contextPath = "${pageContext.request.contextPath}"
</script>
</head>
<body>
	<!-- header -->
	<%@ include file="/WEB-INF/views/layout/header.jsp"%>

	<div class="item_top_info_wrap">
		<c:set var="prod" value="${requestScope.product }" />
		<input type="hidden" class="prod_num" value="${prod.prod_num }">
		<div class="item_top_gallary">
			<div class="viewer_container">
				<ul class="viewer">
					<c:if test="${prod.prod_thumb0 ne null }">
						<li class="view thumb on"><img
							src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb0 }"
							alt=""></li>
					</c:if>
					<c:if test="${prod.prod_thumb1 ne null }">
						<li class="view thumb"><img
							src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb1 }"
							alt=""></li>
					</c:if>
					<c:if test="${prod.prod_thumb2 ne null }">
						<li class="view thumb"><img
							src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb2 }"
							alt=""></li>
					</c:if>
				</ul>
				<div class="navwrap preview">
					<ul class="nav">
						<c:if test="${prod.prod_thumb0 ne null }">
							<li><img class="btn thumb_preview"
								src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb0 }"
								alt=""></li>
						</c:if>
						<c:if test="${prod.prod_thumb1 ne null }">
							<li"><img class="btn thumb_preview"
								src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb1 }"
								alt=""></li>
						</c:if>
						<c:if test="${prod.prod_thumb2 ne null }">
							<li><img class="btn thumb_preview"
								src="${pageContext.request.contextPath}/prod_img/${prod.prod_thumb2 }"
								alt=""></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
		<div class="item_top_info">
			<h1 class="itme_title">${prod.prod_name }</h1>
			<div class="itme_price_wrap">
				<div class="sale">
					70<span class="percent_mark">%</span>
				</div>
				<div class="price_real">
					<div class="price_innerwrap">
						<del class="price_original">46,000원</del>
						<span class="itme_price"><fmt:formatNumber
								value="${prod.prod_price}" pattern="#,###,###,###" /></span>원
					</div>
				</div>
			</div>
			<ul class="item_top_info_sub">
				<li class="slide_item">택배 - 무료배송</li>
				<li class="slide_item">최대구매수량 1개</li>
				<li class="slide_item">원산지 - 기타</li>
			</ul>
			<div class="order_info">
				<!-- 선택 옵션 -->
				<div class="select_option_wrap">
					<h3>옵션 선택</h3>
					<c:if test="${prod.prod_option eq 'A' }">
						<c:forEach var="names" items="${requestScope.op_names }">
							<div class="item_options">
								<button class="item_option_btn btn">
									<span class="txt" data-textinit="${names.op_dep1_name }">${names.op_dep1_name }</span>
								</button>
								<ul class="select_option_list" style="display: none;">
									<c:forEach var="values" items="${requetScope.op_dep1_values }">
										<c:if test="${values.op_dep1_name eq names.op_dep1_values }">
											<li><a href="#" class="item_options_value">${values.op_dep1_value}"</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${prod.prod_option eq 'B' }">
						<c:forEach var="names" items="${requestScope.op_names }">
							<div class="item_options dep1">
								<button class="item_option_btn btn">
									<span class="txt" data-textinit="${names.op_dep1_name }">${names.op_dep1_name }</span>
								</button>

								<ul class="select_option_list" style="display: none;">
									<c:forEach var="values" items="${requestScope.op_dep1_values }">
										<li><a href="#" class="item_options_value">${values.op_dep1_value}</a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="item_options dep2">
								<button class="item_option_btn btn unusable">
									<span class="txt" data-textinit="${names.op_dep2_name }">${names.op_dep2_name }</span>
								</button>
								<ul class="select_option_list" style="display: none;">

								</ul>
							</div>
						</c:forEach>
					</c:if>

				</div>
				<div class="selected_result">
					<ul class="result_item_list">

					</ul>
				</div>
				<div class="total_price">
					<span class="total_txt">총 상품금액</span><span class="total_price_txt">0원</span>
					<input type="hidden" class="total_price_value" value="0">
				</div>
			</div>
			<div class="item_bottom_btn_area">
				<button class="keep_btn btn">장바구니</button>
				<button class="buy_btn btn">구매</button>
			</div>
		</div>
	</div>
</body>

<script>
  // 옵션 선택
  const order_info = document.querySelector('.order_info');
  const result_item_list = document.querySelector('.result_item_list');
  const total_price_value = document.querySelector('.total_price_value');
  const total_price_txt = document.querySelector('.total_price_txt');
  
  order_info.addEventListener('click', (e) => {
    if (e.target.classList.contains('item_option_btn')) {
        if(e.target.classList.contains('unusable')){
			return;
            }
      const item_option = e.target.closest('.item_options')
      if (item_option.querySelector('.select_option_list').style.display == '') {
        item_option.querySelector('.select_option_list').style.display = 'none'
      } else {
        document.querySelectorAll('.item_options').forEach((elem) => {
          elem.querySelector('.select_option_list').style.display = 'none'
        });
        item_option.querySelector('.select_option_list').style.display = '';
      }
    }

    if (e.target.classList.contains('item_options_value')) {
      console.log('버튼 클릭');
      e.preventDefault();
      const item_option = e.target.closest('.item_options')      
      
        if(item_option.classList.contains('dep1')){
	      item_option.querySelector('[data-textinit]').innerHTML = e.target.innerHTML;
	      item_option.querySelector('[data-textinit]').classList.add('uxe-selected');
	      item_option.querySelector('.select_option_list').style.display = 'none'

	    	const ajax = new XMLHttpRequest();
	    	const prod_num = document.querySelector('.prod_num').value;
	    	const op_dep1_value = e.target.innerHTML;
	    	
			ajax.onreadystatechange = function(e) {
				if (ajax.readyState === ajax.DONE) {
					if (ajax.status === 200 || ajax.status === 201) {
						const jsonObj = JSON.parse(e.target.response);
						console.log(jsonObj);

						const item_option_dep2 = document.querySelector('.item_options.dep2');
						const select_option_list = item_option_dep2.querySelector('.select_option_list');
						const item_option_btn = item_option_dep2.querySelector('.item_option_btn');
						item_option_btn.classList.remove('unusable');
						select_option_list.innerHTML='';						
						
						jsonObj.forEach((e)=>{
							const li = document.createElement('li')
							const a = document.createElement('a')
							li.classList.add('dep2_info');
							a.classList.add('item_options_value');
							a.innerHTML = e.op_dep2_value;	
							if(e.op_add_price != 0){a.innerHTML += ' (+'+e.op_add_price+'원)';}
							if(e.op_quantity == 0){
								a.classList.add('unusable');
								a.innerHTML += ' (품절)';
								} else {a.classList.add('btn');}
							li.innerHTML += '<input type="hidden" class="op_num" value ='+e.op_num+'>';
							li.innerHTML += '<input type="hidden" class="op_add_price" value ='+e.op_add_price+'>';
							li.innerHTML += '<input type="hidden" class="op_quantity" value ='+e.op_quantity+'>';
							li.append(a);
							select_option_list.append(li);
							})
				};
			}}

		const result = JSON.stringify({
			prod_num : prod_num,
			op_dep1_value : op_dep1_value
			});
			
	    ajax.open("POST", contextPath + "/shop/getOptions2", false);
		ajax.setRequestHeader("Content-Type", "application/json;charset=utf-8");	
	    ajax.send(result);
		      
		} else if (item_option.classList.contains('dep2')){
				if(!e.target.classList.contains('unusable')){
					const item_option_dep1 = document.querySelector('.item_options.dep1');
					const select_option_list = item_option.querySelector('.select_option_list');
					const item_option_btn = item_option.querySelector('.item_option_btn');
					const seleted = item_option_dep1.querySelector('.uxe-selected');

					const li = document.createElement('li')
					li.classList.add('added_prod');
					const dep2_info = e.target.closest('.dep2_info');
					const number2 = dep2_info.querySelector('.op_add_price').value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
					li.innerHTML = '<div class="first_result"> <span> '+ seleted.innerHTML +'<br>'+e.target.innerHTML+'</span> </div>'
					li.innerHTML +=	'<div class="second_result"> <input type="number" class="quantity" value="1"><strong><span class="result_price">'+number2+'원 </span> <a href="#"><i class="fas fa-times item_cancel_btn"></i></a> </strong> </div>';
					li.innerHTML += '<input type="hidden" class="op_num" value ='+dep2_info.querySelector('.op_num').value+'>';
					li.innerHTML += '<input type="hidden" class="op_add_price" value ='+dep2_info.querySelector('.op_add_price').value+'>';
					li.innerHTML += '<input type="hidden" class="op_quantity" value ='+dep2_info.querySelector('.op_quantity').value+'>';

					item_option_btn.classList.add('unusable');
					select_option_list.innerHTML='';
					seleted.innerHTML = seleted.getAttribute('data-textinit');

					result_item_list.append(li);
					total_price_value.value = parseInt(total_price_value.value) + parseInt(dep2_info.querySelector('.op_add_price').value);
					const number = total_price_value.value
					total_price_txt.innerHTML = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';			
					}	
			}          
    }

   	if(e.target.classList.contains('item_cancel_btn')){
   	   	const added_prod = e.target.closest('.added_prod');
   	   	const quantity = added_prod.querySelector('.quantity');
   	   	const op_add_price = added_prod.querySelector('.op_add_price');

		console.log(parseInt(quantity.value));
		console.log(parseInt(op_add_price.value));
   	   	
   	    total_price_value.value = parseInt(total_price_value.value) - (parseInt(quantity.value) * parseInt(op_add_price.value));
   		const number = total_price_value.value
		total_price_txt.innerHTML = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';

   		added_prod.remove();
   	   	}
  })
  
  result_item_list.addEventListener('change', (e) => {
		if(e.target.value < 1){
			alert('주문 수량은 1개 이상의 숫자로 입력하세요.')
			e.target.value = 1;
			}
		  
	    const added_prod = result_item_list.querySelectorAll('.added_prod');
   	 	total_price_value.value = 0;
   	 	
	    Array.prototype.forEach.call(added_prod, (elem, index) => {
	   	   	const quantity = elem.querySelector('.quantity');
	   	   	const op_add_price = elem.querySelector('.op_add_price');
	   	   	const result_price = elem.querySelector('.result_price');	   

	   	   	const number = (parseInt(quantity.value) * parseInt(op_add_price.value));   	   	
	   	    total_price_value.value = parseInt(total_price_value.value) + parseInt(number);
	   		result_price.innerHTML = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
	    });

   		const number = total_price_value.value
		total_price_txt.innerHTML = number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
	  })
	  
	  const preview = document.querySelector('.preview');
  	  const viewer = document.querySelector('.preview');

  	viewer.addEventListener('click', (e) => {
			if(e.target.classList.contains('thumb_preview')){
					const thumb_previews = document.querySelectorAll('.thumb_preview');
					const view = document.querySelectorAll('.view');
					let index;
					Array.prototype.forEach.call(thumb_previews, (elem, i) => {
						if(e.target == elem)
							index = i;
						})

					Array.prototype.forEach.call(view, (elem, i) => {
							elem.classList.remove('on');
							if(i == index) elem.classList.add('on');
						})					
				}
  	  	})  	
</script>

<style>
ul {
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
}

li {
	list-style: none;
}

.item_top_info_wrap {
	width: 1000px;
	margin: auto;
	display: flex;
	justify-content: space-between;
}

.item_top_gallary .viewer_container {
	padding: 50px 0;
	max-width: 500px;
	text-align: center;
}

.item_top_gallary .viewer_container .viewer li {
	display: none;
	width: 500px;
	height: 500px;
	overflow: hidden;
}

.item_top_gallary .viewer_container .viewer li.on {
	display: block;
}

.item_top_gallary .viewer_container .viewer li img {
	width: 500px;
	height: 500px;
}

.item_top_gallary .nav {
	margin-top: 20px;
	justify-content: center;
	display: flex;
}

.item_top_gallary .nav img {
	width: 60px;
	height: 60px;
	margin-left: 10px;
}

.item_top_gallary .nav li:first-child img {
	margin-left: 0;
}

.price_real .price_innerwrap {
	height: 57.5px;
	vertical-align: bottom;
}

.item_top_info {
	width: 450px;
	margin-top: 10px;
}

.item_top_info .itme_price_wrap {
	margin-bottom: 30px;
}

.item_top_info .itme_price_wrap .sale {
	float: left;
	display: inline-block;
	margin-top: 4px;
	margin-right: 10px;
	line-height: 48px;
	height: 48px;
	color: #e63740;
	font-size: 48px;
	font-weight: bolder;
}

.item_top_info .itme_price_wrap .sale .percent_mark {
	font-size: 24px;
}

.item_top_info .price_real .itme_price {
	font-size: 30px;
	color: #000;
	font-weight: bold;
	/* display: block; */
}

.item_top_info .itme_price_wrap .price_innerwrap .price_original {
	display: block;
	color: #999999;
	font-size: 16px;
	line-height: 18px;
	text-decoration: line-through;
}

.item_top_info .item_top_info_sub {
	position: relative;
	z-index: 10;
	font-size: 16px;
	line-height: 22px;
	color: #222;
	border-top: 1px solid #ececec;
	margin-bottom: 20px;
}

.item_top_info .item_top_info_sub .slide_item {
	color: #222222;
	padding: 12px 0 12px 0;
	position: relative;
	border-bottom: 1px solid #f0f0f0;
	font-size: 16px;
}

.item_top_info .order_info .select_option_wrap .item_options {
	margin-bottom: 10px;
	position: relative;
}

.item_top_info .order_info .select_option_wrap .item_options .select_option_list
	{
	position: absolute;
	margin: 0;
	width: 100%;
	top: 50px;
	border: red 1px solid;
	border-top: none;
	box-sizing: border-box;
	max-height: 350px;
	overflow-y: scroll;
	overflow-x: hidden;
	z-index: 50;
}

.item_top_info .order_info .select_option_wrap .item_options .select_option_list li
	{
	border-bottom: 1px solid #cccccc;
	background-color: white;
	z-index: 50;
}

.item_top_info .order_info .select_option_wrap .item_options .select_option_list li a
	{
	display: block;
	padding: 12px 15px;
	font-size: 14px;
	color: #222222;
	line-height: 18px;
	letter-spacing: 0;
}

.item_top_info .order_info .select_option_wrap .item_options .select_option_list li a:hover
	{
	background-color: #cccccc;
}

.item_top_info .order_info .select_option_wrap .item_options button {
	outline: none;
	border: 1px solid #cccccc;
	height: 50px;
	display: block;
	overflow: hidden;
	width: 100%;
	font-size: 16px;
	line-height: 24px;
	text-align: left;
	padding: 13px 30px 9px 15px;
	background: #ffffff;
	color: #222222;
	text-overflow: ellipsis;
	/* box-sizing: border-box; */
}

.item_top_info .order_info .select_option_wrap .item_options button.unusable,
	.unusable {
	background-color: lightgray;
	cursor: not-allowed;
	opacity: 0.5;
}

.item_top_info .order_info .select_option_wrap .item_options button.seleted
	{
	border: 1px solid red;
	border-bottom-color: #cccccc;
}

.item_top_info .order_info .selected_result {
	margin-top: 30px;
}

.item_top_info .order_info .selected_result li {
	padding: 0 13px;
	background-color: #fafafa;
	border: 1px solid #cccccc;
	color: #666666;
	margin-top: 10px;
}

.item_top_info .order_info .selected_result li div {
	padding: 15px 0;
}

.item_top_info .order_info .selected_result li input {
	width: 50px;
}

.item_top_info .order_info .selected_result li .first_result {
	border-bottom: 1px dotted #cccccc;
}

.item_top_info .order_info .selected_result li .second_result {
	display: flex;
	justify-content: space-between;
}

.item_top_info .order_info .selected_result li .item_cancel_btn {
	color: #cccccc;
}

.item_top_info .order_info .selected_result li .result_price {
	font-size: 20px;
}

.item_top_info .total_price {
	margin: 30px 0;
	text-align: right;
}

.item_top_info .total_price .total_txt {
	vertical-align: middle;
}

.item_top_info .total_price .total_price_txt {
	font-size: 24px;
	color: black;
	font-weight: bolder;
	margin-left: 40px;
}

.item_top_info .item_bottom_btn_area {
	text-align: center;
}

.item_top_info .item_bottom_btn_area button {
	width: 35%;
	height: 50px;
	outline: none;
	font-size: 20px;
}

.item_top_info .item_bottom_btn_area button:hover {
	opacity: 0.5;
}

.item_top_info .item_bottom_btn_area .keep_btn {
	color: black;
	background-color: white;
	border: 1px solid black;
	box-sizing: border-box;
	font-weight: bolder;
}

.item_top_info .item_bottom_btn_area .buy_btn {
	color: white;
	background-color: #1f8ce6;
	border: 1px #1f8ce6 solid;
	box-sizing: border-box;
}
</style>
</html>
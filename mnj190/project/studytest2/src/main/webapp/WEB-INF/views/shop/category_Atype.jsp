<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
li {
	list-style: none;
}

ul {
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
}

.category_wrap .category_tag_wrap {
	padding: 10px 0;
	border-top: 1px solid #999999;
	border-bottom: 1px solid #999999;
}

.category_wrap .item_thumb_area img {
	width: 200px;
}

.category_wrap .category_tag_list {
	width: 1000px;
	margin: auto;
	display: flex;
}

.category_wrap .category_tag_list .category_list {
	margin-left: 10px;
}

.category_wrap .category_tag_list .category_list:first-child {
	margin-left: 0;
}

.category_item_area_wrap {
	width: 1000px;
	margin: auto;
}

.item_collection_section .item_list {
	display: flex;
	flex-wrap: wrap;
}

.item_collection_section .item_list li {
	width: 100%;
	box-sizing: border-box;
}

.item_collection_section .item_list li:nth-child(3n) {
	margin-right: 0;
}

.item_collection_section .item_list .inner {
	display: flex;
	width: 100%;
	position: relative;
	background-color: #fff;
	border: 1px solid #ebecef;
	box-sizing: border-box;
	padding: 30px;
}

.item_collection_section .item_list .inner:hover {
	border: 1px solid lightgray
}

.item_collection_section .item_list .inner .thumb {
	display: inline;
	max-width: 300px;
	height: 200px;
	margin: auto;
}

.item_collection_section .item_list .inner .thumb_box {
	width: 300px;
	height: 200px;
	text-align: center;
}

.item_collection_section .item_list .inner .item_title {
	display: block;
	overflow: hidden;
	margin-top: 6px;
	margin-bottom: 12px;
	font-size: 26px;
	color: #222;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
	letter-spacing: 0;
	font-weight: bolder;
}

.item_collection_section .item_list .inner .item_info {
	position: relative;
	padding: 4px 13px 10px;
}

.item_collection_section .item_list .inner .sale {
	color: #e63740;
}

.item_collection_section .item_list .inner .sale {
	color: #e63740;
	font-size: 24px;
}

.item_collection_section .item_list .inner .price {
	font-size: 24px;
	font-weight: bold;
}

.item_collection_section .item_list .inner span,
	.item_collection_section .item_list .inner del {
	font-size: 12px;
	font-weight: normal;
}

.category_item_area .category_item_top_bar {
	margin-top: 5px;
	margin-bottom: 5px;
	display: flex;
	justify-content: space-between;
	padding: 5px;
}

.category_item_area .category_item_top_bar .category_name {
	display: inline-block;
}

.category_item_area .category_type_btn {
	padding: 5px;
}

.category_item_area .category_type_btn:hover {
	color: lightgray;
}

.category_item_area .category_type_btn.selected {
	color: #1f8ce6;
}

.category_item_area .category_type_btn.selected:hover {
	color: #1f8ce6;
}

.review_rating {
	box-sizing: border-box;
	margin-top: 80px
}

.review_rating span.rating[data] {
	font-size: 20px;
}

.rating.checked {
	color: orange;
}
</style>
</head>
<body>
	<div class="category_wrap">
		<div class="category_item_area">
			<div class="category_item_area_wrap">
				<div class="category_item_top_bar">
					<h3 class="category_name">홈 > 남성의류</h3>
					<div class="category_type_btn_box">
						<a
							href="${pageContext.request.contextPath}/shop?cate=${requestScope.cate }&type=B&page=${requestScope.page }"
							class="category_type_btn"><i class="fas fa-th-large"></i></a> <a
							href="${pageContext.request.contextPath}/shop?cate=${requestScope.cate }&type=A&page=${requestScope.page }"
							class="category_type_btn selected"><i
							class="fas fa-align-justify"></i></a>
					</div>
				</div>
				<div class="item_collection_section">
					<ul class="item_list">
						<c:forEach var="prod" items="${requestScope.products}">
							<li>
								<div class="inner">
									<a
										href="${pageContext.request.contextPath}/shop/product?num=${prod.prod_num}">
										<div class="thumb_box">
											<img class="thumb" src="prod_img/${prod.prod_thumb0}"
												alt="이미지">
										</div>
									</a>
									<div class="item_info">
										<spna class="item_title"> <a
											href="${pageContext.request.contextPath}/shop/product?num=${prod.prod_num}">${prod.prod_name}</a></spna>
										<!-- <strong class="sale"> 69% </strong> -->
										<span class="price"> <strong><fmt:formatNumber
													value="${prod.prod_price}" pattern="#,###,###,###" /></strong><span>원</span>
											<!-- <del>20,000원</del> -->
										</span>
										<div class="review_rating">
											<span
												class="fa fa-star rating <c:if test="${prod.rating >= 1}">checked</c:if>"></span>
											<span
												class="fa fa-star rating <c:if test="${prod.rating >= 2}">checked</c:if>"></span>
											<span
												class="fa fa-star rating <c:if test="${prod.rating >= 3}">checked</c:if>"></span>
											<span
												class="fa fa-star rating <c:if test="${prod.rating >= 4}">checked</c:if>"></span>
											<span
												class="fa fa-star rating <c:if test="${prod.rating >= 5}">checked</c:if>"></span><span>
												(${prod.rating})</span> / <span>구매 : ${prod.cnt}</span>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
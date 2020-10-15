<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
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

.paging_area a :hover {
	background-color: lightgray;
	opacity: 1;
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
	width: 32%;
	box-sizing: border-box;
	margin-right: 2%;
}

.item_collection_section .item_list li:nth-child(3n) {
	margin-right: 0;
}

.item_collection_section .item_list .inner {
	display: inline-block;
	width: max-content;
	position: relative;
	background-color: #fff;
	border: 1px solid #ebecef;
	box-sizing: border-box;
	margin-top: 10px;
}

.item_collection_section .item_list .inner:hover {
	border: 1px solid lightgray
}

.item_collection_section .item_list .inner .thumb {
	display: inline;
	max-width: 318px;
	height: 165px;
}

.item_collection_section .item_list .inner .thumb_box {
	width: 318px;
	height: 165px;
	text-align: center;
}

.item_collection_section .item_list .inner .item_title {
	display: block;
	overflow: hidden;
	height: 19px;
	margin: 12px 13px 0;
	font-size: 15px;
	color: #222;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
	letter-spacing: 0;
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
							class="category_type_btn selected"><i class="fas fa-th-large"></i></a>
						<a
							href="${pageContext.request.contextPath}/shop?cate=${requestScope.cate }&type=A&page=${requestScope.page }"
							class="category_type_btn"><i class="fas fa-align-justify"></i></a>
					</div>
				</div>
				<div class="item_collection_section">
					<ul class="item_list">
						<c:forEach var="prod" items="${requestScope.products}">
							<li>
								<div class="inner">
									<a href="#">
										<div class="thumb_box">
											<img class="thumb" src="prod_img/${prod.prod_thumb0}"
												alt="이미지">
										</div> <spna class="item_title">${prod.prod_name}</spna>
									</a>
									<div class="item_info">
										<strong class="sale"> 69% </strong> <span class="price">
											<strong><fmt:formatNumber value="${prod.prod_price}"
													pattern="#,###,###,###" /></strong><span>원</span> <del>20,000원</del>
										</span>
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
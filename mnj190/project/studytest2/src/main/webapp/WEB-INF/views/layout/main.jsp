<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<main>
		<section class="event_slid">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="https://ad-img.ebaykorea.com/ADS/Contents_/2020_09_03_01_54_45/d791d47ffb624dce.JPG"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://ad-img.ebaykorea.com/ADS/Contents_/2020_09_02_04_56_28/69995b1afed64ecc.JPG"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://ad-img.ebaykorea.com/ADS/Contents_/2020_09_01_04_17_57/642b2adc50ac4853.JPG"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</section>

		<section class="item_collection">
			<article class="new_item_area">
				<div class="item_collection_title">
					<h3>New Item</h3>
				</div>
				<div class="item_collection_section">
					<ul class="item_list">
						<c:forEach var="prod" items="${requestScope.resent }">
							<li>
								<div class="inner">
									<a
										href="${pageContext.request.contextPath}/shop/product?num=${prod.prod_num}">
										<img class="thumb" src="prod_img/${prod.prod_thumb0}"
										alt="이미지"> <spna class="item_title">${prod.prod_name}</spna>
									</a>
									<div class="item_info">
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
			</article>

			<article class="hot_item_area">
				<div class="item_collection_title">
					<h3>Hot Item</h3>
				</div>
				<div class="item_collection_section">
					<ul class="item_list">
						<c:forEach var="prod" items="${requestScope.hot_item }">
							<li>
								<div class="inner">
									<a
										href="${pageContext.request.contextPath}/shop/product?num=${prod.prod_num}">
										<img class="thumb" src="prod_img/${prod.prod_thumb0}"
										alt="이미지"> <spna class="item_title">${prod.prod_name}</spna>
									</a>
									<div class="item_info">
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
			</article>

			<article class="best_review_area">
				<div class="item_collection_title">
					<h3>Best Review</h3>
				</div>
				<div class="item_collection_section">
					<ul class="item_list">
						<c:forEach var="prod" items="${requestScope.best_review }">
							<li>
								<div class="inner">
									<a
										href="${pageContext.request.contextPath}/shop/product?num=${prod.prod_num}">
										<img class="thumb" src="prod_img/${prod.prod_thumb0}"
										alt="이미지"> <spna class="item_title">${prod.prod_name}</spna>
									</a>
									<div class="item_info">
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
			</article>
		</section>
	</main>
</body>

<style>
main .item_collection {
	width: 1000px;
	margin: auto;
}

main .item_collection .item_collection_title {
	color: #333333;
	font-size: 28px;
	color: #1f8ce6;
	margin: 40px 0 5px 0;
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
	width: 320px;
}

.item_collection_section .item_list .inner a {
	width: inherit;
}

.item_collection_section .item_list .inner:hover {
	border: 1px solid lightgray
}

.item_collection_section .item_list .inner .thumb {
	display: block;
	height: 165px;
	max-width: 318px;
	margin: auto;
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

main .event_slid {
	width: 1000px !important;
	margin: auto;
}

.rating.checked {
	color: orange;
}
</style>
</html>
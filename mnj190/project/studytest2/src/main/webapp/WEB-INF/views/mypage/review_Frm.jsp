<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>구매후기 작성</title>
</head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
	const contextPath = "${pageContext.request.contextPath}"
</script>
<style>
.review_frm {
	width: 350px;
	height: 400px;
	position: relative;
	border: 2px darkgray solid;
	margin: auto;
}

.review_frm div {
	border-bottom: 2px darkgray solid;
}

.review_header_frm, .review_rating_frm {
	width: 350px;
	height: 50px;
}

.review_content_frm {
	width: 350px;
	height: 300px;
}

.review_frm .review_header_frm {
	text-align: center;
	background-color: #1f8ce6;
}

.review_frm .review_header {
	display: inline-block;
	font-size: 24px;
	font-weight: bolder;
	color: white;
	margin-top: 9px;
}

.review_frm .save_btn {
	position: absolute;
	right: 5px;
	top: 10px;
	height: 30px;
	width: 60px;
	box-sizing: border-box;
	border-radius: 4px;
	outline: none;
	border: 2px white solid;
	background-color: #1f8ce6;
	color: white;
	font-weight: bold;
	cursor: pointer;
}

textarea {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	border: none;
	padding-top: 5px;
	padding-left: 5px;
	box-sizing: border-box;
	font-size: 18px;
	color: darkgray;
	font-weight: bold;
	resize: none;
	font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS',
		sans-serif;
	line-height: 20px;
	outline: none;
}

.review_rating_frm {
	text-align: center;
	padding-top: 10px;
	box-sizing: border-box;
}

.rating {
	font-size: 30px;
	cursor: pointer;
}

.rating.checked {
	color: orange;
}
</style>

<body>
	<div class="review_frm">

		<div class="review_header_frm">
			<span class="review_header">구매후기 작성</span> <input type="button"
				class="save_btn" value="등록">

		</div>
		<div class="review_rating_frm">
			<span class="fa fa-star rating " data="1"></span> <span
				class="fa fa-star rating " data="2"></span> <span
				class="fa fa-star rating " data="3"></span> <span
				class="fa fa-star rating " data="4"></span> <span
				class="fa fa-star rating" data="5"></span>
		</div>


		<div class="review_content_frm">
			<textarea maxlength="200" class="review_content"></textarea>
		</div>
	</div>
</body>

<script>
	const review_rating_frm = document.querySelector('.review_rating_frm');
	const save_btn = document.querySelector('.save_btn');
	let point = 0;
	review_rating_frm.addEventListener('click', (e) => {
	    if (e.target.classList.contains('rating')) {
	        const rating = document.querySelectorAll('.rating');
	        point = e.target.getAttribute('data')
	        console.log(point)
	        Array.prototype.forEach.call(rating, (elem, i) => {
	            elem.classList.remove('checked')
	            if (i <= (point - 1)) {
	                elem.classList.add('checked')
	            }
	        })
	    }
	})
	
	save_btn.addEventListener('click', (e) => {
	    const review_content = document.querySelector('.review_content').value;
	    const review = new Object();
	    const num = ${requestScope.num};
	    const orders = ${requestScope.orders};
	    const ajax = new XMLHttpRequest();

	    if (ajax.readyState === ajax.DONE) {
			}

		const result = JSON.stringify({
			review_content : review_content,
			review_rating : point,
			prod_num : num,
			orders_num : orders
			});	
	  
	    ajax.open("POST", contextPath + "/mypage/setReviewFrm", false);
		ajax.setRequestHeader("Content-Type", "application/json;charset=utf-8");
	    ajax.send(result);	

		opener.document.location.reload();
		window.close()
	})
</script>

</html>
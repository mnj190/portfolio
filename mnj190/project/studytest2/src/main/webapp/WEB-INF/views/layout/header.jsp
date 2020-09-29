<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />
<style>
html, body {
	padding: 0;
	margin: 0;
}

header {
	margin: 0;
	padding: 0;
	background-color: #1f8ce6;
	text-align: center;
}

header .header .logo {
	font-size: larger;
	font-weight: bold;
	height: 30px;
}

header h1 {
	margin: 0;
	padding: 30px
}

header .header .external_links {
	line-height: 30px;
	display: inline-block;
}

header .header .btn_box {
	position: relative;
	vertical-align: text-bottom;
	display: inline-block;
}

header .header a, header .header a:link, header .header a:visited {
	height: 11px;
	color: white;
	text-decoration: none;
	padding: 0 6px;
}

header .header .external_links a {
	font-size: 11px;
	border-right: 1px white solid;
}

header .header .external_links a:last-child {
	border: none;
}

header .header {
	color: white;
	height: 30px;
	margin: auto;
	max-width: 1000px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: auto;
}

nav .nav {
	margin: auto;
	padding: 10px 0;
	max-width: 1000px;
}

nav .nav_menu_list {
	width: 100%;
	display: flex;
	justify-content: space-between;
	display: flex;
}

.dropmenu_btn {
	font-size: 16px;
	margin-left: -6px;
	vertical-align: bottom;
}

.header .logo .logo_title {
	padding: 0;
}

.attach_total_category {
	position: absolute;
	width: 1000px;
	top: 42px;
	box-sizing: border-box;
	z-index: 10;
	border: 1px #ebecef solid;
}

.attach_total_category .total_category_list {
	display: flex;
	flex-wrap: wrap;
	background-color: white;
}

.attach_total_category .total_category_list li {
	width: 20%;
	height: 210px;
	border-right: 1.8px solid #eaeaea;
	border-bottom: 1px solid #eaeaea;
	box-sizing: border-box;
}

.attach_total_category .total_category_list li:nth-child(5n) {
	border-right: none;
}

.attach_total_category .total_category_list li dt {
	background-color: #f5f4f0;
	height: 35px;
	vertical-align: bottom;
	margin: 5px;
	padding-left: 5px;
	padding-top: 10px;
	color: #666;
	font-size: 12px;
	font-weight: bold;
	box-sizing: border-box;
}

.attach_total_category .total_category_list li dd {
	padding-left: 10px;
	padding-top: 5px;
	font-size: 12px;
}

nav {
	border-bottom: 1px #ebecef solid;
	position: relative;
	height: 42px;
}

header .attach_menu {
	overflow-y: auto;
	position: absolute;
	top: 22px;
	right: 0;
	z-index: 11;
	max-width: 500px;
	max-height: 416px;
	margin-top: 6px;
	padding: 15px;
	border: 1px solid rgba(0, 0, 0, .06);
	border-radius: 6px;
	box-shadow: 0 1px 12px 0 rgba(0, 0, 0, .06);
	background-color: #fff;
	box-sizing: border-box;
	width: 130px;
}

header .attach_menu .menu_list {
	margin-top: 5px;
	text-align: left;
}

header .attach_menu .menu_list:first-child {
	margin-top: 0;
}

header .attach_menu .menu_list a {
	color: #666;
}
</style>
</head>

<body>
	<header>
		<div class="header">
			<div class="left_area">
				<div class="logo">
					<a href="${pageContext.request.contextPath}" class="logo_title">
						제목 </a>
				</div>
			</div>
			<div class="rigth_area">
				<div class="external_links">
					<c:if test="${empty sessionScope.member}">
						<a href="
	${pageContext.request.contextPath}/loginFrm">Login</a>
						<a href="
	${pageContext.request.contextPath}/signupFrm">Sign
							Up</a>
					</c:if>

					<c:if test="${!empty sessionScope.member}">
						<a href="
	${pageContext.request.contextPath}/logout">Logout</a>
					</c:if>
				</div>


				<div class="btn_box"
					<c:if test="${empty sessionScope.member}"> style="display:none" </c:if>>
					<a href="#" class=""><i class="fas fa-bars dropmenu_btn"></i></a>
					<div class="attach_menu not_t1" style="display: none;">
						<ul class="attach_menu_list not_t1">
							<li class="menu_list not_t1"><a
								href="${pageContext.request.contextPath}/mypage">마이페이지</a></li>
							<li class="menu_list not_t1"><a
								href="${pageContext.request.contextPath}/cart">찜한 상품</a></li>

							<li class="menu_list not_t1"><a
								href="${pageContext.request.contextPath}/seller">판매자 메뉴</a></li>

							<li class="menu_list not_t1"><a
								href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</header>
	<nav>
		<div class="nav">
			<ul class="nav_menu_list">
				<li><label for="" class="total_category_btn"><a
						href="#"><i class="fas fa-caret-down font_menu_btn"></i> 전체
							카테고리</a></label></li>
				<li><a href="">메뉴1</a></li>
				<li><a href="">메뉴2</a></li>
				<li><a href="">메뉴3</a></li>
				<li><a href="">메뉴4</a></li>
			</ul>
			<div class="attach_total_category not_t2" style="display: none;">
				<ul class="total_category_list not_t2">
					<!-- <li class="cat1">
						<dl>
							<dt>브랜드 패션</dt>
							<dd>
								<a href="#">브랜드 여성 의류</a>
							</dd>
							<dd>
								<a href="#">브랜드 남성 의류</a>
							</dd>
						</dl>
					</li> -->
				</ul>
			</div>
		</div>
	</nav>
</body>

<style>
</style>

<script>
	
	  const header = document.querySelector('.header');
	  const attach_menu = document.querySelector('.attach_menu');
	  const attach_total_category = document.querySelector('.attach_total_category');
	
	  const total_category_btn = document.querySelector('.total_category_btn')
	  const font_menu_btn = document.querySelector('.font_menu_btn');
	
	  total_category_btn.addEventListener('click', () => {
	    if (attach_total_category.style.display == 'none') {
	      attach_total_category.style.display = null
	      font_menu_btn.classList.remove('fa-caret-down')
	      font_menu_btn.classList.add('fa-caret-up')
	    }
	    else {
	      attach_total_category.style.display = 'none'
	      font_menu_btn.classList.add('fa-caret-down')
	      font_menu_btn.classList.remove('fa-caret-up')
	    }
	  })
	
	  window.addEventListener('click', (e) => {
	    // 마이페이지 메뉴
	    console.log(e.target)
	    if (!e.target.classList.contains('not_t1')) {
	      if (attach_menu.style.display == '') {
	        attach_menu.style.display = 'none';
	        return;
	      }
	    }
	
	    if (e.target.classList.contains('dropmenu_btn')) {
	      if (attach_menu.style.display == 'none') {
	        attach_menu.style.display = null;
	      }
	    }
	  })
	
	  window.onload = function(){
		  var ajax = new XMLHttpRequest();
	  
			ajax.onreadystatechange = function(e) {
				if (ajax.readyState === ajax.DONE) {
					if (ajax.status === 200 || ajax.status === 201) {
						const jsonObj = JSON.parse(e.target.response);
						const category = jsonObj.category;
						const subcategory = jsonObj.subcategory;
						const total_category_list = document.querySelector('.total_category_list');

						console.log(category.length);
						console.log(subcategory);
						
						for(var i = 0; i < category.length; i++){
							console.log(category[i].cate_name);
							console.log(category[i].cate_num);
							
							let add_cate = document.createElement('li');
							add_cate.classList.add('cat1');
							add_cate.innerHTML = '<dl> <dt>'+category[i].cate_name+'</dt>'

					 		for(var j = 0; j < subcategory.length; j++){
								if(subcategory[j].parent_num == category[i].cate_num) {
									add_cate.innerHTML += '<dd><a href="#">'+subcategory[j].cate_name+'</a></dd>'
								}
							}  
        						
							add_cate.innerHTML += '</dl>'
							
        					total_category_list.append(add_cate);        					
							}		
				};
			}}
			
			ajax.open("POST",
					contextPath+"/shop/getCategory", false); //
			ajax.send();
	
	}
	  
	</script>
</html>
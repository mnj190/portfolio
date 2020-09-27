<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>side menu</title>
</head>
<!--CDN 링크 -->
<body>
	<div class="sidemenu_area">

		<div class="sidemenu_title_area">My page</div>
		<div class="sidemenu_id_area">
			<sapn class="highlight_orange"> ${sessionScope.member.name }</sapn>
			님
		</div>
		<ul class="sale_info">
			<li>누적 주문 건수 <span class="right_text">0건</span></li>
			<li>진행 중인 주문 <span class="right_text">0건</span></li>
			<li>교환 / 반품 요청 <span class="right_text">0건</span></li>
		</ul>

		<div class="menu_list">

			<div class="menu_wrap">
				<label for="menu_title">
					<div class="menu_title btn" name="menu_title">
						쇼핑 내역 <i class="fas fa-caret-down down_up_icon"></i>
					</div>
				</label>
				<ul class="submenu_area" style="display: none;">
					<li class="btn orderlist_btn">전체 주문 내역</li>
					<li class="btn refundlist_btn">교환 / 반품 내역</li>
				</ul>
			</div>

			<div class="menu_wrap">
				<div class="menu_title btn">
					회원 정보 <i class="fas fa-caret-down down_up_icon"></i>
				</div>
				<ul class="submenu_area" style="display: none;">
					<li class="btn modificationFrm_btn">회원 정보 수정</li>
					<li class="btn withdrawFrm_btn">회원 탈퇴</li>
				</ul>
			</div>

		</div>

	</div>
</body>
<script>
  const sidemenu_area = document.querySelector('.sidemenu_area');

  sidemenu_area.addEventListener('click', (e) =>{
    console.log(e.target);
    if(e.target.classList.contains('menu_title') || e.target.classList.contains('down_up_icon')){
      const submenu_area = e.target.closest('.menu_wrap').querySelector('.submenu_area');
      const down_up_icon = e.target.closest('.menu_wrap').querySelector('.down_up_icon');

      if(submenu_area.style.display == 'none'){
        submenu_area.style.display = null;
        down_up_icon.classList.remove('fa-caret-down');
        down_up_icon.classList.add('fa-caret-up')
      } else if (submenu_area.style.display == ''){
        submenu_area.style.display = 'none';
        down_up_icon.classList.add('fa-caret-down');
        down_up_icon.classList.remove('fa-caret-up')        
      }
    }

    if(e.target.classList.contains('orderlist_btn')){
    	location.replace(contextPath + '/mypage/orderlist');}


    if(e.target.classList.contains('refundlist_btn')){
    	location.replace(contextPath + '/mypage/refundlist');}


    if(e.target.classList.contains('modificationFrm_btn')){
    	location.replace(contextPath + '/mypage/modificationFrm');}

    if(e.target.classList.contains('withdrawFrm_btn')){
    	location.replace(contextPath + '/mypage/withdrawFrm');}
	
  })  
</script>
<style>
.sidemenu_area {
	width: 170px;
}

.sidemenu_area .sidemenu_title_area {
	background-color: #1F8CE6;
	font-size: 18px;
	font-weight: bolder;
	color: white;
	text-align: center;
	height: 30px;
	vertical-align: middle;
	padding: 5px 0;
	border-bottom: 2px solid #0077d9;
	line-height: 28px;
}

.sidemenu_area .sidemenu_id_area {
	vertical-align: middle;
	text-align: center;
	font-size: 16px;
	padding: 10px;
	font-size: 16px;
}

.sidemenu_area .sale_info {
	border-top: 2px #c5c5c5 solid;
	border-bottom: 2px #c5c5c5 solid;
	padding: 5px;
	padding-left: 10px;
}

.sidemenu_area .sale_info li {
	font-size: 12px;
	padding-top: 3px;
}

.sidemenu_area .sale_info li:first-child {
	padding-top: 0;
}

.sidemenu_area .sale_info li .right_text {
	float: right;
	margin-right: 10px;
}

.sidemenu_area .menu_list .menu_title {
	background-color: lightgray;
	font-weight: bolder;
	padding: 7px;
	vertical-align: middle;
	border-top: 2px #c5c5c5 solid;
	border-bottom: 2px #c5c5c5 solid;
}

.sidemenu_area .menu_list .menu_title .down_up_icon {
	float: right;
	margin-right: 5px;
	vertical-align: middle;
	line-height: 22px;
}

.sidemenu_area .menu_list .menu_title:first-child {
	border-top: 0;
}

.sidemenu_area .menu_list .submenu_area li {
	padding-top: 3px;
	padding-left: 12px;
	font-size: 12px;
}

.sidemenu_area .menu_list .submenu_area li:last-child {
	padding-bottom: 3px;
}
</style>
<script>

</script>

</html>
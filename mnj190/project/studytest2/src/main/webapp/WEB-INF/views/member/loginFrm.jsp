<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member/account.css">
<script type="text/javascript">
const contextPath = "${pageContext.request.contextPath}"</script>
</head>
<body>
	<section class="account-login account-container">
		<form action="${pageContext.request.contextPath}/login"
			class="account-form" method="post">
			<div class="input-group">
				<label class="account-label"> <input type="text" name="id"
					id="id" placeholder="아이디" autocomplete="off" class="login_input">
				</label> <label class="account-label"> <input type="password"
					name="pw" id="pw" placeholder="비밀번호" autocomplete="off"
					class="login_input">
				</label>
				<div class="login_menu_wrapper">
					<label class="auto_login_check"> <input type="checkbox"
						name="auto_login" class="auto_login"> <span>로그인 상태
							유지</span>
					</label>
					<div class="external_links">
						<a href="#" class="link">아이디 찾기</a> <a href="#" class="link">비밀번호
							찾기</a>
					</div>
				</div>
			</div>
			<p class="err_msg"></p>
			<button class="login_btn blue_btn full_btn">로그인</button>
			<button class="signup_btn white_btn full_btn">회원가입</button>
		</form>
	</section>
</body>
<script type="text/javascript">
const account = document.querySelector('.account-form');
const id = document.querySelector('input[name=id]');
const pw = document.querySelector('input[name=pw]');
const err_msg = document.querySelector('.err_msg');

const login_btn = document.querySelector('.login_btn');
const signup_btn = document.querySelector('.signup_btn');

login_btn.addEventListener('click', (e) => {
  e.preventDefault();
  if (id.value.trim().length == 0) {
    err_msg.innerHTML = '아이디를 입력해주세요';
    return;
  } else if (pw.value.trim().length == 0) {
    err_msg.innerHTML = '비밀번호를 입력해주세요';
    return;
  } else {
    account.submit();
  }
})

signup_btn.addEventListener('click', (e) => {
  e.preventDefault();
  location.href = contextPath+'/signupFrm';
})
</script>
</html>
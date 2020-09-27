<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member/account.css">
<script type="text/javascript">
const contextPath = "${pageContext.request.contextPath}"</script>
</head>
<body>
	<section class="account-login account-container">
		<form action="${pageContext.request.contextPath}/signup"
			class="account-form" method="post">
			<div class="input-group">
				<label class="vaild-palceholder input-wrapper"> <span
					class="placeholder">아이디</span> <input type="text" name="id"
					autocomplete="off" class="signup_input" maxlength="10">
				</label>
				<p class="err_msg"></p>
			</div>
			<div class="input-group">
				<label class="vaild-palceholder input-wrapper"> <span
					class="placeholder">비밀번호</span> <input type="password" name="pw"
					autocomplete="off" class="signup_input" maxlength="15">
				</label> <label class="vaild-palceholder input-wrapper"> <span
					class="placeholder">비밀번호 확인</span> <input type="password"
					name="pwc" autocomplete="off" class="signup_input" maxlength="15">
				</label>
				<p class="err_msg"></p>
			</div>
			<div class="input-group">
				<label class="vaild-palceholder input-wrapper"> <span
					class="placeholder">이메일 주소</span> <input type="text" name="email"
					autocomplete="off" class="signup_input" maxlength="25">
				</label>
				<p class="err_msg"></p>
			</div>
			<div class="input-group">
				<label class="vaild-palceholder input-wrapper"> <span
					class="placeholder">이름</span> <input type="text" name="name"
					autocomplete="off" class="signup_input" maxlength="5">
				</label>
				<p class="err_msg"></p>
			</div>
			<input type="button" class="signup_submit_btn blue_btn full_btn"
				value="회원가입 완료" />
		</form>
	</section>
</body>

<script>
  const user_id = document.querySelector('.signup_input[name=id]');
  const user_pw = document.querySelector('.signup_input[name=pw]');
  const user_pwc = document.querySelector('.signup_input[name=pwc]');
  const user_email = document.querySelector('.signup_input[name=email]');
  const user_name = document.querySelector('.signup_input[name=name]');
  const signup_submit_btn = document.querySelector('.signup_submit_btn');
  const signup_frm = document.querySelector('.account-form');

  //정규식
  const id_patten = /^[0-9a-z]+$/;
  const email_patten = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
  const name_patten = /^[가-힣]+$/

  //아이디
  user_id.addEventListener('focus', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.style.color = null;
    e.target.style.borderColor = null;
    ele.style.fontSize = "12px";
    ele.style.top = "10px";
    ele.innerHTML = "5~10자 영문, 숫자 입력"
  })

  user_id.addEventListener('blur', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.innerHTML = "아이디"
    if (e.target.value.length == 0) {
      ele.style.fontSize = "15px";
      ele.style.top = "18px";
    }
    if (chk_id() == true) { 
      ele.style.color = null;
      e.target.style.borderColor = null;
    } else {
      ele.style.color = "red";
      e.target.style.borderColor = "red";
    }
  })

  //비밀번호
  user_pw.addEventListener('focus', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.style.color = null;
    e.target.style.borderColor = null;
    e.target.style.zIndex = null;
    ele.style.fontSize = "12px";
    ele.style.top = "10px";
    ele.innerHTML = "8~15자 이상"
  })

  user_pw.addEventListener('blur', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.innerHTML = "비밀번호"
    if (e.target.value.length == 0) {
      ele.style.fontSize = "15px";
      ele.style.top = "18px";
    }

    if (chk_pw() == true) {
      ele.style.color = null;
      e.target.style.borderColor = null;
      e.target.style.zIndex = null;
    } else {
      ele.style.color = "red";
      e.target.style.borderColor = "red";
      e.target.style.zIndex = "1";
    }
  })

  //비밀번호 확인
  user_pwc.addEventListener('focus', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.style.color = null;
    e.target.style.borderColor = null;
    e.target.style.zIndex = null;
    ele.style.fontSize = "12px";
    ele.style.top = "10px";
    ele.innerHTML = "비밀번호 재입력"
  })

  user_pwc.addEventListener('blur', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.innerHTML = "비밀번호 확인"
    if (e.target.value.length == 0) {
      ele.style.fontSize = "15px";
      ele.style.top = "18px";
    }

    if (chk_pw() == true) {
      if (chk_pwc() == true) {
        ele.style.color = null;
        e.target.style.borderColor = null;
        e.target.style.zIndex = null;
      } else {
        ele.style.color = "red";
        e.target.style.borderColor = "red";
        e.target.style.zIndex = "1";
      }
    } else {
      user_pw.focus();
      user_pw.blur();
      ele.style.color = "red";
      e.target.style.borderColor = "red";
      e.target.style.zIndex = "1";
    }


  })

  //이메일
  user_email.addEventListener('focus', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.style.color = null;
    e.target.style.borderColor = null;
    ele.style.fontSize = "12px";
    ele.style.top = "10px";
    ele.innerHTML = "이메일 주소 입력"
  })

  user_email.addEventListener('blur', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.innerHTML = "이메일주소"
    if (e.target.value.length == 0) {
      ele.style.fontSize = "15px";
      ele.style.top = "18px";
    }

    if (chk_email() == true) {
      ele.style.color = null;
      e.target.style.borderColor = null;
    } else {
      ele.style.color = "red";
      e.target.style.borderColor = "red";
    }
  })

  //이름
  user_name.addEventListener('focus', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.style.color = null;
    e.target.style.borderColor = null;
    ele.style.fontSize = "12px";
    ele.style.top = "10px";
    ele.innerHTML = "이름 입력"
  })

  user_name.addEventListener('blur', (e) => {
    const ele = e.target.parentElement.querySelector('.placeholder');
    ele.innerHTML = "이름"
    if (e.target.value.length == 0) {
      ele.style.fontSize = "15px";
      ele.style.top = "18px";
    }

    if (chk_name() == true) {
      ele.style.color = null;
      e.target.style.borderColor = null;
    } else {
      ele.style.color = "red";
      e.target.style.borderColor = "red";
    }
  })


  //유효성 검사
  function chk_id() {
    const ele = document.querySelector('.signup_input[name=id]');
    const err_msg = ele.parentElement.parentElement.querySelector('.err_msg')
    if (ele.value.length == 0) {
      err_msg.innerHTML = '아이디를 입력해주세요';
    } else if (ele.value.length < 5 || ele.value.length > 10 || !id_patten.test(ele.value)) {
      err_msg.innerHTML = '5~10자의 영문 소문자와 숫자로만 입력해주세요';
    }
    else {
    	var ajax = new XMLHttpRequest();
    	let vaildation = false;
		ajax.onreadystatechange = function() {
			if (ajax.readyState === ajax.DONE) {
				if (ajax.status === 200 || ajax.status === 201) {
							if(ajax.responseText=='duplicate'){err_msg.innerHTML = '중복된 아이디 입니다.';}
							else{err_msg.innerHTML = null; vaildation = true;}							
				}
			};
		}
		ajax.open("POST",
				contextPath+"/id_check", false); //
		ajax.send(ele.value);

		return vaildation;		
	}
  }

  function chk_pw() {
    const ele = document.querySelector('.signup_input[name=pw]');
    const err_msg = ele.parentElement.parentElement.querySelector('.err_msg')
    if (ele.value.length == 0) {
      err_msg.innerHTML = '비밀번호를 입력해주세요';
    } else if (ele.value.length < 8 || ele.value.length > 15) {
      err_msg.innerHTML = '8자 이상 15자 이하 입력해주세요';
    } else {
      err_msg.innerHTML = null;
      return true;
    }
  }

  function chk_pwc() {
    const ele = document.querySelector('.signup_input[name=pwc]');
    const err_msg = ele.parentElement.parentElement.querySelector('.err_msg')
    if (ele.value.length == 0) {
      err_msg.innerHTML = '비밀번호를 재입력해주세요';
    } else if (ele.value != document.querySelector('.signup_input[name=pw]').value) {
      err_msg.innerHTML = '비밀번호가 일치하지 않습니다';
    } else {
      err_msg.innerHTML = null;
      return true;
    }
  }

  function chk_email() {
    const ele = document.querySelector('.signup_input[name=email]');
    const err_msg = ele.parentElement.parentElement.querySelector('.err_msg')
    if (ele.value.length == 0) {
      err_msg.innerHTML = '이메일을 입력해주세요';
    } else if (!email_patten.test(ele.value)) {
      err_msg.innerHTML = '올바른 이메일 형식이 아닙니다';
    } else {
      err_msg.innerHTML = null;
      return true;
    }
  }

  function chk_name() {
    const ele = document.querySelector('.signup_input[name=name]');
    const err_msg = ele.parentElement.parentElement.querySelector('.err_msg')
    if (ele.value.length == 0) {
      err_msg.innerHTML = '이름을 입력해주세요';
    } else if (!name_patten.test(ele.value) || ele.value.length < 2) {
      err_msg.innerHTML = '2글자 이상의 이름을 정확히 입력해 주세요';
    } else {
      err_msg.innerHTML = null;
      return true;
    }
  }

  signup_submit_btn.addEventListener('click', (e) => {
    user_id.focus();
    user_id.blur();
    user_pwc.focus();
    user_pwc.blur();
    user_email.focus();
    user_email.blur();
    user_name.focus();
    user_name.blur();

    if (chk_id() && chk_pw() && chk_pwc() && chk_email() && chk_name()) {
    	signup_frm.submit();
    }
  })
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>개인 정보 수정</title>
</head>
<body>
	<div class="from900">
		<div class="content_title">개인 정보 수정</div>
		<form action="" class="info_modification_frm">
			<table class="info_table blue_table">

				<tr class="user_id">
					<th>아이디</th>
					<input type="hidden" name=ucode
						value="${sessionScope.member.ucode }">
					<td>${sessionScope.member.id }</td>
				</tr>

				<tr class="user_name">
					<th>성명</th>
					<td><input type="text" name="user_name" autocomplete="off"
						value="${sessionScope.member.name }"></td>
				</tr>

				<tr class="user_address">
					<th>주소</th>
					<td>API 등록 예정</td>
				</tr>

				<tr class="user_email">
					<th>이메일</th>
					<input type="hidden" name="user_email"
						value="${sessionScope.member.email }">
					<td>
						<div>
							<input type="text" class="email1" autocomplete="off"> @ <input
								type="text" class="email2" autocomplete="off">
					</td>
				</tr>

				<tr class="user_ad">
					<th>이메일 수신</th>
					<td>
						<div>이벤트와 쇼핑에 대한 정보를 이메일로 받아보시겠습니까?</div> <input type="radio"
						name="user_ad" checked>예 <input type="radio"
						name="user_ad">아니요
					</td>
				</tr>

			</table>
		</form>

		<div class="main_btn_box">
			<input type="button" class="blue_btn submit_btn" value="회원정보 수정">
			<input type="button" class="white_btn cancel_btn" value="정보수정 취소">
			<input type="button" class="white_btn pw_modify_btn" value="비밀번호 변경">
		</div>
	</div>
</body>

<style>
.info_modification_frm input[type=text] {
	height: 30px;
	outline: none;
	border: 2px solid #c5c5c5;
	padding-left: 10px;
}

.info_modification_frm input[type=text]:focus {
	border: 2px solid #0077d9;
}

.info_modification_frm .user_email .email_modify_btn,
	.info_modification_frm .user_email .email_modify_btn2 {
	margin-left: 10px;
}

.info_modification_frm .user_tel .tel {
	box-sizing: border-box;
	height: 30px;
	outline: none;
	border: 2px solid #c5c5c5;
	width: 60px;
}
</style>

<script>
  const main_btn_box = document.querySelector('.main_btn_box');
  const info_modification_frm = document.querySelector('.info_modification_frm');

  // 정규식
  const name_patten = /^[가-힣]+$/
  const email_patten = /^[0-9a-z]+$/;
  const tel_patten = /^[0-9]+$/;

  main_btn_box.addEventListener('click', (e) => {
    // 정보 수정
    if (e.target.classList.contains('submit_btn')) {
      console.log(info_modification_frm)
      if (info_modification_frm.querySelector('input[name=user_name]').value.trim().length == 0) {
        alert('이름을 입력해주세요.')
        info_modification_frm.querySelector('input[name=user_name]').focus();
        return;
      }
      else if (!name_patten.test(info_modification_frm.querySelector('input[name=user_name]').value)) {
        alert('정확한 이름을 입력해주세요.')
        info_modification_frm.querySelector('input[name=user_name]').value = '';
        info_modification_frm.querySelector('input[name=user_name]').focus();
        return;
      }
      else if (info_modification_frm.querySelector('.email1').value.trim().length == 0 ||
        info_modification_frm.querySelector('.email2').value.trim().length == 0) {
        alert('이메일을 입력해주세요.')
        info_modification_frm.querySelector('.email1').value='';
        info_modification_frm.querySelector('.email2').value='';
        info_modification_frm.querySelector('.email1').focus();
        return;
      }
      else if (!email_patten.test(info_modification_frm.querySelector('.email1').value) ||
        !email_patten.test(info_modification_frm.querySelector('.email2').value)) {
        alert('정확한 이메일을 입력해주세요.')
        info_modification_frm.querySelector('.email1').value='';
        info_modification_frm.querySelector('.email2').value='';
        info_modification_frm.querySelector('.email1').focus();
        return;
      }
    }
    // 수정 취소
    if (e.target.classList.contains('cancel_btn')) {
      console.log('취소');
    }

    // 비밀번호 변경
    if (e.target.classList.contains('cancel_btn')) {
      console.log('비밀번호 변경');
    }
  })

  info_modification_frm.addEventListener('blur', (e) => {
    console.log(e.target)
  })
</script>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
var contextPath = "${pageContext.request.contextPath}"</script>
</head>
<body>
	<div class="from900">
		<div class="content_title">상품 등록</div>
		<form action="" class="product_registration_frm">
			<table class="info_table blue_table">
				<tr class="product_category">
					<th>카테고리</th>
					<td><select data="category_dep1" class="category_input">
							<option value="0">대분류</option>
							<c:forEach var="category" items="${requestScope.category }">
								<option value="${category.cate_num}">${category.cate_name }</option>
							</c:forEach>
					</select> <select data="category_dep2" class="category_input">
							<option value="0">중분류</option>
					</select></td>
				</tr>

				<tr class="product_name">
					<th>상품명</th>
					<td><input type="text" data="product_name"
						class="poduct_name_input" placeholder="최대 한글 25자 또는 영,숫자 50자">
					</td>
				</tr>

				<tr class="product_img">
					<th>대표 이미지</th>
					<td>
						<div class="product_image_box_wrap">
							<div class="product_image_box">
								<div class="product_image_btn1">
									<input type="file" class="img_insert_input" accept="image/*"
										style="display: none;">
									<p>600*600</p>
									<p>
										<span class="highlight_orange">[필수등록]</span>
									</p>
									<input type="button" class="img_insert_btn btn" value="등록">
								</div>

								<div class="product_image_btn2" style="display: none;">
									<input type="button" class="img_change_btn btn" value="변경">
									<input type="button" class="img_delete_btn btn" value="삭제">
								</div>
							</div>

							<div class="product_image_box">
								<div class="product_image_btn1">
									<input type="file" class="img_insert_input"
										style="display: none;">
									<p>600*600</p>
									<input type="button" class="img_insert_btn" value="등록">
								</div>

								<div class="product_image_btn2" style="display: none;">
									<input type="button" class="img_change_btn" value="변경">
									<input type="button" class="img_delete_btn" value="삭제">
								</div>
							</div>

							<div class="product_image_box">
								<div class="product_image_btn1">
									<input type="file" class="img_insert_input"
										style="display: none;">
									<p>600*600</p>
									<input type="button" class="img_insert_btn" value="등록">
								</div>

								<div class="product_image_btn2" style="display: none;">
									<input type="button" class="img_change_btn" value="변경">
									<input type="button" class="img_delete_btn" value="삭제">
								</div>
							</div>
						</div>
					</td>
				</tr>

				<tr class="product_price">
					<th>판매 가격</th>
					<td><input type="number" data="product_price"
						class="product_price_input" min="0"><span
						class="text_middle"> 원</span></td>
				</tr>

				<tr class="product_option">
					<th>판매 옵션</th>
					<td><label class="btn"> <input type="radio"
							name="product_option_btn" class="product_option_btn_f" value="f"
							checked><span class="text_middle">미사용</span>
					</label> <label class="btn"> <input type="radio"
							name="product_option_btn" class="product_option_btn_t" value="t"><span
							class="text_middle">사용</span>
					</label> <input type="button" class="option_management_btn btn"
						style="display: none" value="옵션 관리"></td>
				</tr>

				<tr class="product_quantity">
					<th>판매 수량</th>
					<td><input type="number" max="99999" min="0"
						data="product_quantity"
						class="product_quantity_input number_input">
						<p class="guide_msg">* 판매 옵션 사용시 입력 불가능</p>
						<p class="guide_msg">* 수량 = 0 ~ 99999</p></td>
				</tr>

				<tr class="product_description">
					<th>상품 설명</th>
					<td>
						<div class="product_description_input" contenteditable="true"
							contextmenu="true" data="product_description"></div>
					</td>
				</tr>
			</table>

			<div class="product_option_settingBox"
				style="display: none; margin-left: -100px">
				<div class="settingBox_top">
					<span class="step1_txt">1단계 옵션 템플릿</span> > <span class="step1_txt">2단계
						옵션 등록</span> > <span class="step1_txt">3단계 옵션 설정</span>
				</div>
				<div class="settingBox_step1 settingBox_content">
					<p style="margin: 10px;">원하는 템플릿을 선택하세요.</p>
					<input type="radio" name="option_type" value="A"> 선택형 <input
						type="radio" name="option_type" value="B"> 2개 조합선택형
					<div class="step1_bottom settingBox_bottom">
						<input type="button" value="2단계로 이동 >"
							class="next_step blue_btn step1_to_step2">
					</div>
				</div>

				<div class="settingBox_step2  settingBox_content"
					style="display: none;"></div>
				<div class="settingBox_step3 settingBox_content"
					style="display: none;"></div>
			</div>
		</form>

		<div class="main_btn_box">
			<input type="button" class="blue_btn registration_btn" value="등록">
			<input type="button" class="white_btn cancel_btn" value="취소">
		</div>
	</div>
</body>

<script>
  // 전체 범위
  document.addEventListener('keydown', (e) => {
    if (e.target.classList.contains('number_input')) {
      console.log(e.target.keyCode);
      if (!((e.keyCode > 95 && e.keyCode < 106) || (e.keyCode > 47 && e.keyCode < 58) || e.keyCode == 8)) {
        e.preventDefault();
      }
    }
  })

  const info_table = document.querySelector('.info_table ');
  // 서브 카테고리 불러오기
  const category_dep1 = document.querySelector('[data=category_dep1]');
  const category_dep2 = document.querySelector('[data=category_dep2]');

  category_dep1.addEventListener('change', (e) => {
	  console.log('카테고리 변경')
	  
	  console.log(category_dep1.value);
	  var ajax = new XMLHttpRequest();		  
			ajax.onreadystatechange = function(e) {
				if (ajax.readyState === ajax.DONE) {
					if (ajax.status === 200 || ajax.status === 201) {						
						const jsonObj = JSON.parse(e.target.response);
						category_dep2.innerHTML = '';
						
						jsonObj.forEach((e)=>{
							const option = document.createElement('option')
							option.value = e.cate_num;
							option.innerHTML = e.cate_name;
							category_dep2.append(option);
							})
				};
			}}

	  ajax.open("POST", contextPath + "/seller/seachSubCategory", false);	
	  ajax.send(category_dep1.value);
	  
	  })

  // 옵션 관리 박스
  const product_option_settingBox = document.querySelector('.product_option_settingBox');
  const settingBox_step1 = document.querySelector('.settingBox_step1');
  const settingBox_step2 = document.querySelector('.settingBox_step2');
  const settingBox_step3 = document.querySelector('.settingBox_step3');


  info_table.addEventListener('click', (e) => {
    if (e.target.classList.contains('img_insert_btn')) {
      e.target.closest('.product_image_box').querySelector('.img_insert_input').click();
    }

    if (e.target.classList.contains('img_change_btn')) {
      e.target.closest('.product_image_box').querySelector('.img_insert_input').click();
    }

    if (e.target.classList.contains('img_delete_btn')) {
      e.target.closest('.product_image_box').querySelector('.added_image_box').remove();
      e.target.closest('.product_image_box').querySelector('.product_image_btn2').style.display = 'none';
    }

    if (e.target.classList.contains('product_option_btn_f')) {
      if (settingBox_step2.querySelector('.option_table_deletion_point')) {
        settingBox_step2.querySelector('.option_table_deletion_point').remove()
      }
      if (settingBox_step3.querySelector('.option_table_deletion_point')) {
        settingBox_step3.querySelector('.option_table_deletion_point').remove();
      }

      settingBox_step2.style.display = "none";
      settingBox_step3.style.display = "none";
      settingBox_step1.style.display = null;

      e.target.closest('.product_option').querySelector('.option_management_btn').style.display = 'none';

      product_option_settingBox.style.display = "none";
    }

    if (e.target.classList.contains('product_option_btn_t')) {
      product_option_settingBox.style.display = null;
      e.target.closest('.product_option').querySelector('.option_management_btn').style.display = null;
    }

    if (e.target.classList.contains('option_management_btn')) {
        product_option_settingBox.style.display = null;
    }
  })

  info_table.addEventListener('change', (e) => {
    if (e.target.classList.contains('img_insert_input')) {
      const image_box = e.target.closest('.product_image_box');

      if (image_box.querySelector('.added_image_box')) {
        image_box.querySelector('.added_image_box').remove();
      }

      const added_image_box = document.createElement('img');
      
      added_image_box.classList.add('added_image_box');
      added_image_box.src = window.URL.createObjectURL(e.target.files[0]);
      image_box.querySelector('.product_image_btn2').style.display = null;
      image_box.append(added_image_box);
    }

    if (e.target.classList.contains('product_price_input')) {
      if (e.target.value < 0) e.target.value = 0;
    }

    if (e.target.classList.contains('product_quantity_input')) {
      if (e.target.value < 0) e.target.value = 0;
      if (e.target.value > 99999) e.target.value = 99999;
    }
  })


  // 옵션 관리 박스
  product_option_settingBox.addEventListener('click', (e) => {
    // step1에서 step2로 이동
    if (e.target.classList.contains('step1_to_step2')) {
      if (document.querySelector('[name=option_type]:checked')) {
        const option_type = document.querySelector('[name=option_type]:checked').value;
        settingBox_step1.style.display = 'none';
        if (option_type == 'A') {
          const txt = document.createElement('div');
          txt.classList.add('option_table_deletion_point');
          txt.innerHTML = '<p class="step_title">선택형</p> <input type="hidden" name="option_type" value="A"> <table class="option_table"> <colgroup> <col width="30%"> <col width="60"> <col width="10%"> </colgroup> <thead> <tr> <th> 옵션명 </th> <th> 옵션값 </th> <th> </th> </tr> </thead> <tbody class="step2_addition_point"> <tr class="step2_deletion_point"> <td><input type="text" class="step2_input option_dep1_name" placeholder="옵션명 입력  ex) 사이즈"></td> <td><input type="text" class="step2_input option_dep1_value" placeholder="옵션값 입력  ex) 빨강, 파랑, 검정"></td> <td><a href=""><i class="step2_plus_btn far fa-plus-square"></i></a><a href=""> <i class="step2_minus_btn  far fa-minus-square"></i></a> </td> </tr> </tbody> </table> <div class="step2_bottom settingBox_bottom"> <input type="button" value="< 1단계로 이동" class="prev_step white_btn step2_to_step1"> <input type="button" value="3단계로 이동 >" class="next_step blue_btn step2_to_step3"> </div>'
          settingBox_step2.style.display = null;
          settingBox_step2.prepend(txt);
        } else if (option_type == 'B') {
          const txt = document.createElement('div');
          txt.classList.add('option_table_deletion_point');
          txt.innerHTML = '<p class="step_title">2개 조합선택형</p> <input type="hidden" name="option_type" value="B"> <table class="option_table"> <colgroup> <col width="50%"> <col width="50%"> </colgroup> <thead> <tr> <th> 첫 번째 옵션 </th> <th> 두 번째 옵션 </th> </tr> </thead> <tbody> <tr> <td><input type="text" class="step2_input option_dep1_name" placeholder="첫 번째 옵션명 입력  ex) 사이즈"></td> <td><input type="text" class="step2_input option_dep2_name" placeholder="두 번째 옵션명 입력  ex) 컬러"></td> </tr> <tr> <td><input type="text" class="step2_input option_dep1_value" placeholder="첫 번째 옵션값 입력  ex) L, M, S"></td> <td><input type="text" class="step2_input option_dep2_value" placeholder="두 번째 옵션값 입력  ex) 빨강, 파랑, 검정"></td> </tr> </tbody> </table> <div class="step2_bottom settingBox_bottom"> <input type="button" value="< 1단계로 이동" class="prev_step white_btn step2_to_step1"> <input type="button" value="3단계로 이동 >" class="next_step blue_btn step2_to_step3"> </div>'
          settingBox_step2.style.display = null;
          settingBox_step2.prepend(txt);
        }
      }
      else {
        alert("옵션 템플릿을 선택해주세요.")
      }
    }

    // step2에서 step1로 이동
    if (e.target.classList.contains('step2_to_step1')) {
      const del_point = settingBox_step2.querySelector('.option_table_deletion_point');
      del_point.remove();
      settingBox_step2.style.display = 'none';
      settingBox_step1.style.display = null;
    }

    // step2에서 step3로 이동
    if (e.target.classList.contains('step2_to_step3')) {
      const option_type = settingBox_step2.querySelector('[name=option_type]').value
      const txt = document.createElement('div');
      txt.classList.add('option_table_deletion_point');
      let validity = true;
      let txt2 = '';
      let op_group_cnt = 1;
      let op_num_cnt = 1;

      if (option_type == 'A') {
        const option_dep1_names = settingBox_step2.querySelectorAll('.option_dep1_name');
        const option_dep1_values = settingBox_step2.querySelectorAll('.option_dep1_value');

        option_dep1_names.forEach((e, index) => {
          const dep1_name = e.value.trim();
          if(validity == false){
            return;
          }
          else if ((dep1_name.length == 0 || option_dep1_values[index].value.trim().length == 0)) {
            alert('옵션명과 옵션값을 모두 입력해주세요.')
            validity = false;
          }
          else {
            const dep1_values = option_dep1_values[index].value.split(',');
            dep1_values.forEach((dep1_value) => {
              if (dep1_value.length == 0) return;
              txt2 += '<tr class="step3_deletion_point"> <input type="hidden" class="op_group" data="op_group" value="' + op_group_cnt + '"> <td class="op_num">' + op_num_cnt + '</td> <td class="op_ck"><input type="checkbox" class="step3_option_ck"></td> <td class="op_dep1"  data="op_dep1_name">' + dep1_name + '</td> <td class="op_dep1" data="op_dep1_value">' + dep1_value + '</td> <td class="op_add_price"><input type="number" class="step3_input number_input" data="op__add_price" value="0"></td> <td class="state"><select data="op_state" class="step3_input"> <option value="판매가능">판매가능</option> <option value="품절">품절</option> </select></td> <td class="op_quantity"><input type="number" class="step3_input step3_quantity_input number_input" data="op_quantity" value="1" max="99999" min="0"></td> </tr>';
              op_num_cnt++;
            })
            txt.innerHTML = '<p class="step_title">선택형</p> <input type="hidden" name="option_type" value="A"> <table class="option_table"> <colgroup> <col width="5%"> <col width="5%"> <col width="20%"> <col width="20%"> <col width="15%"> <col width="15%"> <col width="15%"> </colgroup> <thead> <tr> <th>No.</th> <th><input type="checkbox" class="step3_option_all_ck"></th> <th>옵션명</th> <th>옵션값</th> <th>추가 금액</th> <th>판매 상태</th> <th>판매 수량</th> </tr> </thead> <tbody>' + txt2 + '</tbody> <tfoot> <tr> <td colspan="7"> <input type="button" class="blue_btn_mini text_bold step3_option_del_btn" value="선택 삭제"> <div class="step3_total_quantity_wrap"> <span class="text_middle text_bold">일괄 판매 수량 : </span> <input type="number" class="step3_total_quantity_input number_input" value="1" max="99999" min="0"> </div> </td> </tr> </tfoot> </table> <div class="step1_bottom settingBox_bottom"> <input type="button" value="< 1단계로 이동" class="prev_step white_btn step3_to_step1"> <input type="button" value="< 2단계로 이동" class="prev_step white_btn step3_to_step2"> <input type="button" value="적용하기" class="prev_step blue_btn option_save_btn"></div>';
            settingBox_step3.prepend(txt);
          }
          op_group_cnt++;
        })
      }

      else if (option_type == 'B') {
        const option_dep1_name = settingBox_step2.querySelector('.option_dep1_name').value.trim();
        const option_dep1_values = settingBox_step2.querySelector('.option_dep1_value').value.trim();
        const option_dep2_name = settingBox_step2.querySelector('.option_dep2_name').value.trim();
        const option_dep2_values = settingBox_step2.querySelector('.option_dep2_value').value.trim();

        if (option_dep1_name.length == 0 || option_dep1_values.length == 0 || option_dep2_name.length == 0 || option_dep2_values.length == 0) {
          alert('옵션명과 옵션값을 모두 입력해주세요.')
          return validity = false;
        } else {
          const dep1_values = option_dep1_values.split(',');
          const dep2_values = option_dep2_values.split(',');
          dep1_values.forEach((dep1_value) => {
            if (dep1_value.length == 0) return;
            dep2_values.forEach((dep2_value) => {
              if (dep2_value.length == 0) return;
              txt2 += '<tr class="step3_deletion_point"> <input type="hidden" class="op_group" data="op_group"  value="' + op_group_cnt + '"> <td class="op_num">' + op_num_cnt + '</td> <td class="op_ck"><input type="checkbox" name="" class="step3_option_ck"></td> <td class="op_dep1" data="op_dep1_value">' + dep1_value + '</td> <td class="op_dep2" data="op_dep2_value">' + dep2_value + '</td> <td class="op_add_price"><input type="number" class="step3_input number_input" data="op__add_price" value="0"></td> <td class="state"><select data="op_state" class="step3_input"> <option value="판매가능">판매가능</option> <option value="품절">품절</option> </select></td> <td class="op_quantity"><input type="number" data="op_quantity" class="step3_input step3_quantity_input number_input" value="1" max="99999" min="0"></td> </tr>'
              op_num_cnt++;
            })
            txt.innerHTML = '<p class="step_title">2개 조합선택형</p> <input type="hidden" name="option_type" value="B"> <table class="option_table"> <colgroup> <col width="5%"> <col width="5%"> <col width="20%"> <col width="20%"> <col width="15%"> <col width="15%"> <col width="15%"> </colgroup> <thead> <tr> <th>No.</th> <th><input type="checkbox" step3_option_all_ck></th> <th> <span data="op_dep1_name">' + option_dep1_name + '</span> </th> <th> <span data="op_dep2_name">' + option_dep2_name + '</span> </th> <th>추가 금액</th> <th>판매 상태</th> <th>판매 수량</th> </tr> </thead> <tbody>' + txt2 + '</tbody> <tfoot> <tr> <td colspan="7"> <input type="button" class="blue_btn_mini text_bold step3_option_del_btn" value="선택 삭제"> <div class="step3_total_quantity_wrap"> <span class="text_middle text_bold">일괄 판매 수량 : </span> <input type="number" class="step3_total_quantity_input number_input" value="1" max="99999" min="0"> </div> </td> </tr> </tfoot> </table> <div class="step1_bottom settingBox_bottom"> <input type="button" value="< 1단계로 이동" class="prev_step white_btn step3_to_step1"> <input type="button" value="< 2단계로 이동" class="prev_step white_btn step3_to_step2"> <input type="button" value="적용하기" class="prev_step blue_btn option_save_btn"> </div>';
            settingBox_step3.prepend(txt);
          })
        }
      }
      if (validity == true) {
        settingBox_step2.style.display = 'none';
        settingBox_step3.style.display = null;
      }
    }

    // step3에서 step1로 이동
    if (e.target.classList.contains('step3_to_step1')) {
      const del_point = settingBox_step2.querySelector('.option_table_deletion_point');
      del_point.remove();
      const del_point2 = settingBox_step3.querySelector('.option_table_deletion_point');
      del_point2.remove();
      settingBox_step3.style.display = 'none';
      settingBox_step1.style.display = null;
    }

    // step3에서 step2로 이동
    if (e.target.classList.contains('step3_to_step2')) {
      const del_point = settingBox_step3.querySelector('.option_table_deletion_point');
      del_point.remove();
      settingBox_step3.style.display = 'none';
      settingBox_step2.style.display = null;
    }

    // 적용하기
    if (e.target.classList.contains('option_save_btn')) {
      product_option_settingBox.style.display='none';      
    }
  })

  //  step2 버튼 이벤트
  settingBox_step2.addEventListener('click', (e) => {
    if (e.target.classList.contains('step2_plus_btn')) {
      e.preventDefault();
      const txt = document.createElement('tr');
      txt.classList.add('step2_deletion_point');
      txt.innerHTML = '<td><input type="text" class="step2_input option_dep1_name" placeholder="옵션명 입력  ex) 사이즈"></td> <td><input type="text" class="step2_input option_dep1_value" placeholder="옵션값 입력  ex) 빨강, 파랑, 검정"></td> <td><a href=""><i class="step2_plus_btn far fa-plus-square"></i></a><a href=""> <i class="step2_minus_btn  far fa-minus-square"></i></a> </td>'
      e.target.closest('.step2_addition_point').append(txt);
    }

    if (e.target.classList.contains('step2_minus_btn')) {
      e.preventDefault();
      if (e.target.closest('.step2_addition_point').childElementCount == 1) {
        alert('삭제할 수 없습니다.')
      } else {
        e.target.closest('.step2_deletion_point').remove();
      }
    }
  })

  // step3 버튼 이벤트
  settingBox_step3.addEventListener('click', (e) => {
    if (e.target.classList.contains('step3_option_del_btn')) {
      const check_box = document.querySelectorAll('.step3_option_ck');
      check_box.forEach((check_box) => {
        if (check_box.checked == true) {
          check_box.closest('.step3_deletion_point').remove();
        }
      })
    }

    if (e.target.classList.contains('step3_option_all_ck')) {
      const check_box = document.querySelectorAll('.step3_option_ck');
      console.log(e.target.checked);
      check_box.forEach((check_box) => {
        check_box.checked = e.target.checked
      })
    }
  })

  settingBox_step3.addEventListener('change', (e) => {
    if (e.target.classList.contains('step3_quantity_input') || e.target.classList.contains('step3_total_quantity_input')) {
      if (e.target.value < 0) e.target.value = 0
      else if (e.target.value > 99999) e.target.value = 99999;
    }

    if (e.target.classList.contains('step3_total_quantity_input')) {
      const quantities = document.querySelectorAll('[data=op_quantity');
      quantities.forEach((op_quantity) => {
        op_quantity.value = e.target.value;
      })
    }
  })

  /* 저장 취소 버튼 */
  const registration_btn = document.querySelector('.registration_btn');
  const cancel_btn = document.querySelector('.cancel_btn');

  registration_btn.addEventListener('click', (e) => {
	  if(document.querySelector('[data=category_dep1]').value == 0){
		  alert('카테고리를 선택해주세요.');}  
	  else if(document.querySelector('[data=category_dep2]').value == 0){
		  alert('카테고리를 선택해주세요.')}
	  else if(document.querySelector('[data=product_name]').value.trim().length == 0){
		  alert('상품 이름을 입력해 주세요.');}
	  else if(document.querySelector('[data=product_price]').value.trim().length == 0){
		  alert('상품 가격을 입력해 주세요.');}
	  else if(document.querySelector('[data=product_quantity]').value.trim().length == 0){
		  alert('상품 수량을 입력해 주세요.');}
	  else if(document.querySelector('[data=product_description]').innerHTML.trim().length == 0){
		  alert('상품 설명을 입력해 주세요.');}		  		
	  else if(document.querySelector('.img_insert_input').value==""){
		  alert('상품 이미지를 하나 이상 등록해 주세요.')}  
	  else{
		  const ProductVO = new Object;
		  const Options = new Array;
		  const thumbs = document.querySelectorAll('.img_insert_input');
		  
		  ProductVO.prod_dep1 = document.querySelector('[data=category_dep1]').value;
		  ProductVO.prod_dep2 = document.querySelector('[data=category_dep2]').value;
		  ProductVO.prod_name = document.querySelector('[data=product_name]').value;
		  ProductVO.prod_price = document.querySelector('[data=product_price]').value;
		  ProductVO.prod_quantity = document.querySelector('[data=product_quantity]').value;
		  ProductVO.prod_description = document.querySelector('[data=product_description]').innerHTML;

		  thumbs.forEach((e,i)=>{
				if(e.value != ''){
					 const formData = new FormData();
                     formData.append("file", e.files[0]); 
					 const ajax = new XMLHttpRequest();
				      ajax.onreadystatechange = function () {
				          if (ajax.readyState === ajax.DONE) {
				              if (ajax.status === 200   || ajax.status === 201) {
					              if(i==0){
					            	  ProductVO.prod_thumb0 = ajax.responseText;
						              } else if(i==1){
						            	  ProductVO.prod_thumb1 = ajax.responseText;
							              } else if(i==2){
							            	  ProductVO.prod_thumb2 = ajax.responseText;
								              }				            	   
				              } else {
				                  console.error(ajax.responseText);
				              }
				          }               
				      }
				      ajax.open(
				              "POST",   "${pageContext.request.contextPath}/seller/setImg", false); //
				      ajax.send(formData);
					}
			  })
		  
	     
		  
		  if(document.querySelector('[name=product_option_btn]:checked').value == 'f'){
			  ProductVO.prod_option = 'f'
			  }		  
		  else if (document.querySelector('[name=product_option_btn]:checked').value == 't'){
				  ProductVO.prod_option = document.querySelector('[name=option_type]:checked').value
				
				  const options_data = document.querySelectorAll('.step3_deletion_point');
				  options_data.forEach((e)=>{
					  const OptionVO = new Object;
					  OptionVO.op_dep1_name = document.querySelector('.option_dep1_name').value;
					  OptionVO.op_dep1_value = e.querySelector('td[data=op_dep1_value]').innerHTML;
					  OptionVO.op_add_price = e.querySelector('input[data=op__add_price]').value;
					  OptionVO.op_state = e.querySelector('[data=op_state]').value;
					  OptionVO.op_quantity = e.querySelector('input[data=op_quantity]').value;
					  if(document.querySelector('.option_dep2_name')){
						  OptionVO.op_dep2_name = document.querySelector('.option_dep2_name').value
						  OptionVO.op_dep2_value = e.querySelector('td[data=op_dep2_value]').innerHTML;
						  }
					  Options.push(OptionVO);
				  })
		  }

		  ProductVO.optionVO = Options
		
		  var ajax = new XMLHttpRequest();		  
			ajax.onreadystatechange = function(e) {
				if (ajax.readyState === ajax.DONE) {
					if (ajax.status === 200 || ajax.status === 201) {							
					console.log(ajax.responseText)
				};
			}}

			const result = JSON.stringify({
				prod_dep1 : ProductVO.prod_dep1,
				prod_dep2 : ProductVO.prod_dep2,
				prod_name : ProductVO.prod_name,
				prod_price : ProductVO.prod_price,
				prod_quantity : ProductVO.prod_quantity,
				prod_description : ProductVO.prod_description,
				prod_option : ProductVO.prod_option,
				prod_thumb0 : ProductVO.prod_thumb0,
				prod_thumb1 : ProductVO.prod_thumb1,
				prod_thumb2 : ProductVO.prod_thumb2,
				optionVO : ProductVO.optionVO
			});			
			
			console.log(result);
			
			ajax.open("POST", contextPath+"/seller/registration", false);
			ajax.setRequestHeader("Content-Type", "application/json;charset=utf-8");			
			ajax.send(result);		
		  }
	  })  
</script>

<style>
.product_registration_frm .info_table td input,
	.product_registration_frm .info_table td select {
	border: 2px #c5c5c5 solid;
	padding-left: 5px;
	height: 30px;
	font-weight: bold;
}

.product_registration_frm .info_table .product_category td .category_input
	{
	width: 170px;
	margin-right: 5px;
}

.product_registration_frm .info_table .product_name td .poduct_name_input
	{
	width: 520px;
	margin-right: 5px;
}

.product_registration_frm .info_table .product_price td .product_price_input
	{
	width: 170px;
}

.product_registration_frm .info_table .product_quantity td .product_quantity_input
	{
	width: 170px;
}

.product_registration_frm .info_table .product_option td .option_management_btn
	{
	margin-left: 20px;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap
	{
	display: flex;
	justify-content: space-between;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box
	{
	position: relative;
	width: 200px;
	height: 200px;
	box-sizing: border-box;
	border: 1px #c5c5c5 solid;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box .added_image_box
	{
	background-color: white;
	width: 198px;
	height: 198px;
	position: absolute;
	top: 0;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box:hover
	{
	width: 200px;
	height: 200px;
	border: 1px solid orange;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box .product_image_btn1
	{
	cursor: pointer;
	margin-top: 80px;
	text-align: center;
	font-size: 12px;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box .product_image_btn2
	{
	cursor: pointer;
	position: absolute;
	bottom: 0;
	right: 0;
	z-index: 5;
	opacity: 0.8;
}

.product_registration_frm .info_table .product_img .product_image_box_wrap .product_image_box .img_insert_btn
	{
	position: absolute;
	top: 150px;
	left: 77px;
}

.product_registration_frm .info_table .product_description td .product_description_input
	{
	overflow-x: scroll;
	margin: auto;
	width: 600px;
	min-height: 800px;
	border: 2px solid #c5c5c5;
	box-sizing: border-box;
	outline: none;
}

.product_option_settingBox {
	width: 1000px;
	position: absolute;
	top: 700px;
	border: 1px #c5c5c5 solid;
	border-radius: 4px;
	background-color: white;
	z-index: 10px;
	margin-letf: -100px;
}

.product_option_settingBox .settingBox_top {
	height: 50px;
	font-size: 24px;
	font-weight: bold;
	padding: 10px;
	border-bottom: 1px #c5c5c5 solid;
	line-height: 50px;
}

.product_option_settingBox .settingBox_content {
	padding: 10px;
}

.product_option_settingBox .settingBox_bottom {
	text-align: center;
	padding-top: 30px;
	padding-bottom: 20px;
}

.product_option_settingBox .settingBox_bottom .option_save {
	float: right;
	margin-right: 40px;
}

.product_option_settingBox .option_table {
	border-radius: 4px;
	border-collapse: collapse;
	width: 900px;
	margin: auto;
}

.product_option_settingBox .option_table td, .product_option_settingBox .option_table th
	{
	border: 1px #c5c5c5 solid;
	padding: 5px 5px;
	box-sizing: border-box;
}

.product_option_settingBox .option_table thead>tr {
	background-color: #1F8CE6;
	color: white;
	height: 2em;
}

.product_option_settingBox .option_table tbody {
	text-align: center;
}

.product_option_settingBox .step_title {
	font-size: 20px;
	font-weight: bold;
	padding: 20px;
	color: orange;
}

.product_option_settingBox .settingBox_step2 .fa-plus-square,
	.product_option_settingBox .settingBox_step2 .fa-minus-square {
	font-size: 20px;
	padding-top: 3px;
	box-sizing: border-box;
}

.product_option_settingBox .settingBox_step2 .step2_deletion_point td .fa-plus-square
	{
	display: none;
}

.product_option_settingBox .settingBox_step2 .step2_deletion_point:first-child td .fa-plus-square
	{
	display: inline-block;
}

.product_option_settingBox .settingBox_step2 .step2_input,
	.product_option_settingBox .settingBox_step3 .step3_input {
	width: 100%;
	height: 2em;
	box-sizing: border-box;
}

.product_option_settingBox .settingBox_step3 .step3_total_quantity_wrap
	{
	float: right;
}

.product_option_settingBox .settingBox_step3 .option_table tbody .op_dep1,
	.product_option_settingBox .settingBox_step3 .option_table tbody .op_dep2
	{
	text-align: left;
	padding-left: 5px;
}
</style>

</html>
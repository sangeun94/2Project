<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/patient_list.jsp"%>
<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page import="java.util.List"%>

<!--pop-->
<div class="pop_wrap">
	<div class="pop_ct large">
		<h3></h3>
		<div class="tabArea">
			<ul class="tab">
				<li style="width: 100%"><a href="#tab_sub1" class="on">신규 등록</a></li>
			</ul>

			<!-- 신규 등록 탭 -->
			<div id="tab_sub1">
				<table class="viewTable">
					<colgroup>
						<col width="220px" />
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<form id="addPatientForm" action="addPatient_proc.jsp" method="post">
							<tr>
								<td rowspan="5">
									<p class="pic_area">
										<span id="idPic"></span>
									</p>
								</td>
								<th>환자번호</th>
								<td><%= PatientInfoList != null ? PatientInfoList.size()+1 : 1 %></td>
								<th><label for="input_name">이름</label></th>
								<td><input type="text" id="input_name" name="name" autocomplete="off" class="txt"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td></td>
								<th><label for="input_jumin">주민등록번호</label></th>
								<td><input type="text" id="input_jumin" name="jumin"
									autocomplete="off" class="txt" maxlength="14" oninput="autoHyphenJumin(this)"></td>
							</tr>
							<tr>
								<th><label for="input_phone_number">휴대전화번호</label></th>
								<td><input type="tel" id="input_phone_number"
									name="phone_number" autocomplete="off" class="txt" maxlength="13"
									oninput="autoHyphen(this)"></td>
								<th><label for="input_email">이메일주소</label></th>
								<td></td>
							</tr>
							<tr>
								<th><label for="input_id">회원아이디</label></th>
								<td></td>
								<th><label>주소</label></th>
								<td><select name="address">
										<option value="서울특별시">서울특별시</option>
										<option value="부산광역시">부산광역시</option>
										<option value="대구광역시">대구광역시</option>
										<option value="인천광역시">인천광역시</option>
										<option value="광주광역시">광주광역시</option>
										<option value="대전광역시">대전광역시</option>
										<option value="울산광역시">울산광역시</option>
										<option value="세종특별자치시">세종특별자치시</option>
										<option value="경기도">경기도</option>
										<option value="강원특별자치도">강원특별자치도</option>
										<option value="충청북도">충청북도</option>
										<option value="충청남도">충청남도</option>
										<option value="전라북도">전라북도</option>
										<option value="전라남도">전라남도</option>
										<option value="경상북도">경상북도</option>
										<option value="경상남도">경상남도</option>
								</select></td>
							</tr>
					</tbody>
				</table>
				<p class="btn_c">
					<button type=submit" class="gray">등록하기</button>
				</p>
				</form>
			</div>
			<button class="pop_close">닫기</button>
		</div>
	</div>
	<!--// pop-->




<script>
	
	/* 이름 유효성 검사  */
	let input_name = document.getElementById('input_name');
	let timeoutId;
	
	input_name.addEventListener('input', function () {
	    clearTimeout(timeoutId);
	    timeoutId = setTimeout(function () {
	        validateName(input_name);
	    }, 500); // 500ms 딜레이 후에 검사 수행
	});
	
	function validateName(input) {
	    // 한글만 허용하는 정규 표현식
	    var pattern = /^[가-힣]*$/;
	
	    if (!pattern.test(input.value)) {
	        alert('이름은 한글만 입력 가능합니다.');
	        input.value = input.value.replace(/[^가-힣]/g, '');
	        input.focus();
	    }
	}


	
	/* 주민등록번호 자동 하이픈 */
	const autoHyphenJumin = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,6})(\d{0,7})$/g, "$1-$2").replace(/(\-{1})$/g, "");
	}

	/* 휴대전화번호 자동 하이픈 */
	const autoHyphen = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
		}
	
	
	/* 이메일 유효성 검사  */
	
	let input_email = document.getElementById('input_email');
	
	input_email.addEventListener('change',(e)=>{ 
	    validEmail(e.target)
	})
	
	function validEmail(obj){
	    if(validEmailCheck(obj)==false){
	        alert('올바른 이메일 주소를 입력해주세요.')
	        obj.value='';
	        obj.focus();
	        return false;
	    }
	}

	function validEmailCheck(obj){
	    var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    return (obj.value.match(pattern)!=null)
	}
	
	
	/* 회원아이디 유효성 검사  */
	let input_id = document.getElementById('input_id');

	input_id.addEventListener('input', function () {
	    validateUserId(this);
	});

	function validateUserId(input) {
	    // 영문과 숫자만 허용하는 정규 표현식
	    var pattern = /^[a-zA-Z0-9]*$/;

	    if (!pattern.test(input.value)) {
	        alert('회원아이디는 영문과 숫자만 입력 가능합니다.');
	        input.value = input.value.replace(/[^a-zA-Z0-9]/g, '');
	        input.focus();
	    }
	}

	
	
	/* 등록 폼 유효성 검사 */
	document.getElementById('addPatientForm').addEventListener('submit', ()=> {
			
			let input_name = document.getElementById('input_name');
			let input_jumin = document.getElementById('input_jumin');
			let input_phone_number = document.getElementById('input_phone_number');
			
			if(input_name.value.trim() == ''){
				alert('이름은 필수 입력 항목입니다.');
				input_name.focus();
				event.preventDefault(); //제출 방지
				return;
			}
			
			if(input_jumin.value.trim() == ''){
				alert('주민등록번호는 필수 입력 항목입니다.');
				input_jumin.focus();
				event.preventDefault();
				return;
			}
			
			if (input_jumin.value.length !== 14) {
		        alert('주민등록번호는 13자리로 입력해주세요.');
		        input_jumin.focus();
		        event.preventDefault();
				return;
	        }
			
			
			if (input_jumin.value.length === 14) {
                const eighthDigit = input_jumin.value.charAt(7); // 8번째 자리 추출
                if (!['1', '2', '3', '4'].includes(eighthDigit)) {
                    alert('올바른 주민등록번호를 입력해주세요.');
                    input_jumin.focus();
                    event.preventDefault();
    				return;
             }}
			
			
			if(input_phone_number.value.trim() == ''){
				alert('휴대전화번호는 필수 입력 항목입니다.');
				input_phone_number.focus();
				event.preventDefault();
				return;
			}
			
			
			if (input_phone_number.value.length !== 13) {
		        alert('올바른 휴대전화번호를 입력해주세요.');
		        input_jumin.focus();
		        event.preventDefault();
				return;
	        }
		
	});

  </script>
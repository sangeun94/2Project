<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_employee/employee_list.jsp"%>
<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page import="java.util.List"%>

<!--pop-->
<div class="pop_wrap">
	<div class="pop_ct large">
		<h3></h3>
		<div class="tabArea">
			<ul class="tab">
				<li style="width: 100%"><a href="#tab_sub1" class="on">신규
						직원 등록</a></li>
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
						<!-- 직원코드, 재직여부, 이름, 성별, 휴대전화번호, 주소, 이메일, 직급, 과번호 -->
						<form id="addEmployeeForm" action="addEmployee_proc.jsp"
							method="post">
							<tr>
								<td rowspan="5">
									<p class="pic_area">
										<span id="idPic"></span>
									</p>
								</td>
								<th><label for="input_employee_code">구분</label></th>
								<td>
									<div id="employee_code_radio_group">
										<input type="radio" id="employee_code_1"
											name="employee_number" value="1"
											onclick="showDepartmentOptions('의사')">의사 <input
											type="radio" id="employee_code_2" name="employee_number"
											value="2" onclick="showDepartmentOptions('간호사')">간호사
										<input type="radio" id="employee_code_3"
											name="employee_number" value="3"
											onclick="showDepartmentOptions('행정')">행정
									</div>
								</td>
								<th><label for="input_department_name">진료과</label></th>
								<td><select name="department_name" id="department_select"
									style="display: none;">
										<option class="option" value="가정의학과">가정의학과</option>
										<option class="option" value="국제진료과">국제진료과</option>
										<option class="option" value="마취통증의학과">마취통증의학과</option>
										<option class="option" value="병리과">병리과</option>
										<option class="option" value="비뇨의학과">비뇨의학과</option>
										<option class="option" value="산부인과">산부인과</option>
										<option class="option" value="성형외과">성형외과</option>
										<option class="option" value="신경과">신경과</option>
										<option class="option" value="신경외과">신경외과</option>
										<option class="option" value="영상의학과">영상의학과</option>
										<option class="option" value="응급의학과">응급의학과</option>
										<option class="option" value="이비인후과">이비인후과</option>
										<option class="option" value="임상약리학과">임상약리학과</option>
										<option class="option" value="정신건강의학과">정신건강의학과</option>
										<option class="option" value="정형외과">정형외과</option>
										<option class="option" value="직업환경의학과">직업환경의학과</option>
										<option class="option" value="진단검사의학과">진단검사의학과</option>
										<option class="option" value="피부과">피부과</option>
										<option class="option" value="핵의학과">핵의학과</option>
										<option class="option" value="흉부외과">흉부외과</option>
										<optgroup label="내과" class="option">
											<option class="option" value="감염내과">감염내과</option>
											<option class="option" value="내분비내과">내분비내과</option>
											<option class="option" value="노년내과">노년내과</option>
											<option class="option" value="류마티스내과">류마티스내과</option>
											<option class="option" value="소화기내과">소화기내과</option>
											<option class="option" value="신장내과">신장내과</option>
											<option class="option" value="알레르기내과">알레르기내과</option>
											<option class="option" value="통합내과">통합내과</option>
											<option class="option" value="혈액내과">혈액내과</option>
											<option class="option" value="호흡기내과">호흡기내과</option>
										</optgroup>
										<optgroup class="option" label="외과">
											<option class="option" value="간담췌외과">간담췌외과</option>
											<option class="option" value="갑상선내분비외과">갑상선내분비외과</option>
											<option class="option" value="대장항문외과">대장항문외과</option>
											<option class="option" value="위장관외과">위장관외과</option>
											<option class="option" value="유방외과">유방외과</option>
											<option class="option" value="이식외과">이식외과</option>
											<option class="option" value="일반외과">일반외과</option>
										</optgroup>
								</select></td>
							</tr>
							<tr>
								<th><label for="input_name">이름</label></th>
								<td><input type="text" id="input_name" name="name"
									autocomplete="off" class="txt"></td>
								<th>성별</th>
								<td><input type="radio" id="gender_M" name="gender"
									value="M">남성 <input type="radio" id="gender_F"
									name="gender" value="F">여성</td>
							</tr>
							<tr>
								<th><label for="input_phone_number">휴대전화번호</label></th>
								<td><input type="tel" id="input_phone_number"
									name="phone_number" autocomplete="off" class="txt"
									maxlength="13" oninput="autoHyphen(this)"></td>
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
							<tr>
								<th><label for="input_email">이메일주소</label></th>
								<td colspan="2"><input type="text" id="input_email" name="email"
									autocomplete="off" class="txt" onchage="validEmail(this)"></td>
							</tr>
							<tr>
								<th><label>직급</label></th>
								<td><select name="position">
										<option value=""></option>
										<option value=""></option>
										<option value=""></option>
										<option value=""></option>
								</select></td>
								<th><label for="input_employment_status">재직여부</label></th>
								<td><input type="radio" id="employment_status_Y"
									name="employment_status" value="Y">재직 <input
									type="radio" id="employment_status_N" name="employment_status"
									value="N">퇴사</td>
							</tr>
					</tbody>
				</table>
				<p class="btn_c">
					<button type=submit " class="gray">등록하기</button>
				</p>
				</form>
			</div>
			<button class="pop_close">닫기</button>
		</div>
	</div>
	<!--// pop-->



	<script>
	
	 function showDepartmentOptions(employeeType) {
	        var departmentSelect = document.getElementById("department_select");

	        // 선택된 직원 유형에 따라 진료과 선택 부분을 보이거나 숨김 처리
	        if (employeeType === '의사' || employeeType === '간호사') {
	            departmentSelect.style.display = 'block';
	        } else {
	            departmentSelect.style.display = 'none';
	        }
	    }
	
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
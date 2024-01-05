<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_employee/employee_list.jsp"%>
<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminEmployeeInfoDAO"%>
<%@ page import="java.util.List"%>
<!--pop-->
<div class="pop_wrap">
	<div class="pop_ct large">
		<h3></h3>
		<div class="tabArea">
			<ul class="tab">
				<li style="width: 100%"><a href="#tab_sub1" class="on">기본
						정보</a></li>
			</ul>
			<%
			String employee_number = request.getParameter("employee_number"); //employee_list.jsp
			System.out.println(employee_number);
			int intEmployeeNumber = 0;
			try {
				intEmployeeNumber = Integer.parseInt(employee_number); //예외
			} catch (Exception e) {
				e.printStackTrace(); //예외 발생 기록
				intEmployeeNumber = 0;
			}

			AdminEmployeeInfoDAO adminEmployeeInfoDAO = new AdminEmployeeInfoDAO();
			EmployeeDTO employeeInfo = adminEmployeeInfoDAO.findEmployeeInfoByEmployeeNumber(intEmployeeNumber);

			if (employeeInfo == null) {
			%>
			<script>
			alert('잘못된 접근입니다.');
			location.href="employee_list.jsp";
			</script>


			<%
			} else {
			%>

			<!-- 기본 정보 -->
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
						<form id="employeeForm" action="modifyEmployee_proc.jsp?employee_number=<%=employeeInfo.getEmployee_number()%>""
							method="post">
							<input type="hidden" name="employee_number" value="<%=employeeInfo.getEmployee_number()%>">
							<tr>
								<td rowspan="5">
									<p class="pic_area">
										<span id="idPic"></span>
									</p>
								</td>
								<th>환자번호</th>
								<td><%=employeeInfo.getEmployee_number()%></td>
								<th><label for="input_name">이름</label></th>
								<td><input type="text" id="input_name" name="name"
									value="<%=employeeInfo.getName()%>" autocomplete="off"
									class="txt"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td><%=employeeInfo.getGender()%></td>
								<th><label for="input_jumin">주민등록번호</label></th>
								<td><input type="text" id="input_jumin" name="jumin"
									value="<%=employeeInfo.getJumin()%>" autocomplete="off"
									class="txt" maxlength="14"
									oninput="autoHyphenJumin(this)"></td>
							</tr>
							<tr>
								<th><label for="input_phone_number">휴대전화번호</label></th>
								<td><input type="tel" id="input_phone_number"
									name="phone_number" value="<%=employeeInfo.getPhone_number()%>"
									autocomplete="off" class="txt" maxlength="13"
									oninput="autoHyphen(this)"></td>
								<th><label for="input_email">이메일주소</label></th>
								<td><input type="text" id="input_email" name="email"
									value="<%=employeeInfo.getEmail()%>" autocomplete="off"
									class="txt" onchage="validEmail(this)"></td>
							</tr>
							<tr>
								<th><label for="input_id">회원아이디</label></th>
								<td><input type="text" id="input_id" name="id"
									value="<%=employeeInfo.getId()%>" autocomplete="off" class="txt"></td>
								<th><label for="input_address">주소</label></th>
								<td><select name="address">
										<option value="서울특별시"
											<%="서울특별시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>서울특별시</option>
										<option value="부산광역시"
											<%="부산광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>부산광역시</option>
										<option value="대구광역시"
											<%="대구광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>대구광역시</option>
										<option value="인천광역시"
											<%="인천광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>인천광역시</option>
										<option value="광주광역시"
											<%="광주광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>광주광역시</option>
										<option value="대전광역시"
											<%="대전광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>대전광역시</option>
										<option value="울산광역시"
											<%="울산광역시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>울산광역시</option>
										<option value="세종특별자치시"
											<%="세종특별자치시".equals(employeeInfo.getAddress()) ? "selected" : ""%>>세종특별자치시</option>
										<option value="경기도"
											<%="경기도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>경기도</option>
										<option value="강원특별자치도"
											<%="강원특별자치도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>강원특별자치도</option>
										<option value="충청북도"
											<%="충청북도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>충청북도</option>
										<option value="충청남도"
											<%="충청남도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>충청남도</option>
										<option value="전라북도"
											<%="전라북도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>전라북도</option>
										<option value="전라남도"
											<%="전라남도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>전라남도</option>
										<option value="경상북도"
											<%="경상북도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>경상북도</option>
										<option value="경상남도"
											<%="경상남도".equals(employeeInfo.getAddress()) ? "selected" : ""%>>경상남도</option>
								</select></td>
							</tr>
					</tbody>
				</table>
				<p class="btn_c">
					<button id="modifyBtn" type="button" class="gray">수정하기</button>
				</p>
				</form>
			</div>
			<button class="pop_close">닫기</button>
		</div>
	</div>
	<!--// pop-->




<script>
	
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
	
	
	
	document.getElementById('modifyBtn').addEventListener('click', ()=> {
			//이름이 있는지 혹시 비어있는지!!!
			
			let input_name = document.getElementById('input_name');
			let input_jumin = document.getElementById('input_jumin');
			let input_phone_number = document.getElementById('input_phone_number');
			
			if(input_name.value.trim() == ''){
				alert('이름은 필수 입력 항목입니다.');
				input_name.focus();
				return;
			}
			
			if(input_jumin.value.trim() == ''){
				alert('주민등록번호는 필수 입력 항목입니다.');
				input_jumin.focus();
				return;
			}
			
			if (input_jumin.value.length !== 14) {
		        alert('주민등록번호는 13자리로 입력해주세요.');
		        input_jumin.focus();
				return;
	        }
			
			
			if (input_jumin.value.length === 14) {
                const eighthDigit = input_jumin.value.charAt(7); // 8번째 자리 추출
                if (!['1', '2', '3', '4'].includes(eighthDigit)) {
                    alert('올바른 주민등록번호를 입력해주세요.');
                    input_jumin.focus();
    				return;
             }}
			
			
			if(input_phone_number.value.trim() == ''){
				alert('휴대전화번호는 필수 입력 항목입니다.');
				input_phone_number.focus();
				return;
			}
			
			
			if (input_phone_number.value.length !== 13) {
		        alert('올바른 휴대전화번호를 입력해주세요.');
		        input_jumin.focus();
				return;
	        }
		
			if(confirm('수정 하시겠습니까?')){
				let form = document.getElementById('employeeForm');
				form.action = 'modifyEmployee_proc.jsp';
				form.submit();
			}
			
	});
</script>

	<%
	}
	%>
	
	<script>
  $( function() {
	//tab
	$(".tabArea .tab a").click(function(){
		$($(this).attr("href")).fadeIn(300);
		$(this).addClass("on");
		$($(this).parents(".tabArea").children("div")).not($(this).attr("href")).fadeOut(0);
		$($(this).parents(".tab").find("a")).not(this).removeClass("on");
		return false;
	});	
	
	//피드구분 다중선택
	$(".tag_multi>li>span").click(function(){
		$(this).toggleClass("on");		
	});
  } );
  </script>
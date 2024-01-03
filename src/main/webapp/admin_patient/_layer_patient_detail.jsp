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
				<li style="width: 50%"><a href="#tab_sub1" class="on">기본 정보</a></li>
				<li style="width: 50%"><a href="#tab_sub2">관리 메모</a></li>
			</ul>
			<%
			String id = request.getParameter("patient_number"); //patient_list.jsp
			System.out.println(id);
			int intId = 0;
			try {
				intId = Integer.parseInt(id); //예외
			} catch (Exception e) {
				e.printStackTrace(); //예외 발생 기록
				intId = 0;
			}

			AdminPatientInfoDAO adminPatientInfoDAO = new AdminPatientInfoDAO();
			PatientDTO patientInfo = adminPatientInfoDAO.findPatientInfoByPatientNumber(intId);

			if (patientInfo == null) {
			%>
			<script>
			alert('잘못된 접근입니다.');
			location.href="patient_list.jsp";
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
						<form id="personForm" action="deletePerson_proc.jsp" method="post">
							<input type="hidden" name="id" value="<%=patientInfo.getId()%>">
						<tr>
							<td rowspan="5">
								<p class="pic_area">
									<span id="idPic">Profile Image</span>
								</p>
							</td>
							<th>환자번호</th>
							<td><%=patientInfo.getPatient_number()%></td>
							<th><label for="input_name">이름</label></th>
							<td><input type="text" id="input_name" name="name"
								value="<%=patientInfo.getName()%>" autocomplete="off"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td><%=patientInfo.getGender()%></td>
							<th><label for="input_jumin">주민등록번호</label></th>
							<td><input type="text" id="input_jumin" name="jumin"
								value="<%=patientInfo.getJumin()%>" autocomplete="off"></td>
						</tr>
						<tr>
							<th>휴대전화번호</th>
							<td><%=patientInfo.getPhone_number()%></td>
							<th>이메일주소</th>
							<td><%=patientInfo.getEmail()%></td>
						</tr>
						<tr>
							<th>회원아이디</th>
							<td><%=patientInfo.getId()%></td>
							<th>주소</th>
							<td><%=patientInfo.getAddress()%></td>
						</tr>
					</tbody>
				</table>
				<p class="btn_c">
					<button id="modifyBtn" type="button" class="gray">수정하기</button>
				</p>
				</form>
			</div>
			<!-- 관리 메모 -->
			<div id="tab_sub2">
				<table class="viewTable">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>관리 메모</th>
							<td><textarea placeholder="환자 관련 내용을 입력하세요."></textarea></td>
						</tr>
					</tbody>
				</table>
				<p class="btn_c">
					<a href="" class="gray">등록하기</a>
				</p>
			</div>
			<button class="pop_close">닫기</button>
		</div>
	</div>
	<!--// pop-->




	<script>
				document.getElementById('deleteBtn').addEventListener('click', ()=> {
						//alert('삭제버튼눌림');
						if(confirm('삭제 하시겠습니까?')){
							//확인 -> true -> 여기가 실행 -> 삭제쪽으로 연결!
							
							//get 방식으로 id 값 전달
							// location.href = 'deletePerson_proc.jsp?patient_number=<%=patientInfo.getPatient_number()%>';
							
							//form submit 을 발생시켜서, post 방식으로 id 값 전달
							let form = document.getElementById('personForm');
							form.action = 'deletePerson_proc.jsp';
							form.submit();
						}
				});
				
				document.getElementById('modifyBtn').addEventListener('click', ()=> {
						//이름이 있는지 혹시 비어있는지!!!
						
						let input_name = document.getElementById('input_name');
						
						if(input_name.value.trim() == ''){
							alert('이름은 필수 입력입니다.');
							input_name.focus();
							return;
						}
					
						if(confirm('수정 하시겠습니까?')){
							let form = document.getElementById('personForm');
							form.action = 'modifyPerson_proc.jsp';
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
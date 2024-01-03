<%@ page import="db.dto.PatientDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp"%>
<%@ include file="../admin_layout/_lnb_patient.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../resources/plug-in/jquery-ui/css/jquery.dataTable.css">
<%
request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
List<PatientDTO> PatientInfoList = patientInfoDAO.findPatientInfoList();
%>

<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp"%>

	<script>
        let gnbDep1 = 1;
        let lnbDep1 = 1;
        let lnbDep2 = 0;
        let lnbDep3 = 0;
        let title = '환자 정보 조회';
	</script>

	<article>

		<!-- DataTables 정보 표시 -->
		<div class="dataTables_info title" id="patientTable_info" role="status" aria-live="polite">
		<p class="total_top">총 <b><%= PatientInfoList != null ? PatientInfoList.size() : 0 %></b>명</p>
		</div>

		<!-- 상단 등록하기 버튼 -->
		<div class="btns_top register-button" style="position:relative; z-index: 1;">
		  <a href="../admin_patient/_layer_add_patient.jsp" class="blue">신규등록하기</a>
		</div>
		
		<table id="patientTable" class="listTable" style="margin-top: 20px;">
			<colgroup>
				<col width="5%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="15%" />
				<col width="13%" />
				<col width="*" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			
			
		<form id="deleteForm" action="deletePatient_proc.jsp" method="post">
			<input type="hidden" id="selectedPatients" name="selectedPatients" value="" />
			<thead>
				<tr>
					<th><input type="checkbox" id="selectAllCheckboxHeader"></th>
					<th>환자번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>주민등록번호</th>
					<th>휴대전화번호</th>
					<th>이메일</th>
					<th>회원아이디</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (PatientDTO patientInfo : PatientInfoList) {
				%>
				<tr>
					<td><input type="checkbox" class="rowCheckbox" value="<%=patientInfo.getPatient_number()%>"></td>
					<td><%=patientInfo.getPatient_number()%></td>
					<td><a
						href="./_layer_patient_detail.jsp?patient_number=<%=patientInfo.getPatient_number()%>"><%=patientInfo.getName()%></a></td>
					<td><%=patientInfo.getGender()%></td>
					<td><%=patientInfo.getJumin()%></td>
					<td><%=patientInfo.getPhone_number()%></td>
					<td><%=patientInfo.getEmail()%></td>
					<td class="s_txt1"><%=patientInfo.getId()%></td>
					<td><%=patientInfo.getAddress()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		</form>
		<!-- 하단 등록하기 버튼 -->
		<div class="btns_top register-button mt20">
		  <a href="../admin_patient/_layer_add_patient.jsp" class="blue">신규등록하기</a>
		</div>
		
		<!-- 하단 삭제 버튼 -->
			<div class="btns_top mt20">
				<button id="deleteBtn" type="button" class="red">선택 삭제하기</button>
			</div>
		
		
	</article>
</section>
<link rel="stylesheet"
	href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css"
	type="text/css" />
<script type="text/javascript"
	src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript"
	src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../resources/js/dataTable.js"></script>
<script>
	document.getElementById('deleteBtn').addEventListener('click', ()=> {
	    // 선택된 체크박스 확인
	    let selectedCheckboxes = document.querySelectorAll('.rowCheckbox:checked');
	
	    if (selectedCheckboxes.length === 0) {
	        alert('삭제할 항목을 선택하세요.');
	        return;
	    }
	
	    // 선택된 환자 번호를 배열에 저장
	    let selectedPatients = Array.from(selectedCheckboxes).map(checkbox => checkbox.value);
	
	    // hidden 필드에 선택된 환자 번호를 설정
	    document.getElementById('selectedPatients').value = JSON.stringify(selectedPatients);
	
	    // 확인 후 삭제 여부 묻기
	    if (confirm('선택한 환자 정보를 삭제하시겠습니까?')) {
	        // form submit을 통해 서버로 데이터 전송
	        let deleteForm = document.getElementById('deleteForm');
	        if (deleteForm) {
	            deleteForm.submit();
	        } else {
	            alert('폼을 찾을 수 없습니다.');
	        }
	    }
	});
</script>
<%-- <script>
	document.getElementById('deleteBtn').addEventListener('click', ()=> {
			//alert('삭제버튼눌림');
			if(confirm('삭제 하시겠습니까?')){
				
				//get 방식으로 id 값 전달
				// location.href = 'deletePatient_proc.jsp?id=<%=PatientInfo.getId()%>';
				
				//form submit 을 발생시켜서, post 방식으로 id 값 전달
				let form = document.getElementById('personForm');
				form.action = 'deletePerson_proc.jsp';
				form.submit();
			}
	});
</script> --%>
<%@ include file="../admin_layout/footer.jsp"%>
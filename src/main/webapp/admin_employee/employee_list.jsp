<%@ page import="db.dto.EmployeeDTO"%>
<%@ page import="java.util.List"%>
<%@page import="db.dao.admin2.AdminEmployeeInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp"%>
<%@ include file="../admin_layout/_lnb_employee.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../resources/plug-in/jquery-ui/css/jquery.dataTable.css">
<%
request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
AdminEmployeeInfoDAO employeeInfoDAO = new AdminEmployeeInfoDAO();
List<EmployeeDTO> EmployeeInfoList = employeeInfoDAO.findAllEmployeeInfoList();
%>

<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp"%>

	<script>
		let gnbDep1 = 2;
		let lnbDep1 = 1;
		let lnbDep2 = 0;
		let lnbDep3 = 0;
		let title = '임직원 조회';
	</script>

	<article>

		<!-- DataTables 정보 표시 -->
		<div class="dataTables_info" id="employeeTable_info" role="status"
			aria-live="polite">
			<p class="total_top">
				총 <b><%=EmployeeInfoList != null ? EmployeeInfoList.size() : 0%></b>명
			</p>
		</div>

		<!-- 상단 등록하기 버튼 -->
		<div class="btns_top register-button"
			style="position: relative; z-index: 1;">
			<a href="../admin_employee/_layer_add_employee.jsp" class="blue">직원
				등록하기</a>
		</div>

		<table id="employeeTable" class="listTable" style="margin-top: 20px;">
			<colgroup>
				<col width="5%" />
				<col width="15%" />
				<col width="10%" />
				<col width="10%" />
				<col width="15%" />
				<col width="*" />
				<col width="*" />
			</colgroup>

			<form id="deleteForm" action="deleteEmployee_proc.jsp" method="post">
				<input type="hidden" id="selectedEmployee" name="selectedEmployees"
					value="" />
			<thead>
				<tr>
					<th><input type="checkbox" id="selectAllCheckboxHeader"></th>
					<th>직원번호(ID)</th>
					<th>이름</th>
					<th>분류</th>
					<th>직급</th>
					<th>휴대전화번호</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (EmployeeDTO employeeInfo : EmployeeInfoList) {
					String employeeCategory = "";
					int employeeCode = employeeInfo.getEmployee_code();

					switch (employeeCode) {
						case 1 :
					employeeCategory = "의사";
					break;
						case 2 :
					employeeCategory = "간호사";
					break;
						case 3 :
					employeeCategory = "행정";
					break;
						default :
					employeeCategory = "알 수 없음";
					break;
					}
				%>
				<tr>
					<td><input type="checkbox" class="rowCheckbox"
						value="<%=employeeInfo.getEmployee_number()%>"></td>
					<td><%=employeeInfo.getEmployee_number()%></td>
					<td>
						<a href="./_layer_Employee_detail.jsp?id=<%=employeeInfo.getEmployee_number()%>"><%=employeeInfo.getName()%></a></td>
					<td><%=employeeCategory%></td>
					<td><%=employeeInfo.getPosition()%></td>
					<td><%=employeeInfo.getPhone_number()%></td>
					<td><%=employeeInfo.getEmail()%></td>
				</tr>
				<%
				}
				%>
		</form>
			</tbody>
		</table>

		<!-- 하단 등록하기 버튼 -->
		<div class="btns_top register-button mt20">
			<a href="../admin_employee/_layer_add_employee.jsp" class="blue">직원
				등록하기</a>
		</div>

		<!-- 하단 삭제 버튼 -->
		<div class="btns_top mt20 red">
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
	
	    // 선택된 번호를 배열에 저장
	    let selectedEmployees = Array.from(selectedCheckboxes).map(checkbox => checkbox.value);
	
	    // hidden 필드에 선택된 환자 번호를 설정
	    document.getElementById('selectedEmployees').value = JSON.stringify(selectedEmployees);
	
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
<%@ include file="../admin_layout/footer.jsp"%>
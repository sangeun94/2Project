<%@page import="db.dto.MedicalDepartmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.Reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 예약</title>

</head>
<body>
	<%@ include file="reservationHeader.jsp" %>
	<h2>STEP1 - 진료과 선택</h2>
	<button type="button" onclick="back()">이전</button>

	<%
		ReservationDAO reservationDAO = new ReservationDAO();
		List<MedicalDepartmentDTO> medicalDepartmentList = reservationDAO.findMedicalDepartmentList();
	%>

	<!-- 진료과 목록 출력 -->
	<div id="departmentList">
		<form method="post" action="reservationStep2Employee.jsp">
			<% 
				for(MedicalDepartmentDTO medicalDepartment : medicalDepartmentList){
			%>
			<button name="department" class="departmentButton"
				value="<%=medicalDepartment.getDepartment_number()%>">
				<%=medicalDepartment.getDepartment_name()%></button> 
			<%
				}
			%>

		</form>
	</div>
	
	<script>
		function back(){
			history.go(-1);  
		}
		
	</script>
</body>
</html>
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
<link rel="stylesheet" href="./CSS/reservation.css">
</head>
<body>
		
	<%
		ReservationDAO reservationDAO = new ReservationDAO();
		List<MedicalDepartmentDTO> medicalDepartmentList = reservationDAO.findMedicalDepartmentList();
	%>
	<div id="container">
	<%@ include file="reservationHeader.jsp" %>

		<div id="departmentBox">
			<h2>STEP1 - 진료과 선택</h2><br>
			<button type="button" onclick="back()" class="prevButton">이전</button><br><br>

		
			<!-- 진료과 목록 출력 -->
			<div>
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
		</div>
	</div>
	
	<script>
		function back(){
			history.go(-1);  
		}
		
	</script>
</body>
</html>
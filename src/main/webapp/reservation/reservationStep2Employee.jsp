<%@page import="db.dto.MedicalDepartmentDTO"%>
<%@page import="db.dto.EmployeeDTO"%>
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
		String departmentNum = request.getParameter("department"); //과번호
		session.setAttribute("departmentNum", departmentNum);
		
		ReservationDAO reservationDAO = new ReservationDAO();
		
		List<EmployeeDTO> employeeList = reservationDAO.findDepartmentEmployeetList(departmentNum);
		
		MedicalDepartmentDTO medicalDepartmentInfo = reservationDAO.findMedicalDepartmentByNum(departmentNum);
	%>
	
	<% System.out.println(departmentNum); //데이터 넘어왔는지 확인용 추후 삭제 %>
	<div id="container">
		<%@ include file="reservationHeader.jsp" %>
		<div id="employeeBox">
			<h2>STEP1 - 의료진 선택</h2><br>
			<button type="button" onclick="back()" class="prevButton">이전</button><br><br>
			
			<div class="bold fontM">&nbsp; 선택 진료과 - <%=medicalDepartmentInfo.getDepartment_name() %></div>
			<div class="fontM">&nbsp; <%=medicalDepartmentInfo.getDepartment_name() %> 의료진</div>
	
				<form action="reservationStep3.jsp" method="post">
					<div id ="employeeList">
					<% 
						for(EmployeeDTO employee : employeeList){
					%>
						<div class="employee">
								<button name="employee" class="employeeButton"
									value="<%=employee.getEmployee_number()%>">
									<img alt="<%=employee.getName()%>" src="./img/prof.png" class="employeeImg"><br>
									<br><br>
									<span class="fontM bold"> <%=employee.getName()%></span>
								</button> 
						</div>
			
					<%
						}
					%>
					</div>
				</form>
			
			</div>
		</div>
	
	<script>
		function back(){
			history.go(-1);  
		}
		
	</script>
</body>
</html>
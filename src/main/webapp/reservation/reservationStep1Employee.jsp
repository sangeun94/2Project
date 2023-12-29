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

</head>
<body>

	
	<%
		ReservationDAO reservationDAO = new ReservationDAO();
		List<EmployeeDTO> employeeList = reservationDAO.findEmployeetList();

	%>
	<div id="container">
		<%@ include file="reservationHeader.jsp" %>
		<h2>STEP1 - 의료진 선택</h2>
		<button type="button" onclick="back()">이전</button>
		
		<div id="employee">
	
			<!-- 의료진 목록 출력 -->
				<form action="reservationStep3.jsp" method="post">
					<div id="employeeList">
					<%
						for(EmployeeDTO employee : employeeList){
					%>
					<div id="employeeBox">
						<img alt="<%=employee.getName()%>" src="./img/prof.png" width="150" height="150">
						<button name="employee" value="<%=employee.getEmployee_number()%>" class="employeeButton">
							<%=employee.getDepartment_name()%> <br> <%=employee.getName() %>
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
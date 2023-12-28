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
<style>
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	html, body{
		height: 100%;
	}
	
	#container{
		width: 100%;
		height: 100%;
	}

	
	#employeeList{
		width: 1200px;
		display: flex;
	}
	
	
	#employeeBox{
		width: 200px;
		height: 300px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	
	
	.employeeButton{
		width: 150px;
		height: 80px;
	}
	
	
</style>

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
		<h2>STEP2 - 의료진 선택</h2>
		<button type="button" onclick="back()">이전</button>
		
		<div>선택 진료과 : <%=medicalDepartmentInfo.getDepartment_name() %></div>
		<div><%=medicalDepartmentInfo.getDepartment_name() %> 의료진</div>

			<form action="reservationStep3.jsp" method="post">
				<div id ="employeeList">
				<% 
					for(EmployeeDTO employee : employeeList){
				%>
					<div id="employeeBox">
						<img alt="<%=employee.getName()%>" src="prof.png" width="150" height="150">
						<button name="employee" class="employeeButton"
							value="<%=employee.getEmployee_number()%>">
							<%=employee.getName()%>
						</button> 
					</div>
		
				<%
					}
				%>
				</div>
			</form>
		</div>
	
	<script>
		function back(){
			history.go(-1);  
		}
		
	</script>
</body>
</html>
<%@page import="java.time.LocalDate"%>
<%@page import="db.dto.EmployeeDTO"%>
<%@page import="db.dao.Reservation.ReservationDAO"%>
<%@page import="db.dto.MedicalDepartmentDTO"%>
<%@page import="java.util.List"%>
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

		String departmentNum = (String)session.getAttribute("departmentNum");
	
		String employee = request.getParameter("employee");
		session.setAttribute("employeeNum", employee);
		
		String employeeNum = (String)session.getAttribute("employeeNum");
		
		ReservationDAO reservationDAO = new ReservationDAO();
		
		EmployeeDTO employeeInfo = reservationDAO.findEmployeeById(employeeNum);
	%>

	<% 
		System.out.println();
		System.out.println("선택과 넘버 : " + departmentNum); 
		System.out.println("선택의료진 넘버 " + employeeNum); 
	%>
	
	<% 
	LocalDate tomorrow = LocalDate.now(); 
	tomorrow = tomorrow.plusDays(1);
	%>
	<div id="container">
	<%@ include file="reservationHeader.jsp" %>
		<div id="scheduleBox">
			<h2>STEP2 - 일정 선택</h2><br>
			<form action="reservationStep4.jsp" method="post">
				<button type="button" onclick="back()" class="prevButton">이전</button><button class="nextButton">다음</button> <br><br>
				<div class="bold fontM cal">선택 의료진 : <%=employeeInfo.getName() %></div>
				<div class="bold fontM">진료과 : <%=employeeInfo.getDepartment_name() %></div><br>
	
					<div id="dateTimeSelect">
					<input type="date" name="date" value=<%=tomorrow %> min=<%=tomorrow %> max=<%=tomorrow.plusDays(90) %>><br><br>
					
						<select name="time" size="7" required>
							<option>09:00</option>
							<option>10:00</option>
							<option>11:00</option>
							<option>14:00</option>
							<option>15:00</option>
						</select> 
					</div><br>
					<input id="content" type="text" name="content" placeholder="예약하실 내용을 입력해주세요." style="width: 300px; height: 300px;" required><br>
					
			</form>
		</div>
		<%@ include file="footer.jsp" %>
	</div>
	
	<script>
		function back(){
			history.go(-1);  
		}
	</script>

</body>
</html>
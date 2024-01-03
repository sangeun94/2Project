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
		//데이터 넘어왔는지 확인용 추후 삭제
		System.out.println(departmentNum); 
		System.out.println(employeeNum); 
	%>
	
	<% 
	LocalDate tomorrow = LocalDate.now(); 
	tomorrow = tomorrow.plusDays(1);
	%>
	
	<%@ include file="reservationHeader.jsp" %>
	<h2>STEP3 - 일정 선택</h2>
	<button type="button" onclick="back()">이전</button> <br>
	<div>선택 의료진 : <%=employeeInfo.getName() %></div>
	<div>진료과 : <%=employeeInfo.getDepartment_name() %></div>
	<form action="reservationStep4.jsp" method="post">
		<input type="date" name="date" value=<%=tomorrow %> min=<%=tomorrow %> max=<%=tomorrow.plusDays(90) %>><br>
		<div>
			<select name="time" size="7" required>
				<option>09:00</option>
				<option>10:00</option>
				<option>11:00</option>
				<option>14:00</option>
				<option>15:00</option>
				<option>16:00</option>
				<option>17:00</option>
			</select> 
		</div>
		<input type="text" name="content" placeholder="예약하실 내용을 입력해주세요." style="width: 300px; height: 300px;" required><br>
		<button>다음</button>
	</form>
	
	<script>
		function back(){
			history.go(-1);  
		}
	</script>

</body>
</html>
<%@page import="db.dto.EmployeeDTO"%>
<%@page import="db.dto.PatientDTO"%>
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
		request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정
		
		//이름
		String id = (String)session.getAttribute("id");
		id = "user5";
		
		//예약번호
		
		//환자번호
		
		//예약일자
		String date = request.getParameter("date");
		
		//예약시간
		String time = request.getParameter("time");
		
		//예약내용
		String content = request.getParameter("content");
		
		//직원번호
		String employeeNum = (String)session.getAttribute("employeeNum");
		
		ReservationDAO reservationDAO = new ReservationDAO();
		
		//환자정보용
		PatientDTO info = reservationDAO.findPatientInfoById(id);
		
		EmployeeDTO employeeInfo = reservationDAO.findEmployeeById(employeeNum);
		
		System.out.println(employeeNum);
		System.out.println(date);
		System.out.println(time);
		System.out.println(content);
	%>
	<%@ include file="reservationHeader.jsp" %>
	<h2>예약사항확인</h2>
	<button type="button" onclick="back()">이전</button> <br>
	<form action="reservation_proc.jsp" method="post">
		<div> 예약자 : <input type="text" value="<%=info.getName() %>" readonly> </div>
		<input type="hidden" name="patient_number" value="<%=info.getPatient_number() %>"> <!-- 환자번호 -->
		<div> 전화번호 : <input type="text" value="<%=info.getPhone_number() %>" readonly> </div>
		<div> 진료과목 : <input type="text" value="<%=employeeInfo.getDepartment_name() %>" readonly> </div>
		<input type="hidden" name="department_number" value="<%=employeeInfo.getDepartment_number() %>"> <!-- 과번호 -->
		<div> 의료진 : <input type="text" value="<%=employeeInfo.getName() %>" readonly> </div>
		<div> 예약일자 : <input type="text" name="date" value="<%=date %>" readonly> </div>
		<div> 예약시간 : <input type="text" name="time" value="<%=time %>" readonly> </div>
		<div> 예약내용 : <input type="text" name="content" value="<%=content %>" readonly> </div>
		<button>예약하기</button>
	</form>
	
	
	
	<script>
		function back(){
			history.go(-1);  
		}
	</script>
	
	
</body>
</html>
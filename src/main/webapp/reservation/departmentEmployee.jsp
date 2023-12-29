<%@page import="db.dao.Reservation.ReservationDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="java.util.List"%>

<%@page import="db.dto.EmployeeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String department = request.getParameter("department");
		System.out.println("다른페이지" + department);
		
		ReservationDAO reservationDAO = new ReservationDAO();

	%> 
	<h1>의사선택</h1>

</body>
</html>
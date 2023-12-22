<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.dao.ReservationDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정
		String name = request.getParameter("name");
		System.out.println(name);
		String phone_number = request.getParameter("Phone_number");
		
		ReservationDAO reservationDAO = new ReservationDAO(); 
		
		
	
	%>
	


</body>
</html>
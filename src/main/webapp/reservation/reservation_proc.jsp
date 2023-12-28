<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="db.dao.Reservation.ReservationDAO" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정
		
		String patient_number = request.getParameter("patient_number");
		int patientNum = Integer.parseInt(patient_number);
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String dateTime = date + time;
		String content = request.getParameter("content");
		String employeeNum = (String)session.getAttribute("employeeNum");
		String department_number = request.getParameter("department_number");
		String reservation_status = "Y";
		
		System.out.println(patient_number);
		System.out.println(date);
		System.out.println(time);
		System.out.println(content);
		System.out.println(employeeNum);
		System.out.println(department_number);
		System.out.println(dateTime);
		
		ReservationDAO reservationDAO = new ReservationDAO();
		
		int result = reservationDAO.saveReservaiton(patientNum, reservation_status, date, dateTime, content, employeeNum, department_number);
		
		if(result > 0){
	%>
		<script>
			alert('예약이 완료되었습니다.');
			location.href = 'reservation.jsp'; //해당 경로로 페이지 이동
		</script>
		<%	
		}else {
	%>
		<script>
			alert('예약에 실패하였습니다.');
			history.back(); //뒤로가기
		</script>
	<%
		}

	%>


</body>
</html>
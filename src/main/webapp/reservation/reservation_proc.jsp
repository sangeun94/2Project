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
		
		System.out.println("환자번호 : " + patient_number);
		System.out.println("예약일자 : " + date);
		System.out.println("예약시간 : " + time);
		System.out.println("예약내용 : " + content);
		System.out.println("선택의료진 넘버 : " + employeeNum);
		System.out.println("선택과 넘버 : " + department_number);
		
		ReservationDAO reservationDAO = new ReservationDAO();
		
		int result = reservationDAO.saveReservation(patientNum, reservation_status, date, dateTime, content, employeeNum, department_number);
		
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
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.Reservation.ReservationDAO"%>
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
		request.setCharacterEncoding("UTF-8");
		String reservationNum = request.getParameter("check");
		System.out.println(reservationNum);

		ReservationDAO reservationDAO = new ReservationDAO();

		String result = null;

		try {
			ReservationDTO reservation = reservationDAO.findReservationByNum(reservationNum);
			result = reservation.getReservation_status();
			reservationDAO.cancelReservation(reservationNum);
		} catch (Exception e) {
			
		}
		
	%>
	
	<%
		if(reservationNum == null){
	%>	
		<script>
			alert('선택된 예약이 없습니다.');
			history.back(); //뒤로가기
		</script>
	<%
		}else if(result.equals("N")){
	%>
		<script>
			alert('이미 취소된 예약입니다.');
			history.back(); //뒤로가기
		</script>
	<%		
		} else {
	%>	
		<script>
			alert('예약이 취소 되었습니다.');
			location.href = 'reservationInfo.jsp';
		</script>
	<%
		}
	%>
</body>
</html>
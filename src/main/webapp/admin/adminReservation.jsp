<%@page import="db.dao.admin.AdminLoginDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
</head>
<body>
	<h1>예약내역 보기</h1>
		
	<hr>
	
<!-- my예약내역할때는 여기서 파라미터 사용 가능! 앞에서쓰던거 끌어오는거지 String dd = request.getParameter(); -->
	<%
		AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
		List<ReservationDTO> reservationList = adminReservationDAO.findAdminReservationList();
			
		for(ReservationDTO reservationInfo : reservationList) {
			
	%>	
		<p> 
			예약날짜: <%=reservationInfo.getReservation_date()%> 
			예약시간: <%=reservationInfo.getReservation_time()%> 
			예약번호: <%=reservationInfo.getReservation_number()%>
			예약내용: <%=reservationInfo.getReservation_content()%>
			예약상태: <%=reservationInfo.getReservation_status()%> 
			환자번호: <%=reservationInfo.getPatient_number()%> 
			의사번호: <%=reservationInfo.getEmployee_number()%> 
			과번호: <%=reservationInfo.getDepartment_number()%>
			<button onclick="location.href='adminPatientInfo.jsp?patient_number=<%=reservationInfo.getPatient_number()%>'" type="button">환자정보보기</button>
		</p>
		
	<%
		}
	%>
	
	
</body>
</html>
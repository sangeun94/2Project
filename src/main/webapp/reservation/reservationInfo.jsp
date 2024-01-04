<%@page import="db.dto.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
<link rel="stylesheet" href="./CSS/reservation.css">
</head>
<body>
	<%
		String id = (String)session.getAttribute("loginId");
		ReservationDAO reservationDAO = new ReservationDAO();

		//환자정보용
		PatientDTO info = reservationDAO.findPatientInfoById(id);
		
		String patientNum =  Integer.toString(info.getPatient_number());
		List<ReservationDTO> reservationList = reservationDAO.reservationInfoList(patientNum);
	
		System.out.print(patientNum);
	%>
	<div id="container">
		<%@ include file="reservationHeader.jsp" %>
		<div id="reservationInfoBox">
			<h2>예약조회</h2><br>
			<div><button type="button" onclick="goReservation()" class="goReservationButton">예약페이지로</button></div><br>
			<div> <span class="bold"> <%=info.getName() %>님 예약 내역입니다.</span></div>
			<form action="reservationCancel_proc.jsp" method="post">
				<table>
					<tr>
						<th>선택</th>
						<th>예약일자</th>
						<th>예약시간</th>
						<th>예약학과</th>
						<th>예약의료진</th>
						<th>예약내용</th>
						<th>예약상태</th>
					</tr>
					<%
					for(ReservationDTO reservation : reservationList ){
					%>
					<tr>
						<td> <input type="checkbox" name ="check" value="<%=reservation.getReservation_number() %>" onclick='checkOnlyOne(this)'> </td>
						<td><%=reservation.getReservation_date() %></td>
						<td><%=reservation.getReservation_time() %></td>
						<td><%=reservation.getDepartment_name() %></td>
						<td><%=reservation.getEmployee_name() %></td>
						<td><%=reservation.getReservation_content() %></td>
						<%
							if(reservation.getReservation_status().equals("Y")){
						%>
							<td>예약</td>
						<%
							} else {
						%>
							<td>취소</td>
						<%	
							}
						%>
					</tr>
					<%
						}
					%>
				</table>
				<input type="hidden" name="patientNum" value="<%=info.getPatient_number() %>">
				<button class="reservationCancelButton">선택 예약 취소</button>
			</form>
		</div>
	</div>
	
	
	
	<script>
		function goReservation(){
			location.href = 'reservation.jsp'; 
		}
		
		
		function checkOnlyOne(element) {
			  
			  const checkboxes 
			      = document.getElementsByName("check");
			  
			  checkboxes.forEach((cb) => {
			    cb.checked = false;
			  })
			  
			  element.checked = true;
		}
	</script>
</body>
</html>
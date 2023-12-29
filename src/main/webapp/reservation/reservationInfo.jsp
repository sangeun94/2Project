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
</head>
<body>
	<%
		String id = (String)session.getAttribute("id");
		ReservationDAO reservationDAO = new ReservationDAO();

		String patientNum = (String)session.getAttribute("patientNum");
		
		//환자정보용
		PatientDTO info = reservationDAO.findPatientInfoById(id);
		List<ReservationDTO> reservationList = reservationDAO.reservationInfoList(patientNum);
	
	%>
	<div id="container">
		<%@ include file="reservationHeader.jsp" %>
		<h2>예약조회</h2>
		<div><button type="button" onclick="goReservation()">예약페이지로</button></div>
		<div> <span> <%=info.getName() %>님 예약 내역입니다.</span></div>
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
						<td>완료</td>
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
			<button>예약취소</button>
		</form>
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
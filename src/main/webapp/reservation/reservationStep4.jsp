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
<link rel="stylesheet" href="./CSS/reservation.css">
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정
		
		//이름
		String id = (String)session.getAttribute("loginId");
		
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
		
		System.out.println();
		System.out.println("선택의료진 넘버 : " + employeeNum);
		System.out.println("선택 일자 : " + date);
		System.out.println("선택 시간 : " + time);
		System.out.println("예약내용 : " + content);
	%>
	<div id="container">
		<%@ include file="reservationHeader.jsp" %>
		<div id="reservationCheckBox">
			<h2>예약사항확인 - 아래 내용으로 예약됩니다.</h2><br>
			<form action="reservation_proc.jsp" method="post">
			<button type="button" onclick="back()" class="prevButton">이전</button><button class="reservationButton">예약하기</button><br><br>
				<div class="reservationInfo">
					<div> <div class="text bold">예약자</div> <input type="text" value="<%=info.getName() %>" class="input2" readonly> </div>
					<input type="hidden" name="patient_number" value="<%=info.getPatient_number() %>"> <!-- 환자번호 -->
					<div> <div class="text bold">전화번호</div> <input type="text" value="<%=info.getPhone_number() %>"  class="input2" readonly> </div>
					<div> <div class="text bold">진료과목</div> <input type="text" value="<%=employeeInfo.getDepartment_name() %>" class="input2" readonly> </div>
					<input type="hidden" name="department_number" value="<%=employeeInfo.getDepartment_number() %>"> <!-- 과번호 -->
					<div> <div class="text bold">의료진</div> <input type="text" value="<%=employeeInfo.getName() %>" class="input2" readonly> </div>
					<div> <div class="text bold">예약일자</div> <input type="text" name="date" value="<%=date %>" class="input2" readonly> </div>
					<div> <div class="text bold">예약시간</div> <input type="text" name="time" value="<%=time %>" class="input2" readonly> </div>
					<div> <div class="text bold">예약내용</div> <input type="text" name="content" value="<%=content %>" class="input3" readonly> </div>
				</div>
			</form>
		</div>
		
		<%@ include file="footer.jsp" %>
	</div>
	
	
	
	<script>
		function back(){
			history.go(-1);  
		}
	</script>
	
	
</body>
</html>
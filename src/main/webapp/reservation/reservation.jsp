<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dto.PatientDTO" %> 
<%@ page import="db.dto.ReservationDTO" %> 
<%@ page import="db.dao.Reservation.ReservationDAO" %> 
<%@ page import="db.dto.MedicalDepartmentDTO" %> 
<%@ page import="db.dto.EmployeeDTO" %> 
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 예약</title>
<link rel="stylesheet" href="./CSS/reservation.css">
<style>
	#reservationBody{
		display: flex;
		justify-content: center;
	}

	.info{
		width: 450px;
		height: 780px;
		padding: 20px;
	}
	
	.infoBox{
		width: 100%;
		height: 100%;
		padding: 30px;
		border: 2px solid #C0C0C0;
		border-radius: 30px;
	}
	
	}

</style>
</head>
<body>
	<% 
	String id = (String)session.getAttribute("id");
	id = "user5";
	session.setAttribute("id", id);

	ReservationDAO reservationDAO = new ReservationDAO();
	PatientDTO info = reservationDAO.findPatientInfoById(id);
	%>


	<div id = "container">
		
		<%@ include file="reservationHeader.jsp" %>
		
		<div id ="reservationBody">
			<div class = "info">
				<div class="infoBox">
					<div><span>회원정보</span></div>
					<div> <span>어서오세요!</span> <span> <%=info.getName() %> 님</span> </div>
					<form action="reservationInfo.jsp">
						<div><button>예약내역조회</button> </div>
					</form>
				</div>
				
			</div>
			
			
			<!-- 예약step2 -->
			<div class ="info">
				<div class ="infoBox">
					<form action="reservationStep1Department.jsp" method="post" id="reservationStep0">
						<div>이름 : <input type="text" value="<%=info.getName() %>" disabled> </div>
						<div>번호 : <input type="text" value="<%=info.getPhone_number() %>" disabled> </div>
						<div> 
							<input type="radio" id="agree" name="agree" value="yes"><label for="agree">동의</label> 
							<input type="radio" id="disagree" name="agree" value="no"><label for="disagree">비동의</label> 
						</div>
						<input id ="depart" type="button" value="진료과료 예약">
						<input id = "emplo" type="button" value="의료진으로 예약">
					</form>
				</div>
			</div>
			
			<div class="info">
				<div class="infoBox">
					예약주의사항
				</div>
			</div>
		
		</div> <!-- reservationBody -->

	</div> <!-- 컨테이너 -->
	

	<script>
	
		document.getElementById('emplo').addEventListener('click',()=>{
				let form = document.getElementById('reservationStep0');
				form.action = 'agree_proc1.jsp';
				form.submit();
			
		});
		
		document.getElementById('depart').addEventListener('click',()=>{
			let form = document.getElementById('reservationStep0');
			form.action = 'agree_proc2.jsp';
			form.submit();
		
		});

		
		
	</script>
</body>
</html>
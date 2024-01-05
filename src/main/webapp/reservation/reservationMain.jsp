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


</style>
</head>
<body>
	<% 
	String id = (String)session.getAttribute("loginId");
	
	//String id = (String)session.getAttribute("id");
	//id = "user5";
	//session.setAttribute("id", id);

	ReservationDAO reservationDAO = new ReservationDAO();
	PatientDTO info = reservationDAO.findPatientInfoById(id);
	%>


	<div id = "container">
		
		<%@ include file="reservationHeader.jsp" %>
		
		<div id ="reservationBody">
			<div class = "info" id = "notLogin">
				<div class="infoBox">
					<div class="infoHead"><span class="fontM bold">회원예약</span></div>
					<div> <span class="fontM bold">온라인예약은 회원만 가능합니다. <br> 로그인 후 이용해주세요.</span> </div>
						<div class="infoFoot"><button class="buttonM" id="loginPop">로그인</button> </div>
				</div>
				
			</div>
			
			<div class = "info login none" id="login">
				<div class="infoBox">
					<div class="infoHead"><span class="fontM bold">회원예약</span></div>
					<form action="reservationLogin_proc.jsp" method="post">
						<div class="login"><input type="text" class="inputM" placeholder="아이디" name="id" required></div>
						<div class="login"><input type="password" class="inputM" placeholder="비밀번호" name="password" required></div>
						<div class="infoFoot"><button class="buttonM">로그인</button> </div>
					</form>
				</div>
				
			</div>

			
			<div class="info">
				<div class="infoBoxFoot">
					<div class="infoHead"><span class="fontM bold">예약 안내</span></div><br><br><br>
					<div class="reservationInfoBox">
						<div class="infoText">
							<div><span class="bold">진료예약</span></div>
							<div><span class="call">041-561-1122</span></div>
							<div><span>평일 08:00 ~ 18:00</span></div>
							<div><span>평일 08:00 ~ 13:00</span></div>
						</div>
						
						<div class="infoText">
							<div><span class="bold">오시는 길</span></div>
							<div><span>충남 천안시 동남구 대흥로 215</span></div>
						</div>
						
						<div><span class="bold">* 온라인 예약은 회원만 가능합니다.</span></div><br>
						
					</div>
					
				</div>
			</div>
		
		</div> <!-- reservationBody -->
		<%@ include file="footer.jsp" %>
	</div> <!-- 컨테이너 -->
	

	<script>
	
		document.getElementById('loginPop').addEventListener('click',()=>{
			document.getElementById('notLogin').classList.add('none');
			document.getElementById('login').classList.remove('none');
		});
		
/* 		document.getElementById('depart').addEventListener('click',()=>{
			let form = document.getElementById('reservationStep0');
			form.action = 'agree_proc2.jsp';
			form.submit();
		
		}); */

		
		
	</script>
</body>
</html>
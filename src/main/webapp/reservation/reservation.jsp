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

	ReservationDAO reservationDAO = new ReservationDAO();
	PatientDTO info = reservationDAO.findPatientInfoById(id);
	
	System.out.println();
	System.out.println("로그인 아이디 : " + id);
	%>


	<div id = "container">
		
		<%@ include file="reservationHeader.jsp" %>
		
		<div id ="reservationBody">
			<div class = "info">
				<div class="infoBox">
					<div class="infoHead"><span class="fontM bold">회원정보</span></div>
					<div> <span class="fontM bold">어서오세요! <%=info.getName() %> 님</span> </div>
					<form action="reservationInfo.jsp" id="infoF" method="post">
						<div class="infoFoot">
							<button class="buttonM">예약내역조회</button><br>
							<button class="buttonM" type="button" id="logout">로그아웃</button>
						</div>
					</form>
				</div>
				
			</div>
			
			
			<!-- 예약step2 -->
			<div class ="info">
				<div class ="infoBox">
					<div class="infoHead"><span class="fontM bold">예약인 정보</span></div>
					<form action="reservationStep1Department.jsp" method="post" id="reservationStep0">
						<div  class="infoInput"> 
							<div> <span class="bold">성명</span> <br> <input type="text" value="<%=info.getName() %>" disabled class="input"> </div><br>
							<div><span class="bold">연락처</span> <br> <input type="text" value="<%=info.getPhone_number() %>" disabled class="input"> </div><br><br>
							<div><span class="bold">개인정보 수집 · 이용 동의</span></div><br>
							<div><span class="fontS">개인정보는 병원정보 조회를 위해서만 사용합니다. <br> 개인정보 이용에 동의합니다.</span></div>
							<div id="agreeBox">
								<div class="agreeBox"><input type="radio" id="agree" name="agree" value="yes"><label for="agree"><span class="fontS pointer"> &nbsp;동의합니다.</span></label></div>
								<div class="agreeBox"><input type="radio" id="disagree" name="agree" value="no"><label for="disagree"><span class="fontS pointer">&nbsp;동의하지 않습니다.</span></label></div>
							</div>
						</div>
						
						<div class="infoFoot">
							<input id ="depart" type="button" value="진료과료 예약" class="buttonM"><br>
							<input id = "emplo" type="button" value="의료진으로 예약" class="buttonM">
						</div>
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
		
		document.getElementById('logout').addEventListener('click',()=>{
			let form = document.getElementById('infoF');
			form.action = 'reservationLogout.jsp';
			form.submit();
		
		});

		
		
	</script>
</body>
</html>
<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin.AdminPatientInfoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자정보</title>
</head>
<body>
	<h1>환자정보</h1>
<%
request.setCharacterEncoding("UTF-8");

    String patient_number = request.getParameter("patient_number");
    System.out.println("patientInfo 파라미터 : " + patient_number);

    int intPatientNumber = Integer.parseInt(patient_number);
    AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
    PatientDTO patientInfo = patientInfoDAO.findPatientByNum(intPatientNumber);

    if (patientInfo != null) {
%>
		<p>환자 번호: <%= patientInfo.getPatient_number() %></p>
		<p>상태 코드: <%= patientInfo.getPatient_status_code() %></p>
		<p>ID: <%= patientInfo.getId() %></p>
		<p>이메일: <%= patientInfo.getEmail() %></p>
		<p>이름: <%= patientInfo.getName() %></p>
		<p>주민번호: <%= patientInfo.getJumin() %></p>
		<p>전화번호: <%= patientInfo.getPhone_number() %></p>
		<p>주소: <%= patientInfo.getAddress() %></p>
<%
	} else {
%>
		<script> 
			alert('해당 환자 정보가 없습니다.');
			history.back(); //뒤로가기
		</script>
<% 
	}
%>
			
</body>
</html>
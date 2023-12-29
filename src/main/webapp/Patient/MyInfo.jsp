
<%@ page import="db.dao.Patient.LoginDAO" %>
<%@page import="db.dto.PatientDTO"%>
<%@ page import= "db.dao.Patient.PatientDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@
		 include file="navigation.jsp"
%>















<%
		

		// 현재 로그인한 사용자의 아이디 (예: eorn243)
		String loggedInUserId = "id";
	
		// PatientManager는 적절한 패키지에 있는 클래스명으로 변경
		PatientDAO patientDAO = new PatientDAO();
		PatientDTO patientDTO = patientDAO.findPatientById(loggedInUserId);
		
		LoginDAO loginDAO = new LoginDAO();
%>

 		
 	
 	 <% if (patientDTO != null) { %>
        <h1>내 정보</h1>
        <p>ID: <%= patientDTO.getId() %> </p>
            <P>PW: <%= patientDTO.getPassword() %> </p>
            <p>Name: <%= patientDTO.getName() %> </p>
            <P>EMAIL: <%= patientDTO.getEmail() %> </p>
            <P>PHONE: <%= patientDTO.getPhone_number() %> </p>
            <P>ADDRESS: <%= patientDTO.getAddress() %> </p>
        
        <!-- 다른 정보도 필요에 따라 출력 -->
    <% } else { %>
        <p>해당 아이디의 환자 정보를 찾을 수 없습니다.</p>
    <% } %>
    
</body>
</html>
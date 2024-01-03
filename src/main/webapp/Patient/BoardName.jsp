<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
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
    String loginId = (String) session.getAttribute("loginId");

    if (loginId != null) {
        PatientDAO patientDAO = new PatientDAO();
        String patientName = patientDAO.getPatientNameById(loginId);

        // 이제 patientName에 로그인한 사용자의 이름이 들어있습니다.
        out.println("로그인한 사용자의 이름: " + patientName);
    } else {
        out.println("로그인이 되어있지 않습니다. 로그인을 해주세요.");
    }
%>
</body>
</html>
<%@ page import="db.dao.PatientDAO" %>
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
	request.setCharacterEncoding("UTF-8"); // 문자 인코딩 설정
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String jumin = request.getParameter("jumin");
    String phone_number = request.getParameter("phone_number");
    String address = request.getParameter("address");

    PatientDTO patientInfo = new PatientDTO();
    patientInfo.setId(id);
    patientInfo.setPassword(password);
    patientInfo.setEmail(email);
    patientInfo.setName(name);
    patientInfo.setJumin(jumin);
    patientInfo.setPhone_number(phone_number);
    patientInfo.setAddress(address);

    PatientDAO patientDAO = new PatientDAO();
    
    int result = patientDAO.savePatientInfo(patientInfo);
    
    if (result > 0) {
%>
    <script>
        alert('저장 성공');
        location.href = 'Login.jsp'; // 해당 경로로 페이지 이동
    </script>
<%
    } else {
%>
    <script>
        alert('저장 실패');
        history.back(); // 뒤로가기
    </script>
<%
    }
%>
</body>
</html>
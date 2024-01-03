<%@ page import="db.dto.PatientDTO" %>
<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 정보 수정 결과</title>
</head>
<body>
<%
    // Update_proc.jsp에서 필요한 코드 작성
    // 사용자로부터 전달된 업데이트 데이터를 받아 처리
    request.setCharacterEncoding("UTF-8");

    String loginId = (String) session.getAttribute("loginId");
    boolean updateSuccess = false;

    if (loginId != null) {
        PatientDAO patientDAO = new PatientDAO();
        PatientDTO patientDTO = patientDAO.findPatientById(loginId);

        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");
        String address = request.getParameter("address");

        if (address != null && !address.isEmpty()) {
            patientDTO.setAddress(address);
        }
        if (password != null && !password.isEmpty()) {
            patientDTO.setPassword(password);
        }
        if (email != null && !email.isEmpty()) {
            patientDTO.setEmail(email);
        }
        if (phone_number != null && !phone_number.isEmpty()) {
            patientDTO.setPhone_number(phone_number);
        }
		
     	// 업데이트 로직
        updateSuccess = patientDAO.updatePatientInfo(patientDTO);

        // commit 추가
        //patientDAO.commit();
       
    }

    // Update_proc.jsp에서 업데이트 성공 여부를 MyInfo1.jsp로 전달
    response.sendRedirect("MyInfo1.jsp?updateSuccess=" + updateSuccess);
%>
</body>
</html>
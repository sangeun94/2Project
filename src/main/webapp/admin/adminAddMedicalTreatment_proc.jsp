<%@ page import="java.sql.SQLException"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료정보 생성</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("UTF-8");
	
	    String patient_number = request.getParameter("patient_number");
	    String employee_number = request.getParameter("employee_number");
	    String treatment_date = request.getParameter("treatment_date");
	    String treatment_time = request.getParameter("treatment_time");
	    String hospitalization_status = request.getParameter("hospitalization_status");
	    String treatment_content = request.getParameter("treatment_content");
	
	    AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
	    int result = dao.addMedicalTreatment(null, patient_number, employee_number, treatment_date, treatment_time, hospitalization_status, treatment_content);
	
	    if(result > 0) {
	        // 진료 정보 추가 성공
	%>
	        <script>
	            alert("진료 정보가 성공적으로 추가되었습니다.");
	            location.href = "adminMedicalTreatmentInfo.jsp";
	        </script>
	<%
	    } else {
	        // 진료 정보 추가 실패
	%>
	        <script>
	            alert("진료 정보 추가에 실패했습니다.");
	            history.back();
	        </script>
	<%
	    }
	%>
</body>
</html>
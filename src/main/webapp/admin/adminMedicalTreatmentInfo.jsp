<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자별 진료내역</title>
</head>
<body>

	<h1>환자별 진료내역</h1>
	
	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
			AdminMedicalTreatmentDAO adminMedicalTreatmentDAO = new AdminMedicalTreatmentDAO();
			List<MedicalTreatmentDTO> medicalTreatmentList = adminMedicalTreatmentDAO.findAdminMedicalTreatmentList();
				
			for(MedicalTreatmentDTO medicalTreatmentInfo : medicalTreatmentList) {
			
	%>	
			<p> 
				진료번호: <%=medicalTreatmentInfo.getTreatment_number()%> 
				진료일: <%=medicalTreatmentInfo.getTreatment_date()%>
				진료시간: <%=medicalTreatmentInfo.getTreatment_time()%> 
				입원여부: <%=medicalTreatmentInfo.getHospitalization_status()%> 
				진료과: <%=medicalTreatmentInfo.getEmployee_number()%>
				진료의: <%=medicalTreatmentInfo.getEmployee_number()%>
				환자번호: <%=medicalTreatmentInfo.getPatient_number()%>
				환자이름: <%=medicalTreatmentInfo.getPatient_name()%>
				진료내용: <%=medicalTreatmentInfo.getTreatment_content()%>
				<button onclick="location.href='adminModifyTreatment.jsp?treatment_number=<%=medicalTreatmentInfo.getTreatment_number()%>'" type="button">수정하기</button> 
			</p>
		
	<%
			}
	    } else {
	        // 로그인되지 않은 경우 처리
	%>
	        <script>
	            alert('로그인이 필요합니다.');
	            location.href = "adminLogin.jsp"; // 로그인 페이지로 이동
	        </script>
	<%
    	}
	%>
</body>
</html>
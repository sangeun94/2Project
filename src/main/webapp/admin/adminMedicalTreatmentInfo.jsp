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
		AdminMedicalTreatmentDAO adminMedicalTreatmentDAO = new AdminMedicalTreatmentDAO();
		List<MedicalTreatmentDTO> medicalTreatmentList = adminMedicalTreatmentDAO.findAdminMedicalTreatmentList();
			
		for(MedicalTreatmentDTO medicalTreatmentInfo : medicalTreatmentList) {
			
	%>	
		<p> 
			진료번호: <%=medicalTreatmentInfo.getTreatment_number()%> 
			진료일: <%=medicalTreatmentInfo.getTreatment_date()%>
			진료시간: <%=medicalTreatmentInfo.getTreatment_time()%> 
			의사번호: <%=medicalTreatmentInfo.getEmployee_number()%>
			환자번호: <%=medicalTreatmentInfo.getPatient_number()%>
			입원여부: <%=medicalTreatmentInfo.getHospitalization_status()%> 
			진료내용: <%=medicalTreatmentInfo.getTreatment_content()%>
			<button onclick="location.href='ModifyTreatment.jsp?treatment_number=<%=medicalTreatmentInfo.getTreatment_number()%>'" type="button">수정하기</button> 
		</p>
		
	<%
		}
	%>
</body>
</html>
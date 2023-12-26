<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료내역 수정</title>
</head>
<body>
	<h1>진료내역 수정</h1>
	<%
        String treatmentNumberStr = request.getParameter("treatment_number");
        if (treatmentNumberStr == null || treatmentNumberStr.isEmpty()) {
    %>
            <script>
                alert("오류: 올바른 진료 번호가 제공되지 않았습니다.");
                history.back();
            </script>
    <%
        } else {
            int treatment_number = Integer.parseInt(treatmentNumberStr);
            AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
            MedicalTreatmentDTO medicalTreatment = dao.findAdminMedicalTreatmentById(treatment_number);

            if (medicalTreatment != null) {
    %>       
                <!-- 진료 정보 입력 폼 -->
                <form action="adminModifyTreatment_proc.jsp" method="post">
                    <input type="hidden" name="treatment_number" value="<%=treatment_number%>">
                    입원여부: Y <input type="radio" name="hospitalization_status" value="Y" <%= "Y".equals(medicalTreatment.getHospitalization_status()) ? "checked" : "" %>>
                            N <input type="radio" name="hospitalization_status" value="N" <%= "N".equals(medicalTreatment.getHospitalization_status()) ? "checked" : "" %>><br>
                    진료내용: <textarea name="treatment_content"><%=medicalTreatment.getTreatment_content()%></textarea><br>
                    <button type="submit">수정하기</button>
                </form>  
    <%
            } else {
    %>
                <p>진료 정보를 찾을 수 없습니다.</p>
    <%
            }
        }
    %>
	
</body>
</html>
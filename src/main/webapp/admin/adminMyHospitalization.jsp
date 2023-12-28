<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료내역 입원차트작성</title>
</head>
<body>
	<h1>진료내역 입원차트작성</h1>
	<%
        request.setCharacterEncoding("UTF-8");

        // 로그인 확인
        if (session != null && session.getAttribute("loginId") != null) {
            String employee_number = session.getAttribute("loginId").toString(); // 현재 로그인한 사용자의 아이디
            System.out.println("로그인 id : " + employee_number);
            
            AdminMedicalTreatmentDAO adminMedicalTreatmentDAO = new AdminMedicalTreatmentDAO();
            List<MedicalTreatmentDTO> medicalTreatmentList = adminMedicalTreatmentDAO.findAdminMedicalTreatmentListById(employee_number);

            // 입원여부 Y인 진료내역 출력
            if (medicalTreatmentList != null && !medicalTreatmentList.isEmpty()) {
                for (MedicalTreatmentDTO treatment : medicalTreatmentList) {
                    // 예약 정보 표시
    %>
                    <p>
                        로그인 사용자 아이디: <%=employee_number%>
                        진료번호: <%=treatment.getTreatment_number()%> 
						진료일: <%=treatment.getTreatment_date()%>
						진료시간: <%=treatment.getTreatment_time()%>
						입원여부: <%=treatment.getHospitalization_status()%>
						진료과: <%=treatment.getDepartment_name()%>
						진료의: <%=treatment.getEmployee_name()%>
						환자번호: <%=treatment.getPatient_number()%>
						환자이름: <%=treatment.getPatient_name()%> 
						진료내용: <%=treatment.getTreatment_content()%>
						<button onclick="location.href='adminAddHospitalization.jsp?patient_number=<%=treatment.getPatient_number()%>'" type="button">입원차트작성</button> 
                    </p>
    <%
                }
            } else {
                // 진료 정보가 없는 경우
                %>
                <p>해당 환자의 진료 정보가 없습니다.</p>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 수정</title>
</head>
<body>
	
	<h1>예약내역 수정</h1>
	<%-- <%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
	        String treatmentNumberStr = request.getParameter("treatment_number");
	        if (treatmentNumberStr == null || treatmentNumberStr.isEmpty()) {
    %>
	            <script>
	                alert("오류: 올바른 예약 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
	            int treatment_number = Integer.parseInt(treatmentNumberStr);
	            AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
	            MedicalTreatmentDTO medicalTreatment = dao.findAdminMedicalTreatmentById(treatment_number);
	
	            if (medicalTreatment != null) {
    %>                   
	                <p>진료번호: <%=medicalTreatment.getTreatment_number()%></p> 
	                <p>환자번호: <%=medicalTreatment.getPatient_number()%></p>
					<p>진료일: <%=medicalTreatment.getTreatment_date()%></p>
					<p>진료시간: <%=medicalTreatment.getTreatment_time()%></p>
					<p>환자이름: <%=medicalTreatment.getPatient_name()%></p>
					
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
                	<p>예약 정보를 찾을 수 없습니다.</p>
    <%
	            }
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
    %> --%>


</body>
</html>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@page import="db.dto.InpatientRoomDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원차트 작성</title>
</head>
<body>
	<h1>입원차트 작성</h1>
	
	<hr>
    <%
        String patient_number = request.getParameter("patient_number");
        System.out.println("patient_number: " + patient_number); // 디버깅 출력
        AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
        MedicalTreatmentDTO medicalTreatment = dao.findAdminMedicalTreatmentListById2(patient_number);
        
        AdminHospitalizationDAO dao2 = new AdminHospitalizationDAO();
        List<InpatientRoomDTO> inpatientRoomList = dao2.findInpatientRoomList(); // 입원실 현재 인원 조회
	
    %>
    	<h2>각 입원실의 현재 인원</h2>
    	
    <%
        for (InpatientRoomDTO room : inpatientRoomList) {
    %>
            <p>
                입원실 번호: <%= room.getInpatient_room_number() %><br>
                현재 인원: <%= room.getPatient_number() %><br>
            </p>
            
    <%
        }
    %>	
    	<hr>
    <%
        if (medicalTreatment != null) {
    %>
            <p>
                진료날짜: <%=medicalTreatment.getTreatment_date()%><br>
                진료시간: <%=medicalTreatment.getTreatment_time()%><br>
                환자번호: <%=medicalTreatment.getPatient_number()%><br>
                환자이름: <%=medicalTreatment.getName()%><br>
                진료내용: <%=medicalTreatment.getTreatment_content()%><br>
            </p>
            
            <hr>
            
            <!-- 입원 정보 입력 폼 -->
		    <form action="adminAddHospitalization_proc.jsp" method="post">
			    <!-- 입원번호는 시퀀스로 자동으로 1씩증가하는 형태로! -->
			    <input type="hidden" name="patient_number" value="<%=medicalTreatment.getPatient_number()%>">
			    <label>입원일 : </label><input type="date" name="hospitalization_date"><br>
			    <label>퇴원일 : </label><input type="date" name="discharge_date"><br>
			    <label>입원실번호 : </label><input type="text" name="inpatient_room_number"><br>
			    <button type="submit">입원 정보 추가</button>
			</form> 

    <%
        } else {
    %>
            <p>진료 정보를 찾을 수 없습니다.</p>
    <%
        }
    %>
	
	
</body>
</html>
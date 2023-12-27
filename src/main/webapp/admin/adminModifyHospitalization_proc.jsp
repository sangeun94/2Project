<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@page import="db.dto.HospitalizationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원정보수정 결과</title>
</head>
<body>
	<%
	    request.setCharacterEncoding("UTF-8");
	    
	    // 폼에서 전달된 파라미터를 가져옵니다.
	    int hospitalization_number = Integer.parseInt(request.getParameter("hospitalization_number"));    
	    String hospitalization_date = request.getParameter("hospitalization_date");
	    String discharge_date = request.getParameter("discharge_date");
	    String inpatient_room_number = request.getParameter("inpatient_room_number");
		
		System.out.println("hospitalization_number: " + hospitalization_number); // 디버깅 출력

	    // DTO 객체를 생성하고 값을 설정
	    HospitalizationDTO hospitalization = new HospitalizationDTO();
	    hospitalization.setHospitalization_number(hospitalization_number);
	    hospitalization.setHospitalization_date(hospitalization_date);
	    hospitalization.setDischarge_date(discharge_date);
	    hospitalization.setInpatient_room_number(inpatient_room_number);
	
	    // DAO 인스턴스를 생성하고 modifyMedicalTreatmentInfo 메소드를 호출.
	    AdminHospitalizationDAO dao = new AdminHospitalizationDAO();
	    int result = dao.modifyHospitalizationInfo(hospitalization);
	
	    // 처리 결과에 따라 사용자에게 메시지를 보여주고, 적절한 페이지로 이동
	    if(result > 0) {
	%>
	        <script>
	            alert("입원 정보가 성공적으로 수정되었습니다.");
	            location.href = "adminHospitalizationInfo.jsp"; // 성공 시 입원 목록 페이지로 리디렉션
	        </script>
	<%
	    } else {
	%>
	        <script>
	            alert("입원 정보 수정에 실패했습니다.");
	            history.back(); // 실패 시 이전 페이지로 돌아감
	        </script>
	<%
	    }
	%>
</body>
</html>
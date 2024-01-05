<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료정보수정 결과</title>
</head>
<body>
	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
		    request.setCharacterEncoding("UTF-8");
		    
		    // 폼에서 전달된 파라미터를 가져옵니다.
		    int treatment_number = Integer.parseInt(request.getParameter("treatment_number"));
		    String hospitalization_status = request.getParameter("hospitalization_status");
		    String treatment_content = request.getParameter("treatment_content");
		
		    // DTO 객체를 생성하고 값을 설정합니다.
		    MedicalTreatmentDTO medicalTreatment = new MedicalTreatmentDTO();
		    medicalTreatment.setTreatment_number(treatment_number);
		    medicalTreatment.setHospitalization_status(hospitalization_status);
		    medicalTreatment.setTreatment_content(treatment_content);
		
		    // DAO 인스턴스를 생성하고 modifyMedicalTreatmentInfo 메소드를 호출합니다.
		    AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
		    int result = dao.modifyMedicalTreatmentInfo(medicalTreatment);
		
		    // 처리 결과에 따라 사용자에게 메시지를 보여주고, 적절한 페이지로 리디렉션합니다.
		    if(result > 0) {
	%>
		        <script>
		            alert("진료 정보가 성공적으로 수정되었습니다.");
		            location.href = "../admin_patient/treatment_list.jsp"; // 성공 시 진료 목록 페이지로 리디렉션
		        </script>
	<%
	    	} else {
	%>
		        <script>
		            alert("진료 정보 수정에 실패했습니다.");
		            history.back(); // 실패 시 이전 페이지로 돌아감
		        </script>
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
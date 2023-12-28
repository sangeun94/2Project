<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원 정보 생성</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

	 // 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
	        // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
        	
            String hospitalization_date = request.getParameter("hospitalization_date");
            String discharge_date = request.getParameter("discharge_date");
            String inpatient_room_number = request.getParameter("inpatient_room_number");
            int patient_number = Integer.parseInt(request.getParameter("patient_number"));

            System.out.println("patient_number: " + patient_number); // 디버깅 출력
            
            AdminHospitalizationDAO dao = new AdminHospitalizationDAO();
            int result = dao.addHospitalization(hospitalization_date, discharge_date, inpatient_room_number, patient_number);
        
            if(result > 0) {
                // 입원 정보 추가 성공
    %>
                <script>
                    alert("입원 정보가 성공적으로 추가되었습니다.");
                    location.href = "adminHospitalizationInfo.jsp";
                </script>
    <%
            } else {
                // 입원 정보 추가 실패
    %>
                <script>
                    alert("입원 정보 추가에 실패했습니다.");
                    history.back();
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
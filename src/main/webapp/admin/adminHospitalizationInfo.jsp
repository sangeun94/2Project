<%@page import="db.dto.HospitalizationDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자별 입원내역</title>
</head>
<body>
	<h1>환자별 입원내역</h1>
	
	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
			AdminHospitalizationDAO adminHospitalizationDAO = new AdminHospitalizationDAO();
			List<HospitalizationDTO> hospitalizationList = adminHospitalizationDAO.findAdminHospitalizationList();
				
			for(HospitalizationDTO hospitalizationInfo : hospitalizationList) {
			
	%>	
			<p> 
				입원번호: <%=hospitalizationInfo.getHospitalization_number()%> 
				입원일: <%=hospitalizationInfo.getHospitalization_date()%>
				퇴원일: <%=hospitalizationInfo.getDischarge_date()%> 
				입원실: <%=hospitalizationInfo.getInpatient_room_number()%>
				환자번호: <%=hospitalizationInfo.getPatient_number()%>
				환자이름: <%=hospitalizationInfo.getPatient_name()%> 
				<button onclick="location.href='adminModifyHospitalization.jsp?hospitalization_number=<%=hospitalizationInfo.getHospitalization_number()%>'" type="button">수정하기</button> 
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
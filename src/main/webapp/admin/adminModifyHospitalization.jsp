<%@page import="db.dto.HospitalizationDTO"%>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원내역 수정</title>
</head>
<body>
    <h1>입원내역 수정</h1>
    <%
	 	// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
	        String hospitalizationNumberStr = request.getParameter("hospitalization_number");
	        if (hospitalizationNumberStr == null || hospitalizationNumberStr.isEmpty()) {
    %>
	            <script>
	                alert("오류: 올바른 입원 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
	            int hospitalization_number = Integer.parseInt(hospitalizationNumberStr);
	            AdminHospitalizationDAO dao = new AdminHospitalizationDAO();
	            HospitalizationDTO hospitalization = dao.findAdminHospitalizationById(hospitalization_number);
	
	            if (hospitalization != null) {
    %>       
	                <p>입원번호: <%=hospitalization.getHospitalization_number()%></p>
	                <p>환자번호: <%=hospitalization.getPatient_number()%></p>
	                <p>환자이름: <%=hospitalization.getPatient_name()%></p>
	                
	                <form action="adminModifyHospitalization_proc.jsp" method="post">
	                    <input type="hidden" name="hospitalization_number" value="<%=hospitalization.getHospitalization_number()%>">
	                    <label>입원일 : </label><input type="date" name="hospitalization_date" value="<%=hospitalization.getHospitalization_date()%>"><br>
	                    <label>퇴원일 : </label><input type="date" name="discharge_date" value="<%=hospitalization.getDischarge_date()%>"><br>
	                    <label>입원실번호 : </label><input type="text" name="inpatient_room_number" value="<%=hospitalization.getInpatient_room_number()%>"><br>
	                    <button type="submit">수정하기</button>
	                </form>
    <%
           	 } else {
    %>
               	 <p>입원 정보를 찾을 수 없습니다.</p>
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
    %>
</body>
</html>
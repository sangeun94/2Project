<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    if (session != null && session.getAttribute("loginId") != null) {
        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
        System.out.println("로그인 id : " + loggedInEmployeeNumber);
        
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
		
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		String phone_number = request.getParameter("phone_number");
		String address = request.getParameter("address");
		System.out.println(phone_number);
		
		AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
		int result = patientInfoDAO.savePatientInfo(name, jumin, phone_number, address);
		
		if(result > 0){
	%>
	<script>
			alert('환자 정보가 성공적으로 추가되었습니다.');
			location.href = 'patient_list.jsp'; //해당 경로로 페이지 이동
		</script>
	<%
	    }
    } else {
        // 로그인되지 않은 경우 처리
%>
		<script>
            alert('로그인이 필요합니다.');
            location.href = "../admin/adminLogin.jsp"; // 로그인 페이지로 이동
        </script>
	<%
    }
%>

</body>
</html>
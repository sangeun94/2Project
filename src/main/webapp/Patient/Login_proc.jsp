<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page import="db.dao.Patient.LoginDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page import="java.util.regex.Pattern" %>
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
	
    request.setCharacterEncoding("UTF-8");
	
	//id 매개변수의 값을 가져오고
    String id = request.getParameter("id");
	//pw 매개변수의 값을 가져오고
    String password = request.getParameter("password");
    String name = request.getParameter("name");
   
    System.out.println("Login_proc 파라미터 : " + id + " " + password  );
    
    //Login 클래스의 객체 생성
    LoginDAO loginDAO = new LoginDAO();
    //LoginDAO를 사용하여 ID기반으로 사용자 정보를 데이터베이스에서 찾아온다.
    PatientDTO patientInfo = loginDAO.findLoginById(id);
    //세션에 "loginId" 속성을 설정하여 현재 로그인한 사용자의 ID를 저장합니다. 이것은 사용자가 로그인 상태를 유지하는 데 사용됩니다.
    session.setAttribute("loginId", id);  //아이디 저장 세션에서
    
    
    if (patientInfo == null) {
%>
  <script>
        alert('해당 사용자 정보가 없습니다.');
        location.href = "../Patient/Login1.jsp";
    </script>
  
<%
    } else {
        if (id.equals(patientInfo.getId()) && password.equals(patientInfo.getPassword())) {
%>
            <script>
                alert('로그인 성공');
                location.href = "../homeMain/HompageMain.jsp"; // 로그인 성공 시 이동할 페이지
            </script>
<%
//로그인 성공 시 사용자 아이디와 이름을 세션에 저장



        } else {
%>
            <script>
                alert('로그인 실패');
                history.back(); // 뒤로가기
            </script>
<%
        }
        
        session.setAttribute("loginName", patientInfo.getName());
        //String enteredUserId = "user123";
        
    }
    
%>
		
	
</body>
</html>
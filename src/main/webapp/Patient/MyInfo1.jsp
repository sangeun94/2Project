

<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내 정보</h1>
    
    <% 
        
        String loginId = (String) session.getAttribute("loginId");
   
    if (loginId != null) {
        PatientDAO patientDAO = new PatientDAO();
        PatientDTO patientDTO = patientDAO.findPatientById(loginId);

           
            
    %>
    
    
  
    
    
    
    
    
    
    
    
    <form action="updatePatientInfo.jsp" method="post">
            <p>어서오세요, <%= patientDTO.getName() %>님</p>
            <!--<p>아이디: <input type="text" value="<%= patientDTO.getId() %>"></p>-->
            <!--<p>비밀번호: <input type="password" value="<%= patientDTO.getPassword() %>"></p>-->
            <!--<p>이메일: <input type="text" value="<%= patientDTO.getEmail() %>"></p>-->
            <!--<p>전화번호: <input type="text" value="<%= patientDTO.getPhone_number() %>"></p>-->
            <!--<p>주소: <input type="text" value="<%= patientDTO.getAddress() %>"></p>-->
             <p>아이디: <%= patientDTO.getId() %></p> 
            <p>비밀번호: <%= patientDTO.getPassword() %></p> 
            <p>이름: <%= patientDTO.getName() %></p>
            <p>이메일: <%= patientDTO.getEmail() %> </p> 
          	 <p>전화번호: <%= patientDTO.getPhone_number() %></p> 
           	<p>주소: <%= patientDTO.getAddress() %></p> 
             
            <!-- 여기에 사용자의 추가 정보를 표시하거나 필요한 작업을 수행할 수 있습니다. -->
            <button type="submit" >수정하기</button>
    </form>
    <%
        } else {
    %>
            <p>로그인이 되어있지않습니다. 로그인을 해주세요 <a href="Login.jsp">login</a>.</p>
          
    <%
        }
    %>
    
    <script>
		    
    </script>
</body>
</html>
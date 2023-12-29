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
        request.setCharacterEncoding("UTF-8");

        String loginId = (String) session.getAttribute("loginId");
        boolean updateSuccess = false; // 미리 정의

        if (loginId != null) {
            PatientDAO patientDAO = new PatientDAO();
            PatientDTO patientDTO = patientDAO.findPatientById(loginId);

            // 폼이 제출되었을 때의 처리
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String password = request.getParameter("password");
                String email = request.getParameter("email");
                String phone_number = request.getParameter("phone_number");
                String address = request.getParameter("address");

                // 업데이트 로직
                if (address != null && !address.isEmpty()) {
                    patientDTO.setAddress(address);
                }
                if (password != null && !password.isEmpty()) {
                    patientDTO.setPassword(password);
                }
                if (email != null && !email.isEmpty()) {
                    patientDTO.setEmail(email);
                }
                if (phone_number != null && !phone_number.isEmpty()) {
                    patientDTO.setPhone_number(phone_number);
                }

                updateSuccess = patientDAO.updatePatientInfo(patientDTO);

                if (updateSuccess) {
                    // 업데이트 성공 메시지 설정
                    
                    request.setAttribute("message", "정보가 성공적으로 수정되었습니다.");
                } else {
                    // 업데이트 실패 메시지 설정
                    request.setAttribute("message", "정보 수정에 실패했습니다.");
                }
            }
    %>
    
    <form method="post">
        <p>어서오세요, <%= patientDTO.getName() %>님</p>
        <p>아이디: <%= patientDTO.getId() %></p>
        <p>비밀번호: <input type="password" name="password" value="<%= patientDTO.getPassword() %>"></p>
        <p>이메일: <input type="text" name="email" value="<%= patientDTO.getEmail() %>"></p>
        <p>전화번호: <input type="text" name="phone_number" value="<%= patientDTO.getPhone_number() %>"></p>
        <p>주소: <input type="text" name="address" value="<%= patientDTO.getAddress() %>"></p>
         <button type="submit" onclick="goToMyPage()">수정하기</button> 
         
        
    </form>

    <% 
        } else {
    %>
        <p>로그인이 되어있지 않습니다. 로그인을 해주세요 <a href="Login.jsp">login</a>.</p>
    <%
        }
    %>
    
    <script>
      
      // 추가적인 스크립트가 필요한 경우 여기에 작성
       	function goToMyPage() {
            // 업데이트 성공 또는 실패 여부에 따라 알림창 표시
            <% if (updateSuccess) { %>
                alert("정보가 성공적으로 수정되었습니다.");
                window.location.href = "Mypage.jsp";
                location.href = 'Mypage.jsp';
            <% } else { %>
                alert("정보 수정에 실패했습니다.");
            <% } %>
		}
    </script>

    <!-- 필요에 따라 추가적인 내용을 표시할 수 있습니다. -->

    <button><a href="Mypage.jsp">내 정보로 돌아가기</a></button>
</body>
</html>
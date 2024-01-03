<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*,java.util.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 로그인페이지</title>
 <script>
        function validateForm() {
            var id = document.getElementById("id").value;
            var password = document.getElementById("password").value;
            var email = document.getElementById("email").value;

            // Email 형식 검증
            var emailRegex = /^[a-zA-Z0-9_+&*-]+(?:\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$/;
            if (!emailRegex.test(email)) {
                alert('이메일 형식이 올바르지 않습니다.');
                return false; // 폼 전송을 막음
            }

            // 여기에 다른 입력 항목에 대한 검증 로직 추가 가능

            return true; // 폼 전송을 허용
        }
</script>
</head>
<body>
	
		<!-- <div class="login-buttons">
            <button class="tab-btn active" onclick="showForm('patientForm')">환자 로그인</button>
            <button class="tab-btn" onclick="showForm('employeeForm')">직원 로그인</button>
        </div> -->
        
        
       
        
     <div class="twologin">   
     
<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked onchange="showForm('patientForm')">
  <label class="btn btn-outline-primary" for="btnradio1">환자로그인</label>

  <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" onchange="showForm('employeeForm')">
  <label class="btn btn-outline-primary" for="btnradio2">직원로그인</label>
</div>
        
        
        
         
        <!-- 환자 로그인 창 -->
        <form id="patientForm" class="active" action="Login_proc.jsp" method="post">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required>

            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">로그인</button>
            <button type="button" onclick="goToJoinPage()">회원가입</button>
        </form>
	
	
        <!-- 직원 로그인 창 -->
        <form id="employeeForm" class="active"  action="adminLogin_proc.jsp" method="post" style="display: none;">
            <label for="employee_number">아이디:</label>
            <input type="text" id="employee_number" name="employee_number" required>

            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">로그인</button>
        </form>
	</div>
	<script>
	 
	  
	// 탭 및 폼 전환 함수
	    function showForm(formId) {
        // 모든 폼의 활성화 클래스 초기화
        document.querySelectorAll('.twologin form').forEach(form => form.classList.remove('active'));

        // 클릭한 폼에 활성화 클래스 적용
        document.getElementById(formId).classList.add('active');
    }
	    function goToJoinPage() {
	        window.location.href = "join.jsp";
	    }
	    
	    
	</script>
	
	
</body>
</html>
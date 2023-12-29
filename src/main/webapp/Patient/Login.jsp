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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
		  body {
            font-family: 'Nanum Gothic', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .twologin {
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

         .login-buttons {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .tab-btn {
            padding: 10px;
            background-color: #808080; /* 회색 */
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }

        .tab-btn.active {
            background-color: #007BFF; /* 파랑색 */
        }

        .twologin form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: none;
        }

        .twologin form.active {
            display: block;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #333;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 10px;
        }

        button[type="submit"]:hover {
            background-color: #45a049;
        }
</style>
 
 <%
   // String userId = "rla12";  // 로그인한 사용자 아이디를 동적으로 가져오는 로직을 여기에 추가
   
   // 회원 가입 후 로그인 처리
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	PatientDAO patientDAO = new PatientDAO();
	PatientDTO loggedInUser = patientDAO.getPatientInfoById(id);
   // 세션에 사용자 정보 저장
	session.setAttribute("loggedInUser", loggedInUser);
%> 
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
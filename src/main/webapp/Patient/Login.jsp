<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<h1>로그인 페이지</h1>
	
	<form action="Login_proc.jsp" method="post"> <!-- get : /addPerson_proc.jsp?name=뚜벅뚜벅, post : /addPerson_proc.jsp -->
		<label>아이디 : </label><input type="text" name="id" required><br> <!-- name="컬럼별명" -->
		<label>비밀번호 : </label><input type="password" name="password" required><br>
		 
		<button type="submit" >로그인</button>
		<button type="submit" onclick="goToJoinPage()">회원가입</button>		
	</form>
	<script>
	  function goToJoinPage() {
	        window.location.href = "join.jsp";
	    }
	  
	</script>
	
</body>
</html>
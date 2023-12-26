<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리페이지 로그인</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	
	<form action="adminLogin_proc.jsp" method="post"> <!-- get : /addPerson_proc.jsp?name=뚜벅뚜벅, post : /addPerson_proc.jsp -->
		<label>아이디 : </label><input type="text" name="employee_number"><br> <!-- name="컬럼별명" -->
		<label>비밀번호 : </label><input type="password" name="password"><br>
		<button type="submit">로그인</button>	
	</form>

</body>
</html>
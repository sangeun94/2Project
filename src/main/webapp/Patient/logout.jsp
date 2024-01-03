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
		session.invalidate(); //세션 청소 사용자 아이디 abc
	%>
	
	<script>
		location.href = "Login.jsp";
	</script>
</body>
</html>
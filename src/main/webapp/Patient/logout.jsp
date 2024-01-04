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
		// 로그아웃 후 메인 페이지로 리다이렉트
		response.sendRedirect("../homeMain/HompageMain.jsp");
	%>
	
	<script>
		location.href = "../Patient/Login1.jsp";
	</script>
</body>
</html>
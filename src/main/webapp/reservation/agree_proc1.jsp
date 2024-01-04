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
		String agree = request.getParameter("agree");	
	%>
	
	<%
		System.out.println("동의여부 : " + agree);
	%>
	
	<%
		if(agree == null || agree.equals("no")){
	%>	
		<script>
			alert('개인정보 수집 동의에 동의해야만 예약 가능합니다.');
			history.back(); //뒤로가기
		</script>
	
	<%		
		} else {
	%>	
		<script>
			location.href = 'reservationStep1Employee.jsp';
		</script>

	<%
		}
	%>
	

	
</body>
</html>
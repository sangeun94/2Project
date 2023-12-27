<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>휴먼대학교병원 관리자</title>
<link rel="stylesheet" href="../resources/css/default.css">
<script src="../resources/js/jquery-1.7.2.min.js"></script>
<script src="../resources/js/jquery.easing.1.3.js"></script>
<script src="../resources/js/design.js"></script>
</head>
<body>
	<% 
	if(session != null && session.getAttribute("loginId") != null){
		String id = session.getAttribute("loginId").toString(); //현재 로그인한 사람 아이디
		//해당 아이디 가지고 조회 예약정보 조회
		System.out.println("마이페이지 id : " + id);
	%>

	<section id="container">
		<header>
			<h1>
				<a href="#"><img src="../resources/img/humc_logo_239x25.png"
					alt="HUMC LOGO"></a>
			</h1>
			<p>
				<b><%=id%></b>님</p>
			<!-- <a href="javascript:FuncLogout();"> -->
			<form action="../admin/adminLogout.jsp" method="post">
				<button type="submit">로그아웃</button>
			</form><!-- </a> -->
			
			
			<ul id="gnb">
				<li><a href="../admin_patient/patient_list.jsp">환자 관리</a></li>
				<li><a href="/">직원 관리</a></li>
				<li><a href="/">사이트 관리</a></li>
				<li><a href="/">Setting</a></li>
			</ul>
		</header>

	<%
	} else {
		//로그인안한거
		System.out.println("로그인 안함");
		
		//로그인을 안했을때 보여줄 화면
		//location 로그인 안하면 접근안됨.
		%>
		<script>
		alert('잘못된 접근입니다.(로그인 필요)');
		location.href="login.jsp";
		</script>
		<%
	}
	%>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
</style>
</head>
<body>

<h1>회원가입</h1>
	<form action="join_proc.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="5글자 이상 입력해주세요" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="password" placeholder="5글자 이상 입력해주세요" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" placeholder="@를 꼭입력해주세요." required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름을 입력해주세요" required></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="jumin" placeholder="숫자만 입력해주세요." required></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone_number" placeholder="숫자만 입력해주세요." required></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" placeholder="ex)서울특별시" required></td>
			</tr>
			<tr>
				<td><button type="submit" name="join">회원가입</button>&nbsp; &nbsp;
				<button type="reset">취소</button>
				<button type="submit" onclick="goToLoginPage()">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>
	<script>
	 function goToLoginPage() {
	        window.location.href = "Login.jsp";
	    }
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<style>
	*{
	margin: 0px;
    padding: 0;
    box-sizing: border-box;
	}
	 body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .joininput {
        	width : 700px;
            max-width: 600px;
            margin: 50px auto;
            margin-top : 120px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .grayline {
            border-top: 1px solid #ddd;
            margin: 10px 0;
        }

        form {
            margin-top: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        input {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            padding: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
           	margin: 0px auto;
           	
        }

        button[type="reset"] {
            background-color: #f44336;
            margin-right: 10px;
        }

        button[type="submit"]:hover,
        button[type="reset"]:hover {
            background-color: #45a049;
        }
</style>
</head>
<body>
<script>

</script>
<div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">
                    <a href="../hyml/HompageMain.html">
                        <div class="container-Logo"><img src="../imgs/로고1.png"></div>
                    </a>
                    <li class="menu-item"><a>예약</a>
                        <div class="sub-menu">
                        </div>
                    </li>
                    <li class="menu-item"><a>예약</a>
                        <div class="sub-menu">
                        </div>
                    </li>
                    <li class="menu-item"><a>예약</a>
                        <div class="sub-menu">
                        </div>
                    </li>
                    <li class="menu-item"><a>예약</a>
                        <div class="sub-menu">
                        </div>
                    </li>
                    <li class="menu-item"><a>예약</a>
                        <div class="sub-menu">
                        </div>
                    </li>
                    <li>
                        <div class="util__item-area">마이페이지</div>
                    </li>
                    <li>
                        <div class="util__item-area_2">회원가입</div>
                    </li>
                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
<div class="joininput">
<h1>회원가입</h1>
<div class="grayline"></div>
	<form action="join_proc.jsp" method="post" onsubmit="return validateForm();" id="form2">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="5글자 이상 입력해주세요" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" placeholder="5글자 이상 입력해주세요" required></td>
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
				<td>
				<button type="submit" name="join">회원가입</button>
				<button type="reset">리  셋</button>
				<button type="submit" onclick="goToLoginPage()">뒤로가기</button>
				</td>
			</tr>
		</table>
	</form>
</div>
	<script>
	 function goToLoginPage() {
	        window.location.href = "Login.jsp";
	    }
	
	</script>
</body>
</html>
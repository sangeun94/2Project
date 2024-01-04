<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>


    <main id="content" class="loginContent">
        <div class="selectBox">
            <div class="memberBox" onclick="location.href='../Patient/Login.jsp';">
                회원 로그인
            </div>
            <div class="adminBox" onclick="location.href='adminLogin.jsp';">
                관리자 로그인
            </div>
        </div>
        <div class="logBoxWrap">
            <div class="logBox">
                <i class="fa-regular fa-user"></i>
                <h1 class="regularTxt">로그인</h1>
                <p class="colorPoint02">휴먼대학교병원 홈페이지 회원 서비스는<br>로그인 후 이용하실 수 있습니다.</p>
                <form id="memberVo" action="Login_proc.jsp" method="post">
                    <label><input id="id" name="id" required placeholder="아이디" class="inputText" type="text" value=""></label>                           
                    <label><input id="pass"  name="password" required onkeydown="check();" placeholder="비밀번호" class="inputText" type="password" value=""></label>
                    <button type="submit" id="loginBtn" class="btnType03 btnBig">로그인</button>
                    <button  id="joinBtn" class="btnType04 btnBig" onclick="javascript:goToJoinPage()">회원가입  </button>  
                </form>               
            </div>
        </div>    
    </main>
    
    <script>
        function goToJoinPage() {
            window.location.href = "../html/HompageMain.html";
        }
        
    </script>
</body>
</html>
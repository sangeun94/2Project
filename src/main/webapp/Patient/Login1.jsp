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
        <!-- 상단바 -->
        <div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">

                    <a href="../homeMain/HompageMain.jsp">
                        <div class="container-Logo"><img src="../homeMain/imgs/로고1.png"></div>
                    </a>

                    <li class="menu-item"><a href="../homeMain/Introduce.jsp">병원소개</a>
                    </li>

                    <li class="menu-item"><a href="../reservation/reservationMain.jsp">진료예약</a>
                    </li>

                    <li class="menu-item"><a href="list.jsp">고객의소리</a>
                    </li>

                    <li class="menu-item"><a href="MyInfo1.jsp">마이페이지</a>
                    </li>
                    
                    <li>
                        <a href="Login1.jsp">로그인</a>
                    </li>

                    <li>
                        <a href="join.jsp">회원가입</a>
                    </li>

                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
        <!-- 상단바 끝 -->

    <main id="content" class="loginContent">
        <div class="selectBox">
            <div class="memberBox" onclick="location.href='Login1.jsp';">
                회원 로그인
            </div>
            <div class="adminBox" onclick="location.href='../admin/adminLogin.jsp';">
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
                    <a href="javascript:goToJoinPage()" id="joinBtn">회원가입</a>
                </form>               
            </div>
        </div>    
    </main>
    
    <!-- Footer 시작 -->
    <div class="ft_homWrap">
        <footer id="footer">
            <div class="Wrapall_ft">
            <div class="footerMenu_top">

                <ul class="ftmu_top">
                    <li>어린이병원</li>
                    <li>암병원</li>
                    <li>천안휴먼대병원</li>
                    <li>천안매병원</li>
                    <li>강남센터</li>
                    <li>휴먼대학교의과대학</li>
                </ul>

                <ul class="ftmu_top_1">
                    <li class="ftmu_top_li_a">진료과 </li>
                    <li class="ftmu_top_li_a">주요센터 </li>
                    <li class="ftmu_top_li_a">주요부서 </li>
                    <li class="ftmu_top_li_a">주요서비스 </li>
                    <li class="ftmu_top_li_a">패밀리사이트 </li>
                </ul>
            </div>

            <div class="footerMenu_mid">
                <li class="ftmu_top_li_b aacolor">비급여진료비용</li>
                <li class="ftmu_top_li_b">환자권리장전</li>
                <li class="ftmu_top_li_b">이용약관</li>
                <li class="ftmu_top_li_b aacolor">개인정보 처리방침</li>
                <li class="ftmu_top_li_b">정보공개</li>
                <li class="ftmu_top_li_b">정보무단수집거부공개</li>
                <li class="ftmu_top_li_b">뷰어 다운로드</li>
                <li class="ftmu_top_li_b">진료협력센터</li>
                <li class="ftmu_top_li_b">장례식장</li>
            </div>

            <div class="footerMenu_bot">
                <p>
                    주소:충남 천안시 동남구 대흥로 215, 7층 T.041-561-1122 대표전화:1588-5700 홈페이지 의견접수
                    <br>
                    COPYRIGHT 2024 HUMAN NATIONAL UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED
                </p>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-1.png">
                <p>
                    전자의무기록시스템
                    <br>
                    (EMR)인증
                </p>
            </div>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-2.png">
                <p>
                    보건복지부 제1호
                    <br>
                    인증 의료기관
                </p>
            </div>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-3.png">
                <p>
                    정보보호관리체계
                    <br>
                    (ISMS)인증
                </p>
            </div>

        </div>

    </div>
    </footer>
    </div>
    <!-- Footer 끝 -->
    
    <script>
        function goToJoinPage() {
            window.location.href = "../Patient/join.jsp";
        }
        
    </script>
</body>
</html>
<%@page import="java.util.Set"%>
<%@ page import="db.dto.PatientDTO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Optional" %>
<%@ page import="java.util.Optional" %>
<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="./css/media.css">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 
</head>
<body>
    	    <!-- 상단바 -->
            <div class="menu">

                <nav class="clearfix">
    
                    <ul class="clearfix">
    
                        <a href="HompageMain.html">
                            <div class="container-Logo"><img src="../homeMain/imgs/로고1.png"></div>
                        </a>
    
                        <li class="menu-item"><a href="">병원소개</a>
                        </li>
    
                        <li class="menu-item"><a href="">진료예약</a>
                        </li>
    
                        <li class="menu-item"><a href="">고객의소리</a>
                        </li>
    
                        <li class="menu-item"><a href="../Patient/Login1.jsp">마이페이지</a>
                        </li>
                        
                        <li>
                            <a href="../Patient/Login1.jsp">로그인</a>
                        </li>
    
                        <li>
                            <a href="">회원가입</a>
                        </li>
    
                    </ul>
                    <a id="pull" href="#"></a>
                </nav>
    
            </div>
            <!-- 상단바 끝 -->
<%

// 1. 로그인한 사용자의 아이디를 세션에서 가져온다.
String loginId = (String) session.getAttribute("loginId");

if (loginId != null) {
    // 2. 해당 아이디로 회원 가입 정보를 조회하여 사용자의 이름을 얻는다.
    PatientDAO patientDAO = new PatientDAO();
    String patientName = patientDAO.getPatientNameById(loginId);

    // 3. 얻은 이름을 게시판에 적용한다.
%>  
<form action="WritePost.jsp" method="post">
    <div class="board_wrap">
        <div class="board_title">
            <strong>글쓰기</strong>           
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt for="title">제목</dt>
                        <dd><input type="text" id="title" name="title" placeholder="제목을 입력하세요." required></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글쓴이</dt>
                        <dd><input type="text" id="name" name="name" placeholder="글쓴이 입력" value="<%=patientName %>" readonly  style="color: white; background-color: gray;"></dd>
                    </dl>

                </div>
                <div class="cont">
                    <textarea id="content" name="content" placeholder="내용 입력하세요" required></textarea>
                </div>
            </div>
            <div class="bt_wrap">
            	<button type="submit" class="submitBtn">등록</button>
                <button type="button" class="deleteBtn" onclick="location.href='list.jsp';">취소</button>
            </div>
        </div>
    </div>
</form>    
<%
    } else {
        out.println("로그인이 되어있지 않습니다. 로그인을 해주세요.");
    }
%>    
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
</body>
</html>
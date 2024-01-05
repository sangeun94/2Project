<%@ page import="java.util.List" %>
<%@ page import="db.dao.Patient.BoardDAO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dao.Patient.LoginDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객의 소리</title>
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="./css/css.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <style>
        a {
            color: inherit;
            text-decoration: none;
        }
        a:hover {
            color: red;
        }
    </style>
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

                    <li class="menu-item"><a href="../Patient/list.jsp">고객의소리</a>
                    </li>
                    
                    <li class="menu-item"><a href="../Patient/MyInfo1.jsp">마이페이지</a>
                    </li>
                    
                    
                    <% 
					    String loginId = (String) session.getAttribute("loginId");
					    if (loginId != null) {  // 로그인 상태
					        System.out.println("사용자가 로그인했습니다: " + loginId);
					%>
					        <li><%= loginId %>님</li>
					        <li><a href="../Patient/logout.jsp">로그아웃</a></li>
					<%
					    } else {  // 로그아웃 상태
					        System.out.println("사용자가 로그인하지 않았습니다");
					%>
					        <li><a href="../Patient/Login1.jsp">로그인</a></li>
					        <li><a href="../Patient/join.jsp">회원가입</a></li>
					<%
					    }
					%>
            	 	
                    
                    <!--  
                    <li>
                        <a href="../Patient/Login1.jsp">로그인</a>
                    </li>

                    <li>
                        <a href="">회원가입</a>
                    </li>
-->
                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
        <!-- 상단바 끝 -->
<%
   // String loginId = (String) session.getAttribute("loginId");
    BoardDAO boardDAO = new BoardDAO();
   
   
    String somePatientId = "examplePatientId";
    PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientDTO = patientDAO.getPatientInfoById(somePatientId);
	
    String loginName = (String) session.getAttribute("loginName");

    if(session != null && session.getAttribute("loginId") != null){
        String id = session.getAttribute("loginId").toString();
%>        
       <div>
        <form action="logout.jsp" method="post">
            <button type="submit">로그아웃</button>
        </form>
       </div> 

<% 
    } else {
%>
        <script>
            alert('잘못된 접근입니다.(로그인 필요)');
            location.href="Login1.jsp";
        </script>
<%
    }

    if (loginId != null) {
        patientDTO = patientDAO.getPatientInfoById(loginId);
    }
    List<BoardDTO> boardList = boardDAO.getAllPosts();
    if (boardList == null || boardList.isEmpty()) {
    	
    	
%>
        <p>등록된 게시물이 없습니다.</p>
<% 
	} else {
		for (BoardDTO board : boardList) {
            String boardName = board.getName();
            pageContext.setAttribute("boardName_" + board.getBoard_number(), boardName);
        }
%>
        <div class="board_wrap">
            <!-- Board List and Table -->
            <div class="board_title">
                <strong>고객의 소리</strong>
               	<p class="total_top">총 게시물 : <b><%= boardList != null ? boardList.size() : 0 %></b></p>                
            </div>
            <div class="board_list_wrap">
                <div class="board_list">
                    <!-- Board List Headers -->
                    <div class="top">
                        <div class="num">번호</div>
                        <div class="title">제목</div>
                        <div class="writer">글쓴이</div>
                        <div class="date">작성일</div>
                        <div class="count">조회</div>
                    </div>
                    <!-- Board List Items -->
                    <% for (BoardDTO board : boardList) { 
                    	String boardName = (String) pageContext.getAttribute("boardName_" + board.getBoard_number());
                    %>
                        <div onclick="goToContent(<%= board.getBoard_number() %>, this)">
                            <div class="num"><%= board.getBoard_number() %></div>
                            <div class="title"><a href="javascript:void(0)"><%= board.getTitle() %></a></div>
                            <div class="writer"><%= board.getName() %></div>
                            <div class="date">2024.01.05</div>
                            <div class="count">3</div>
                        </div>
                    <% } %>
                </div>
            </div>
            <!-- Pagination and Buttons -->
            <div class="board_page">
                <!-- Pagination Links -->
            </div>
            <div class="bt_wrap">
                <a class="on" onclick="goToBoard()">글쓰기</a>
            </div>
        </div>
<%
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
                    <li class="ftmu_top_li_a">진료과</li>
                    <li class="ftmu_top_li_a">주요센터 </li>
                    <li class="ftmu_top_li_a">주요부서 </li>
                    <li class="ftmu_top_li_a">주요서비스</li>
                    <li class="ftmu_top_li_a">패밀리사이트</li>
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
    function goToBoard() {
        window.location.href = "write.jsp";
    }
    
    function goToContent(boardNumber, element) {
        element.classList.add('clicked');
        window.location.href = "view.jsp?boardNumber=" + boardNumber;
    }
</script>
</body>
</html>
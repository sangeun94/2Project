
<%@page import="db.dto.BoardDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@page import="db.dto.PatientDTO" %>
<%@page import="db.dao.Patient.BoardDAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고객의 소리 보기</title>
    <link rel="stylesheet" href="css/css.css">
    <link rel="stylesheet" href="./css/content.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	    <!-- 상단바 -->
        <div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">

                    <a href="HompageMain.jsp">
                        <div class="container-Logo"><img src="../homeMain/imgs/로고1.png"></div>
                    </a>

                    <li class="menu-item"><a href="Introduce.jsp">병원소개</a>
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
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
     
        
        
         // 게시물 번호 가져오기
        int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));
        // 게시물 정보를 가져오기
        BoardDAO boardDAO = new BoardDAO();
        BoardDTO board = boardDAO.getBoardByNumber(boardNumber);

        // 세션에서 작성자 이름 가져오기
        String boardName = board.getName();
     	

        try {
            // JDBC 드라이버 로딩
            Class.forName("oracle.jdbc.driver.OracleDriver");
    
            // JDBC 연결
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
            //String sql = "SELECT b.title, b.content, b.author_id, p.name FROM board b JOIN patient p ON b.author_id = p.id WHERE b.board_number = ?";
            String sql = "SELECT title, content ,name FROM board WHERE board_number = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, boardNumber);
        
            rs = pstmt.executeQuery();
            
            if (rs.next()   ) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                String name = rs.getString("name");
             
               
                boolean updateSuccess = Boolean.parseBoolean(request.getParameter("updateSuccess"));
                //String loginId = (String) session.getAttribute("loginId");
           
            if (loginId != null) {
                PatientDAO patientDAO = new PatientDAO();
                //PatientDTO patientDTO = patientDAO.findPatientById(loginId);
                String patientName = patientDAO.getPatientNameById(loginId);
                
                // 여기서 title과 content를 사용하여 화면에 출력하거나 다른 처리를 수행
    %>
    

    <div class="board_wrap">
        <div class="board_title">
            <strong>고객의 소리</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    <%= title %> 
                </div>
                <div class="info">
                    <dl>
                        <dt>번호</dt>
                        <dd><%= boardNumber %></dd> <!--  수정 할 부분 -->
                    </dl>
                    <dl> 
                        <dt>글쓴이</dt>
        		
                    	<dd><%=boardName%></dd> <!--  수정 할부분 -->
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2021.1.16</dd>
                    </dl>
                    <dl>
                        <dt>조회</dt>
                        <dd>33</dd>
                    </dl>
                </div>
                <div class="cont">
                    <%= content %>
                </div>
            </div>
            <div class="bt_wrap">
                <a href="list.jsp" class="on">목록</a>
            </div>
        </div>
    </div>
<%
	if (updateSuccess) {
%>  
	     <p>업데이트가 성공적으로 수행되었습니다.</p>
<%           
        } else {       
%>

<%
        	}
        } else {
%>
<p>로그인이 필요합니다<p>
<% 
        	}
        }
 
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } finally {
        // 연결 및 리소스 해제
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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


</body>
</html>
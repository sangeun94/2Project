

<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="../Patient/css/homepage.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/nav.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/footer2.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/Introduce.css" />
<title>Insert title here</title>
</head>
<style>

body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .mainform {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            border: 1px solid lightgray;
            margin: 20px;
        }

        .titlename {
            font-size: 22px;
            font-weight: bolder;
            margin-bottom: 10px;
        }

        .pform {
            border: 1px solid black;
            padding: 10px;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group p {
            margin: 0;
            padding: 5px 0;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3498db;
        }
        .update{
            margin-left: 220px;
        }
</style>
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
    	boolean updateSuccess = Boolean.parseBoolean(request.getParameter("updateSuccess"));
        //String loginId = (String) session.getAttribute("loginId");
   
    if (loginId != null) {
        PatientDAO patientDAO = new PatientDAO();
        PatientDTO patientDTO = patientDAO.findPatientById(loginId);

           
            
    %>
    
    
    <form  method="post" class="mainform" action="updatePatientInfo.jsp">
            <div class="titlename"><%= patientDTO.getName() %>님 안녕하세요</div>
        <br>
        <!-- 첫 번째 칸 -->
        <div class="form-group">
            <label for="id">아이디:</label>
            <p id="id"><%= patientDTO.getId() %></p>
        </div>
    
       <!-- 두 번째 칸 -->
        <div class="form-group">
            <label for="password">비밀번호:</label>
            <p id="password">
    			<%= "*".repeat(patientDTO.getPassword().length()) %>
			</p>
        </div>
    
        <!-- 세 번째 칸 -->
        <div class="form-group">
            <label for="name">이름:</label>
            <p id="name"><%= patientDTO.getName() %></p>
        </div>
    
       
        <div class="form-group">
	    <label for="email">이메일:</label>
	     <p id="email" onchange="validEmail(this)"><%= patientDTO.getEmail() %></p>
		</div>
    
        <div class="form-group">
            <label for="phone">휴대전화</label>
            <p id="phone"><%= patientDTO.getPhone_number() %></p>
        </div>
    
        <div class="form-group">
            <label for="address">주소:</label>
            <p id="address"><%= patientDTO.getAddress() %></p>
        </div>
    
        <button type="submit"  class="update" >수정하기</button>
        
    </form>
    <%
        } else {
        	
    %>
    	<script>
            alert('잘못된 접근입니다.(로그인 필요)');
            location.href="Login1.jsp";
        </script>
          
    <%
        }
    %>
    
   
 <!-- Footer 시작 -->
    <div class="ft_homWrap">
        <footer id="footer">
            <div class="Wrapall_ft">
            <div class="footerMenu_top">

                <ul class="ftmu_top" >
                    <li>어린이병원</li>
                    <li>암병원</li>
                    <li>천안휴먼대병원</li>
                    <li>천안매병원</li>
                    <li>강남센터</li>
                    <li>휴먼대학교의과대학</li>
                </ul>

                <ul class="ftmu_top_1">
                    <li class="ftmu_top_li_a">진료과 ▲</li>
                    <li class="ftmu_top_li_a">주요센터 ▲</li>
                    <li class="ftmu_top_li_a">주요부서 ▲</li>
                    <li class="ftmu_top_li_a">주요서비스 ▲</li>
                    <li class="ftmu_top_li_a">페밀리사이트 ▲</li>
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
    
    </script>
</body>
</html>
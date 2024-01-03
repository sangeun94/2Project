

<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
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

                <a href="HompageMain.html">
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
<!-- 상단바 끝 -->

    
    <% 
    	boolean updateSuccess = Boolean.parseBoolean(request.getParameter("updateSuccess"));
        String loginId = (String) session.getAttribute("loginId");
   
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
	     <p id="email"><%= patientDTO.getEmail() %></p>
		</div>
    
        <div class="form-group">
            <label for="phone">전화번호:</label>
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
            <p>로그인이 되어있지않습니다. 로그인을 해주세요 <a href="Login.jsp">login</a>.</p>
          
    <%
        }
    %>
    
   
</body>
</html>
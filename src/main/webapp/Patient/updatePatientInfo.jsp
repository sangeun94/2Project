<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="../css/nav.css" />
<head>
<meta charset="UTF-8">
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
            border-color: lightgray;
        }
        input::placeholder {
        color: #95a5a6;
        }
        input:disabled {
        background-color: #ecf0f1;
        color: #7f8c8d;
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
        .btnmypage{
            margin-left: 160px;
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
                <li class="menu-item"><a>예약</a></li>
                <li class="menu-item"><a>예약</a></li>
                <li class="menu-item"><a>예약</a></li>
                <li class="menu-item"><a>예약</a></li>
                <li class="menu-item"><a>예약</a></li>
                <li><div class="util__item-area">마이페이지</div></li>
                <li><div class="util__item-area_2">회원가입</div></li>
            </ul>
            <a id="pull" href="#"></a>
        </nav>
    </div>
    <!-- 상단바 끝 -->
 <%
  // Character encoding 설정 및 세션에서 로그인 아이디 가져오기
  request.setCharacterEncoding("UTF-8");
  String loginId = (String) session.getAttribute("loginId");
  boolean updateSuccess = false;

  if (loginId != null) {
    // 로그인 아이디로 환자 정보 가져오기
    PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientDTO = patientDAO.findPatientById(loginId);

    // 폼이 제출되었을 때의 처리
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      String phone_number = request.getParameter("phone_number");
      String address = request.getParameter("address");

      // 업데이트 로직
      if (address != null && !address.isEmpty()) {
        patientDTO.setAddress(address);
      }
      if (password != null && !password.isEmpty()) {
        patientDTO.setPassword(password);
      }
      if (email != null && !email.isEmpty()) {
        patientDTO.setEmail(email);
      }
      if (phone_number != null && !phone_number.isEmpty()) {
        patientDTO.setPhone_number(phone_number);
      }

      // 환자 정보 업데이트 및 결과에 따른 메시지 설정
      updateSuccess = patientDAO.updatePatientInfo(patientDTO);

      if (updateSuccess) {
    	  //patientDAO.commit();
        request.setAttribute("message", "정보가 성공적으로 수정되었습니다.");
      } else {
        request.setAttribute("message", "정보 수정에 실패했습니다.");
      }
    }
%>

<form method="post" class="mainform" action="Update_proc.jsp">
    <!-- 폼의 내용은 그대로 유지 -->
    <div class="titlename">어서오세요,<%= patientDTO.getName() %>님</div>
        <!-- 첫 번째 칸 -->
        <div class="form-group">
            <label for="id">아이디:</label>
            <p id="id"><%= patientDTO.getId() %></p>
        </div>
    
        <!-- 두 번째 칸 -->
        <div class="form-group">
            <label for="password">비밀번호:</label>
            <input type="password" name="password" value="<%= patientDTO.getPassword() %>">
            
        </div>
    
        <!-- 세 번째 칸 -->
        <div class="form-group">
            <label for="name">이름:</label>
            <p id="name"><%= patientDTO.getName() %></p>
        </div>
    
        <!-- 네 번째 칸 (이메일, 전화번호, 주소 등 추가) -->
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="text" name="email" value="<%= patientDTO.getEmail() %>">
        </div>
    
        <div class="form-group">
            <label for="phone_number">전화번호:</label>
            <input type="text" name="phone_number" value="<%= patientDTO.getPhone_number() %>">
        </div>
    
        <div class="form-group">
            <label for="address">주소:</label>
            <input type="text" name="address" value="<%= patientDTO.getAddress() %>">
        </div>
    <%-- 아래의 버튼 클릭 시 update_proc.jsp로 전달할 hidden input 추가 --%>
     <input type="hidden" name="updateSuccess" value="<%= updateSuccess %>"> 
    <!-- 수정된 부분: 버튼에 type="submit" 추가 -->
  <button type="submit" onclick="goToMyPage()">수정하기</button>

<%
  } else {
%>
  <p>로그인이 되어있지 않습니다. 로그인을 해주세요 <a href="Login.jsp">login</a></p>
</form>   
<%
}
%>

<!-- 수정된 부분: 페이지 이동 시 스크립트 -->
<script>
  // 업데이트 성공 시 페이지 이동
  function goToMyPage() {
    <% if (updateSuccess) { %>
      alert("정보가 성공적으로 수정되었습니다.");
      window.location.href = "MyInfo1.jsp";
    <% } else { %>
      alert("정보 수정에 실패했습니다.");
    <% } %>
  }
</script>

<!-- 필요에 따라 추가적인 내용을 표시할 수 있습니다. -->

</body>
</html>
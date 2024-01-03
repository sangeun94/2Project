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
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
</head>
<body>

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
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
        <br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea>
        <br>
          <label for="name">이름:</label>
          <input type="text" id="name" name="name" value="<%=patientName %>" readonly  style="color: white; background-color: gray;">
 		
        <br>
        <button type="submit">등록</button>
    </form>
    <%
    } else {
        out.println("로그인이 되어있지 않습니다. 로그인을 해주세요.");
    }
%>
</body>
</html>
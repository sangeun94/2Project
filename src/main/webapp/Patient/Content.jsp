<%@ page import="java.util.List" %>
<%@ page import="db.dao.Patient.BoardDAO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
        .post-container {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }

        .post {
            border: 1px solid #ddd;
            padding: 10px;
            margin-bottom: 10px;
        }

        .post-title {
            font-size: 18px;
            font-weight: bold;
        }

        .post-author {
            color: #666;
        }

        .post-content {
            margin-top: 10px;
        }
    </style>
<body>
	 <%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardDTO> boardList = boardDAO.getAllPosts();
    String somePatientId = "examplePatientId";
    PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientDTO = patientDAO.getPatientInfoById(somePatientId);
%>

<div class="post-container">
    <% 
    if (boardList == null || boardList.isEmpty()) {
    %>
        <p>등록된 게시물이 없습니다.</p>
    <%
    } else {
        for (BoardDTO board : boardList) {
    %>
        <div class="post">
            <div class="post-title"><%= board.getTitle() %></div>
            <div class="post-author">작성자: <%= patientDTO != null ? patientDTO.getName() : "Unknown" %></div>
            <div class="post-content"><%= board.getContent() %></div>
        </div>
    <%
        }
    }
    %>
</div>
	
</body>
</html>
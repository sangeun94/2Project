<%@ page import="db.dao.Patient.BoardDAO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
	
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String name = request.getParameter("name");

    BoardDTO boardDTO = new BoardDTO();
  
    boardDTO.setTitle(title);
    boardDTO.setContent(content);
    boardDTO.setName(name);

    BoardDAO boardDAO = new BoardDAO();
    boolean result = boardDAO.savePost(boardDTO);

    if (result) {
%>
    <script>
        alert('게시물이 성공적으로 등록되었습니다.');
        location.href = 'list.jsp';
    </script>
<%
    } else {
%>
    <script>
        alert('게시물 등록에 실패했습니다.');
        history.back();
    </script>
<%
    }
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form action="WritePost.jsp" method="post">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required>
        <br>
        <label for="content">내용:</label>
        <textarea id="content" name="content" required></textarea>
        <br>
        <label for="name">이름:</label>
       <!--  <input type="text" id="name" name="name" required> -->
        <br>
        <button type="submit">등록</button>
    </form>
</body>
</html>
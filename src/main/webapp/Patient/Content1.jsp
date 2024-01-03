<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="javax.naming.NamingException" %>
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
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    // 게시물 번호 가져오기
    int boardNumber = Integer.parseInt(request.getParameter("boardNumber"));

    try {
        // JDBC 드라이버 로딩
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // JDBC 연결
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");

        String sql = "SELECT title, content FROM board WHERE board_number = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardNumber);

        rs = pstmt.executeQuery();

        if (rs.next()) {
            String title = rs.getString("title");
            String content = rs.getString("content");

            // 여기서 title과 content를 사용하여 화면에 출력하거나 다른 처리를 수행
%>
            <h1>제목 : <%= title %></h1>
            <p>내용 : <%= content %></p>
<%
        } else {
%>
            <p>해당 게시물을 찾을 수 없습니다.</p>
<%
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


</body>
</html>
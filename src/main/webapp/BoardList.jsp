<%@ page import="java.util.List" %>
<%@ page import="db.dao.BoardDAO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page import = "db.dao.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.tableboard{
		width: 100%;
	display: flex;
	}
	.smallboard1{
		height: 30px;
		
		width: 30px;
	}
	.smallboard2{
		height: 30px;
		
		width: 300px;
	}
	.smallboard3{
		height: 30px;
		
		width: 300px;
	}
</style>
</head>
<body>
<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardDTO> boardList = boardDAO.getAllPosts();
    
 
%>
<h2>게시물 목록</h2>

<%
    if (boardList == null || boardList.isEmpty()) {
%>
    <p>등록된 게시물이 없습니다.</p>
<%
    } else {
        for (BoardDTO board : boardList) {
%>
			<div class="tableboard">
				<div class="smallboard1">
					<%= board.getBoard_number() %>
				</div>
				<div class="smallboard2">
					<!-- <p>내용 : <%= board.getContent() %></p> -->
					<h3>제목: <%= board.getTitle() %></h3>
				</div>
				<div class="smallboard3">
					 <p>작성자 : <%= board.getName() %></p>
					
					
				</div>
			</div>
             <div>
                
                
               
                
                <hr>
            </div>
<%
        }
        
    }
%>
<% 
	if(session != null && session.getAttribute("loginId") != null){
		String id = session.getAttribute("loginId").toString(); //현재 로그인한 사람 아이디
		//해당 아이디 가지고 조회 예약정보 조회
		System.out.println("마이페이지 id : " + id);
	%>
		로그인 사용자 아이디 <%=id%>
		
		<form action="logout.jsp" method="post">
			<button type="submit">로그아웃</button>
		</form>
	<%
	} else {
		//로그인안한거
		System.out.println("로그인 안함");
		
		//로그인을 안했을때 보여줄 화면
		//location 로그인 안하면 접근안됨.
		%>
		<script>
		alert('잘못된 접근입니다.(로그인 필요)');
		location.href="login.jsp";
		</script>
		<%
	}
	%>
<button type="submit"><a href="Board.jsp">글쓰기</a></button>
</body>
</html>
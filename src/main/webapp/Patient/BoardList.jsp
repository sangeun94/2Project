
<%@ page import="java.util.List" %>
<%@ page import="db.dao.Patient.BoardDAO" %>
<%@ page import="db.dto.BoardDTO" %>
<%@ page import = "db.dao.Patient.PatientDAO" %>
<%@ page import = "db.dao.Patient.LoginDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 a {
        color: inherit;
        text-decoration: none;
    }
	a :hover{
		color: red;
	}
   
</style>
</head>
<body>

<%

	String loginId = (String) session.getAttribute("loginId");
    BoardDAO boardDAO = new BoardDAO();
	
    List<BoardDTO> boardList = boardDAO.getAllPosts();
    // somePatientId는 예시로 주어진 환자의 아이디입니다. 실제로는 세션에서 로그인한 사용자의 아이디 등을 가져와야 합니다.
    String somePatientId = "examplePatientId";
    PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientDTO = patientDAO.getPatientInfoById(somePatientId);
    
   
    
    String loginName = (String) session.getAttribute("loginName");
    if (loginId != null) {
        // 로그인한 사용자가 있을 경우, 해당 사용자의 정보를 가져옴
       
        patientDTO = patientDAO.getPatientInfoById(loginId);
    }
 
%>


<%
    if (boardList == null || boardList.isEmpty()) {
%>
    <p>등록된 게시물이 없습니다.</p>
<%
    } else {
        for (BoardDTO board : boardList) {
%>
			
	
	<table border = "1" width = "100%">
	
				
		<tr height="50px">
			<th width="25%">글번호</th>
			<th width="50%">제목</th>
			<th width="25%">작성자</th>
			
		</tr>
		<tr>
			
	<td align="center" onclick="goToContent(<%= board.getBoard_number() %>, this)">
    <a href="javascript:void(0)"><%= board.getBoard_number() %></a>
	</td>
	<td align="center" onclick="goToContent(<%= board.getBoard_number() %>, this)">
    <a href="javascript:void(0)"><%= board.getTitle() %></a>
	</td>
	 <td align="center" onclick="goToContent(<%= board.getBoard_number() %>, this)"> 
     <a href="javascript:void(0)"><%= board.getName()  %></a> 
    <!--!= getName() 뒤에 null ? board.getName() : loginName  -->
    
	</td>
			<!-- <td align="center" ><a href = "Content.jsp"><%= board.getBoard_number() %></td> -->
			<!-- <td align="center"><a href = "Content1.jsp"><%= board.getTitle() %></td> -->
			<!-- <td align="center"><a href = "Content1.jsp"><%= board.getName() %></td> -->
		</tr>
	</table>		
             
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
<button type="submit" onclick="goToBoard()">글쓰기</button>
<script>
		function goToBoard() {
		    window.location.href = "Board.jsp";
		}
		
		function goToContent(boardNumber, element) {
		    // 클릭 효과를 위해 clicked 클래스 추가
		    element.classList.add('clicked');

		    // Content1.jsp로 이동
		    window.location.href = "Content1.jsp?boardNumber=" + boardNumber;
		}
		
		
</script>
</body>
</html>
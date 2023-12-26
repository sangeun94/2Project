<%@ page import="db.dao.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Patient Information</title>
</head>
<body>
	
	<%
	String id = request.getParameter("id");
	System.out.println(id);
	
	PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientInfo = patientDAO.findPatientById(Integer.parseInt(id));
   
	%>
	<h1>환자의 상세 정보 페이지</h1>
	<%
	if (patientInfo == null) {
	%>
	<script>
	alert('잘못된 접근입니다.');
	location.href="index.jsp";
	</script>
	<%
	} else {
	%>
	<h2> 이 환자의 아이디는 <%=patientInfo.getId() %></h2>
	<h3> 이 환자의 이름은 <%=patientInfo.getName() %></h3>
 	<form id="patientForm" action="deletePatient_proc.jsp" method="post">  
	<input type="hidden" name="id" value="<%=patientInfo.getId()%>">
	<label>이름:<input type="text" id="input_name" name="name" value="<%=patientInfo.getName()%>"></label>
	<button id="modifyBtn" type="button"> 수정하기 </button>
	<button id="deleteBtn" type="button"> 삭제하기 </button>
	</form>
	
	<script>
	document.getElementById('deleteBtn').addEventListener('click', () => {
	    if (confirm('삭제 하시겠습니까?')) {
	        let form = document.getElementById('patientForm');
	        form.action = 'deletePatient_proc.jsp';
	        form.submit();
	    }
	});
	
	document.getElementById('modifyBtn').addEventListener('click', () => {
	    let input_name = document.getElementById('input_name');
	    if (input_name.value.trim() === '') {
	        alert('이름은 필수 입력입니다.');
	        input_name.focus();
	        return;
	    }
	
	    if (confirm('수정 하시겠습니까?')) {
	        let form = document.getElementById('patientForm');
	        form.action = 'modifyPatient_proc.jsp';
	        form.submit();
	    }
	});
	</script>
	<%
	}
	%>
</body>
</html>
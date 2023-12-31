<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 수정</title>
</head>
<body>
	
	<h1>예약내역 수정</h1>
	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
	        String reservation_number = request.getParameter("reservation_number");
	        if (reservation_number == null || reservation_number.isEmpty()) {
    %>
	            <script>
	                alert("오류: 올바른 예약 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
	            AdminReservationDAO dao = new AdminReservationDAO();
	            ReservationDTO reservation = dao.findAdminMyReservationById2(reservation_number);
	
	            if (reservation != null) {
    %>                   
	                <p>예약번호: <%=reservation.getReservation_number()%></p> 
	                <p>환자번호: <%=reservation.getPatient_number()%></p>
					<p>환자이름: <%=reservation.getPatient_name()%></p>
					
	                <!-- 진료 정보 입력 폼 -->
	                <form action="adminModifyReservation_proc.jsp" method="post">
	                    <input type="hidden" name="reservation_number" value="<%=reservation_number%>">
	                    <label>예약일 : </label><input type="date" name="reservation_date" value="<%=reservation.getReservation_date()%>"><br>
	                    <label>예약시간 : </label><input type="date" name="reservation_time" value="<%=reservation.getReservation_time()%>"><br>
   	                    접수상태: Y <input type="radio" name="reservation_status" value="Y" <%= "Y".equals(reservation.getReservation_status()) ? "checked" : "" %>>
                       			N <input type="radio" name="reservation_status" value="N" <%= "N".equals(reservation.getReservation_status()) ? "checked" : "" %>><br>
               			<label>진료과 : </label><input type="text" name="department_name" value="<%=reservation.getDepartment_name()%>"><br>
               			<label>진료의 : </label><input type="text" name="employee_name" value="<%=reservation.getEmployee_name()%>"><br>
	                    <label>예약내용 : </label><input type="text" name="reservation_content" value="<%=reservation.getReservation_content()%>"><br>
	                </form>  
    <%
            	} else {
    %>
                	<p>예약 정보를 찾을 수 없습니다.</p>
    <%
	            }
	        }
	    } else {
            // 로그인되지 않은 경우 처리
    %>
            <script>
                alert('로그인이 필요합니다.');
                location.href = "adminLogin.jsp"; // 로그인 페이지로 이동
            </script>
    <%
        }
    %>


</body>
</html>
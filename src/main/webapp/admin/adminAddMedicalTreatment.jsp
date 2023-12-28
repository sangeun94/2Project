<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진료차트 작성</title>
</head>
<body>
	<h1>진료차트 작성</h1>
	
	<hr>
      <%
   		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
	        // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	        
	        String reservation_number = request.getParameter("reservation_number");
	        System.out.println("reservation_number: " + reservation_number); // 디버깅 출력
	        AdminReservationDAO dao = new AdminReservationDAO();
	        ReservationDTO reservation = dao.findAdminMyReservationById2(reservation_number);
	
	        if (reservation != null) {
    %>
	            <p>
	                예약날짜: <%=reservation.getReservation_date()%><br>
	                예약시간: <%=reservation.getReservation_time()%><br>
	                환자번호: <%=reservation.getPatient_number()%><br>
	                의사번호: <%=reservation.getEmployee_number()%><br>
	               	예약내용: <%=reservation.getReservation_content()%><br>
	            </p>
	            
	            <hr>
	            
	              <!-- 진료 정보 입력 폼 -->
			    <form action="adminAddMedicalTreatment_proc.jsp" method="post">
			    	<!-- 진료번호는 시퀀스로 자동으로 1씩증가하는 형태로! -->
			    	<input type="hidden" name="treatment_date" value="<%=reservation.getReservation_date()%>">
			        <input type="hidden" name="treatment_time" value="<%=reservation.getReservation_time()%>">
			        <input type="hidden" name="patient_number" value="<%=reservation.getPatient_number()%>">
			        <input type="hidden" name="employee_number" value="<%=reservation.getEmployee_number()%>">
			        <input type="hidden" name="reservation_content" value="<%=reservation.getReservation_content()%>">
			        입원여부: Y <input type="radio" name="hospitalization_status" value="Y">
			                N <input type="radio" name="hospitalization_status" value="N"><br>
			        진료내용: <textarea name="treatment_content"></textarea><br>
			        <button type="submit">진료 정보 추가</button>
			    </form>  

    <%
        	} else {
    %>
            	<p>예약 정보를 찾을 수 없습니다.</p>
    <%
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
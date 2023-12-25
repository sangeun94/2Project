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
            </p>
            
            <hr>
            
              <!-- 진료 정보 입력 폼 -->
		    <form action="adminAddMedicalTreatment_proc.jsp" method="post">
		    	<input type="hidden" name="treatment_date" value="<%=reservation.getReservation_date()%>">
		        <input type="hidden" name="treatment_time" value="<%=reservation.getReservation_time()%>">
		        <input type="hidden" name="patient_number" value="<%=reservation.getPatient_number()%>">
		        <input type="hidden" name="employee_number" value="<%=reservation.getEmployee_number()%>">
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
    %>
	
	
	
</body>
</html>
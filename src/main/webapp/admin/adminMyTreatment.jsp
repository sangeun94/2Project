<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역 진료차트작성</title>
</head>
<body>
    <h1>예약내역 진료차트작성</h1>
    <%
        request.setCharacterEncoding("UTF-8");
        String employee_number = request.getParameter("employee_number");
        AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
        List<ReservationDTO> reservationList = adminReservationDAO.findAdminMyReservationTreatmentById(employee_number);

        if (reservationList != null && !reservationList.isEmpty()) {
            for (ReservationDTO reservation : reservationList) {
    %>
                <p>
                    예약날짜: <%=reservation.getReservation_date()%>
                    예약시간: <%=reservation.getReservation_time()%>
                    예약번호: <%=reservation.getReservation_number()%>
                    예약내용: <%=reservation.getReservation_content()%>
                    예약상태: <%=reservation.getReservation_status()%>
                    환자번호: <%=reservation.getPatient_number()%>
                    의사번호: <%=reservation.getEmployee_number()%>
                    과번호: <%=reservation.getDepartment_number()%>
                	<button onclick="location.href='adminAddMedicalTreatment.jsp?reservation_number=<%=reservation.getReservation_number()%>'" type="button">진료차트작성</button> 
                </p>
    <%
            }
        } else {
    %>
            <script> 
                alert('해당 환자 정보가 없습니다.');
                history.back(); //뒤로가기
            </script>
    <% 
        }
    %>
</body>
</html>
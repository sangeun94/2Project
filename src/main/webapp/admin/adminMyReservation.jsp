<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY예약내역</title>
</head>
<body>

    <h1>MY예약내역</h1>
    
    <form>
        <button type="submit">로그아웃</button>
    </form>
        
    <hr>
    
    <%
        request.setCharacterEncoding("UTF-8");
    
        String employee_number = request.getParameter("employee_number");
        System.out.println("MYreservation 파라미터 : " + employee_number);
        
        AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
        List<ReservationDTO> reservationList = adminReservationDAO.findAdminMyReservationById(employee_number);

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
                    <button onclick="location.href='adminPatientInfo.jsp?patient_number=<%=reservation.getPatient_number()%>'" type="button">환자정보보기</button>
                </p>
    <%
            }
        } else {
    %>
            <script> 
                alert('예약 정보가 없습니다.');
                history.back(); //뒤로가기
            </script>
    <% 
        }
    %>

</body>
</html>
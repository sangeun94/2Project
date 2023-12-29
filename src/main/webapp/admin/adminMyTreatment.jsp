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

        // 로그인 확인
        if (session != null && session.getAttribute("loginId") != null) {
            String employee_number = session.getAttribute("loginId").toString(); // 현재 로그인한 사용자의 아이디

            AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
            List<ReservationDTO> reservationList = adminReservationDAO.findAdminMyReservationTreatmentById(employee_number);

            // 예약 정보 출력
            if (reservationList != null && !reservationList.isEmpty()) {
                for (ReservationDTO reservation : reservationList) {
                    // 예약 정보 표시
    %>
                    <p>
                        로그인 사용자 아이디: <%=employee_number%>
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
                // 예약 정보가 없는 경우
                %>
                <p>해당 환자의 예약 정보가 없습니다.</p>
                <%
            }
        } else {
            // 로그인되지 않은 경우 처리
            %>
            <script>
                alert('로그인이 필요합니다.');
                location.href = "loginPage.jsp"; // 로그인 페이지로 리다이렉션
            </script>
            <%
        }
    %>
</body>
</html>
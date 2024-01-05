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
    <%
        request.setCharacterEncoding("UTF-8");

        // 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String employee_number = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + employee_number);

            AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
            List<ReservationDTO> reservationList = adminReservationDAO.findAdminMyReservationById(employee_number);

     %>
            
            <h1>MY예약내역</h1>
            
     <%

            if (reservationList != null && !reservationList.isEmpty()) {
                for (ReservationDTO reservation : reservationList) {
     %>      
                    <p>
                        예약번호: <%=reservation.getReservation_number()%>
                        환자번호: <%=reservation.getPatient_number()%>
                        예약날짜: <%=reservation.getReservation_date()%>
                        예약시간: <%=reservation.getReservation_time()%>
                        접수상태: <%=reservation.getReservation_status()%>
                        진료과: <%=reservation.getDepartment_name()%>
                        진료의: <%=reservation.getEmployee_name()%>
                        환자이름: <%=reservation.getPatient_name()%>
                        예약내용: <%=reservation.getReservation_content()%>
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
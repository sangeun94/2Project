<%@page import="db.dao.admin.AdminLoginDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");

	 	// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
	        // 세션에 저장된 로그인 아이디 사용
	        String employee_number = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + employee_number);

            // 예약 정보 조회
            AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
            List<ReservationDTO> reservationList = adminReservationDAO.findAdminReservationList();

            %><h1>모든 예약내역 보기</h1><hr><%

            for (ReservationDTO reservationInfo : reservationList) {
    %>  
                <p> 
                    예약번호: <%=reservationInfo.getReservation_number()%>
                    환자번호: <%=reservationInfo.getPatient_number()%>
                    예약날짜: <%=reservationInfo.getReservation_date()%>
                    예약시간: <%=reservationInfo.getReservation_time()%>
                    접수상태: <%=reservationInfo.getReservation_status()%>
                    진료과: <%=reservationInfo.getDepartment_name()%>
                    진료의: <%=reservationInfo.getEmployee_name()%>
                    환자이름: <%=reservationInfo.getPatient_name()%>
                    예약내용: <%=reservationInfo.getReservation_content()%>
                    <button onclick="location.href='adminPatientInfo.jsp?patient_number=<%=reservationInfo.getPatient_number()%>'" type="button">환자정보보기</button>
                	<button onclick="location.href='adminPatientInfo.jsp?patient_number=<%=reservationInfo.getPatient_number()%>'" type="button">예약내역 수정하기</button>
                </p>
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
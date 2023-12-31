<%@page import="db.dao.admin.AdminReservationDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약정보수정 결과</title>
</head>
<body>
		<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
		    request.setCharacterEncoding("UTF-8");
		    
		    // 폼에서 전달된 파라미터를 가져옵니다.
		    String reservation_number = request.getParameter("reservation_number");    
		    String reservation_date = request.getParameter("reservation_date");
		    String reservation_time = request.getParameter("reservation_time");
		    String reservation_status = request.getParameter("reservation_status");
		    String department_name = request.getParameter("department_name");
		    String employee_name = request.getParameter("employee_name");
		    String reservation_content = request.getParameter("reservation_content");
		    			
			System.out.println("reservation_number: " + reservation_number); // 디버깅 출력
	
		    // DTO 객체를 생성하고 값을 설정
		    ReservationDTO reservation = new ReservationDTO();
		    reservation.setReservation_number(reservation_number);
		    reservation.setReservation_date(reservation_date);
		    reservation.setReservation_time(reservation_time);
		    reservation.setReservation_status(reservation_status);
		    reservation.setDepartment_name(department_name);
		    reservation.setEmployee_name(employee_name);
		    reservation.setReservation_content(reservation_content);
		
		    // DAO 인스턴스를 생성하고 modifyMedicalTreatmentInfo 메소드를 호출.
		    AdminReservationDAO dao = new AdminReservationDAO();
		    int result = dao.modifyReservationInfo(reservation);
		
		    // 처리 결과에 따라 사용자에게 메시지를 보여주고, 적절한 페이지로 이동
		    if(result > 0) {
	%>
		        <script>
		            alert("예약 정보가 성공적으로 수정되었습니다.");
		            location.href = "../admin_patient/reservation_list.jsp"; // 성공 시 입원 목록 페이지로 리디렉션
		        </script>
	<%
	    	} else {
	%>
		        <script>
		            alert("예약 정보 수정에 실패했습니다.");
		            history.back(); // 실패 시 이전 페이지로 돌아감
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
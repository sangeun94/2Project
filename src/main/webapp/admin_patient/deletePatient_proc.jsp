<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 정보 삭제</title>
</head>
<body>
    <%
    int result = 0; // 결과 변수를 선언하고 초기화

    if (session != null && session.getAttribute("loginId") != null) {
        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
        System.out.println("로그인 id : " + loggedInEmployeeNumber);
        
        request.setCharacterEncoding("UTF-8"); // 문자 인코딩 설정
        
        // 배열로 파라미터 읽어오기
        String[] selectedPatients = request.getParameterValues("selectedPatients");

        // 선택된 환자 번호에 해당하는 작업 수행
        if (selectedPatients != null && selectedPatients.length > 0) {
            AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
            
            // 전체 문자열에서 숫자만 추출
            String allNumbers = String.join("", selectedPatients);
            String[] individualNumbers = allNumbers.split("[^0-9]");

            for (String patientNumber : individualNumbers) {
                // 빈 문자열이면 건너뛰기
                if (patientNumber.isEmpty()) {
                    continue;
                }

                // 선택된 각 환자 번호에 대한 처리
                // 예시: 환자 번호 출력
                System.out.println("선택된 환자 번호: " + patientNumber);

                // TODO: 선택된 환자 번호에 대한 삭제 또는 처리 로직을 여기에 추가
                // patientInfoDAO.removePatientInfoById(Integer.parseInt(patientNumber));
                result = patientInfoDAO.removePatientInfoById(Integer.parseInt(patientNumber));
            }
        }

        if (result > 0) {
    %>
            <script>
                alert('환자 정보가 삭제되었습니다.');
                location.href = 'patient_list.jsp'; // 해당 경로로 페이지 이동
            </script>
    <%
        } else {
    %>
            <script>
                alert('환자 정보를 삭제할 수 없습니다.');
                location.href = 'patient_list.jsp'; // 실패하더라도 목록 페이지로 이동
            </script>
    <%
        }
    } else {
        // 로그인되지 않은 경우
    %>
        <script>
            alert('정보를 삭제할 수 없습니다. 실패');
            alert('로그인이 필요합니다.');
            location.href = "../admin/adminLogin.jsp"; // 로그인 페이지로 이동
        </script>
    <%
    }
    %>
</body>
</html>
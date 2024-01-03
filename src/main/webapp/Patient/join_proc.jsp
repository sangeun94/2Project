<%@ page import="db.dao.Patient.PatientDAO" %>
<%@ page import="db.dto.PatientDTO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String emailRegex = "^[a-zA-Z0-9]+(?:[_.-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\\.[a-zA-Z0-9]+)+$";
%>
<script>
function validateForm() {
    // 클라이언트 측 유효성 검사 코드
    var emailInput = document.getElementsByName("email")[0];
    var email = emailInput.value;


    var nameInput = document.getElementsByName("name")[0];
    var name = nameInput.value;

    var addressInput = document.getElementsByName("address")[0];
    var address = addressInput.value;

    // 이메일 유효성 검사: @가 꼭 들어가야 하며, '@' 뒤에 문자열이 포함되어야 함
    //var emailRegex = /^[a-zA-Z0-9]+(?:[_.-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)+$/;
    var emailRegex = <%= emailRegex %>;
    if (!emailRegex.test(email)) {
        alert('이메일 형식이 올바르지 않습니다.');
        return false;
    }

    // 주소 유효성 검사: 특수문자 사용 금지
    var addressRegex = /^[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣\s]*$/;
    if (!addressRegex.test(address)) {
        alert('주소에는 특수문자를 사용할 수 없습니다.');
        return false;
    }

    // 이름 유효성 검사: 숫자와 특수문자 사용 금지
    var nameRegex = /^[a-zA-Z가-힣\s]*$/;
    if (!nameRegex.test(name)) {
        alert('이름에는 숫자와 특수문자를 사용할 수 없습니다.');
        return false;
    }

    // 서버 측 유효성 검사를 위해 true 반환
    return true;
}
</script>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8"); // 문자 인코딩 설정
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String jumin = request.getParameter("jumin");
    String phone_number = request.getParameter("phone_number");
    String address = request.getParameter("address");
    
    // 서버 측 유효성 검사
    if (!jumin.matches("\\d+")  ) {
%>
    <script>
        alert('저장 실패. 주민번호에는 숫자만 입력 가능합니다.');
        history.back(); // 뒤로가기
    </script>
<%
    } else if (!phone_number.matches("\\d+")) {
%>
    <script>
        alert('저장 실패. 전화번호에는 숫자만 입력 가능합니다.');
        history.back(); // 뒤로가기
    </script>
<%
    } else if (!email.matches(emailRegex)) {
%>
    <script>
        alert('이메일 형식이 올바르지 않습니다.');
        history.back(); // 뒤로가기
    </script>

<%
    } else {
        PatientDTO patientInfo = new PatientDTO();
        patientInfo.setId(id);
        patientInfo.setPassword(password);
        patientInfo.setEmail(email);
        patientInfo.setName(name);
        patientInfo.setJumin(jumin);
        patientInfo.setPhone_number(phone_number);
        patientInfo.setAddress(address);

        PatientDAO patientDAO = new PatientDAO();

        int result = patientDAO.savePatientInfo(patientInfo);

        // 회원 가입 후 세션에 사용자 정보 저장
        session.setAttribute("loggedInUser", patientInfo);

        if (result > 0) {
%>
            <script>
                alert('회원가입이 되었습니다. 로그인을 해주세요.');
                location.href = 'Login.jsp'; // 해당 경로로 페이지 이동
            </script>
<%
        } else {
%>
            <script>
                alert('회원가입을 실패하셨습니다.');
                history.back(); // 뒤로가기
            </script>
<%
        }
    }
%>
</body>
</html>
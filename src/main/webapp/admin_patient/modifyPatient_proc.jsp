<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
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
		request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
		int patient_status_code = 0;
		String patient_number = request.getParameter("patient_number");
		String name = request.getParameter("name");
		String jumin = request.getParameter("jumin");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String address = request.getParameter("address");
		
		
		if( id == null ){
			patient_status_code = 3;
		} else{
			patient_status_code = 1;
		}
		
		if( name == null){
			//이름이 안넘어왔는데?
		}
		
		
		if (patient_number != null && !patient_number.isEmpty()) {
			System.out.println("modifyPerson_proc 파라미터 : " + patient_number + " " + name);
			int intPatientNumber = Integer.parseInt(patient_number);
			
			AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
			PatientDTO patientInfo = new PatientDTO();
			patientInfo.setPatient_number(intPatientNumber);
			patientInfo.setName(name);
			patientInfo.setJumin(jumin);
			patientInfo.setPhone_number(phone_number);
			patientInfo.setEmail(email);
			patientInfo.setId(id);
			patientInfo.setAddress(address);
			patientInfo.setPatient_status_code(patient_status_code);
			
			
			int result = patientInfoDAO.modifyPatientInfo(patientInfo);
			
			%>
				<script>
					alert('수정 성공');
					location.href = 'patient_list.jsp?patient_number=<%=patient_number%>'; //해당 경로로 페이지 이동
				</script>
			<%
			} else {
			%>
				<script>
					alert('수정 실패');
					history.back(); //뒤로가기
				</script>
			<%	
				}
			%>
</body>
</html>
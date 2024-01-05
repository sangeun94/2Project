<%@ page import="db.dto.EmployeeDTO"%>
<%@ page import="db.dao.admin.AdminLoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>   
   <%
      request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 -> 콘솔창에 제대로 한글로 나오게끔!
      
      //id password 둘다 넘겨줘야한다!
      String employee_number = request.getParameter("employee_number"); //getParameter("가져올컬럼별명")
      String password = request.getParameter("password"); //getParameter("가져올컬럼별명")
      
      System.out.println("adminLogin_proc 파라미터 : " + employee_number + " " + password);
      
      AdminLoginDAO adminLoginDAO = new AdminLoginDAO();
      EmployeeDTO employeeInfo = adminLoginDAO.findEmployeeById(employee_number);
      
      
      //오류페이지 뜨게하지 않기 위해! 예외처리해줌 
      if (employeeInfo == null) {
   %>      
         <h2>해당 사용자 정보가 없습니다.</h2>
      <script> //alert창 뜨고 로그인페이지로 보내버리는!
         alert('아이디 또는 비밀번호를 확인하세요.');
         location.href = "../admin/adminLogin.jsp";
      </script>
   <%   
      } else { 
         if(employee_number.equals(employeeInfo.getEmployee_number()) && password.equals(employeeInfo.getPassword())) {
            //로그인 성공
            session.setAttribute("loginId", employee_number);
   %>         
            <script>
               /* alert('로그인 성공'); */
               location.href = '../admin_patient/patient_list.jsp?employee_number=<%=employee_number%>'; //해당 경로로 페이지 이동
            </script>
         <%   
            } else {
         %>   
            <script>
               alert('로그인 실패');
               //location.href = 'addPerson.jsp'; //신규인원추가로 가면 안되짘ㅋㅋ
               history.back(); //뒤로가기
            </script>
         <%   
            }
      }
   %>
   
      
   
</body>
</html>
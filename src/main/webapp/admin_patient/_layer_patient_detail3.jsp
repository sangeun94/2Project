<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/my_reservation_list.jsp" %>
<%@ page import="db.dto.PatientDTO"%>
<%@ page import="db.dao.admin.AdminPatientInfoDAO" %>

<!-- 차트 작성하기 상세
<section id="contents">
   <%@ include file="../admin_layout/hgroup.jsp" %>
   <script>
   let gnbDep1 = 1;
    let lnbDep1 = 5;
    let lnbDep2 = 0;
    let lnbDep3 = 0;
    let title = '차트 작성하기';
   </script>
   <article>
   </article>
</section>       -->
   
<div class="pop_wrap">
      <div class="pop_ct large">
         <h3></h3>         
         <div class="tabArea">
            <ul class="tab">
               <li style="width:100%"><a href="#tab_sub1" class="on">기본 정보</a></li>
            </ul>         
   
<%
        request.setCharacterEncoding("UTF-8");

        // 로그인 확인
        if (session != null && session.getAttribute("loginId") != null) {
        	// 세션에 저장된 로그인 아이디 사용
            String employee_number = session.getAttribute("loginId").toString();
            System.out.println("로그인 id : " + employee_number);
        	
            String patient_number = request.getParameter("patient_number");
            System.out.println("patientInfo 파라미터 : " + patient_number);

            int intPatientNumber = Integer.parseInt(patient_number);
            AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
            PatientDTO patientInfo = patientInfoDAO.findPatientByNum(intPatientNumber);

            if (patientInfo != null) {
%>
         <!-- 기본 정보 -->
         <div id="tab_sub1">
            <table class="viewTable">
               <colgroup><col width="220px" /><col width="15%" /><col width="*" /><col width="15%" /><col width="*" /></colgroup>
               <tbody>
               <tr>
                  <td rowspan="5">
                     <p class="pic_area">
                        <span id="idPic">Profile Image</span>
                     </p>
                  </td>
                  <th>환자번호</th>
                  <td><%= patientInfo.getPatient_number() %></td>               
                  <th>이름</th>
                  <td><%= patientInfo.getName() %></td>
               </tr>
               <tr>
                  <th>상태코드</th>
                  <td><%= patientInfo.getPatient_status_code() %></td>
                  <th>주민등록번호</th>
                  <td><%= patientInfo.getJumin() %></td>
               </tr>
               <tr>
                  <th>휴대전화번호</th>
                  <td><%= patientInfo.getPhone_number() %></td>
                  <th>이메일주소</th>
                  <td><%= patientInfo.getEmail() %></td>
               </tr>
               <tr>
                  <th>회원아이디</th>
                  <td><%= patientInfo.getId() %></td>
                  <th>주소</th>
                  <td><%= patientInfo.getAddress() %></td>
               </tr>
               </tbody>
            </table>
         </div>
<%
            } else {
    %>
                <script> 
                    alert('해당 환자 정보가 없습니다.');
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

         <!-- 관리 메모 -->
         <!-- <div id="tab_sub2">   
            <table class="viewTable">
               <colgroup><col width="20%" /><col width="*" /></colgroup>
               <tbody>
               <tr>
                  <th>관리 메모</th>
                  <td><textarea placeholder="환자 관련 내용을 입력하세요."></textarea></td>
               </tr>               
               </tbody>
            </table>
            <p class="btn_c">
               <a href="" class="red">등록하기</a>
            </p>               
         </div> -->            
         <button class="pop_close">닫기</button>
      </div>
   </div>            
   <!--// pop-->
   
  <script>
  $( function() {
   //tab
   $(".tabArea .tab a").click(function(){
      $($(this).attr("href")).fadeIn(300);
      $(this).addClass("on");
      $($(this).parents(".tabArea").children("div")).not($(this).attr("href")).fadeOut(0);
      $($(this).parents(".tab").find("a")).not(this).removeClass("on");
      return false;
   });   
   
   //피드구분 다중선택
   $(".tag_multi>li>span").click(function(){
      $(this).toggleClass("on");      
   });
  } );
  </script>   
  <%@ include file="../admin_layout/footer.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/treatment_list.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>
<%@ page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>

<%-- <%@ include file="../admin_layout/hgroup.jsp" %> --%>
<!-- 차트 작성하기 상세
<section id="contents">
	
	<script>
	let gnbDep1 = 1;
    let lnbDep1 = 5;
    let lnbDep2 = 0;
    let lnbDep3 = 0;
    let title = '차트 작성하기';
	</script>
	<article>
	</article>
</section>		 -->
	
	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
	        String treatmentNumberStr = request.getParameter("treatment_number");
	        if (treatmentNumberStr == null || treatmentNumberStr.isEmpty()) {
    %>
    	        <script>
	                alert("오류: 올바른 진료 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
	            int treatment_number = Integer.parseInt(treatmentNumberStr);
	            AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
	            MedicalTreatmentDTO medicalTreatment = dao.findAdminMedicalTreatmentById(treatment_number);
	
	            if (medicalTreatment != null) {
    %>  
	<!--pop-->
	<div class="pop_wrap">
		<div class="pop_ct large">
			<h3></h3>			
			<div class="tabArea">
				<ul class="tab">
					<li style="width:100%"><a href="#tab_sub1" class="on">진료차트 수정</a></li>
				</ul>			
				<!-- 기본 정보 -->
			<div id="tab_sub1">
				<table class="viewTable">
					<colgroup><col width="220px" /><col width="15%" /><col width="*" /><col width="15%" /><col width="*" /></colgroup>
					<tbody>
					<tr>
						<td rowspan="5">
							<p class="pic_area">
								<span id="idPic"></span>
							</p>
						</td>
						<th>진료번호</th>
						<td><%=medicalTreatment.getTreatment_number()%></td>					
						<th>환자번호</th>
						<td><%=medicalTreatment.getPatient_number()%></p></td>
					</tr>
					<tr>
						<th>진료일</th>
						<td><%=medicalTreatment.getTreatment_date()%></td>
						<th>진료시간</th>
						<td><%=medicalTreatment.getTreatment_time()%></td>
					</tr>
					<tr>
						<th>환자이름</th>
						<td><%=medicalTreatment.getPatient_name()%></td>
					<form action="../admin/adminModifyTreatment_proc.jsp" method="post">
						<input type="hidden" name="treatment_number" value="<%=treatment_number%>">
						<th>입원여부</th>
						<td>Y <input type="radio" name="hospitalization_status" value="Y" <%= "Y".equals(medicalTreatment.getHospitalization_status()) ? "checked" : "" %>>
			                N <input type="radio" name="hospitalization_status" value="N" <%= "N".equals(medicalTreatment.getHospitalization_status()) ? "checked" : "" %>><br></td>
					</tr>
					</tbody>
				</table>
			</div>

			        <textarea name="treatment_content" placeholder="진료 내용을 입력하세요."><%=medicalTreatment.getTreatment_content()%></textarea><br>
			        <p class="btn_c">
						<a href="" class="red"><button type="submit">수정하기</button></a>
					</p>
			        
			    </form>	
	<%
            	} else {
    %>
                	<p>진료 정보를 찾을 수 없습니다.</p>
    <%
	            }
	        }
	    } else {
            // 로그인되지 않은 경우 처리
    %>
            <script>
                alert('로그인이 필요합니다.');
                location.href = "../admin/adminLogin.jsp"; // 로그인 페이지로 이동
            </script>
    <%
        }
    %>
						
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
  <!-- <%@ include file="../admin_layout/footer.jsp" %> -->
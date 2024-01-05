<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/chart_list.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>
<%@page import="java.util.List"%>
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
	        
	        String reservation_number = request.getParameter("reservation_number");
	        System.out.println("reservation_number: " + reservation_number); // 디버깅 출력
	        AdminReservationDAO dao = new AdminReservationDAO();
	        ReservationDTO reservation = dao.findAdminMyReservationById2(reservation_number);
	
	        if (reservation != null) {
	%>
	<!--pop-->
	<div class="pop_wrap">
		<div class="pop_ct large">
			<h3></h3>			
			<div class="tabArea">
				<ul class="tab">
					<li style="width:100%"><a href="#tab_sub1" class="on">진료차트 작성</a></li>
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
						<th>예약일</th>
						<td><%=reservation.getReservation_date()%></td>					
						<th>예약시간</th>
						<td><%=reservation.getReservation_time()%></td>
					</tr>
					<tr>
						<th>환자번호</th>
						<td><%=reservation.getPatient_number()%></td>
						<th>환자이름</th>
						<td><%=reservation.getPatient_name()%></td>
					</tr>
					<tr>
						<th>예약내용</th>
						<td><%=reservation.getReservation_content()%></td>
					<form action="../admin/adminAddMedicalTreatment_proc.jsp" method="post">
					<!-- 진료번호는 시퀀스로 자동으로 1씩증가하는 형태로! -->
				    	<input type="hidden" name="treatment_date" value="<%=reservation.getReservation_date()%>">
				        <input type="hidden" name="treatment_time" value="<%=reservation.getReservation_time()%>">
				        <input type="hidden" name="patient_number" value="<%=reservation.getPatient_number()%>">
				        <input type="hidden" name="employee_number" value="<%=reservation.getEmployee_number()%>">
				        <input type="hidden" name="reservation_content" value="<%=reservation.getReservation_content()%>">
						<th>입원여부</th>
						<td>Y <input type="radio" name="hospitalization_status" value="Y">
			                N <input type="radio" name="hospitalization_status" value="N"><br></td>
					</tr>
					</tbody>
				</table>
			</div>

			        <textarea name="treatment_content" placeholder="진료 내용을 입력하세요."></textarea><br>
			        <p class="btn_c">
						<a href="" class="red"><button type="submit">진료 정보 추가</button></a>
					</p>
			        
			    </form>	
	<%
        	} else {
    %>
            	<p>예약 정보를 찾을 수 없습니다.</p>
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
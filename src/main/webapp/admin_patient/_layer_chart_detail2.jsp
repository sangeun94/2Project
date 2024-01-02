<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/hospitalChart_list.jsp" %>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>
<%@page import="db.dto.InpatientRoomDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dto.MedicalTreatmentDTO"%>
<%@page import="db.dao.admin.AdminMedicalTreatmentDAO"%>

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
    	
	        String patient_number = request.getParameter("patient_number");
	        System.out.println("patient_number: " + patient_number); // 디버깅 출력
	        AdminMedicalTreatmentDAO dao = new AdminMedicalTreatmentDAO();
	        MedicalTreatmentDTO medicalTreatment = dao.findAdminMedicalTreatmentListById2(patient_number);
	        
	        AdminHospitalizationDAO dao2 = new AdminHospitalizationDAO();
	        List<InpatientRoomDTO> inpatientRoomList = dao2.findInpatientRoomList(); // 입원실 현재 인원 조회
	
    %>
    	<!--pop-->
	<div class="pop_wrap">
		<div class="pop_ct large">
			<h3></h3>			
			<div class="tabArea">
				<ul class="tab">
					<li style="width:100%"><a href="#tab_sub1" class="on">입원차트 작성</a></li>
				</ul>
    
				
<%
	if (medicalTreatment != null) {
%>			
			<!-- 기본 정보 -->
			<div id="tab_sub1">
				<table class="viewTable">
					<colgroup><col width="220px" /><col width="15%" /><col width="*" /><col width="15%" /><col width="*" /></colgroup>
					<tbody>
					<tr>
						<td rowspan="3">
							<p class="pic_area">
								<span id="idPic">Profile Image</span>
							</p>
						</td>
						<th>진료일</th>
						<td><%=medicalTreatment.getTreatment_date()%></td>					
						<th>진료시간</th>
						<td><%=medicalTreatment.getTreatment_time()%></td>
					</tr>
					<tr>
						<th>환자번호</th>
						<td><%=medicalTreatment.getPatient_number()%></td>
						<th>환자이름</th>
						<td><%=medicalTreatment.getPatient_name()%></td>
					</tr>
					<tr>
						<th>진료내용</th>
						<td colspan="3"><%=medicalTreatment.getTreatment_content()%></td>				
					</tr>
					</tbody>
				</table>
				
				<table class="viewTable">
					<colgroup><col width="50%" /><col width="50%" /></colgroup>
					<tbody>
					<tr>
						<th>입원실 번호</th>					
						<th>현재 인원</th>
					</tr>
					</tbody>
				</table>
			
 <%
        	for (InpatientRoomDTO room : inpatientRoomList) {
    %>
    					<!-- 기본 정보 -->
			
				<table class="viewTable">
					<colgroup><col width="50%" /><col width="50%" /></colgroup>
					<tbody>
					<tr>
						<td style="text-align: center"><%= room.getInpatient_room_number() %></td>					
						<td style="text-align: center"><%= room.getPatient_number() %></td>
					</tr>
					</tbody>
				</table>
	            
    <%
        	}
    		
    %>
    
    
    </div>
				<form action="../admin/adminAddHospitalization_proc.jsp" method="post">
					<!-- 진료번호는 시퀀스로 자동으로 1씩증가하는 형태로! -->
				   	<input type="hidden" name="patient_number" value="<%=medicalTreatment.getPatient_number()%>" >
				    <label>입원일 : </label>
				    	<input type="text" name="hospitalization_date" id="idHospitalizationDate" class="txt" style="width:120px" autocomplete="off" >
				    	<a href="javascript:;" class="btn_datepicker">달력</a>
				    <label>퇴원일 : </label>
				    	<input type="text" name="discharge_date" id="idDischargeDate" class="txt" style="width:120px" autocomplete="off">
				    	<a href="javascript:;" class="btn_datepicker">달력</a>
				    <label>입원실번호 : </label>
				    	<select name="inpatient_room_number" style="width:200px;">
		                    <option value="701">701</option>
		                    <option value="702">702</option>
		                    <option value="703">703</option>
		                    <option value="704">704</option>
		                    <option value="705">705</option>
		                    <option value="801">801</option>
		                    <option value="802">802</option>
		                    <option value="803">803</option>
		                    <option value="804">804</option>
		                    <option value="805">805</option>
						</select>
			        <p class="btn_c">
						<a href="" class="red"><button type="submit">입원 정보 추가</button></a>
					</p>
			        
			    </form>		    
		
	<%
        	} else {
    %>
            	<p>진료 정보를 찾을 수 없습니다.</p>
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
	
	
<link rel="stylesheet" href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css" type="text/css" />
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$("#idHospitalizationDate").datepicker($.datepicker.regional.ko);
	$("#idDischargeDate").datepicker($.datepicker.regional.ko);
});
</script>

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
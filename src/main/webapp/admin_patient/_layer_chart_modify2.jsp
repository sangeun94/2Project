<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/hospitalization_list.jsp" %>
<%@page import="db.dto.HospitalizationDTO"%>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>

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
	
	        String hospitalizationNumberStr = request.getParameter("hospitalization_number");
	        if (hospitalizationNumberStr == null || hospitalizationNumberStr.isEmpty()) {
    %>
	            <script>
	                alert("오류: 올바른 입원 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
	            int hospitalization_number = Integer.parseInt(hospitalizationNumberStr);
	            AdminHospitalizationDAO dao = new AdminHospitalizationDAO();
	            HospitalizationDTO hospitalization = dao.findAdminHospitalizationById(hospitalization_number);

    %>       
	<!--pop-->
	<div class="pop_wrap">
		<div class="pop_ct large">
			<h3></h3>			
			<div class="tabArea">
				<ul class="tab">
					<li style="width:100%"><a href="#tab_sub1" class="on">입원차트 수정</a></li>
				</ul>
				
	<%
			if (hospitalization != null) {
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
						<th>입원번호</th>
						<td><%=hospitalization.getHospitalization_number()%></td>					
						<th>환자번호</th>
						<td><%=hospitalization.getPatient_number()%></p></td>
					</tr>
					<tr>
						<th>환자이름</th>
						<td><%=hospitalization.getPatient_name()%></td>
					
					</tbody>
				</table>
			</div>
			
				<form action="../admin/adminModifyHospitalization_proc.jsp" method="get">
					
					<input type="hidden" name="hospitalization_number" value="<%=hospitalization.getHospitalization_number()%>">        
			        <label>입원일 : </label>
				    	<input type="date" name="hospitalization_date" value="<%=hospitalization.getHospitalization_date()%>" id="idHospitalizationDate" class="txt" style="width:120px" autocomplete="off">
				    	<!-- <a href="javascript:;" class="btn_datepicker">달력</a> -->
				    <label>퇴원일 : </label>
				    	<input type="date" name="discharge_date" value="<%=hospitalization.getDischarge_date()%>" id="idDischargeDate" class="txt" style="width:120px" autocomplete="off">
				    	<!-- <a href="javascript:;" class="btn_datepicker">달력</a> -->
				    <label>입원실번호 : </label>
				    	<select name="inpatient_room_number" style="width:200px;">
		                    <option value="701" <%= "701".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>701</option>
						    <option value="702" <%= "702".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>702</option>
						    <option value="703" <%= "703".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>703</option>
						    <option value="704" <%= "704".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>704</option>
						    <option value="705" <%= "705".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>705</option>
						    <option value="801" <%= "801".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>801</option>
						    <option value="802" <%= "802".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>802</option>
						    <option value="803" <%= "803".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>803</option>
						    <option value="804" <%= "804".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>804</option>
						    <option value="805" <%= "805".equals(hospitalization.getInpatient_room_number()) ? "selected" : "" %>>805</option>
						</select>
			        	
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

<link rel="stylesheet" href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css" type="text/css" />
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	console.log($("#idHospitalizationDate").length); // 이 코드는 해당 ID를 가진 요소가 있는지 확인합니다.
	console.log($("#idHospitalizationDate").length); // 이 코드는 해당 ID를 가진 요소가 있는지 확인합니다.
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
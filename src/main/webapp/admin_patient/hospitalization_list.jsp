<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>
<%@page import="db.dto.HospitalizationDTO"%>
<%@page import="java.util.List"%>
<%@page import="db.dao.admin.AdminHospitalizationDAO"%>

<!-- 환자 관리 - 입퇴원 관리 -->
<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp" %>
	
	<script>
        let gnbDep1 = 1;
        let lnbDep1 = 7;
        let lnbDep2 = 0;
        let lnbDep3 = 0;
        let title = '입퇴원 관리';
	</script>

	<article>
		<fieldset class="search_box">
			<label>입원일 : </label>
				<input type="text" id="idHospitalizationDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>
			<label>퇴원일 : </label>
				<input type="text" id="idDischargeDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>
			<label>성별 : </label>
				<select style="width:200px;">
					<option value="">전체</option>
					<option value="">여성</option>
					<option value="">남성</option>
				</select>
			<p>			
				<label>입원실 : </label>
					<select style="width:200px;">
						<option value="">전체</option>
	                    <option value="">701</option>
	                    <option value="">702</option>
	                    <option value="">703</option>
	                    <option value="">704</option>
	                    <option value="">705</option>
	                    <option value="">801</option>
	                    <option value="">802</option>
	                    <option value="">803</option>
	                    <option value="">804</option>
	                    <option value="">805</option>
					</select>	
					
				<label></label>
					<select style="width:120px;">				
						<option value="">이름</option>
	                    <option value="">환자번호</option>
						<option value="">진료번호</option>
						<option value="">진료과</option>
						<option value="">진료의</option>
						<option value="">주민등록번호</option>
						<option value="">휴대전화번호</option>
						<option value="">주소</option>
					</select>				
					<input type="text" class="txt" style="width:200px" >	
				<a href="javascript:FuncSearch(1);" class="btn_search">검색</a>
			</p>
		</fieldset>


	<%
		// 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String loggedInEmployeeNumber = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + loggedInEmployeeNumber);
	
			AdminHospitalizationDAO adminHospitalizationDAO = new AdminHospitalizationDAO();
			List<HospitalizationDTO> hospitalizationList = adminHospitalizationDAO.findAdminHospitalizationList();
			
	%>
		<p class="total_top">총 <b><%= hospitalizationList != null ? hospitalizationList.size() : 0 %></b>개</p>
		<table class="listTable" style="margin-top:20px;">
			<colgroup>
                <col width="5%" />
                <col width="5%" />
                <col width="10%" />
                <col width="10%" />
                <col width="10%" />
                <col width="5%" />
                <col width="5%" />
                <col width="8%" />
			</colgroup>
			<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>입원번호</th>
				<th>입원일</th>
				<th>퇴원일</th>
				<th>입원실</th>
				<th>환자번호</th>
				<th>환자이름</th>
				<th>입원차트수정</th>
			</tr>
			</thead>
			<tbody>
			
<% 
	for(HospitalizationDTO hospitalizationInfo : hospitalizationList) {
%>			
			<tr>
				<td><input type="checkbox"></td>
				<td> <%=hospitalizationInfo.getHospitalization_number()%> </td>
				<td><%=hospitalizationInfo.getHospitalization_date()%></td>			
				<td><%=hospitalizationInfo.getDischarge_date()%></td>	
				<td><%=hospitalizationInfo.getInpatient_room_number()%></td>	
				<td><%=hospitalizationInfo.getPatient_number()%></td>
				<td><%=hospitalizationInfo.getPatient_name()%></td>
				<td><a href="./_layer_chart_modify2.jsp?hospitalization_number=<%=hospitalizationInfo.getHospitalization_number()%>">수정하기</a></td>
			</tr>
<%
	}
%>			
			
			</tbody>
		</table>	
					
	</article>
</section>	

<%
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

<link rel="stylesheet" href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css" type="text/css" />
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js" charset="utf-8"></script>
<script type="text/javascript">
$(function() {
	$("#idHospitalizationDate").datepicker($.datepicker.regional.ko);
	$("#idDischargeDate").datepicker($.datepicker.regional.ko);
});
</script>
<%@ include file="../admin_layout/footer.jsp" %>
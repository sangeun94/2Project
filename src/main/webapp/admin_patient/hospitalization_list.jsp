<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>

<!-- 환자 관리 - 입퇴원 관리 -->
<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp" %>
	
	<script>
        let gnbDep1 = 1;
        let lnbDep1 = 6;
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


		<p class="total_top">총 <b>00</b>개</p>
		<table class="listTable" style="margin-top:20px;">
			<colgroup>
                <col width="5%" /><col width="15%" /><col width="15%" /><col width="15%" /><col width="20%" /><col width="35%" />
			</colgroup>
			<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>입원일</th>
				<th>퇴원일</th>
				<th>입원실</th>
				<th>환자번호</th>
				<th>이름</th>
			</tr>
			</thead>
			<tbody>
			
			<tr>
				<td><input type="checkbox"></td>
				<td>2023-01-01</td>
				<td>2023-01-05</td>			
				<td>701</td>	
				<td>3</td>	
				<td><a href="./_layer_patient_detail.html"></a>이영희</td>
			</tr>
			</tbody>
		</table>	
					
	</article>
</section>	

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
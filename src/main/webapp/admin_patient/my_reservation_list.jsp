<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>

<!-- 환자 관리 - MY 예약 확인 -->
<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp" %>

	<script>
        let gnbDep1 = 1;
        let lnbDep1 = 3;
        let lnbDep2 = 0;
        let lnbDep3 = 0;
        let title = 'MY 예약 확인';
	</script>

	<article>
		<!-- <fieldset class="search_box">
			<label>예약일 : </label>
				<input type="text" id="idReservationDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>
			<label>성별 : </label>
				<select style="width:200px;">
					<option value="">전체</option>
					<option value="">여성</option>
					<option value="">남성</option>
				</select>		
			<label>주소 : </label>
				<select style="width:200px;">
					<option value="">전체</option>
                    <option value="">서울특별시</option>
                    <option value="">부산광역시</option>
                    <option value="">대구광역시</option>
                    <option value="">인천광역시</option>
                    <option value="">광주광역시</option>
                    <option value="">대전광역시</option>
                    <option value="">울산광역시</option>
                    <option value="">세종특별자치시</option>
                    <option value="">경기도</option>
                    <option value="">강원특별자치도</option>
                    <option value="">충청북도</option>
                    <option value="">충청남도</option>
                    <option value="">전라북도</option>
                    <option value="">전라남도</option>
                    <option value="">경상북도</option>
                    <option value="">경상남도</option>
				</select>	
			<p>	
			<label>생년월일 : </label>
				<input type="text" id="idStartDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>
				<input type="text" id="idEndDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>	
			</p>	
			<p>		
				</select>	
			<label></label>
				<select style="width:120px;">				
					<option value="">이름</option>
					<option value="">예약번호</option>
                    <option value="">환자번호</option>
					<option value="">주민등록번호</option>
					<option value="">휴대전화번호</option>
					<option value="">진료의</option>
					<option value="">진료과</option>
				</select>				
				<input type="text" class="txt" style="width:200px" >	
			<a href="javascript:FuncSearch(1);" class="btn_search">검색</a>
			</p>
		</fieldset> -->

		<div class="sort_area">
			<select id="idListSize">
				<option value="30" selected="selected">30개씩 보기</option>
				<option value="50">50개씩 보기</option>
				<option value="100">100개씩 보기</option>
                <option value="200">200개씩 보기</option>			
			</select>		
			<span class="btns">
				<a href="" class="blue">선택 다운로드</a>
				<a href="" class="green ml05">전체 다운로드</a>
			</span>
		</div>

		<p class="total_top">총 <b>00</b>개</p>
		<table class="listTable" style="margin-top:20px;">
			<colgroup>
                <col width="5%" /><col width="5%" /><col width="5%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="10%" /><col width="20%" /><col width="*" />
			</colgroup>
			<thead>
			<tr>
				<th><input type="checkbox"></th>
				<th>예약번호</th>
				<th>환자번호</th>
				<th>예약일</th>
				<th>예약시간</th>
				<th>진료과</th>
				<th>진료의</th>
				<th>이름</th>
				<th>주민등록번호</th>
				<th>휴대전화번호</th>
			</tr>
			</thead>
			<tbody>
			<!-- 검색 결과 -->
			<!-- <tr>
				<td class="no-data" colspan="10">검색결과 없음</td>
			</tr>			 -->
			<tr>
				<td><input type="checkbox"></td>
				<td>1</td>
				<td>1</td>
				<td>2023-12-01</td>
				<td>2시</td>
				<td>이비인후과</td>
				<td>김다영</td>
				<td><a href="./_layer_patient_detail.html">홍길동</a></td>
				<td>950101-1234567</td>
				<td>010-1111-1111</td>
			</tr>
			</tbody>
		</table>	
		<div class="btns_top mt20">
			<a href="" class="red">선택 삭제</a>
		</div>		
        
		<p class="pagination" id="idPaging">	
            <a href=""><img src="../resources/img/btn/paging1.png" alt="처음" /></a>
            <a href=""><img src="../resources/img/btn/paging2.png" alt="이전" /></a>
			<span>
				<a href="javascript:FuncSearch(1);" class="on">1</a>
				<a href="javascript:FuncSearch(1);">2</a>
				<a href="javascript:FuncSearch(1);">3</a>
				<a href="javascript:FuncSearch(1);">4</a>
				<a href="javascript:FuncSearch(1);">5</a>
				<a href="javascript:FuncSearch(1);">6</a>
				<a href="javascript:FuncSearch(1);">7</a>
				<a href="javascript:FuncSearch(1);">8</a>
				<a href="javascript:FuncSearch(1);">9</a>
				<a href="javascript:FuncSearch(1);">10</a>
			</span>
			<a href=""><img src="../resources/img/btn/paging3.png" alt="다음" /></a>
			<a href=""><img src="../resources/img/btn/paging4.png" alt="마지막" /></a>
		</p>			
	</article>
</section>	

<link rel="stylesheet" href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css" type="text/css" />
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript" src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js" charset="utf-8"></script>
<!-- <script type="text/javascript">
$(function() {
	$("#idStartDate").datepicker($.datepicker.regional.ko);
	$("#idEndDate").datepicker($.datepicker.regional.ko);
	$("#idReservationDate").datepicker($.datepicker.regional.ko);
});
</script> -->
<%@ include file="../admin_layout/footer.jsp" %>
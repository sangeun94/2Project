<%@ page import="db.dto.PatientDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="db.dao.admin2.AdminPatientInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp"%>
<%@ include file="../admin_layout/_lnb_patient.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../resources/plug-in/jquery-ui/css/jquery.dataTable.css">
<%
request.setCharacterEncoding("UTF-8"); //문자인코딩 설정
AdminPatientInfoDAO patientInfoDAO = new AdminPatientInfoDAO();
List<PatientDTO> PatientInfoList = patientInfoDAO.findPatientInfoList();
%>



<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp"%>

	<script>
        let gnbDep1 = 1;
        let lnbDep1 = 1;
        let lnbDep2 = 0;
        let lnbDep3 = 0;
        let title = '환자 정보 조회';
	</script>

	<article>


		<%-- <fieldset class="search_box">
			<label>등록일자 : </label>
				<input type="text" id="idRegStartDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>
				<input type="text" id="idRegEndDate" class="txt" style="width:120px" ><a href="javascript:;" class="btn_datepicker">달력</a>					
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
				<!-- </select>	 -->
			<label></label>
				<select style="width:120px;">				
					<option value="">이름</option>
					<option value="">회원아이디</option>
                    <option value="">환자번호</option>
					<option value="">이메일</option>
					<option value="">주민등록번호</option>
					<option value="">휴대전화번호</option>
					<option value="">주소</option>
				</select>				
				<input type="text" class="txt" style="width:200px" >	
			<a href="javascript:FuncSearch(1);" class="btn_search">검색</a>
			</p>
		</fieldset>

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

		<p class="total_top">총 <b><%= PatientInfoList != null ? PatientInfoList.size() : 0 %></b>개</p>
		 --%>

		<!-- DataTables 정보 표시 -->
		<div class="dataTables_info title" id="patientTable_info"
			role="status" aria-live="polite">
			총 환자
			<%=PatientInfoList != null ? PatientInfoList.size() : 0%>명
		</div>



		<table id="patientTable" class="listTable" style="margin-top: 20px;">
			<colgroup>
				<col width="5%" />
				<col width="8%" />
				<col width="10%" />
				<col width="8%" />
				<col width="15%" />
				<col width="15%" />
				<col width="*" />
				<col width="*" />
				<col width="*" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>환자번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>주민등록번호</th>
					<th>휴대전화번호</th>
					<th>이메일</th>
					<th>회원아이디</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<!-- 환자 검색 결과 -->
				<!-- <tr>
				<td class="no-data" colspan="8">검색결과 없음</td>
			</tr>		 -->
				<%
				for (PatientDTO patientInfo : PatientInfoList) {
				%>
				<tr>
					<td><input type="checkbox"></td>
					<td><%=patientInfo.getPatient_number()%></td>
					<td><a
						href="./_layer_patient_detail.jsp?patient_number=<%=patientInfo.getPatient_number()%>"><%=patientInfo.getName()%></a></td>
					<td><%=patientInfo.getGender()%></td>
					<td><%=patientInfo.getJumin()%></td>
					<td><%=patientInfo.getPhone_number()%></td>
					<td><%=patientInfo.getEmail()%></td>
					<td class="s_txt1"><%=patientInfo.getId()%></td>
					<td><%=patientInfo.getAddress()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>


		<div class="btns_top mt20">
			<a href="" class="red">선택 삭제</a>
		</div>
		
	</article>
</section>
<link rel="stylesheet"
	href="../resources/plug-in/jquery-ui/css/jquery-ui-1.8.12.custom.css"
	type="text/css" />
<script type="text/javascript"
	src="../resources/plug-in/jquery-ui/js/jquery-ui-1.8.12.custom.min.js"></script>
<script type="text/javascript"
	src="../resources/plug-in/jquery-ui/js/jquery.ui.datepicker-ko.js"
	charset="utf-8"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script type="text/javascript">

	$(function() {
		$("#idStartDate").datepicker($.datepicker.regional.ko);
		$("#idEndDate").datepicker($.datepicker.regional.ko);
		$("#idRegStartDate").datepicker($.datepicker.regional.ko);
		$("#idRegEndDate").datepicker($.datepicker.regional.ko);
	});

	$(document).ready(function() {
		// DataTables
		let table = $('#patientTable').DataTable({
			"paging" : true, // 페이징 활성화
			"pageLength" : 30, // 한 페이지에 표시될 목록 수
			"lengthMenu" : [[30, 50, 100, 200],[ "30개씩보기", "50개씩보기", "100개씩보기", "200개씩보기" ]], // 목록 수 선택 옵션
			"ordering" : false, // 정렬 비활성화
			"language": {
				 "zeroRecords": "검색 결과 없음", //dataTables_empty
				 "sInfo": "_START_ ~ _END_ (검색 결과 총 _TOTAL_명)",
				 "sInfoEmpty": "",
				 "infoFiltered": ""//total 집계 "총 환자 _MAX_명"
			}
		});		
	
		
		// Show entries 라벨 숨기기
	    $('.dataTables_length label').contents().filter(function() {
	        return this.nodeType === 3; // 텍스트 노드 선택
	    }).remove();

	    // Search: 라벨 숨기기
	    $('.dataTables_filter label').contents().filter(function() {
	        return this.nodeType === 3; // 텍스트 노드 선택
	    }).remove();
		
	 // patientTable_filter input에 placeholder 추가
	    let searchInput = $('.dataTables_filter input');
	    searchInput.attr('placeholder', '검색어를 입력하세요.');

	});
</script>
<%@ include file="../admin_layout/footer.jsp"%>
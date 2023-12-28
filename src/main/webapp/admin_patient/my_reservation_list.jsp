<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>
<%@page import="java.util.List"%>
<%@page import="db.dto.ReservationDTO"%>
<%@page import="db.dao.admin.AdminReservationDAO"%>

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

<%
        request.setCharacterEncoding("UTF-8");

        // 로그인 확인
	    if (session != null && session.getAttribute("loginId") != null) {
		    // 세션에 저장된 로그인 아이디 사용
	        String employee_number = session.getAttribute("loginId").toString();
	        System.out.println("로그인 id : " + employee_number);

            AdminReservationDAO adminReservationDAO = new AdminReservationDAO();
            List<ReservationDTO> reservationList = adminReservationDAO.findAdminMyReservationById(employee_number);
            
            if (reservationList != null && !reservationList.isEmpty()) {
%>
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
				<th>접수상태</th>
				<th>진료과</th>
				<th>진료의</th>
				<th>환자이름</th>
				<th>예약내용</th>
			</tr>
			</thead>
			<tbody>
			<!-- 검색 결과 -->
			<!-- <tr>
				<td class="no-data" colspan="10">검색결과 없음</td>
			</tr>			 -->
		<%
				for (ReservationDTO reservation : reservationList) {
		%>
			<tr>
				<td><input type="checkbox"></td>
				<td><%=reservation.getReservation_number()%></td>
				<td><%=reservation.getPatient_number()%></td>
				<td><%=reservation.getReservation_date()%></td>
				<td><%=reservation.getReservation_time()%></td>
				<td><%=reservation.getReservation_status()%></td>
				<td><%=reservation.getDepartment_name()%></td>
				<td><%=reservation.getEmployee_name()%></td>
				<td><a href="./_layer_patient_detail.html"><%=reservation.getPatient_name()%></a></td>
				<td><%=reservation.getReservation_content()%></td>
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
    %>
                <script> 
                    alert('예약 정보가 없습니다.');
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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/reservation_list.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>
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
	        if (reservation_number == null || reservation_number.isEmpty()) {
    %>
	            <script>
	                alert("오류: 올바른 예약 번호가 제공되지 않았습니다.");
	                history.back();
	            </script>
    <%
	        } else {
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
					<li style="width:100%"><a href="#tab_sub1" class="on">예약내역 수정</a></li>
				</ul>			
				<!-- 기본 정보 -->
			<div id="tab_sub1">
				<table class="viewTable">
					<colgroup>
						<col width="220px" />
						<col width="15%" />
						<col width="*" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
					<tr>
						<td rowspan="2">
							<p class="pic_area">
								<span id="idPic"></span>
							</p>
						</td>
						<th>예약번호</th>
						<td><%=reservation.getReservation_number()%></td>					
						<th>환자번호</th>
						<td><%=reservation.getPatient_number()%></p></td>
					</tr>
					<tr>
						<th>환자이름</th>
						<td><%=reservation.getPatient_name()%></td>
					<form action="../admin/adminModifyReservation_proc.jsp" method="post">
	                    <input type="hidden" name="reservation_number" value="<%=reservation_number%>">
						<th>접수상태</th>
						<td>Y <input type="radio" name="reservation_status" value="Y" <%= "Y".equals(reservation.getReservation_status()) ? "checked" : "" %>>
                			N <input type="radio" name="reservation_status" value="N" <%= "N".equals(reservation.getReservation_status()) ? "checked" : "" %>><br></td>
					</tr>
					</tbody>
				</table>
			</div>	
						<label>예약일 : </label>
				    		<input type="text" name="reservation_date" value="<%=reservation.getReservation_date()%>" id="idHospitalizationDate" class="txt" style="width:120px" autocomplete="off">
				    		<a href="javascript:;" class="btn_datepicker">달력</a>
				    		
				    	<label>예약시간 : </label>
				    	<select name="reservation_time" style="width:200px;">
		                    <option value="09:00" <%= "09:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>09:00</option>
						    <option value="10:00" <%= "10:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>10:00</option>
						    <option value="11:00" <%= "11:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>11:00</option>
						    <option value="12:00" <%= "12:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>12:00</option>
						    <option value="14:00" <%= "14:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>14:00</option>
						    <option value="15:00" <%= "15:00".equals(reservation.getReservation_time()) ? "selected" : "" %>>15:00</option>
						</select><br>
       					<label>진료과 : </label>
						<select name="department_name" style="margin-top: 5px; width:120px">
						    <option value="가정의학과" <%= "가정의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>가정의학과</option>
						    <option value="국제진료과" <%= "국제진료과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>국제진료과</option>
						    <option value="마취통증의학과" <%= "마취통증의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>마취통증의학과</option>
						    <option value="병리과" <%= "병리과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>병리과</option>
						    <option value="비뇨의학과" <%= "비뇨의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>비뇨의학과</option>
						    <option value="산부인과" <%= "산부인과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>산부인과</option>
						    <option value="성형외과" <%= "성형외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>성형외과</option>
						    <option value="신경과" <%= "신경과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>신경과</option>
						    <option value="신경외과" <%= "신경외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>신경외과</option>
						    <option value="영상의학과" <%= "영상의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>영상의학과</option>
						    <option value="응급의학과" <%= "응급의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>응급의학과</option>
						    <option value="이비인후과" <%= "이비인후과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>이비인후과</option>
						    <option value="임상약리학과" <%= "임상약리학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>임상약리학과</option>
						    <option value="정신건강의학과" <%= "정신건강의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>정신건강의학과</option>
						    <option value="정형외과" <%= "정형외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>정형외과</option>
						    <option value="직업환경의학과" <%= "직업환경의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>직업환경의학과</option>
						    <option value="진단검사의학과" <%= "진단검사의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>진단검사의학과</option>
						    <option value="피부과" <%= "피부과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>피부과</option>
						    <option value="핵의학과" <%= "핵의학과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>핵의학과</option>
						    <option value="흉부외과" <%= "흉부외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>흉부외과</option>
						    <optgroup label="내과">
						        <option value="감염내과" <%= "감염내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>감염내과</option>
						        <option value="내분비내과" <%= "내분비내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>내분비내과</option>
						        <option value="노년내과" <%= "노년내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>노년내과</option>
						        <option value="류마티스내과" <%= "류마티스내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>류마티스내과</option>
						        <option value="소화기내과" <%= "소화기내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>소화기내과</option>
						        <option value="신장내과" <%= "신장내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>신장내과</option>
						        <option value="알레르기내과" <%= "알레르기내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>알레르기내과</option>
						        <option value="통합내과" <%= "통합내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>통합내과</option>
						        <option value="혈액내과" <%= "혈액내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>혈액내과</option>
						        <option value="호흡기내과" <%= "호흡기내과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>호흡기내과</option>
						    </optgroup>
						    <optgroup label="외과">
						        <option value="간담췌외과" <%= "간담췌외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>간담췌외과</option>
						        <option value="갑상선내분비외과" <%= "갑상선내분비외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>갑상선내분비외과</option>
						        <option value="대장항문외과" <%= "대장항문외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>대장항문외과</option>
						        <option value="위장관외과" <%= "위장관외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>위장관외과</option>
						        <option value="유방외과" <%= "유방외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>유방외과</option>
						        <option value="이식외과" <%= "이식외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>이식외과</option>
						        <option value="일반외과" <%= "일반외과".equals(reservation.getDepartment_name()) ? "selected" : "" %>>일반외과</option>
						    </optgroup>
						</select><br>
               			
               			<label>진료의 : </label>
						<select name="employee_name" style="margin-top: 5px; width:120px">
						    <optgroup label="가정의학과">
						        <option value="박지윤" <%= "박지윤".equals(reservation.getEmployee_name()) ? "selected" : "" %>>박지윤</option>
						        <option value="김민지" <%= "김민지".equals(reservation.getEmployee_name()) ? "selected" : "" %>>김민지</option>
						    </optgroup>
						    <optgroup label="국제진료과">
						        <option value="최민재" <%= "최민재".equals(reservation.getEmployee_name()) ? "selected" : "" %>>최민재</option>
						        <option value="이주원" <%= "이주원".equals(reservation.getEmployee_name()) ? "selected" : "" %>>이주원</option>
						    </optgroup>
						    <optgroup label="마취통증의학과">
						        <option value="박시우" <%= "박시우".equals(reservation.getEmployee_name()) ? "selected" : "" %>>박시우</option>
						        <option value="정서연" <%= "정서연".equals(reservation.getEmployee_name()) ? "selected" : "" %>>정서연</option>
						    </optgroup>
						    <optgroup label="병리과">
						        <option value="강준호" <%= "강준호".equals(reservation.getEmployee_name()) ? "selected" : "" %>>강준호</option>
						        <option value="최하은" <%= "최하은".equals(reservation.getEmployee_name()) ? "selected" : "" %>>최하은</option>
						    </optgroup>
						    <optgroup label="비뇨의학과">
						        <option value="정태민" <%= "정태민".equals(reservation.getEmployee_name()) ? "selected" : "" %>>정태민</option>
						        <option value="조수빈" <%= "조수빈".equals(reservation.getEmployee_name()) ? "selected" : "" %>>조수빈</option>
						    </optgroup>
						    <optgroup label="산부인과">
						        <option value="윤민지" <%= "윤민지".equals(reservation.getEmployee_name()) ? "selected" : "" %>>윤민지</option>
						        <option value="강유진" <%= "강유진".equals(reservation.getEmployee_name()) ? "selected" : "" %>>강유진</option>
						    </optgroup>
						    <optgroup label="성형외과">
						        <option value="조승현" <%= "조승현".equals(reservation.getEmployee_name()) ? "selected" : "" %>>조승현</option>
						        <option value="장현우" <%= "장현우".equals(reservation.getEmployee_name()) ? "selected" : "" %>>장현우</option>
						    </optgroup>
						    <optgroup label="신경과">
						        <option value="임서연" <%= "임서연".equals(reservation.getEmployee_name()) ? "selected" : "" %>>임서연</option>
						        <option value="윤주원" <%= "윤주원".equals(reservation.getEmployee_name()) ? "selected" : "" %>>윤주원</option>
						    </optgroup>
						    <optgroup label="신경외과">
						        <option value="장지훈" <%= "장지훈".equals(reservation.getEmployee_name()) ? "selected" : "" %>>장지훈</option>
						        <option value="한준서" <%= "한준서".equals(reservation.getEmployee_name()) ? "selected" : "" %>>한준서</option>
						    </optgroup>
						    <optgroup label="영상의학과">
						        <option value="오지현" <%= "오지현".equals(reservation.getEmployee_name()) ? "selected" : "" %>>오지현</option>
						        <option value="임서아" <%= "임서아".equals(reservation.getEmployee_name()) ? "selected" : "" %>>임서아</option>
						    </optgroup>
						    <optgroup label="응급의학과">
						        <option value="한승우" <%= "한승우".equals(reservation.getEmployee_name()) ? "selected" : "" %>>한승우</option>
						        <option value="서민호" <%= "서민호".equals(reservation.getEmployee_name()) ? "selected" : "" %>>서민호</option>
						    </optgroup>
							<optgroup label="이비인후과">
     							<option value="김다영" <%= "김다영".equals(reservation.getEmployee_name()) ? "selected" : "" %>>김다영</option>
						    </optgroup>
						    <optgroup label="임상약리학과">
						        <option value="이성호" <%= "이성호".equals(reservation.getEmployee_name()) ? "selected" : "" %>>이성호</option>
						    </optgroup>
						    <optgroup label="정신건강의학과">
						        <option value="박수민" <%= "박수민".equals(reservation.getEmployee_name()) ? "selected" : "" %>>박수민</option>
						    </optgroup>
						    <optgroup label="정형외과">
						        <option value="최준서" <%= "최준서".equals(reservation.getEmployee_name()) ? "selected" : "" %>>최준서</option>
						    </optgroup>
						    <optgroup label="직업환경의학과">
						        <option value="정유진" <%= "정유진".equals(reservation.getEmployee_name()) ? "selected" : "" %>>정유진</option>
						    </optgroup>
						    <optgroup label="진단검사의학과">
						        <option value="강민준" <%= "강민준".equals(reservation.getEmployee_name()) ? "selected" : "" %>>강민준</option>
						    </optgroup>
						    <optgroup label="피부과">
						        <option value="조서현" <%= "조서현".equals(reservation.getEmployee_name()) ? "selected" : "" %>>조서현</option>
						    </optgroup>
						    <optgroup label="핵의학과">
						        <option value="윤준영" <%= "윤준영".equals(reservation.getEmployee_name()) ? "selected" : "" %>>윤준영</option>
						    </optgroup>
						    <optgroup label="흉부외과">
						        <option value="장하은" <%= "장하은".equals(reservation.getEmployee_name()) ? "selected" : "" %>>장하은</option>
						    </optgroup>
						    <optgroup label="감염내과">
						        <option value="임도현" <%= "임도현".equals(reservation.getEmployee_name()) ? "selected" : "" %>>임도현</option>
						    </optgroup>
						    <optgroup label="내분비내과">
						        <option value="한주원" <%= "한주원".equals(reservation.getEmployee_name()) ? "selected" : "" %>>한주원</option>
						    </optgroup>
						    <optgroup label="노년내과">
						        <option value="오수빈" <%= "오수빈".equals(reservation.getEmployee_name()) ? "selected" : "" %>>오수빈</option>
						    </optgroup>
						    <optgroup label="류마티스내과">
						        <option value="서승우" <%= "서승우".equals(reservation.getEmployee_name()) ? "selected" : "" %>>서승우</option>
						    </optgroup>
						    <optgroup label="소화기내과">
						        <option value="김서영" <%= "김서영".equals(reservation.getEmployee_name()) ? "selected" : "" %>>김서영</option>
						    </optgroup>
						    <optgroup label="신장내과">
						        <option value="이준호" <%= "이준호".equals(reservation.getEmployee_name()) ? "selected" : "" %>>이준호</option>
						    </optgroup>
						    <optgroup label="알레르기내과">
						        <option value="박가영" <%= "박가영".equals(reservation.getEmployee_name()) ? "selected" : "" %>>박가영</option>
						    </optgroup>
						    <optgroup label="통합내과">
						     	<option value="최승민" <%= "최승민".equals(reservation.getEmployee_name()) ? "selected" : "" %>>최승민</option>
						    </optgroup>
						    <optgroup label="혈액내과">
						        <option value="정지원" <%= "정지원".equals(reservation.getEmployee_name()) ? "selected" : "" %>>정지원</option>
						    </optgroup>
						    <optgroup label="호흡기내과">
						        <option value="강민지" <%= "강민지".equals(reservation.getEmployee_name()) ? "selected" : "" %>>강민지</option>
						    </optgroup>
						    <optgroup label="간담췌외과">
						        <option value="조현우" <%= "조현우".equals(reservation.getEmployee_name()) ? "selected" : "" %>>조현우</option>
						    </optgroup>
						    <optgroup label="갑상선내분비외과">
						        <option value="윤지민" <%= "윤지민".equals(reservation.getEmployee_name()) ? "selected" : "" %>>윤지민</option>
						    </optgroup>
						    <optgroup label="대장항문외과">
						        <option value="장준영" <%= "장준영".equals(reservation.getEmployee_name()) ? "selected" : "" %>>장준영</option>
						    </optgroup>
						    <optgroup label="위장관외과">
						        <option value="임수빈" <%= "임수빈".equals(reservation.getEmployee_name()) ? "selected" : "" %>>임수빈</option>
						    </optgroup>
						    <optgroup label="유방외과">
						        <option value="한도현" <%= "한도현".equals(reservation.getEmployee_name()) ? "selected" : "" %>>한도현</option>
						    </optgroup>
						    <optgroup label="이식외과">
						        <option value="오윤서" <%= "오윤서".equals(reservation.getEmployee_name()) ? "selected" : "" %>>오윤서</option>
						    </optgroup>
						    <optgroup label="일반외과">
						        <option value="서준혁" <%= "서준혁".equals(reservation.getEmployee_name()) ? "selected" : "" %>>서준혁</option>
						    </optgroup>
						</select><br>	   					
						<textarea style="margin-top: 5px; height:100px;" name="reservation_content" placeholder="예약 내용을 입력하세요."><%=reservation.getReservation_content()%></textarea><br>
   	   			        <p class="btn_c">
							<a href="" class="red"><button type="submit">수정하기</button></a>
						</p>
			        
			    </form>	
    <%
            	} else {
    %>
                	<p>예약 정보를 찾을 수 없습니다.</p>
    <%
	            }
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
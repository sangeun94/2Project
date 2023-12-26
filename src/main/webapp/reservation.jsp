<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.dto.PatientDTO" %> 
<%@ page import="db.dto.ReservationDTO" %> 
<%@ page import="db.dao.ReservationDAO" %> 
<%@ page import="db.dto.MedicalDepartmentDTO" %> 
<%@ page import="db.dto.EmployeeDTO" %> 
<%@ page import="java.util.List" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>온라인 예약</title>
<style>
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	.alignCenter{
		text-align: center;
	}
	
	.box{
		width: 300px;
		height: 800px;
		border: 1px solid black;
	}
	
	.dsNone{
		display: none;
	}
	
	
	#container{
		display: flex;
		width: 100%;
		height: 100%;
	}
	
	#reservationStep{
		display: flex;
	}
	
	#departmentList{
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 500px;
		overflow-y: scroll;
		overflow-x: none;
	}
	
	
	
	.department{
		width: 250px;
		height: 80px;
		border: 1px solid black;
	}
	
	#employeeList{
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 500px;
		overflow-y: scroll;
		overflow-x: none;
	}
	
	
	
	.employee{
		width: 250px;
		height: 80px;
		border: 1px solid black;
	}

	#step4 {
		width: 600px;
	}
	

</style>
</head>

<script>

	var today = new Date();
	//달력 생성
	function buildCalendar() {
		
		var row = null;
		var cnt = 0;

		var calendarTable = document.getElementById("calendar");
		var calendarTableTitle = document.getElementById("calendarTitle");

		//타이틀에 년, 월 출력
		calendarTableTitle.innerHTML = today.getFullYear() + "년"
				+ (today.getMonth() + 1) + "월";

		//현재 달력의 첫날과 마지막날을 구하기
		var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
		var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
		
		//작성할 테이블 초기화
		while(calendarTable.rows.length > 2) {
			calendarTable.deleteRow(calendarTable.rows.length - 1);
		}
		
		//달의 첫 날까지 빈 셀 생성
		row = calendarTable.insertRow();
		for(i = 0; i < firstDate.getDay(); i++){
			cell = row.insertCell();
			cnt += 1;
		}
		
		//달력에 요일 채우기
		for(i = 1; i <= lastDate.getDate(); i++){
			cell = row.insertCell();
			cnt += 1;
			
			cell.setAttribute('id', i);
			cell.innerHTML = i;
			cell.align = "center";
			
			//선택한 일자 출력하기
			cell.onclick = function(){
				clickedYear = today.getFullYear();
				clickedMonth = (1 + today.getMonth());
				clickedDate = this.getAttribute('id');
				
				clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
				clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
				clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
				
				opener.document.getElementById("date").value = clickYMD;
			}
			
			if(cnt%7 == 0){
				row = calendar.insertRow();
			}
		}
		
		//달력의 마지막날 뒤 빈칸 행으로 채우기
		if(cnt%7 != 0){
			for(i = 0; i<7-(cnt % 7); i++){
				cell = row.insertCell();
			}
		}	

	}
	
	
	// 이전달 이동
	function prevCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
		buildCalendar();
	}
	
	// 다음달 이동
	function nextCalendar(){
		today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
		buildCalendar();
	}
	
</script>

<body>
	<% 
	String departmentNum = request.getParameter("department");
	
	String id = (String)session.getAttribute("id");
	id = "user5";

	ReservationDAO reservationDAO = new ReservationDAO();
	
	PatientDTO info = reservationDAO.findPatientInfoById(id);
	List<MedicalDepartmentDTO> medicalDepartmentList = reservationDAO.findMedicalDepartmentList();
	List<EmployeeDTO> employeeList = reservationDAO.findEmployeetList();	
	List<EmployeeDTO> employeeList2 = reservationDAO.findDepartmentEmployeetList(departmentNum);	
	
	
	%>


	<div id = "container">
		<div id = "info" class = "box">
			
			<div><span>회원정보</span></div>
			<span>성명</span> <span> <%=info.getName() %> 님</span>
			
			<br>
			<div> <button>로그아웃</button> </div>
			<div> <button>마이페이지</button> </div>
			<div> <button>예약현황</button> </div>
			
		</div>
		
		<!-- 예약폼 -->
		<div id = "reservationStep">
			<!--  <form action="Reservation_proc.jsp" method="post"> -->
			
				<div id = "step0" class = "box" onclick = "next1()">
					<div><span>회원예약</span></div>
					
				</div>
				
				
				<div id = "step1" class = "box dsNone">
					<div><span>회원예약</span></div>
					<p>1. 본인 정보 확인</p>
					<p> <label>성명 : </label> <span> <%=info.getName() %> </span></p>
					<p> <label>전화번호 : </label><%=info.getPhone_number() %> </p>
					
					<input id = "agree" type="radio" name = "agree"> <label for="agree">동의</label>
					<input id = "disagree" type="radio" name = "agree"> <label for="disagree">비동의</label>
					
					<br>
					<button onclick = "prev1()">이전</button> <button onclick = "next2()">다음</button>
				</div>
				
				<div id = "step2" class = "box dsNone">
					<div><span>회원예약</span></div>
					<p>예약 방법 선택</p>
					<button onclick = "department()">진료과 예약</button>
					<button onclick = "employee()">의료진 예약</button>
					
					<br>
					<button onclick = "prev2()">이전</button>
				</div>
				
				
				<!-- 진료과 -->
				<div id = "step3_department" class = "box dsNone">
					<div><span>진료예약-STEP1</span></div>
					<p>진료과</p>
					
					<!-- 진료과 목록 출력 -->
					<div id = "departmentList">
						<form method="post">

							<% 
								for(MedicalDepartmentDTO medicalDepartment : medicalDepartmentList){
							%>
									<button name="department" value=<%=medicalDepartment.getDepartment_number()%>><%=medicalDepartment.getDepartment_number()%> <%=medicalDepartment.getDepartment_name()%></button>
							<%
								}
							%>
						</form>
						<% System.out.println(departmentNum); %>
					</div>
					<br>
					<button onclick = "prev3()">이전</button>
				</div>
				
				<!-- 의료진 -->
				
				<div id = "step3_employee" class = "box dsNone">
					<div><span>진료예약-STEP1</span></div>
					<p>의료진</p>
					<!-- 의료진 목록 출력 -->
					<div id = "employeeList">
						<% 
							for(EmployeeDTO employee : employeeList){
						%>
							<button> <span><%=employee.getName() %></span> </button>
						<%
							}
						%>
					</div>
					
					<br>
					<button onclick = "prev3()">이전</button>

				</div>

			<!-- 진료과 선택 시 해당 과 의사 출력 -->
			<div id="step4" class="box dsNone">
				<div>
					<span>진료예약-STEP2</span>
					<div><%=departmentNum %></div>
					<div>
						<%
						for (EmployeeDTO employee : employeeList2) {
						%>
						<button>
							<span><%=employee.getName()%></span>
						</button>
						<%
						}
						%>
					</div>
				</div>
				
				<div id = "employeeList">
				</div>
			
				


			</div>

			<!-- 
			<div id="step4" class="box dsNone">
				<div>
					<span>진료예약-STEP2</span>
				</div>

				<table id="calendar" class="alignCenter">
					<h3>달력</h3>
					<tr>
						<td class="alignCenter"><label onclick="prevCalendar()">
								◀ </label></td>
						<td colspan="5" id="calendarTitle" class="alignCenter">yyyy년
							M월</td>
						<td><label onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td class="alignCenter">일</td>
						<td class="alignCenter">월</td>
						<td class="alignCenter">화</td>
						<td class="alignCenter">수</td>
						<td class="alignCenter">목</td>
						<td class="alignCenter">금</td>
						<td class="alignCenter">토</td>
					</tr>

					<script>
						buildCalendar();
					</script>

				</table>

			</div>
			 -->



		</div>

	</div>
	

	
	
	
	<script>

		const step0 = document.getElementById("step0");
		const step1 = document.getElementById("step1");
		const step2 = document.getElementById("step2");
		const step3_department = document.getElementById("step3_department");
		const step3_employee = document.getElementById("step3_employee");
		const step4 = document.getElementById("step4");
		

		function next1(){
			step0.classList.add('dsNone');
			step1.classList.remove('dsNone');
		}
		
		function next2(){
			step2.classList.remove('dsNone');
		}
		
		function prev1(){
			step1.classList.add('dsNone');
			step0.classList.remove('dsNone');
		}
		
		function prev2(){
			step2.classList.add('dsNone');
			step1.classList.remove('dsNone');
		}
		
		function prev3(){
			step1.classList.remove('dsNone');
			step2.classList.remove('dsNone');
			step3_employee.classList.add('dsNone');
			step3_department.classList.add('dsNone');
			step4.classList.add('dsNone');
		}
		
		function department() {
			step1.classList.add('dsNone');
			step2.classList.add('dsNone');
			step3_department.classList.remove('dsNone');
			step4.classList.remove('dsNone');
		}
		
		function employee() {
			step1.classList.add('dsNone');
			step2.classList.add('dsNone');
			step3_employee.classList.remove('dsNone');
			step4.classList.remove('dsNone');
		}
		
		function getDepartment_number(num) {
			console.log(num);
	}

	</script>
</body>
</html>
<%@page import="db.dto.PatientDTO"%>
<%@page import="db.dao.Patient.PatientDAO"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<!-- <link rel="stylesheet" type="text/css" href="../Patient/css/homepage.css" /> -->
    <link rel="stylesheet" type="text/css" href="../Patient/css/nav.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/update.css" />
    
    <link rel="stylesheet" type="text/css" href="../Patient/css/content.css" /> 
     
<head>
<meta charset="UTF-8">
<title>내정보수정하기</title>
</head>
<style>
*{
	margin: 0px;
	padding: 0px;
	box-sizing: border-box;
}
body {
            font-family: 'Arial', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
          
        }

        .mainform {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            border: 1px solid lightgray;
            margin: 20px;
           	
           	;
            
            
           
        }

        .titlename {
            font-size: 22px;
            font-weight: bolder;
            margin-bottom: 10px;
        }

        .form-group {
            margin-bottom: 10px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        .form-group p {
            margin: 0;
            padding: 5px 0;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            box-sizing: border-box;
            border-color: lightgray;
        }
        input::placeholder {
        color: #95a5a6;
        }
        input:disabled {
        background-color: #ecf0f1;
        color: #7f8c8d;
        }
        button {
            background-color: #3498db;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #3498db;
        }
        .btnmypage{
            margin-left: 160px;
        }
        #btnmo{
        	margin-left: 180px;
        }
</style>
<body>
  
  <!-- 상단바 -->
        <div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">

                    <a href="../homeMain/HompageMain.jsp">
                        <div class="container-Logo"><img src="../homeMain/imgs/로고1.png"></div>
                    </a>

                    <li class="menu-item"><a href="Introduce.jsp">병원소개</a>
                    </li>

                    <li class="menu-item"><a href="../reservation/reservationMain.jsp">진료예약</a>
                    </li>

                    <li class="menu-item"><a href="../Patient/list.jsp">고객의소리</a>
                    </li>
                    
                    <li class="menu-item"><a href="../Patient/MyInfo1.jsp">마이페이지</a>
                    </li>
                    
                    
                    <% 
					    String loginId = (String) session.getAttribute("loginId");
					    if (loginId != null) {  // 로그인 상태
					        System.out.println("사용자가 로그인했습니다: " + loginId);
					%>
					        <li><%= loginId %>님</li>
					        <li><a href="../Patient/logout.jsp">로그아웃</a></li>
					<%
					    } else {  // 로그아웃 상태
					        System.out.println("사용자가 로그인하지 않았습니다");
					%>
					        <li><a href="../Patient/Login1.jsp">로그인</a></li>
					        <li><a href="../Patient/join.jsp">회원가입</a></li>
					<%
					    }
					%>
            	 	
                    
                    <!--  
                    <li>
                        <a href="../Patient/Login1.jsp">로그인</a>
                    </li>

                    <li>
                        <a href="">회원가입</a>
                    </li>
-->
                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
        <!-- 상단바 끝 -->
 <%
  // Character encoding 설정 및 세션에서 로그인 아이디 가져오기
  request.setCharacterEncoding("UTF-8");
  //String loginId = (String) session.getAttribute("loginId");
  boolean updateSuccess = false;

  if (loginId != null) {
    // 로그인 아이디로 환자 정보 가져오기
    PatientDAO patientDAO = new PatientDAO();
    PatientDTO patientDTO = patientDAO.findPatientById(loginId);

    // 폼이 제출되었을 때의 처리
    if ("POST".equalsIgnoreCase(request.getMethod())) {
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      String phone_number = request.getParameter("phone_number");
      String address = request.getParameter("address");

      // 업데이트 로직
      if (address != null && !address.isEmpty()) {
        patientDTO.setAddress(address);
      }
      if (password != null && !password.isEmpty()) {
        patientDTO.setPassword(password);
      }
      if (email != null && !email.isEmpty()) {
        patientDTO.setEmail(email);
      }
      if (phone_number != null && !phone_number.isEmpty()) {
        patientDTO.setPhone_number(phone_number);
      }

      // 환자 정보 업데이트 및 결과에 따른 메시지 설정
      updateSuccess = patientDAO.updatePatientInfo(patientDTO);

      if (updateSuccess) {
    	  //patientDAO.commit();
        request.setAttribute("message", "정보가 성공적으로 수정되었습니다.");
      } else {
        request.setAttribute("message", "정보 수정에 실패했습니다.");
      }
    }
%>

<form method="post" class="mainform" action="Update_proc.jsp" style="align-items: center;">
    <!-- 폼의 내용은 그대로 유지 -->
    <div class="titlename">어서오세요,<%= patientDTO.getName() %>님</div>
        <!-- 첫 번째 칸 -->
        <div class="form-group">
            <label for="id">아이디:</label>
            <p id="id"><%= patientDTO.getId() %></p>
        </div>
    
        <!-- 두 번째 칸 -->
        <div class="form-group">
            <label for="password">비밀번호:</label>
            <input type="password" name="password" value="<%= patientDTO.getPassword() %>">
            
        </div>
    
        <!-- 세 번째 칸 -->
        <div class="form-group">
            <label for="name">이름:</label>
            <p id="name"><%= patientDTO.getName() %></p>
        </div>
    
        <!-- 네 번째 칸 (이메일, 전화번호, 주소 등 추가) -->
        <div class="form-group">
            <label for="email">이메일:</label>
            <input type="text" name="email"  onchange="validEmail(this)" value="<%= patientDTO.getEmail() %>">
        </div>
    
        <div class="form-group">
            <label for="phone_number">휴대전화</label>
            <input type="text" name="phone_number" value="<%= patientDTO.getPhone_number() %> " oninput="autoHyphen(this)" maxlength="13">
        </div>
    
        <div class="form-group">
            <label for="address">주소:</label>
            <select name="address">
						<option value = "서울특별시">서울특별시</option>
						<option value = "부산광역시">부산광역시</option>
						<option value = "대구광역시">대구광역시</option>
						<option value = "인천광역시">인천광역시</option>
						<option value = "광주광역시">광주광역시</option>
						<option value = "대전광역시">대전광역시</option>
						<option value = "세종특별자치시">세종특별자치시</option>
						<option value = "경기도">경기도</option>
						<option value = "강원특별자치도">강원특별자치도</option>
						<option value = "충청북도">충청북도</option>
						<option value = "충청남도">충청남도</option>
						<option value = "전라북도">전라북도</option>
						<option value = "전라남도">전라남도</option>
						<option value = "경삭북도">경삭북도</option>
						<option value = "경상남도">경상남도</option>
					</select>
           <!--  <input type="text" name="address" value="<%= patientDTO.getAddress() %>"> -->
        </div>
    <%-- 아래의 버튼 클릭 시 update_proc.jsp로 전달할 hidden input 추가 --%>
     <input type="hidden" name="updateSuccess" value="<%= updateSuccess %>"> 
    <!-- 수정된 부분: 버튼에 type="submit" 추가 -->
  <button type="submit" onclick="goToMyPage()" id="btnmo">수정하기</button>

<%
  } else {
%>
  <p>로그인이 되어있지 않습니다. 로그인을 해주세요 <a href="Login.jsp">login</a></p>
<!-- ------------------------------------------------------------ -->

<!-- ------------------------------------------------------------ -->
</form>   

<%
}
%>
<!-- 필요에 따라 추가적인 내용을 표시할 수 있습니다. -->
<!-- Footer 시작 -->
    <div class="ft_homWrap" >
        <footer id="footer">
            <div class="Wrapall_ft">
            <div class="footerMenu_top">

                <ul class="ftmu_top" style="margin-left: 10px" >
                    <li>어린이병원</li>
                    <li>암병원</li>
                    <li>천안휴먼대병원</li>
                    <li>천안매병원</li>
                    <li>강남센터</li>
                    <li>휴먼대학교의과대학</li>
                </ul>

                <ul class="ftmu_top_1">
                    <li class="ftmu_top_li_a">진료과 ▲</li>
                    <li class="ftmu_top_li_a">주요센터 ▲</li>
                    <li class="ftmu_top_li_a">주요부서 ▲</li>
                    <li class="ftmu_top_li_a">주요서비스 ▲</li>
                    <li class="ftmu_top_li_a">페밀리사이트 ▲</li>
                </ul>
            </div>

            <div class="footerMenu_mid">
                <li class="ftmu_top_li_b aacolor">비급여진료비용</li>
                <li class="ftmu_top_li_b">환자권리장전</li>
                <li class="ftmu_top_li_b">이용약관</li>
                <li class="ftmu_top_li_b aacolor">개인정보 처리방침</li>
                <li class="ftmu_top_li_b">정보공개</li>
                <li class="ftmu_top_li_b">정보무단수집거부공개</li>
                <li class="ftmu_top_li_b">뷰어 다운로드</li>
                <li class="ftmu_top_li_b">진료협력센터</li>
                <li class="ftmu_top_li_b">장례식장</li>
            </div>

            <div class="footerMenu_bot">
                <p>
                    주소:충남 천안시 동남구 대흥로 215, 7층 T.041-561-1122 대표전화:1588-5700 홈페이지 의견접수
                    <br>
                    COPYRIGHT 2024 HUMAN NATIONAL UNIVERSITY HOSPITAL. ALL RIGHTS RESERVED
                </p>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-1.png">
                <p>
                    전자의무기록시스템
                    <br>
                    (EMR)인증
                </p>
            </div>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-2.png">
                <p>
                    보건복지부 제1호
                    <br>
                    인증 의료기관
                </p>
            </div>

            <div class="ftbot_img">
                <img src="../homeMain/imgs/ft-3.png">
                <p>
                    정보보호관리체계
                    <br>
                    (ISMS)인증
                </p>
            </div>

        </div>

    </div>
    </footer>
    </div>
    <!-- Footer 끝 -->
 


    <!-- 수정된 부분: 페이지 이동 시 스크립트 -->
<script>
	  // 업데이트 성공 시 페이지 이동
	  function goToMyPage() {
	    <% if (updateSuccess) { %>
	      alert("정보가 성공적으로 수정되었습니다.");
	      window.location.href = "MyInfo1.jsp";
	    <% } else { %>
	      alert("정보 수정에 실패했습니다.");
	    <% } %>
	  }
	  
	  /* 주민등록번호 자동 하이픈 */
		const autoHyphenJumin = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		  .replace(/^(\d{0,6})(\d{0,7})$/g, "$1-$2").replace(/(\-{1})$/g, "");
		}

		/* 휴대전화번호 자동 하이픈 */
		const autoHyphen = (target) => {
			 target.value = target.value
			   .replace(/[^0-9]/g, '')
			  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
			}
/* 이메일 유효성 검사  */
		
		let input_email = document.getElementById('input_email');
		
		input_email.addEventListener('change',(e)=>{ 
		    validEmail(e.target)
		})
		
		function validEmail(obj){
		    if(validEmailCheck(obj)==false){
		        alert('올바른 이메일 주소를 입력해주세요.')
		        obj.value='';
		        obj.focus();
		        return false;
		    }
		}

		function validEmailCheck(obj){
			var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		    //return (obj.value.match(pattern)!=null)
			 return pattern.test(obj.value);
		}
</script>
    
</body>
</html>
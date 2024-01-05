<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 회원가입</title>
	<link rel="stylesheet" type="text/css" href="../Patient/css/homepage.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/nav.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/footer2.css" />
    <link rel="stylesheet" type="text/css" href="../Patient/css/Introduce.css" />
<style>
	*{
	margin: 0px;
    padding: 0px;
    box-sizing: border-box;
	}
	 body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .joininput {
        	width : 700px;
            max-width: 600px;
            margin: 50px auto;
            margin-top : 150px;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .grayline {
            border-top: 1px solid #ddd;
            margin: 10px 0;
        }

        form {
            margin-top: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
            text-align: left;
        }

        input {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            padding: 10px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            
           	margin: 0px auto;
           	
        }

        button[type="reset"] {
            background-color: #3498db;
            margin-right: 0px;
        }

        button[type="submit"]:hover,
        button[type="reset"]:hover {
            background-color: #3498db;
        }
        .btnright{
        	margin-left: 300px;
        }
</style>
</head>
<body>

  <!-- 상단바 -->
        <div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">

                    <a href="../homeMain/HompageMain.jsp">
                        <div class="container-Logo"><img src="../homeMain/imgs/로고1.png"></div>
                    </a>

                    <li class="menu-item"><a href="../homeMain/Introduce.jsp">병원소개</a>
                    </li>

                    <li class="menu-item"><a href="../reservation/reservation.jsp">진료예약</a>
                    </li>

                    <li class="menu-item"><a href="list.jsp">고객의소리</a>
                    </li>

                    <li class="menu-item"><a href="MyInfo1.jsp">마이페이지</a>
                    </li>
                    
                    <li>
                        <a href="Login1.jsp">로그인</a>
                    </li>

                    <li>
                        <a href="join.jsp">회원가입</a>
                    </li>

                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
        <!-- 상단바 끝 -->
<div class="joininput">
<h1>회원가입</h1>
<div class="grayline"></div>
	<form action="join_proc.jsp" method="post" onsubmit="return validateForm();" id="form2">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" placeholder="아이디를 입력해주세요" pattern="[a-zA-Z0-9]+" required minlength ="5"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" placeholder="비밀번호를 입력해주세요" required></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" id="input_email" name="email" placeholder="@를 꼭입력해주세요."onchange="validEmail(this)" required></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" placeholder="이름을 입력해주세요" required></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><input type="text" name="jumin" placeholder="숫자만 입력해주세요." required oninput="autoHyphenJumin(this); validateJumin(this);" maxlength="14" ></td>
			</tr>
			<tr>
				<td>휴대전화</td>
				<td><input type="text" name="phone_number" placeholder="숫자만 입력해주세요." required oninput="autoHyphen(this)" maxlength="13"></td>
			</tr>
			<tr>
				<td>주소</td>
				<!-- <td><input type="text" name="address" placeholder="ex)서울특별시"></td> -->
				<td>
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
				</td>
			</tr>
			<tr>
                <td></td>
				<td class="btnright">
                    <button type="submit" name="join">회원가입</button>
                    <button type="reset">리  셋</button>
                    <button type="submit" onclick="goToLoginPage()">뒤로가기</button>
				</td>
			
			</tr>
		</table>
	</form>
</div>

 <!-- Footer 시작 -->
    <div class="ft_homWrap">
        <footer id="footer">
            <div class="Wrapall_ft">
            <div class="footerMenu_top">

                <ul class="ftmu_top" style="margin-left: 4px">
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
   
	<script>
	 function goToLoginPage() {
	        window.location.href = "Login1.jsp";
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
		
		
		
		document.getElementById('modifyBtn').addEventListener('click', ()=> {
				//이름이 있는지 혹시 비어있는지!!!
				
				let input_name = document.getElementById('input_name');
				let input_jumin = document.getElementById('input_jumin');
				let input_phone_number = document.getElementById('input_phone_number');
				
				if(input_name.value.trim() == ''){
					alert('이름은 필수 입력 항목입니다.');
					input_name.focus();
					return;
				}
				
				if(input_jumin.value.trim() == ''){
					alert('주민등록번호는 필수 입력 항목입니다.');
					input_jumin.focus();
					return;
				}
				
				if(input_phone_number.value.trim() == ''){
					alert('휴대전화번호는 필수 입력 항목입니다.');
					input_phone_number.focus();
					return;
				}
			
				if(confirm('수정 하시겠습니까?')){
					let form = document.getElementById('patientForm');
					form.action = 'modifyPatient_proc.jsp';
					form.submit();
				}
		});
		
		function validateJumin(input) {
		    var value = input.value.replace(/[^0-9]/g, ''); // 숫자만 추출

		    if (value.length >= 7) {
		        var lastDigit = value.charAt(6); // 주민번호 뒷자리 첫 번째 자리

		        if (!["1", "2", "3", "4"].includes(lastDigit)) {
		            alert("주민등록번호 뒷자리 첫 번째 자리는 1, 2, 3, 4 중 하나여야 합니다.");
		            input.value = value.substring(0, 6) + "1" + value.substring(7);
		        }
		    }
		}
		
		function validateForm() {
	        var idInput = document.getElementsByName("id")[0];
	        var idPattern = /^[a-zA-Z0-9]+$/;

	        if (!idPattern.test(idInput.value)) {
	            alert("아이디는 영문자와 숫자만 허용됩니다.");
	            return false;
	        }

	        // 나머지 유효성 검사 로직 추가

	        return true;
	    }
		
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
</body>
</html>
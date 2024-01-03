<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    * {
    margin: 0px;
    padding: 0;
    box-sizing: border-box;
    }
    body {
            font-family: Arial, sans-serif;
        }
    .header{
        height: 100px;
        background-color: lightblue;
    }
    .content-header{
        height: 120px;
        background-color: lightcoral;
        line-height: 120px;
        
    }
    #h2content{
        text-align: center;
        font-size: 35px;
    }
    #labelagree{
        font-size: 22px;
    }
    #checkboxstyle{
        size: 20pxpx;
    }
    

        /**/
form{ padding: 10px; }
.circle{
    display: inline-block; /* 영역적용가능해짐 */
    width: 23px; height: 23px;
    border: 2px solid #666;
    box-sizing: border-box;
    border-radius: 10px; /* 모서리둥글게 처리 */
    position: relative; top: 4px;
    cursor: pointer; /* 마우스 올렸을때 손모양 처리 */

    background-image: url(././imgs/patientimg/check_gray.png);
    background-size: 70%;
    background-repeat: no-repeat;
    background-position: center;
}

#chk:checked + .circle{
    background-color: navy;
    border-color: navy;
    background-image: url(./imgs/patientimg/check_white.png);
}
span{
    font-size: 18px;
}

/*----------------------------------------------------------*/
#chk2:checked + .circle{
    background-color: navy;
    border-color: navy;
    background-image: url(././imgs/patientimg/check_white.png);
}
#chk3:checked + .circle{
    background-color: navy;
    border-color: navy;
    background-image: url(././imgs/patientimg/check_white.png);
}
#chk4:checked + .circle{
    background-color: navy;
    border-color: navy;
    background-image: url(././imgs/patientimg/check_white.png);
}

/* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
#chk{ position: absolute; left: -999em; }
#chk2{ position: absolute; left: -999em; }
#chk3{ position: absolute; left: -999em; }
#chk4{ position: absolute; left: -999em; }
    .line{
            
            height: 0.4px;
            background-color: #666;
            opacity: 0.3;
    }

    /* 스크롤박스 CSS*/
    .scrollable-text {
        max-height: 150px; /* 스크롤 영역의 최대 높이 설정 */
        overflow-y: auto; /* 수직 스크롤바를 표시하고 내용이 넘칠 때만 스크롤을 허용 */
        border: 1px solid #ccc; /* 테두리 추가 */
        padding: 10px; /* 내용과 테두리 사이에 간격 추가 */
        background-color: #f8f8f8; /* 배경색 설정 */
    }

    /* 스크롤바 스타일링 */
    .scrollable-text::-webkit-scrollbar {
        width: 12px;
    }

    .scrollable-text::-webkit-scrollbar-thumb {
        background-color: #007BFF; /* 스크롤바 색상 */
        border-radius: 10px; /* 스크롤바 모서리를 둥글게 만듦 */
    }

    .scrollable-text::-webkit-scrollbar-track {
        background-color: #f8f8f8; /* 스크롤바 트랙 배경색 */
    }
    p{
        padding: 5px;
    }
    .iconbi{
        display: flex;
    }
    
</style>
</head>
<body>
 <div class="header"></div>
	<div class="content-header">
        <h2 id="h2content">회원가입</h2>
    </div>
	<div class="join">
        <form action="join.jsp">
            <!--label태그는 체크박스를 누르지 않아도 연결된 체크박스를 체크해줌-->
            <label for="chk">
              <input type="checkbox" id="chk" onclick="checkAll()">
              <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
              <i class="circle"></i>
              <span class="text">약관 전체 동의</span>
            </label>
            <input type="checkbox" id="chk">

            <!-- 추가된 체크박스 -->
        
         
    <div class="line"></div>
    
    <label for="chk2">
        <input type="checkbox" id="chk2">
        <i class="circle"></i>
        <span class="text">휴면 이용약관(필수)</span>
    </label>
    <div class="scrollable-text">
        <!-- 스크롤 가능한 텍스트 영역 -->
        <p style="font-size: 15px;">제 1장 총칙</p>
        <p> 제1조 (목적)</p>
        <p>본 약관은 회원이 휴면 의료원(이하 "의료원")이 온라인으로 제공하는 진료예약 및 제반 서비스(이하 “서비스”)의
            이용과 관련하여 의료원과 회원간의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>

            <p>제2조 (용어의 정의)</p>
            <p>① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
            <p>1. “의료원”이라 함은 온라인을 통하여 서비스를 제공하는 사업자를 의미합니다.</p>
            <p>2. “회원”이라 함은 본 약관에 동의하고 서비스 이용 자격을 부여받은 자를 의미합니다.</p>
            <p>3. “서비스”라 함은 의료원이 온라인으로 제공하는 서비스를 의미합니다.</p>
            <p>4. “가입”이라 함은 사이트에서 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 의하여 서비스 이용계약을 완료시키는 행위</p>
            <p>5. “계정(ID)”이라 함은 회원의 식별과 서비스 이용을 위하여 회원이 선정하고 의료원이 부여하는 문자, 숫자 또는 특수문자의 조합을 의미합니다.</p>
            <p>6. “계정정보“라 함은 회원의 계정, 비밀번호, 성명 등 회원이 의료원에 제공한 일반정보 및 병원등록번호등을 통칭합니다.</p>
            <p>7. “비밀번호”라 함은 회원이 부여받은 계정과 일치되는 회원임을 확인하고 회원의 정보 및 권익보호를 위해 회원 자신이 선정하여 비밀로 관리하는 문자, 숫자 또는 특수문자의 조합을 의미합니다.</p>
 <p>8. “고유식별정보”라 함은 주민등록번호, 외국인등록번호를 의미합니다.</p>
 <p>9. “민감정보”라 함은 건강에 관한 정보를 의미합니다.</p>
 <p>10. “탈퇴(해지)”라 함은 회원이 이용계약을 종료시키는 행위</p>
<p>② 이 약관에서 사용하는 용어의 정의는 제1항 각호에서 정하는 것을 제외하고는 관계법령 및 기타 일반적인 상관례에 의합니다.</p>
 <p>제3조 (의료원정보의 제공)</p>
 <p>의료원은 다음 각 호의 사항을 홈페이지에 게시하여, 회원이 이를 쉽게 알 수 있도록 합니다. 다만, 개인정보처리방침과 약관은 회원이 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</p>

 <p>① 상호 및 소재지 주소(회원의 불만을 처리할 수 있는 곳의 주소를 포함한다)</p>
 <p>③ 이용약관과 개인정보처리방침</p>
 <p>④ 환자권리장전과 의료정보윤리헌장</p>
 <p>제4조 (서비스의 제공 및 변경)</p>
 <p>① 의료원은 이용자에게 아래와 같은 서비스를 제공합니다.</p>
 <p><병원 홈페이지></p>
 <p>1. 본인/대리/비회원 진료 예약 및 내역 조회 서비스</p>
 <p>2. 건강검진 예약 및 조회, 온라인문진 서비스</p>
 <p>3. 검사일정 조회 및 결과 조회 서비스</p>
 <p>4. 내원, 입퇴원 내역 조회 서비스</p>
 <p>5. 증명서발급 서비스</p>
 <p>6. 의료진 및 진료일정 안내</p>
 <p>7. 건강정보, 건강동영상 및 통합검색서비스</p>
 <p>8. 일부 병원의 건강상담서비스</p>
 <p>9. 비급여 진료비 조회서비스</p>
 <p>10. 트위터, 페이스북 등 SNS 연계서비스</p>
 <p>11. 회원 본인이 선택한 관심질환에 대한 . 건강정보 및 각종소식</p>
 <p>12. 고객의소리</p>
 <p>13. 월 1회 건강정보메일 발송 서비스</p>
 <p>14. 기타 "의료원"이 정하는 서비스</p>
 <p><의료원 홈페이지></p>
 <p>1. 입사지원 서비스</p>
 <p>2. 후원참여, 후원내역조회 및 영수증발급</p>
 <p><대학 홈페이지></p>
 <p>1. 게시판 및 교직원 검색</p>
 <p>2. 교육신청서비스</p>
 <p>② "의료원"은 그 변경될 서비스의 내용 및 제공일자를 제5조 제5항에서 정한 방법으로 이용자에게 통지하고, 제4조에서 정한 서비스를 변경하여 제공할 수 있습니다.</p>
 <p>③ "의료원"은 서비스 내용의 변경으로 인하여 이용자가 입은 손해에 대하여 배상하지 아니합니다. 단, 병원의 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.</p>
 <p>제5조 (약관의 명시와 개정)</p>
 <p>① 의료원은 이 약관의 내용을 회원이 알 수 있도록 사이트의 초기 서비스화면(전면)에 게시하거나 연결화면을 제공하는 방법으로 회원에게 공지합니다.</p>
 <p>② 의료원은 회원이 의료원과 이 약관의 내용에 관하여 질의 및 응답을 할 수 있도록 조치를 취합니다.</p>
 <p>③ 의료원은 서비스를 이용하고자 하는 자(이하 “이용자”라 한다)가 약관의 내용을 쉽게 알 수 있도록 작성하고 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 계약 해제ㆍ해지, 의료원의 면책사항 및 회원에 대한 피해보상 등과 같은 중요한 내용을 회원이 쉽게 이해할 수 있도록 굵은 글씨 등으로 처리하거나 별도의 연결화면 또는 팝업화면 등을 제공하고 이용자의 동의를 얻도록 합니다.</p>
 <p>④ 의료원은 「약관의 규제에 관한 법률」, 「개인정보보호법」등 관련 법령에 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</p>
 <p>⑤ 의료원이 약관을 개정할 경우에는 적용일자 및 개정내용, 개정사유 등을 명시하여 그 적용일자로부터 최소한 7일 이전(회원에게 불리하거나 중대한 사항의 변경은 30일 이전)부터 그 적용일자 경과 후 상당한 기간이 경과할 때까지 초기화면 또는 초기화면과의 연결화면을 통해 공지합니다.</p>
 <p>⑥ 의료원은 약관을 개정할 경우에는 개정약관 공지 후 개정약관의 적용에 대한 회원의 동의 여부를 확인합니다. 개정약관 공지시 회원이 동의 또는 거부의 의사표시를 하지 않으면 승낙한 것으로 간주하겠다는 내용도 함께 공지한 경우에는 회원이 약관 시행일 까지 거부의사를 표시하지 않는다면 개정약관에 동의한 것으로 간주할 수 있습니다.</p>
 <p>⑦ 회원이 개정약관의 적용에 동의하지 않는 경우 의료원 또는 회원은 서비스 이용계약을 해지할 수 있습니다.</p>
 <p>제6조 (약관 외 준칙)</p>
 <p>이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「약관의 규제에 관한 법률」,「개인정보보호법」,「의료법」등 관련 법령에 따릅니다.</p>


</div>

    </div>
    
    <label for="chk3">
        <input type="checkbox" id="chk3">
        <i class="circle"></i>
        <span class="text">개인정보 수집·이용(필수)</span>
    </label>
    <div class="scrollable-text">
        <!-- 스크롤 가능한 텍스트 영역 -->
       <p>개인정보의 수집 및 이용목적</p> 
       <p>휴면 의료원(이하 “의료원”)에서 개인정보를 수집하고 이용하는 목적은 홈페이지 회원의 가입 및 관리를 위함입니다.</p> 
       <p>의료원 산하병원(세브란스병원, 강남세브란스병원, 용인세브란스병원, 치과대학병원)의 홈페이지는 통합회원제로 운영되고 있으며, 한 번의 로그인으로 모든 사이트 이용이 가능합니다.</p> 

       <p>수집된 개인정보는 다음과 같이 활용됩니다.</p> 

       <p>1. 진료/건강검진 예약, 예약조회 및 회원제 서비스 이용에 따른 본인 확인 절차에 사용</p> 
       <p>2. 공지사항 전달, 불만처리등을 위한 의사소통 경로</p> 
       <p>3. 건강검진 관련 물품 발송</p> 
       <p>4. 진료의뢰 환자의 예약을 위한 자료</p> 
       <p>5. 교육 신청자의 교육진행을 위한 자료</p> 
       <p>(위항의 원활한 업무처리를 위하여 개인정보 처리(취급) 업무(DM등)를 외부 전문업체에 위탁할 수 있으며 해당내용은 홈페이지에 공개합니다.)</p> 

       <p>개인정보의 수집항목</p> 
       <p>휴면에서 수집하는 개인정보 항목은 다음과 같습니다.</p> 

       <p><회원가입 처리항목></p> 
       <p>1) 내/외국인(만14세 이상 국내거주 내/외국인)</p> 
       <p>- 필수항목 : 성명, 아이디, 비밀번호, 이메일, 연락처</p> 
       <p>- 선택항목 : 예비연락처</p> 
       <p>2) 소아/청소년(만14세 미만 내/외국인)</p> 
       <p>- 필수항목 : 성명, 아이디, 비밀번호, 이메일, 연락처, 법정대리인 성명, 법정대리인성별, 법정대리인 생년월일, 법정대리인 인증(휴대폰인증/아이폰인증/범용 공인인증서)</p> 
       <p>- 선택항목 : 예비연락처</p> 
       <p>3) 해외거주외국인</p> 
       <p>- 필수항목 : 국적, 거주국가, 이름, 성별, 생년월일, 아이디, 비밀번호, 현지연락처, 이메일</p> 
       <p>- 선택항목 : 한국내 연락처</p> 
       <p>4) SNS(네이버)</p> 
       <p>- 필수항목 : 이용자 고유 식별자</p> 
       <p>- 선택항목 : 이름, 이메일, 프로필사진, 성별, 생년월일, 생일, 연령대, CI</p> 
       <p>5) SNS(카카오톡)</p> 
       <p>- 필수항목 : 닉네임, 프로필 사진</p> 
       <p>- 선택항목 : 성별</p> 
       <p>6) 간편예약</p> 
       <p>- 필수항목 : 전화번호</p> 
       <p>7) 비회원 예약(주민등록번호 예약 시)</p> 
       <p>- 필수항목 : 성명, 주민등록번호, 전화번호, 인증(휴대폰인증/아이폰인증/범용 공인인증서)</p> 
       <p>8) 비회원 예약(대리 예약)</p> 
       <p>- 필수항목 : 성명, 전화번호</p> 
       <p>- 필수정보 : 성명, 아이디, 비밀번호, 연락처, 이메일</p> 
       <p>- 선택정보 : 예비연락처, 관심질병</p> 
       <p><진료/건강검진 예약시 수집정보></p> 
       <p>- 필수정보 : 고유식별정보 또는 병원등록번호</p> 
       <p><진료/건강검진/검사예약조회 및 결과 조회, 증명서발급시 수집정보></p> 
       <p>- 필수정보 : 병원등록번호</p> 
       <p><교육비, 발전기금 결재시 수집정보></p> 
       <p><p>- 필수정보 : 고유식별정보, 신용카드, 은행 계좌 등</p> 
<p>귀하는 선택정보에 대한 개인정보 수집․이용에 동의하지 않으실 수 있습니다.</p> 
<p>선택정보 수집‧이용에 동의하지 않을 경우에도 홈페이지 회원가입은 가능하나, 예약에 관련된 연락등 일부 서비스의 이용이 제한될 수 있습니다.</p> 
<p>다만, 홈페이지 개선 지원을 위한 최소한의 정보인 필수항목의 개인정보 미제공시에는 홈페이지 회원가입이 거부될 수 있습니다.</p> 
<p>개인정보의 수집방법</p> 
<p>휴면은 홈페이지 회원가입, 예약및 조회/결과조회, 증명서 발급, 신청 양식, 전화, 팩스, 상담게시판, 이메일, 이벤트 응모등을 통해 개인정보를 수집합니다.</p> 
<p>개인정보 수집 시에는 별도로 동의 받아야할 사항(고유식별정보, 민감정보, 목적 외 이용 및 제 3자 제공, 마케팅목적 활용)은 가입신청서등을 통하여 각각 동의를 받은 후 수집합니다.</p> 
<p>개인정보의 보유 및 이용기간</p> 
<p>개인정보는 휴면의료원이 고객에게 서비스를 제공하는 기간에 한하여 보유 및 이용되며 회원 탈퇴시에는 즉시 파기합니다.</p> 
<p>1. 이용기간 : 회원 가입기간 (탈퇴 후 즉시 파기)</p> 
<p>2. 설문조사, 행사등의 목적으로 수집된 경우 : 설문조사, 행사등이 종료된 때</p> 
<p>3. 진료서비스의 제공을 위하여 수집된 경우 : 의료법 기준에 준함</p> 
<p>수집목적 또는 제공받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 귀하의 개인정보를 보유할 수 있습니다</p> 
    </div>
    <label for="chk4">
        <input type="checkbox" id="chk4">
        <i class="circle"></i>
        <span class="text">의학정보 및 홍보 마케팅 제공 수집·이용(선택)</span>
    </label>
    <div class="scrollable-text">
      <p>목적 : 위 진료외 의학정보 안내 및 홍보 마케팅 자료 제공</p>
        
      <p>항목 : 회원정보 (성명, 성별, 연락처, 이메일)</p>
        
      <p>기간 : 해당목적 달성 시까지 (의료법 및 관계법령상 의무기간 포함)</p>
    </div>
    <div class="line"></div><!-- 선택사항 아래 회색줄-->
    <div class="bodyfooter">
        <p class="iconbi">동의 거부 시 불이익에 관한 사항</p>
        <p>귀하는 위 항목에 대하여 동의를 거부할 수 있으며, 동의 후에도 언제든지 철회 가능합니다.</p>
    </div>
    <button onclick="goToJoin()" style="font-size: 25px;">동의하기</button>
    <button style="font-size: 25px;"><a href="main.html" >뒤로가기</a></button>
</form>

    </div>
    </div>
    <div class="content-footer"></div>
    <script>
        function checkAll() {
            var chkAll = document.getElementById("chk");
            var chk2 = document.getElementById("chk2");
            var chk3 = document.getElementById("chk3");
            var chk4 = document.getElementById("chk4");
            if (chkAll.checked) {
                chk2.checked = true;
                chk3.checked = true;
                chk4.checked = true;
            } else {
                chk2.checked = false;
                chk3.checked = false;
                chk4.checked = false;
            }
        }
        function goToJoin(){
            window.location.href = " join.jsp"
        }
        chkAll.addEventListener("click", function() {
            if (chkAll.checked) {
                agreeBtn.removeAttribute("disabled");
            } else {
                agreeBtn.setAttribute("disabled", "true");
            }
        });
    </script>
   
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
       
   
    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16" style="color: chocolate;" >
        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
        <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
      </svg>
</body>
</html>
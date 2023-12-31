<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인</title>
    <link rel="stylesheet" type="text/css" href="./css/footer2.css" >
    <link rel="stylesheet" type="text/css" href="./css/hompage.css" >
    <link rel="stylesheet" type="text/css" href="./css/nav.css" >
</head>

<div>


        <!-- 상단바 -->
        <div class="menu">

            <nav class="clearfix">

                <ul class="clearfix">

                    <a href="HompageMain.jsp">
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
                    
                    <!-- 로그인 여부에 따라 다르게 표시될 로그인/회원가입 버튼 -->

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
            	 	
                    
                    
                    
                    
                    
                   <!--   <li>
                        <a href="../Patient/Login1.jsp">로그인</a>
                    </li>

                    <li>
                        <a href="../Patient/join.jsp">회원가입</a>
                    </li>
					-->
                </ul>
                <a id="pull" href="#"></a>
            </nav>

        </div>
        <!-- 상단바 끝 -->


        <!-- 슬라이더 시작 -->
        <div class="image-container_top">

            <div class="top_img_wrapper">

                <div class="img">
                    <img src="../homeMain/imgs/상단1.jpg" alt="사진 1">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단2.jpg" alt="사진 2">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단3.jpg" alt="사진 3">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단4.jpg" alt="사진 4">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단5.jpg" alt="사진 5">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단6.jpg" alt="사진 6">
                </div>

                <div class="img">
                    <img src="../homeMain/imgs/상단7.jpg" alt="사진 7">
                </div>

            </div>

        </div>

        <button id="prevButton" class="arrow-button">〈</button>
        <button id="nextButton" class="arrow-button">〉</button>

        <script src="../homeMain/js/swiperbtn.js"></script>
        <!-- 슬라이더 끝 -->


        <!-- mainInner 시작 -->
        <div class="middleBody">

            <div class="mainInner">

                <div class="mainInner_Row">

                    <div class="mainCol01 bgColor01">
                        <h3 class="m01_T_h">진료예약</h3>
                        <p class="m01_a_p">빠르고 쉽게 진료예약을</p>
                        <p class="m01_b_p">하실 수 있습니다.</p>
                        <div class="btnWrap">
                            <a href="" role="button">진료예약</a>
                            <a href="" role="button">첫예약상담</a>
                        </div>
                    </div>

                    <div class="mainCol01 bgColor02">
                        <h3 class="m01_T_h">진료과/센터</h3>
                        <p class="m01_a_p">병원의 진료과 / 센터를</p>
                        <p class="m01_b_p">상세히 확인할 수 있습니다.</p>
                        <div class="btnWrap">
                            <a href="" role="button">본원</a>
                            <a href="" role="button">암병원</a>
                        </div>
                    </div>

                    <div class="mainCol01 bgColor03">
                        <h3 class="m01_T_h">진료안내</h3>
                        <p class="m01_3_a">대표전화</p>
                        <h2 class="m01_3_a_a">1588-5700</h2>
                        <p class="m01_3_b">암환자 상담</p>
                        <h4 class="m01_3_b_a">02-2072-0707</h4>
                        <div class="btnWrap">
                            <a href="" role="button">외래진료안내</a>
                            <a href="" role="button">진료시간표</a>
                        </div>
                    </div>

                    <div class="mainCol01 bgColor01">
                        <h3 class="m01_T_h">로그인</h3>
                        <p class="m01_a_p">빠르고 쉽게 진료예약을</p>
                        <p class="m01_b_p">하실 수 있습니다.</p>
                        <div class="btnWrap">
                            <a href="" role="button">로그인</a>
                            <a href="" role="button">회원가입</a>
                        </div>
                    </div>

                </div>

                <div class="mainInner_Row">

                    <div class="mainCol02 mainSearchWrap">
                        <a href="">
                        <img src="../homeMain/imgs/자료1.jpg">
                        <h3 class="m02_T_h">진료과 찾기</h3>
                        <p class="m02_a_p">
                            휴먼대학교병원의 의료진은
                            <br>
                            환자를 위해 항상 노력하고 있습니다.
                        </p>
                        </a>
                    </div>

                    <div class="mainCol02 mainNews">
                        <h2 class="m02_T_h_b">HUMC 핫이슈</h2>

                        <span class="s_1"><a href="">휴먼대병원 어린이병원학교, 아이들의 희망과 꿈을...</a></span> 
                        <span class="s_2"><a href="">제27회 함춘학술상 및 제20회 장기려의도상 시상식</a></span>
                        <span class="s_3"><a href="">휴먼대병원, 뇌전증 치료제 토피라메이트 최적 혈중...</a></span>
                        <span class="s_4"><a href="">휴먼대병원 어린이 환자에게 희망이 된 AKMU의 따...</a></span>

                        <p class="p_1">2023-12-31</p>
                        <p class="p_2">2023-12-30</p>
                        <p class="p_3">2023-12-29</p>
                        <p class="p_4">2023-12-29</p>
                    </div>

                </div>

                <div class="mainInner_Row">

                    <a href="../html/Introduce.html">
                    <div class="mainCol02 Issue">
                        <h2 class="m02_T_h_b">병원소개</h2>
                    </div>
                    </a>

                </div>

                    <div class="mainCol01 bgColor04">
                        <h3 class="m01_T_h">위임장/동의서/증명서</h3>
                        <p class="m3_1_2">
                            위임장, 동의서 다운로드
                            <br>
                            및 증명서를 발급받으실 수
                            <br>
                            있습니다.
                        </p>
                        <div class="btnWrap">
                            <a href="" role="button">위임장/동의서</a>
                            <a href="" role="button">증명서발급</a>
                        </div>
                    </div>

                    <div class="mainCol01 bgColor05">
                        <h3 class="m01_T_h">고객의 소리</h3>
                        <p class="m3_1_2">
                            병원을 이용하시면서
                            <br>
                            감사 또는 건의하고자 하는
                            <br>
                            사항을 등록하실 수 있습니다.
                        </p>
                        <div class="btnWrap">
                            <a href="" role="button">감사합니다</a>
                            <a href="" role="button">건의합니다</a>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    <!-- mainInner 끝 -->


    <!-- mainInner_b 시작 -->
    <div class="middleBody_b">

        <div class="mainInner_b">

            <h1 class="H_T">건강정보</h1>
            <p class="H_P">질병,영양,운동,생활 속 관리 등 건강에 대한 모든 것</p>

            <div class="mainInner_Row_b">
                <div class="mainCol01 bgType01">
                    <strong>
                        건강 TV
                    </strong>
                    <p>
                        휴먼대학교병원 의료진에게
                        <br>
                        듣는 팟캐스트 '건강톡톡'
                    </p>
                </div>

                <div class="mainCol01 bgType02">
                    <strong>
                        우리 집 주치의
                    </strong>
                    <p>
                        하나의 질병에 대해서
                        <br>
                        깊이 있게 알아봅니다.
                    </p>
                </div>

                <div class="mainCol01 bgType03">
                    <strong>
                        공개강좌
                    </strong>
                    <p>
                        누구에게나 열려있는
                        <br>
                        공개 건강강좌
                    </p>
                </div>

                <div class="mainCol01 bgType04">
                    <strong>
                        건강채널
                    </strong>
                    <p>
                        더 편하게 만나는 건강정보
                    </p>
                </div>

            </div>

        </div>

    </div>
    <!-- mainInner_b 끝 -->


    <!-- mainInner_c 시작 -->
    <div class="middleBody_c">

        <div class="mainInner_c">

            <div class="mainCol01 bgColor06">
                <h3 class="m01_T_h">공공부문</h3>
                <p class="m3_1">
                    공공보건의료 발전을 위해
                    <br>
                    다양한 사업을 수행하고
                    <br>
                    있습니다.
                </p>
                <div class="btnWrap">
                    <a href="" role="button">공공부문</a>
                </div>
            </div>

            <div class="mainCol01 bgColor07">
                <h3 class="m01_T_h">건강증진센터</h3>
                <p class="m3_1">
                    질병 예방 및 삶의 질 향상을
                    <br>
                    위해 노력합니다.
                </p>
                <div class="btnWrap">
                    <a href="" role="button">본원</a>
                    <a href="" role="button">강남센터</a>
                </div>
            </div>

            <div class="mainCol01 bgColor08">
                <h3 class="m01_T_h">발전후원회</h3>
                <p class="m3_1">
                    따뜻한 마음을 의료 발전으로
                    <br>
                    보답 하겠습니다.
                </p>
                <div class="btnWrap">
                    <a href="" role="button">발전후원회</a>
                    <a href="" role="button">암병원후원</a>
                </div>
            </div>

            <div class="mainCol01 bgColor09">
                <h3 class="m01_T_h">진료협력센터</h3>
                <p class="m3_1">
                    네트워크로 하나되는 의료
                    <br>
                    HUMC 진료협력시스템
                </p>
                <div class="btnWrap">
                    <a href="" role="button">진료의뢰</a>
                    <a href="" role="button">협력병원</a>
                </div>
            </div>

        </div>

    </div>
    <!-- mainInner_c 끝 -->


    <!-- Footer 시작 -->
    <div class="ft_homWrap">
        <footer id="footer">
            <div class="Wrapall_ft">
            <div class="footerMenu_top">

                <ul class="ftmu_top">
                    <li>어린이병원</li>
                    <li>암병원</li>
                    <li>천안휴먼대병원</li>
                    <li>천안매병원</li>
                    <li>강남센터</li>
                    <li>휴먼대학교의과대학</li>
                </ul>

                <ul class="ftmu_top_1">
                    <li class="ftmu_top_li_a">진료과 </li>
                    <li class="ftmu_top_li_a">주요센터</li>
                    <li class="ftmu_top_li_a">주요부서 </li>
                    <li class="ftmu_top_li_a">주요서비스 </li>
                    <li class="ftmu_top_li_a">패밀리사이트 </li>
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


</body>

</html>
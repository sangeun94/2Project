<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../admin_patient/hospitalChart_list.jsp" %>
<!-- <%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/header.jsp" %>
<%@ include file="../admin_layout/_lnb_patient.jsp" %>


<!-- 차트 작성하기 상세
<section id="contents">
	<%@ include file="../admin_layout/hgroup.jsp" %>
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
	
	<!--pop-->
	<div class="pop_wrap">
		<div class="pop_ct large">
			<h3></h3>			
			<div class="tabArea">
				<ul class="tab">
					<li style="width:50%"><a href="#tab_sub1">차트 작성</a></li>
					<li style="width:50%"><a href="#tab_sub2" class="on">기본 정보</a></li>
				</ul>			
	
			<!-- 차트 작성 -->
			<div id="tab_sub1">	
				<table class="viewTable">
					<colgroup><col width="20%" /><col width="*" /></colgroup>
					<tbody>
					<tr>
						<th>진료 상세</th>
						<td><textarea placeholder="진료 내용을 입력하세요."></textarea></td>
					</tr>					
					</tbody>
				</table>
				<p class="btn_c">
					<a href="" class="red">등록하기</a>
				</p>					
			</div>	

			<!-- 기본 정보 -->
			<div id="tab_sub2">
				<table class="viewTable">
					<colgroup><col width="220px" /><col width="15%" /><col width="*" /><col width="15%" /><col width="*" /></colgroup>
					<tbody>
					<tr>
						<td rowspan="5">
							<p class="pic_area">
								<span id="idPic">Profile Image</span>
							</p>
						</td>
						<th>환자번호</th>
						<td>1</td>					
						<th>이름</th>
						<td>홍길동</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>남</td>
						<th>주민등록번호</th>
						<td>950101-1234567</td>
					</tr>
					<tr>
						<th>휴대전화번호</th>
						<td>010-1111-1111</td>
						<th>이메일주소</th>
						<td>user1@example.com</td>
					</tr>
					<tr>
						<th>회원아이디</th>
                        <td>user1</td>
						<th>주소</th>
						<td>서울특별시</td>
					</tr>
					</tbody>
				</table>
			</div>
						
			<button class="pop_close">닫기</button>
		</div>
	</div>				
	<!--// pop-->
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
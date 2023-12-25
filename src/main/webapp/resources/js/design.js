$(function(){
	//gnb & lnb
	var gnbCrt1 = $("#gnb>li:nth-child(" + (gnbDep1) + ")");
	var lnbCrt1 = $("#lnb>li:nth-child(" + (lnbDep1) + ")>a");
	var lnbCrt2 = $("#lnb>li:nth-child(" + (lnbDep1) + ")>ul>li:nth-child(" + (lnbDep2) + ")>a");
	var lnbCrt3 = $("#lnb>li:nth-child(" + (lnbDep1) + ")>ul>li:nth-child(" + (lnbDep2) + ") ul li:nth-child(" + (lnbDep3) + ") a" );
	if(gnbCrt1) gnbCrt1.addClass("on");
	if(lnbCrt1) lnbCrt1.addClass("on").next("ul").slideDown(0);
	if(lnbCrt2) lnbCrt2.addClass("on");
	if(lnbCrt3) lnbCrt3.addClass("on");
	$("#lnb ul").siblings("a").parent().addClass("child");
	$("#lnb a").click(function(){
		if($(this).parent().hasClass("child")){
			$(this).toggleClass("on").next("ul").slideToggle(200);
			$("#lnb>.child>a").not(this).removeClass("on").next("ul").slideUp(200);
			return false;
		};
	});
	$("nav").mouseleave(function(){
		if(lnbCrt1) lnbCrt1.addClass("on").next("ul").slideDown(200);
		$("#lnb>.child>a").not(lnbCrt1).removeClass("on").next("ul").slideUp(200);
	});

	//title
	if(title == 0) {
		if(gnbDep1 == 0) {
		} else{
			$("hgroup p").append("<span>"+ gnbCrt1.text() +"</span>");
		}
		if(lnbDep1 == 0) {
		} else{
			$("hgroup h3").text(lnbCrt1.text());
			$("hgroup p").append("<span>"+ lnbCrt1.text() +"</span>");
		}
		if(lnbDep2 == 0) {
		} else{
			$("hgroup h3").text(lnbCrt2.text());
			$("hgroup p").append("<span>"+ lnbCrt2.text() +"</span>");
		}
		if(lnbDep3 == 0) {
		} else{
			$("hgroup h3").text(lnbCrt3.text());
			$("hgroup p").append("<span>"+ lnbCrt3.text() +"</span>");
		}
	} else {
		$("hgroup h3").text(title);
			if(lnbDep1 == 0) {
				$("hgroup p").append("<span>"+ gnbCrt1.text() +"</span>");
			} else if(lnbDep2 == 0){
				$("hgroup p").append("<span>"+ gnbCrt1.text() +"</span>");
				$("hgroup p").append("<span>"+ lnbCrt1.text() +"</span>");
			} else if(lnbDep3 == 0) {
				$("hgroup p").append("<span>"+ gnbCrt1.text() +"</span>");
				$("hgroup p").append("<span>"+ lnbCrt1.text() +"</span>");			
				$("hgroup p").append("<span>"+ lnbCrt2.text() +"</span>");
			} else {
				$("hgroup p").append("<span>"+ gnbCrt1.text() +"</span>");
				$("hgroup p").append("<span>"+ lnbCrt1.text() +"</span>");			
				$("hgroup p").append("<span>"+ lnbCrt2.text() +"</span>");			
		    }
	}

	if ($("#contents").offset()) {
		$(window).scroll(function() {
			var fix = $("#contents").offset().top - $(window).scrollTop();
			if(fix <= 15) {
				$("nav").addClass("fixed");
			} else{
				$("nav").removeClass("fixed");
			};
		});
	}

	//pop
	$(".pop_close").click(function(){
		$(this).parents(".pop_wrap").fadeOut(200);
		return false;
	});
	$(".pop_close2").click(function(){
		$(this).parents(".pop_wrap").fadeOut(200);
		return false;
	});	
	/*퍼블리싱전용 start*/
	function pop_margin2() {
		$(".pop_ct").each(function(){
			var mt = $(this).outerHeight();
			//$(this).css("margin-top",-mt/2);
		});
	}
	pop_margin2();
	/*퍼블리싱전용 end*/

	// 트리메뉴
	$(".tree_list>button").click(function(){
		$(".tree_list").fadeOut(100);
		return false;
	});
	
	FuncSetNotifyTreeList();
});

/**
 * 스크립트 언어 설정
 */
var objScriptLang = null;
function FuncLoadLang(lang) {
	MF_RequestByURL('./_data/locale/script.asp', "json", function(data) {
		objScriptLang = data[lang];
		if (callback) callback();
	}, function(response) {
		// 해당 언어가 없으면 기본 영어로
		MB_RequestByURL('./_data/locale/en.asp', "json", function(data) {
			objScriptLang = data;
			if (callback) callback();
		});
	});
}

//트리메뉴
function FuncSetNotifyTreeList() {
	$(".tree_list li:last-child").addClass("last");
	$(".tree_list li ul").addClass("depth2").parent("li").addClass("child").children("a").after("<button>열림</button>");
	$(".tree_list li.child>button").click(function(){
		$(this).toggleClass("on").next("ul").slideToggle(200);
		if($(this).parents("ul").hasClass("depth2")) {
		} else {
			$(".tree_list li.child>button").not(this).removeClass("on").next("ul").slideUp(200);
		}
		return false;
	});
}

// 레이어 팝업 표시
function FuncPopShow(id, url) {
	// 뒤에 레이어 ID 를 자동으로 추가
	url = url + ((url.indexOf("?") > 0)?  "pLID=" : "?pLID=") + id;
	
	MF_ShowLoading();
	
	MF_RequestByURL(url, null, function(response) {
		MF_HideLoading();
		
		$("#" + id).html(response);
		$("#" + id).show();
		
		pop_margin(id);
	}, MF_ErrorAlert);
}

// 레이어 팝업 숨김
function FuncPopHide(id) {
	$("#" + id).fadeOut(100);
}

//팝업 사이즈 조절
function pop_margin(id) {
	$("#" + id + " .pop_ct").each(function(){
		var mt = $(this).outerHeight();
		$(this).css("margin-top",-mt/2);
	});
}
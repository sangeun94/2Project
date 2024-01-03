// 자바스크립트 함수 모음


/**
 * CSS 동적로딩
 *
 * @param url
 */
function MF_LoadCSS(url) {
	$('<link href="' + url + '" rel="stylesheet" type="text/css" />').appendTo("head");
	var $link = $('<link/>').appendTo("head");
	$link.attr({
		href : url,
		rel  : "stylesheet",
		type : "text/css"
	});
}


/**
 * 파라미터 반환
 *
 * @returns 파라미터 문자열
 */
function MF_GetParam(){
	var url = window.location.href;
	var paramIndex = url.indexOf("?");
	if (paramIndex > -1) {
		return url.substr(paramIndex + 1);
	}

	return null;
}


/**
 * 파라미터 반환
 *
 * @returns 파라미터 문자열
 */
function MF_GetParamValue(key){
	var params = MF_GetParam();
	var value = null;
	if (params != null) {
		params = params.split("&");
		var param = null;
		for (i = 0; i < params.length; i++) {
			param = params[i].split("=");
			if (param[0] == key) {
				value = param[1];
				break;
			}
		}
	}

	return value;
}


/**
 * 이미지 동적 로딩
 *
 * @param parent		이미지가 삽입될 부모 객체
 * @param imgID			이미지 객체에 할당될 id 값(null 이면 임의로 할당)
 * @param src			이미지 경로
 * @param className		이미지 class 명
 * @param style			이미지 style
 * @param alt			alt 문구
 * @param callbackParam	콜백함수로 함께 전달될 파라미터
 * @param callback		로딩 완료 후 호출될 함수(이미지 객체가 전달, 파라미터:object, 이미지소스, callbackParam)
 * @param hasLoading	로딩 중 표시 여부(true/false)
 */
function MF_LoadImg(parent, id, src, className, style, alt, callbackParam, callback, hasLoading) {
	// 이미지 아이디가 없으면 임의로 할당
	if (id == null || id == "") id = "idImg" + MF_GetCurrentTimeStamp();

	var imgLoading = null;
	if (hasLoading) {
//		imgLoading = $("<img src='" + frameworkURL + "/mobilnet/images/loading2.gif', class='idMFImageLoading' alt='loading'\/>");
//		$(parent).append(imgLoading);
	}

	var src = "<img id='" + id + "' src='" + src + "' class='" + className + "' style='" + style + "' alt='" + unescape(alt) + "'\/>";
	var img = $(src);
	$(img).bind("load", function() {
		if (imgLoading != null) imgLoading.remove();

		if (callback != null) {
			callback(id, src, callbackParam);
		}
	});
}


/**
 * 숫자 천단위 , 추가
 */
function MF_FormatNumber(number) {
	number=number+'';
    return number.replace(/[^\d\.\-]/g, '')
      .replace(/(\.\d{2})[\W\w]+/g, '$1')
      .split('')
      .reverse()
      .join('')
      .replace(/(\d{3})/g,'$1,')
      .split('')
      .reverse()
      .join('')
      .replace(/^([\-]{0,1}),/, '$1')
      .replace(/(\.\d)$/, '$1'+'0')
      .replace(/\.$/, '.00');
}


/**
 * TimeStamp 구하기
 */
function MF_GetCurrentTimeStamp() {
	return new Date().getTime();
}


/**
 * 쿠키값 추출
 * @param cookieName 쿠키명
 */
function MF_GetCookie(cookieName) {
	var search = cookieName + "=";
	var cookie = document.cookie;

	// 현재 쿠키가 존재할 경우
	if (cookie.length > 0) {
		// 해당 쿠키명이 존재하는지 검색한 후 존재하면 위치를 리턴.
		startIndex = cookie.indexOf( cookieName );

		// 만약 존재한다면
		if (startIndex != -1) {
			// 값을 얻어내기 위해 시작 인덱스 조절
			startIndex += cookieName.length;

			// 값을 얻어내기 위해 종료 인덱스 추출
			endIndex = cookie.indexOf( ";", startIndex );

			// 만약 종료 인덱스를 못찾게 되면 쿠키 전체길이로 설정
			if (endIndex == -1) endIndex = cookie.length;

			// 쿠키값을 추출하여 리턴
			return unescape( cookie.substring( startIndex + 1, endIndex ) );
		} else {
			// 쿠키 내에 해당 쿠키가 존재하지 않을 경우
			return false;
		}
	} else {
		// 쿠키 자체가 없을 경우
		return false;
	}
}

/**
 * 쿠키 설정
 * @param cookieName 쿠키명
 * @param cookieValue 쿠키값
 * @param expireDay 쿠키 유효날짜
 */
function MF_SetCookie(cookieName, cookieValue, expireDate) {
	var today = new Date();
	today.setDate( today.getDate() + parseInt( expireDate ) );
	document.cookie = cookieName + "=" + escape( cookieValue ) + "; path=/; expires=" + today.toGMTString() + ";";
}

/**
 * 현재 사용중인 파일의 이름을 가져온다, / 로 split 하고 맨 마지막에서 . 뒤를 제거함
 * @returns {*}
 * @constructor
 */
function MF_GetFilename() {
    var filePath = location.pathname.split('/');
    var fileName = filePath[filePath.length - 1].split('.')[0];
    return fileName;
}

/**
 * 파일 다운로드
 */
function MF_FileDown(fileID, fileSeq) {
	$("#idFileDownloadFrame").attr("src", MF_ContextPath + "/_common/file/fileDown.asp?pFileID=" + fileID + "&pFileSeq=" + fileSeq);
}

function MF_FileDownName(pgmID, fileName) {
	$("#idFileDownloadFrame").attr("src", MF_ContextPath + "/_common/file/fileDownName.asp?pPgmID=" + pgmID + "&pFileName=" + fileName);
}


/**
 * 페이징 처리
 * @param pageNo		현재 페이지 번호
 * @param listSize      한 페이지 표시될 목록 수
 * @param totalCount    전체 갯수
 * @param target        표시될 레이어
 * @param callbackName	호출 함수명
 */
function MF_SetPaging(pageNo, listSize, totalCount, target, callbackName, param) {
	if (totalCount == 0) {
		target.html("<a href='javascript:" + callbackName + "(1);' class='on'>1<\/a>");
		return;
	}
	
	if (listSize == -1) {
		listSize = totalCount;
	}
	
	var blockSize = 10;
	
	var currentBlock = parseInt(pageNo / blockSize)
	if ((pageNo % blockSize) > 0) currentBlock += 1;
	
	var lastPage = parseInt(totalCount / listSize)
	if ((totalCount % listSize) > 0) lastPage += 1;
	
	var startPage = (currentBlock - 1) * blockSize + 1;
	var endPage = startPage + blockSize - 1;
	if (endPage > lastPage) endPage = lastPage;
	
	var prevPage = ((currentBlock - 1) * blockSize);
	if (prevPage <= 0) prevPage = 1;
	
	var nextPage = ((currentBlock * blockSize) + 1)
	if (nextPage > lastPage) nextPage = endPage;
	
	var html = "";
	if (param == null || param == "") {
		if (lastPage > 1) {
			html += "<a href='javascript:" + callbackName + "(1);'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging1.png\" alt=\"처음\" /><\/a> ";
			html += "<a href='javascript:" + callbackName + "(" + prevPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging2.png\" alt=\"이전\" /><\/a>";
		}
		html += "<span>";
		for (var i = startPage; i <= endPage; i++) {
			if (i == pageNo) {
				html +=  " <a href='javascript:" + callbackName + "(" + i + ");' class='on'>" + i + "<\/a> ";
			} else {
				html +=  " <a href='javascript:" + callbackName + "(" + i + ");'>" + i + "<\/a> ";
			}
		}
		if (lastPage > 1) {
			html += "<a href='javascript:" + callbackName + "(" + nextPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging3.png\" alt=\"다음\" /><\/a> ";
			html += "<a href='javascript:" + callbackName + "(" + lastPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging4.png\" alt=\"마지막\" /><\/a>";
		}
	} else {
		if (lastPage > 1) {
			html += "<a href='javascript:" + callbackName + "(" + param + ", 1);'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging1.png\" alt=\"처음\" /><\/a> ";
			html += "<a href='javascript:" + callbackName + "(" + param + ", " + prevPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging2.png\" alt=\"이전\" /><\/a>";
		}
		for (var i = startPage; i <= endPage; i++) {
			if (i == pageNo) {
				html +=  " <a href='javascript:" + callbackName + "(" + param + ", " + i + ");' class='on'>" + i + "<\/a>";
			} else {
				html +=  " <a href='javascript:" + callbackName + "(" + param + ", " + i + ");'>" + i + "<\/a> ";
			}
		}
		html += "</span>";
		if (lastPage > 1) {
			html += "<a href='javascript:" + callbackName + "(" + param + ", " + nextPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging3.png\" alt=\"다음\" /><\/a> ";
			html += "<a href='javascript:" + callbackName + "(" + param + ", " + lastPage + ");'><img src=\"" + MF_ContextPath + "/resources/img/btn/paging4.png\" alt=\"마지막\" /><\/a>";
		}
	}
	
	target.html(html);
}
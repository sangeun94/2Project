/**
 * HUMD 2차 1
 * admin dataTable
 */

	$(document).ready(function() {
		// DataTables
		let table = $('#patientTable').DataTable({
			"paging" : true, // 페이징 활성화
			"pageLength" : 30, // 한 페이지에 표시될 목록 수
			"lengthMenu" : [[30, 50, 100, 200],[ "30개씩보기", "50개씩보기", "100개씩보기", "200개씩보기" ]], // 목록 수 선택 옵션
			"ordering" : false, // 정렬 비활성화
			"language": {
				 "zeroRecords": "검색 결과 없음", //dataTables_empty
				 "sInfo": "_START_ ~ _END_ (검색 결과 총 _TOTAL_명)",
				 "sInfoEmpty": "",
				 "infoFiltered": ""//total 집계 "총 환자 _MAX_명"
			}
		});	
		
		// Show entries 라벨 숨기기
	    $('.dataTables_length label').contents().filter(function() {
	        return this.nodeType === 3; // 텍스트 노드 선택
	    }).remove();

	    // Search: 라벨 숨기기
	    $('.dataTables_filter label').contents().filter(function() {
	        return this.nodeType === 3; // 텍스트 노드 선택
	    }).remove();
		
		// 검색 input에 placeholder 추가
	    let searchInput = $('.dataTables_filter input');
	    searchInput.attr('placeholder', '검색어를 입력하세요.');
	    
	    // 체크박스 전체 선택/해제
	    let selectAllCheckboxHeader = $('#selectAllCheckboxHeader');
	    let tbodyCheckboxes = $('.rowCheckbox');
	
	    selectAllCheckboxHeader.on('change', function() {
	        tbodyCheckboxes.prop('checked', selectAllCheckboxHeader.prop('checked'));
	    });
	
	    // tbody 내 체크박스 선택 시
	    tbodyCheckboxes.on('change', function() {
	        selectAllCheckboxHeader.prop('checked', tbodyCheckboxes.length === tbodyCheckboxes.filter(':checked').length);
	    });

	});
	
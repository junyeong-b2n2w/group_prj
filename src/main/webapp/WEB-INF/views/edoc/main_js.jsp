<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready( function() {
	let today = new Date();   
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	month = String(month)
	if(month.length == 1){
		month = "0"+month
	}
	let date = today.getDate();  // 날짜
	var todayDate = year + '-' + month + '-' + date
	var setting = {
			searchno : "${loginUser.emp_id}",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				code = ""
				if(res != null && res.length != 0){
					$.each(res, function(i, ob) {
						var regymd = ob.ed_regymd
						code += '<tr role="'+ob.ed_no+'" class="detailTr">'
						code += '<td class="p-2 text-center">'+regymd.substring(0,10)+'</td>' //문서번호, 제목, 구분
						code += '<td class="p-2">'+ob.ed_aprvtitle
						if(regymd.substring(0,10) == todayDate){
							code += '&nbsp;&nbsp;&nbsp;<span class="badge bg-red">New</span>'
						}
						code +='</td>'
						if(ob.ed_aprvstt == "DED01"){
							code += '<td class="p-2 text-center">결재상신</td>'							
						}else if (ob.ed_aprvstt == "DED03"){
							code += '<td class="p-2 text-center">진행중</td>'
						}else if (ob.ed_aprvstt == "DED04"){
							code += '<td class="p-2 text-center">결재완료</td>'
						}else if (ob.ed_aprvstt == "DED05"){
							code += '<td class="p-2 text-center">반려</td>'
						}
						code += '</tr>'
					})
				}else{
					code += "<tr><td colspan='3' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
				}
				$("#aprvList").empty()
				$("#aprvList").append(code)
			},
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 4		// 한페이지당 보여줄 리스트 개수
		}
	var setting2 = {
			searchno : "${loginUser.emp_id}",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				code = ""
				if(res != null && res.length != 0){
					$.each(res, function(i, ob) {
						var regymd = ob.aprv_asgmdt
						code += '<tr role="'+ob.ed_no+'" class="detailTr">'
						code += '<td class="p-2 text-center">'+regymd.substring(0,10)+'</td>' //문서번호, 제목, 구분
						code += '<td class="p-2">'+ob.ed_aprvtitle
						if(regymd.substring(0,10) == todayDate){
							code += '&nbsp;&nbsp;&nbsp;<span class="badge bg-red">New</span>'
						}
						code += '</td>'
						code += '<td class="p-2 text-center">결재대기</td>'
						code += '</tr>'
					})
				}else{
					code += "<tr><td colspan='3' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
				}
				$("#waitList").empty()
				$("#waitList").append(code)
			},
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 4		// 한페이지당 보여줄 리스트 개수6
		}
	var setting3 = {
			searchno : "${loginUser.emp_id}",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				code = ""
				if(res != null && res.length != 0){
					$.each(res, function(i, ob) {
						var regymd = ob.ed_regymd
						var asgmdt = ob.aprv_asgmdt
						if(!asgmdt){
							asgmdt = "none"
						}
						code += '<tr role="'+ob.ed_no+'" class="detailTr">'
						code += '<td class="p-2 text-center">'+regymd.substring(0,10)+'</td>' //문서번호, 제목, 구분
						code += '<td class="p-2">'+ob.ed_aprvtitle
						if(regymd.substring(0,10) == todayDate || asgmdt.substring(0,10) == todayDate){
							code += '&nbsp;&nbsp;&nbsp;<span class="badge bg-red">New</span>'
						}
						code += '</td>'
						if(ob.ed_aprvstt == "DED01"){
							code += '<td class="p-2 text-center">결재상신</td>'							
						}else if (ob.ed_aprvstt == "DED03"){
							code += '<td class="p-2 text-center">진행중</td>'
						}else if (ob.ed_aprvstt == "DED04"){
							code += '<td class="p-2 text-center">결재완료</td>'
						}else if (ob.ed_aprvstt == "DED05"){
							code += '<td class="p-2 text-center">반려</td>'
						}
						code += '</tr>'
					})
				}else{
					code += "<tr><td colspan='3' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
				}
				$("#ingList").empty()
				$("#ingList").append(code)
			},
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 4		// 한페이지당 보여줄 리스트 개수
		}
	var setting4 = {
			searchno : "${loginUser.emp_id}",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				code = ""
				if(res != null && res.length != 0){
					$.each(res, function(i, ob) {
						var regymd = ob.ed_comymd
						code += '<tr role="'+ob.ed_no+'" class="detailTr">'
						code += '<td class="p-2 text-center">'+regymd.substring(0,10)+'</td>' //문서번호, 제목, 구분
						code += '<td class="p-2">'+ob.ed_aprvtitle
						if(regymd.substring(0,10) == todayDate){
							code += '&nbsp;&nbsp;&nbsp;<span class="badge bg-red">New</span>'
						}
						code +='</td>'
						code += '<td class="p-2 text-center">결재완료</td>'
						code += '</tr>'
					})
				}else{
					code += "<tr><td colspan='3' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
				}
				$("#receList").empty()
				$("#receList").append(code)
			},
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 4		// 한페이지당 보여줄 리스트 개수
		}
	var aprv = new Pagination(setting);	// pagination 객체생성
	aprv.setPagenation("aprvPaging","myAprvPageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
	var wait = new Pagination(setting2);	// pagination 객체생성
	wait.setPagenation("waitPaging","myAprvWaitPageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
	var ing = new Pagination(setting3);	// pagination 객체생성
	ing.setPagenation("ingPaging","myAprvIngPageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
	var receive = new Pagination(setting4);	// pagination 객체생성
	receive.setPagenation("recePaging","myReceivePageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
			
	$('#mainDivId').on('mouseenter', '.detailTr', function( event ) {
	    $(this).css("background","lightblue");
	}).on('mouseleave', '.detailTr', function( event ) {
		$(this).css("background","white");
	})
	$("#mainDivId").on("click",".detailTr", function() {
		var edno = $(this).attr("role")
		OpenWindow("detail.do?edno="+edno,"전자문서"+edno,700, 850)
	})
})
</script>
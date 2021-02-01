<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready( function() {
	var setting = {
// 			table : "notice",			// DB테이블명(필수)
			primarykey : "ED_DFTR",		// DB기본키명(필수)
			searchno : "${loginUser.emp_id}",
			orderby : "edocListorderby",		// DB정렬기준 컬럼(필수)
			defaultorderby : "ed_regymd",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				if(res != null && res.length != 0){
					code = "";
					$.each(res, function(i, obj) {
						code += "<tr>"
						code += "<td>"+obj.ed_deptnm.substring(0,3)+"-"+obj.ed_no+"</td>"
						code += "<td>"+obj.ed_empnm+"</td>"
						code += "<td>"+obj.ed_deptnm+"</td>"
						code += "<td>"+obj.ed_formnm+"</td>"
						code += "<td onclick='OpenWindow(\"detail.do?edno="+obj.ed_no+"\",\"전자문서"+obj.ed_no+"\",700, 850)'><a href='#' style='color: deepskyblue;text-decoration: revert;'>"+obj.ed_aprvtitle+"</a></td>"
						code += "<td>"+obj.ed_regymd+"</td>"
						code += "<td>"
						if(obj.ed_comymd == null){
							code +="미완료"
						}else{
							code += obj.ed_comymd
						}
						code +="</td>"
						
						if(/DAP.5/.exec(obj.code)){
							code += '<td>결재대기</td><td><i class="fas fa-user-circle h4 text-info mr-1 ml-3"></i></td>'
						}else{
							if(obj.ed_aprvstt == "DED01"){
								code += '<td>상신</td><td><i class="fas fa-arrow-alt-circle-up h4 text-info mr-1 ml-3"></i></td>'
							}else if(obj.ed_aprvstt == "DED03"){
								code += '<td>진행중</td><td><i class="fas fa-spinner h4 text-secondary mr-1 ml-3"></i></td>'
							}else if(obj.ed_aprvstt == "DED04"){
								code += '<td>완료</td><td><i class="fas fa-check-circle h4 text-success mr-1 ml-3"></i></td>'
							}else if(obj.ed_aprvstt == "DED05"){
								code += '<td>반려</td><td><i class="fas fa-times-circle h4 text-danger mr-1 ml-3"></i></td>'
							}
						}
						if(obj.ed_aprvstt == "DED04"){
							code += "<td><input name='aprvReference' value='설정' class='btn btn-sm w-100' style='font-size:0.5rem;' role= '"+obj.ed_no+"'></td>"
						}else{
							code += "<td></td>"
						}
						code += "</tr>"
					})
				}else{
					code = "<tr><td colspan='10' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
				}
				$("#aprvListAppend").empty()
				$("#aprvListAppend").append(code)
			},
			searchBtn : "searchBtn",// 검새버튼 아이디 추가
			refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
// 			equalMap : "ntc_writerid",// =조건 검색추가시 추가 컬럼명(TAGNAME)
			likeMap : "ed_formnm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
			likeMap2 : "ed_deptnm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
			likeMap3 : "ed_empnm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
// 			dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
// 			dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
// 			checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
// 			radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임)
			selDateGtMap : {selName : "dateSel", input : "startdate"},
			selDateLtMap : {selName : "dateSel", input : "enddate"},
			selectBox : "ed_aprvstt",
			selLikeMap : {selName : "priSearchSelect", input : "priSearchInput"},
			displaypage : 10,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 10		// 한페이지당 보여줄 리스트 개수
		}
		var test = new Pagination(setting);	// pagination 객체생성
		test.setPagenation("aprvListPaging","aprvPageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
})
</script>

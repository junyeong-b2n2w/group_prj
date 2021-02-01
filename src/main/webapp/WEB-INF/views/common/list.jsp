<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div><input type="text" name="ntc_title" placeholder="제목"></div>
<div><input type="text" name="ntc_writerid" placeholder="사람"></div>
<div><input type="date" name="regdtGt"></div>
<div><input type="date" name="regdtLt"></div>
<div><input type="button" id="searchBtn" value="검색"></div>
<div><input type="button" id="refreshBtn" value="전체"></div>
<div><input type="checkbox" name="inmap" value="test">test</div>
<div><input type="checkbox" name="inmap" value="user01">user01</div>
<div id=listArea></div>
<div id=pagenation></div>
<script>
	window.onload = function() {
		var setting = {
				table : "notice",			// DB테이블명(필수)
				primarykey : "ntc_no",		// DB기본키명(필수)S
				orderby : "orderby",		// DB정렬기준 컬럼(필수)
				defaultorderby : "ntc_regdt",		// DB정렬기준 컬럼(필수)
				onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
					if(res != null){
						code = "<ul>";
						$.each(res, function(i, obj) {
							code += "<li>" + obj.ntc_no + "</li>"
						})
					}else{
						code = "<div>없다!</div>"
					}
					$("#listArea").empty()
					$("#listArea").append(code)
				},
				searchBtn : "searchBtn",// 검새버튼 아이디 추가
				refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
				equalMap : "ntc_writerid",// =조건 검색추가시 추가 컬럼명(TAGNAME)
				likeMap : "ntc_title",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
				dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
				dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
				checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
				radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임)
				displaypage : 3,	// 한화면에 보여줄 페이지 버튼 개수
				perPageNum : 7		// 한페이지당 보여줄 리스트 개수
			}
			var test = new Pagination(setting);	// pagination 객체생성
			test.setPagenation("pagenation","pagelist", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
	}
	
</script>
<%-- <%@ include file="inge2.jsp" %> --%>
<%@ include file="pagination2.jsp" %>













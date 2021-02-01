<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/css/zTreeStyle/zTreeStyle.min.css" />



<div class="content">
	<div class="container-xl">
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">게시판</h2>
				</div>
				<div class="col-auto ms-auto d-print-none">
					<a href="<%=request.getContextPath() %>/post/registpost.do?post_brdno=${postvo.post_brdno}" class="btn btn-primary w-200" id="modalRegistBtn"> 글 등록 </a>
				</div>
			</div>
		</div>
		<div class="card p-3">
			<div class="card-body py-3" style="border-bottom: 2px solid #206bc4 !important;">
				<div class="d-flex" style="justify-content: flex-end;">
					<div class="ms-auto text-muted">
						<div class="ms-2 d-inline-block">
							<select class="form-select form-control-sm" name="searchType">
								<option value="post_title">제목</option>
								<option value="post_cont">내용</option>
								<option value="post_pbls">작성자</option>
							</select>
						</div>
						<div class="ms-2 d-inline-block">
							<input type="text" class="form-control" aria-label="Search invoice" placeholder="검색어를 입력하세요" name="post_search">
						</div>
						<div class="ms-2 d-inline-block">
							<a href="#" class="btn btn-white btn-icon" aria-label="Button" id="searchType"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<circle cx="10" cy="10" r="7"></circle>
									<line x1="21" y1 ="21" x2="15" y2="15"></line></svg>
							</a> <input type="button" class="btn btn-primary" value="초기화" id="refreshBtn">
						</div>
					</div>
				</div>
			</div>

			<div class="table-responsive">
				<table class="table card-table table-vcenter text-nowrap datatable">
					<thead>
						<tr>
							<th class="w-1">No.
							</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>

					<tbody id="PostList">
					</tbody>
				</table>
			</div>



			<div class="card-footer d-flex align-items-center" style="place-content: center;">

				<div id="post_lists"></div>



				<!-- 글 등록 끝 -->
			</div>
		</div>

	</div>
</div>

<script>

window.addEventListener("load",function(){
	
	var setting = {
			table : "post",			// DB테이블명(필수)
			primarykey : "post_no",		// DB기본키명(필수)S
			searchno : "${postvo.post_brdno }",
			selLikeMap : {selName : "searchType", input : "post_search"},
			 onPageClick : function (res) { 	// 페이지네이션 후 받을데이터 처리
			
				 if(res != null){
					code = "";
					$.each(res, function(i, obj) {
						if(i == 0){
							code += "<tr class='first'>";
						}else{
							code += "<tr>";
						}
						code += "<td><span class='text-muted'>" + res[i].post_no + "</span></td>";
					if(res[i].post_ppost != null){
						code += '<td>';
						if(res[i].level > 1){
							for(let j=0; j<res[i].level-1; j++ ){
								code+="&nbsp;&nbsp;";
							}
						}
						
						code += '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"> <path stroke="none" d="M0 0h24v24H0z" fill="none" /> <path d="M6 6v6a3 3 0 0 0 3 3h10l-4 -4m0 8l4 -4" /></svg>';
						code += '<a href="" data-toggle="modal" data-keyboard="false" data-backdrop="static" data-target="#modal-Boarddetail" id="postModalDetail" onclick="postGo('+res[i].post_no+',this); ">'+res[i].post_title+' </a> </td>'
					}
					
					if(res[i].post_ppost == null){
						code += '<td> <a href="" data-toggle="modal" data-keyboard="false" data-backdrop="static" data-target="#modal-Boarddetail" id="postModalDetail" onclick="postGo('+res[i].post_no+',this);">'+res[i].post_title+'</a> </td>'
					}
					
						code += '<td><span class="flag flag-country-us"></span>'+res[i].post_pbls+''
						code += '</td>';
						code += ' <td>'+res[i].post_views+'</td><td>'+res[i].post_regdt+'</td>';
						code += "</tr>"
					})
				}else{
					code = "<div>없다!</div>"
				}
				$("#PostList").empty();
				$("#PostList").append(code) ; 
 			},
			searchBtn : "searchType",// 검새버튼 아이디 추가
			refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
// 			equalMap : "post_no",// =조건 검색추가시 추가 컬럼명(TAGNAME)
// 			likeMap : "post_title",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
// 			dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
// 			dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
// 			checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
// 			radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임) 
			displaypage : 10,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 10		// 한페이지당 보여줄 리스트 개수
		}
		var test = new Pagination(setting);	// pagination 객체생성

		var page = 1
		
		if(${param.NowPage}){
			page = ${param.NowPage}
		}
		test.setPagenation("post_lists","cri", page) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
		
})


function postGo(postNo,page){
	var NowPage = $('.page-item.active').attr('value');
	var value = $(page).closest('tr').hasClass('first');
	
	if(value){
		value = 1;
	}else{
		value= 2;
	}
	location.href="<%=request.getContextPath()%>/post/detail.do?post_no="+postNo+"&NowPage="+NowPage+"&value="+value;
}


</script>


<%@ include file="/WEB-INF/views/common/pagination2.jsp"%>
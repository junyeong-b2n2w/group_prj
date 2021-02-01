<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="content">
	    <div class="container">
	    <div class="page-header d-print-none">
				<div class="row align-items-center">
					<div class="d-flex justify-content-between ">
						<h3 class="page-title">회사  관리</h3>
						<button type="button" class="btn btn-primary" onclick="regist()">등록하기</button>
					</div>
				</div>
			</div>
	    
		  
		    
			    <div class="card container p-3">
				    <div class="card-header d-flex justify-content-between">
					    <h3>회사 리스트</h3> 
						<div class="ms-auto text-muted">
							<div class="ms-2 d-inline-block">
								<select class="form-select " name="searchCompType">
									<option value="comp_nm">회사명</option>
									<option value="comp_crno">사업자등록번호</option>
									<option value="comp_delgnm">대표명</option>
									<option value="comp_addr">소재지</option>
								</select>
							</div>
							<div class="ms-2 d-inline-block">
								<input type="text" class="form-control " aria-label="Search invoice" name="company_search" placeholder="검색어를 입력하세요">
							</div>
							<div class="ms-2 d-inline-block">
								<button type="button" class="btn btn-primary " id="search">검색</button>
							</div>
							<div class="ms-2 d-inline-block">
								<button type="button" class="btn btn-primary " id="allCompany">초기화</button>
							</div>
							
						</div>
				    </div>
				    <table class="table table-vcenter">
					    <thead>
						    <tr>
							    <th>#</th>
							    <th class="regymd" role="comp_nm">회사명</th>
							    <th>사업자등록번호</th>
							    <th class="regymd" role="comp_delgnm">대표명</th>
							    <th>소재지</th>
							    <th class="regymd" role="comp_regymd">등록일자</th>
							    <th>활성상태</th>
						    </tr>
					    </thead>
					    <tbody id="compTable">
					    </tbody>
				    </table>
				    <div class="card-footer d-flex justify-content-center" id="pagenation">
					    <ul class="pagination m-0 ms-auto">
						    <li class="page-item disabled">
							    <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
							   		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg>prev
							    </a>
						    </li>
						    <li class="page-item"><a class="page-link" href="#">1</a></li>
						    <li class="page-item active"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#">4</a></li>
						    <li class="page-item"><a class="page-link" href="#">5</a></li>
						    <li class="page-item">
							    <a class="page-link" href="#">
							    	next<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>
							    </a>
						    </li>
					    </ul>
				    </div>
			    </div>
	    </div>	
    </div>

	<script type="text/javascript">
		function regist() {
			location.href="<%=request.getContextPath()%>/role/company/registForm";
		}
		
		function getFormatDate(date){
			var year = date.getFullYear();
			var month = new String(date.getMonth()+1);
			var day = new String(date.getDate()); 
			
			if(month.length == 1){ 
				month = "0" + month; 
			}
			if(day.length == 1){ 
				  day = "0" + day; 
			} 
			
			return date = year + "-"  + month + "-" + day;
		}
		
		$(document).ready(function () {
			var setting = {
					orderby : "regymd",		// DB정렬기준 컬럼(필수)
					defaultorderby : "comp_regymd",
					selLikeMap : {selName : "searchCompType", input : "company_search"},
					onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
						console.log(res);
						
						if(res != null){
							code = "";
							$.each(res, function(i, obj) {
								var addr = res[i].comp_addr.split(',')[1];
								var actv = "";
								var date = getFormatDate(new Date(res[i].comp_regymd));
								
								code += "<tr>";
								code += "	<td>"+ (i+1) +"</td>";
								code += "	<td><a href='detail?comp_no="+res[i].comp_no+"'>"+ res[i].comp_nm +"</a></td>";
								code += "	<td>"+ res[i].comp_crno +"</td>";
								code += "	<td>"+ res[i].comp_delgnm +"</td>";
								code += "	<td>"+ addr.split(" ")[0] + " " + addr.split(" ")[1] + "</td>";
								code += "	<td>" + date + "</td>"
								code += "	<td>";
								if(res[i].comp_actvyn == 'Y'){
									code += "	<span class='badge bg-primary me-1'>활성</span>"
							    } else{
							    	code += "	<span class='badge bg-danger me-1'>비활성</span>"
								}
								code += "	</td>"
								code += "</tr>";
							});
						} else{
							code = "<tr>";
							code += "<td colspan='6' rowspan='2'>조회되는 사원이 없습니다</td>";
							code += "</tr>";
						}
						
						$("#compTable").empty();
						$("#compTable").append(code);
					},
					searchBtn : "search",// 검새버튼 아이디 추가
					refreshBtn : "allCompany", // 전체목록조회 돌아가기버튼 ID 
//						equalMap : "ntc_writerid",// =조건 검색추가시 추가 컬럼명(TAGNAME)
// 						likeMap : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
//						dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
//						dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
//						checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
//						radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임)
					displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
					perPageNum : 10		// 한페이지당 보여줄 리스트 개수
				}
			
				var test = new Pagination(setting);	// pagination 객체생성
				test.setPagenation("pagenation","companyList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
		})
		
	</script>
	
	<%@ include file="../common/pagination2.jsp"%>
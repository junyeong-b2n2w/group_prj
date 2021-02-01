<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">

					<h2 class="page-title">공지사항</h2>
				</div>
				<div class="col-auto ms-auto d-print-none">
                <button type="button" class="btn btn-primary" onclick="javascript:goNoticeRegist();">
                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
              	    등록
                </button>
              </div>
			</div>
		</div>
		<!-- page title -->
		
		<div class="row row-deck row-cards">
			<div class="col-12">
			 <div class="card p-3">
                 <div class="card-body py-3" style="border-bottom: 2px solid #206bc4!important;">
                  <div class="d-flex" style="justify-content: flex-end;">
                    <div class="ms-auto text-muted">
                      <div class="ms-2 d-inline-block">
                      <select class="form-select form-control-sm" name="searchType" id="searchType">
			              <option value="tc" ${cri.searchType eq 'tc' ? 'selected':'' }>검색구분</option>
			              <option value="t" ${cri.searchType eq 't' ? 'selected':'' }>제목</option>
			              <option value="c" ${cri.searchType eq 'c' ? 'selected':'' }>내용</option>
			            </select>
                      </div>
                      <div class="ms-2 d-inline-block searchbox">
                        <input type="text" class="form-control" placeholder="검색어를 입력하세요" id="keyword" name="keyword" value="">
                      </div>
                      <div class="d-inline-block mx-0 px-0" >
                         <a href="javascript:searchList_go(1);" class="btn btn-white btn-icon" aria-label="Button">
                           <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
                         </a>
                       </div>
                    </div>
                  </div>
                </div>
                <div class="table-responsive mt-4">
                  <table class="table card-table table-vcenter text-nowrap datatable">
                    <thead>
                      <tr>
                        <th class="w-1">No.</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>조회수</th>
                        <th>작성일</th>
                      </tr>
                    </thead>
                    <tbody id="appendNotice">
                    
                    </tbody>
                  </table>
                 </div><!-- table div -->
                <div class="card-footer d-flex align-items-center" style="justify-content: center;"id="paginationDiv">
	                </div><!-- paginaion -->
	              </div><!-- card -->
                </div><!-- col-12 -->
              </div><!-- row -->
		</div>
	<!-- containew-xl -->
</div>
<script>
function detailNotice(ntc_no){
	
// 	var chk = $('.page-item.active').attr('value');
<%-- 	location.href="<%=request.getContextPath()%>/notice/detail?ntc_no="+ntc_no+"&chk="+chk; --%>
	location.href="<%=request.getContextPath()%>/notice/detail?ntc_no="+ntc_no;
}
function goNoticeRegist(){
	location.href="<%=request.getContextPath()%>/notice/registForm";
	
}

window.addEventListener('load',function(){
	var nList = ${nList};
	
	var data = ${pageMaker};
	//getPagination에  pageMaker, formName, 페이지네이션 표시항 위치
	getPagination(data,'form','paginationDiv');
	
	setTempData(nList);
	var getData = getTempData();
	
	getNoticeList(getData);
})

$('#paginationDiv').on("click", "ul > li > a", function (event) {
		$('#paginationDiv > ul > li').removeClass('active');
		$(this).closest("#paginationDiv > ul > li").addClass('active');
// 		var searchGo = $(this).prop("onclick");
// 		$(this).removeProp("onclick");
// 		$(this).click(searchGo);
	 var reGetData = getTempData();
	 
	 
// 	 	if(!(reGetData.pageMaker.prev)){
// 	 		reGetData.pageMaker.cri.page = -1
// 	 	}else if(!(reGetData.pageMaker.next)){
// 	 		reGetData.pageMaker.cri.page = -1
	 		
// 	 	}
// 	 	if(reGetData.pageMaker.cri.page == -1){
	 		
// 	 		alert("페이지가 없습니다")
// 	 		return;
// // 	 		alert("aaa");
// // // 	 		return false;
// 	 	}
	 	
	 console.log("getNoticeList getData " + JSON.stringify(reGetData.pageMaker.prev));
// 	 if(reGetData.pageMaker.prev)
	getNoticeList(reGetData.nList);
// 	$(this).prop("onclick",searchGo);
});


function getNoticeList(getData){
	 var code =""
	 $.each(getData,function (index) {
// 		 var formatDate = getFormatDate(data[index].ntc_regdt);
				code += "<tr>";
				code += "<td><span class='text-muted'>"+getData[index].ntc_no+"</span></td>";
				code += "<td><a href='' onclick='detailNotice("+getData[index].ntc_no+");' class='text-reset' tabindex='-1' data-toggle='modal' id='title'>"+getData[index].ntc_title+"</a></td>";
				code += "<td> <span class='flag flag-country-gb'></span>"+getData[index].ntc_writerid+"</td>";
				code += "<td>"+getData[index].ntc_views+"</td>";
				code += "<td>"+getData[index].ntc_regdt+"</td></tr>";
		});
			 $("#appendNotice").empty();  
			 $("#appendNotice").html(code);  
			 setTempData(getData);
}

// function getFormatDate(date){
//     console.log(date + "year")
//     var year = date.getFullYear();
//     var month = (1 + date.getMonth());
//     month = month >= 10 ? month : '0' + month;
//     var day = date.getDate();
//     day = day >= 10 ? day : '0' + day;
//     return year + '-' + month + '-' + day;
// }


</script>
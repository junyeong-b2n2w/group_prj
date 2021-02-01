<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="cri" value="${pageMaker.cri }"></c:set>

	<ul class="pagination ">
      <li class="page-item">
        <a class="page-link" href="javascript:searchList_go(${pageMaker.prev ? pageMaker.startPage-1 : -1},${url });" >
          <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="15 6 9 12 15 18"></polyline></svg>
          prev
        </a>
      </li>
      <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
			<li class="page-item <c:out value="${pageMaker.cri.page == pageNum?'active':''}"/>">
				<a class="page-link" href="javascript:searchList_go(${pageNum},${url });">${pageNum}</a>			
			</li>
	  </c:forEach>
      <li class="page-item">
        <a class="page-link" href="javascript:searchList_go(
			${pageMaker.next ? pageMaker.endPage+1 : -1},${url })">
          next <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><polyline points="9 6 15 12 9 18"></polyline></svg>
        </a>
      </li>
    </ul>

	

	

<form id="jobForm">
	<input type="hidden" name="page" value="${cri.page}"/>
	<input type="hidden" name="perPageNum" value="${cri.perPageNum}"/>
	<input type="hidden" name="searchType" value="${cri.searchType}"/>
	<input type="hidden" name="searchType2" value="${cri.searchType2}"/>
	<input type="hidden" name="keyword" value="${cri.keyword}"/>
</form>

<script>
	function searchList_go(page,url) {
		if(page==-1){
			return
		}
		
		var perPageNum = 10;
		if($('select[name="perPageNum"]').val()){
			perPageNum = $("select[name='perPageNum']").val()
		}
		
		var jobForm=$("#jobForm");
		jobForm.find("[name='page']").val(page);
		jobForm.find("[name='perPageNum']").val(perPageNum);
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='searchType2']").val($('select[name="searchType2"]').val());
		jobForm.find("[name='keyword']").val($('div.searchbox input[name="keyword"]').val());
		jobForm.attr("method","post")
		
		if(url){
			jobForm.attr("action",url)
		}else{
			jobForm.attr("action","list.do")
		}
		jobForm.submit()
	}
	
</script>
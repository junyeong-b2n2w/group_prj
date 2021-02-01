<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>



<div class="divide-y" id="appendArea">
	<c:forEach var="attach" items="${attachList }">
		<label class="row"> 
		<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
				<span class="col">${attach.attc_extnm } 
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
						<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg></span>
		</a> <span class="col-auto"> <label
				class="form-check form-check-single form-switch"> <small
					data-src="${attach.attc_no }" class="newFile"> <a
						onclick="javascript:deleteFile('${attach.attc_no }');"> <svg
								xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
								height="24" viewBox="0 0 24 24" stroke-width="2"
								stroke="currentColor" fill="none" stroke-linecap="round"
								stroke-linejoin="round">
								<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
								<line x1="18" y1="6" x2="6" y2="18"></line>
								<line x1="6" y1="6" x2="18" y2="18"></line></svg>
					</a></label>
		</span>
		</label>
	</c:forEach>
</div>


<div class="divide-y" id="appendArea">
	<c:forEach var="attach" items="${attachList }">
	  <div>
	  <label class="row">
	  <a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
	    <span class="col">${attach.attc_extnm }
	    	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						<path d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
						<path d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
	    </span>
	    </a>
	    <span class="col-auto">
	      <label class="form-check form-check-single form-switch">
	        <a onclick="javascript:deleteFile('${attach.attc_no }');">
	        	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="18" y1="6" x2="6" y2="18"></line>
									<line x1="6" y1="6" x2="18" y2="18"></line></svg>
	        </a>
	        <small data-src="${attach.attc_no }" class="newFile"></small>
	      </label>
	    </span>
	  </label>
	</div>
	</c:forEach>
</div>
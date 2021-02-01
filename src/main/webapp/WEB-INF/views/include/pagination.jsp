<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>


	var tempData;
	
	var appendArea;
	function getPagination(pageMaker, formName, appendId) {
		appendArea = appendId;
		var prev
		if(pageMaker.prev){
			prev = pageMaker.startPage-1
		}else{
			prev = -1
		}
		
		var next
		if(pageMaker.next){
			next = pageMaker.endPage+1
		}else{
			next = -1
		}
		
		var active
		if(pageMaker.cri.page == pageMaker.pageNum){
			active = "active";
		}else{
			active = "";
		}
		var url = pageMaker.url;
		if(url == null){
			url = "list.do";
		}else{
			url = "<%=request.getContextPath()%>"+pageMaker.url;
			
		}
		
		
		code = "<ul class='pagination '>";
		code += "<li class='page-item'>";
		code += "<a class='page-link' onclick='searchList_go("+prev+",\""+url+"\");' >";
		code += "<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'><\/path><polyline points='15 6 9 12 15 18'></polyline></svg>";
		code += "prev</a></li>";
		for(var i=pageMaker.startPage; i<pageMaker.endPage+1; i++){
			code += "<li class='page-item "+active+"'>";
			code += "<a class='page-link' onclick='searchList_go("+i+",\""+url+"\");'>"+i+"</a>";
			code += "</li>";
		}
		code += "<li class='page-item'>";
		code += "<a class='page-link' onclick='searchList_go("+next+",\""+url+"\");'>";
		code += "next<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'><\/path><polyline points='9 6 15 12 9 18'></polyline></svg>";
		code += "</a></li>";
      	code += "</ul>";
      	code += "<form id='"+formName+"'>";
        code += "<input type='hidden' name='page'/>";
        code += "<input type='hidden' name='perPageNum'/>";
        code += "<input type='hidden' name='searchType'/>";
        code += "<input type='hidden' name='keyword'/>";
        code += "<input type='hidden' name='primaryKey' value='"+pageMaker.cri.primaryKey+"'/>";
        code += "</form>";
        code += "<script>";
        code += "function searchList_go(page,url) {";
        code += "if(page==-1){";
        code += "alert('페이지가 없습니다.');";
        code += "return;";
        code += "}";
        code += "var perPageNum = 10;";
        code += "if($(\"select[name='perPageNum']\").val()){";
        code += "perPageNum = $(\"select[name='perPageNum']\").val()";
        code += "}";
        code += "var searchForm=$('#"+formName+"');";
        code += "searchForm.find(\"[name='page']\").val(page);";
        code += "searchForm.find(\"[name='perPageNum']\").val(perPageNum);";
        code += "searchForm.find(\"[name='searchType']\").val($(\"select[name='searchType']\").val());";
		code += "searchForm.find(\"[name='keyword']\").val($(\"div.searchbox input[name='keyword']\").val());";
		code += "var chkSearchForm = searchForm.serializeArray();";
		code += "repaging(chkSearchForm,url,"+pageMaker.cri.primaryKey+");";
		code += "}";
		code += "<\/script>";
		
   		$("#"+appendId).html(code)
		
	}
	

	 function repaging(chkSearchForm,url,primaryKey){
			var jsonArray ={};
			
			$.each(chkSearchForm,function(index,obj){
				
				jsonArray[obj.name] = obj.value;
			})
			
			jsonArray['primaryKey'] = primaryKey+"";
			 $.ajax({
			        
				url:url,
	   			type:"POST",
	   			data: jsonArray,
	   			async:false,
	   			dataType:"json",
	   			success:function(data){
	   				setTempData(data)
	   			}
			 })
			 
		}
	function setTempData(data){
		tempData = data;
	}
	
	 function getTempData(){
		 return tempData;
	 }

</script>
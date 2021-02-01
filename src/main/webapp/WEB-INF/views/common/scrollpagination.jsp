<%@ page language='java' contentType='text/html; charset=UTF-8'
	pageEncoding='UTF-8'%>
<script>
	function Pagination(setting) {
		this.displaypage = 10;
		this.perPageNum = 10;
		this.asc = 'asc'
		var searchFlag = 'search'
		this.setPagenation =  function(PageAreaId,ajaxUrl,first) {
									var object = new Object();	// 설정 세팅후 전송
									if(setting.table){object.table = setting.table}
									if(setting.defaultorderby){object.orderby = setting.defaultorderby}
									if(setting.primarykey){object.primarykey=setting.primarykey}
									if(setting.asc){object.asc = setting.asc}
									if(setting.perPageNum){object.perPageNum = setting.perPageNum}
									if(setting.displaypage){object.displaypage = setting.displaypage}
									if(setting.searchno){object.searchno = setting.searchno}
									
									if(first){	// 처음일경우 실행
										object.page = first
										var returnResult = callAjax(ajaxUrl, object)
										setting.onPageClick.call(this, returnResult)
										setpage(ajaxUrl, PageAreaId, returnResult)
									}
									
									$("#"+PageAreaId).off().on("click",".page-item", function() {
										if(!$(this).hasClass("disabled")){
											if(searchFlag == 'search'){
												object.page = $(this).val()
												searchObject = searchData(object)
												var returnResult = callAjax($(this).parents("ul").attr("role"), searchObject)
												setting.onPageClick.call(this, returnResult)
												setpage(ajaxUrl, PageAreaId, returnResult)
											}else{
												object.page = $(this).val()
												searchObject = refreshSearch(object)
												var returnResult = callAjax($(this).parents("ul").attr("role"), searchObject)
												setting.onPageClick.call(this, returnResult)
												setpage(ajaxUrl, PageAreaId, returnResult)
											}
										}
									})
									$("#"+setting.searchBtn).on("click", function() {
										object.page = 1
										var searchObject = searchData(object)
										var returnResult = callAjax(ajaxUrl, searchObject)
										if(returnResult.length > 0){
											setting.onPageClick.call(this, returnResult)
										}else{
											setting.onPageClick.call(this, null)
										}
										setpage(ajaxUrl, PageAreaId, returnResult)
										
										searchFlag = "search"
									})
									$("."+setting.orderby).on("click", function() {
										orderCol = $(this).attr("role")
										if(object.asc == "asc"){
											object.asc = "desc"
										}else{
											object.asc = "asc"
										}
										object.orderby = orderCol
										var returnResult = callAjax(ajaxUrl, object)
										setting.onPageClick.call(this, returnResult)
										setpage(ajaxUrl, PageAreaId, returnResult)
									})
									$("#"+setting.refreshBtn).on("click", function() {
										if(setting.table){object.table = setting.table}
										if(setting.defaultorderby){object.orderby = setting.defaultorderby}
										if(setting.primarykey){object.primarykey=setting.primarykey}
										if(setting.asc){object.asc = setting.asc}
										if(setting.perPageNum){object.perPageNum = setting.perPageNum}
										if(setting.displaypage){object.displaypage = setting.displaypage}
										if(setting.searchno){object.searchno = setting.searchno}
										object.page = 1
										searchFlag = "refresh"
										var searchObject = refreshSearch(object)
										var returnResult = callAjax(ajaxUrl, searchObject)
										setting.onPageClick.call(this, returnResult)
										setpage(ajaxUrl, PageAreaId, returnResult)
									})
									
									
								}
		
		
			
			function callAjax(url, object) {
				var result;
				$.ajax({
					url : "<%=request.getContextPath()%>/attend/test/"+url,
					type : "post",
					async : false,
					data : object,
					success : function (res) {
						result = res
					}
				})
						return result;
			}
			
			
			
			
		
		function searchData(retobject) {
			var likeobj = new Object()
			if(setting.likeMap){
				var value = $("input[name='"+setting.likeMap+"']").val();
				if(value){
					likeobj[setting.likeMap] = value
				}
			}
			if(setting.likeMap2){
				var value = $("input[name='"+setting.likeMap2+"']").val();
				if(value){
					likeobj[setting.likeMap2] = value
				}
			}
			if(setting.likeMap3){
				var value = $("input[name='"+setting.likeMap3+"']").val();
				if(value){
					likeobj[setting.likeMap3] = value
				}
			}
			if(setting.likeMap4){
				var value = $("input[name='"+setting.likeMap4+"']").val();
				if(value){
					likeobj[setting.likeMap4] = value
				}
			}
			if(setting.likeMap5){
				var value = $("input[name='"+setting.likeMap5+"']").val();
				if(value){
					likeobj[setting.likeMap5] = value
				}
			}
			if(setting.selLikeMap){
				var value = $("input[name='"+setting.selLikeMap.input+"']").val();
				if(value){
					var col = $("select[name='"+setting.selLikeMap.selName+"']").val();
					likeobj[col] = value
				}
			}
			if(setting.selLikeMap2){
				var value = $("input[name='"+setting.selLikeMap2.input+"']").val();
				if(value){
					var col = $("select[name='"+setting.selLikeMap2.selName+"']").val();
					likeobj[col] = value
				}
			} 
			var equalobj = new Object()
			if(setting.equalMap){
				var value = $("input[name='"+setting.equalMap+"']").val();
				if(value){
					equalobj[setting.equalMap] = value
				}
			}
			if(setting.equalMap2){
				var value = $("input[name='"+setting.equalMap2+"']").val();
				if(value){
					equalobj[setting.equalMap2] = value
				}
			}
			if(setting.equalMap3){
				var value = $("input[name='"+setting.equalMap3+"']").val();
				if(value){
					equalobj[setting.equalMap3] = value
				}
			}
			if(setting.equalMap4){
				var value = $("input[name='"+setting.equalMap4+"']").val();
				if(value){
					equalobj[setting.equalMap4] = value
				}
			}
			if(setting.equalMap5){
				var value = $("input[name='"+setting.equalMap5+"']").val();
				if(value){
					equalobj[setting.equalMap5] = value
				}
			}
			if(setting.selEqualMap){
				var value = $("input[name='"+setting.selEqualMap.input+"']").val();
				if(value){
					var col = $("select[name='"+setting.selEqualMap.selName+"']").val();
					equalobj[col] = value
				}
			}
			if(setting.selEqualMap2){
				var value = $("input[name='"+setting.selEqualMap2.input+"']").val();
				if(value){
					var col = $("select[name='"+setting.selEqualMap2.selName+"']").val();
					equalobj[col] = value
				}
			}
			if(setting.selectBox){
				var value = $("select[name='"+setting.selectBox+"']").val();
				
				if(value){
					if(value == "waitaprv"){
						var waitobj = new Object()
						var waitCol = "code"
						waitobj[waitCol] = "DAP05,DAP15,DAP25,DAP35,DAP45,DAP55,DAP65,DAP75"
						retobject.inMap = waitobj
					}else{
						equalobj[setting.selectBox] = value
					}
					
				}
			}
			if(equalobj){
				retobject.equalMap = equalobj;
			}
			if(likeobj){
				retobject.likeMap = likeobj;
			}
			if(setting.checkbox){
				var obj = new Object()
				var list = ""
				var checkbox = $("input[name='"+setting.checkbox.name+"']")
				$.each(checkbox, function(i) {
					if($(checkbox[i]).prop("checked")){
						list += $(checkbox[i]).val() + ","
					}
				})
				if(list.length > 0){
					obj[setting.checkbox.col] = list
					retobject.inMap = obj
				}
			}
			var dateGtobj = new Object()
			if(setting.dateGtMap){
				var value = $("input[name='"+setting.dateGtMap.name+"']").val()
				if(value){
					dateGtobj[setting.dateGtMap.col] = value
				}
			}
			if(setting.selDateGtMap){
				var value = $("input[name='"+setting.selDateGtMap.input+"']").val()
				if(value){
					var col = $("select[name='"+setting.selDateGtMap.selName+"']").val();
					dateGtobj[col] = value
				}
			}
			if(dateGtobj){
				retobject.dateGtMap = dateGtobj;
			}
			var dateLtobj = new Object()
			if(setting.dateLtMap){
				var value = $("input[name='"+setting.dateLtMap.name+"']").val()
				if(value){
					obj[setting.dateLtMap.col] = value
				}
			}
			if(setting.selDateLtMap){
				var value = $("input[name='"+setting.selDateLtMap.input+"']").val()
				if(value){
					var col = $("select[name='"+setting.selDateLtMap.selName+"']").val();
					dateLtobj[col] = value
				}
			}
			if(dateLtobj){
				retobject.dateLtMap = dateLtobj;
			}
			return retobject;
		}
		
		function setpage(ajaxUrl, pageAreaId, pageMaker) {
			if(pageMaker && pageMaker.length != 0){
				$("#"+pageAreaId).empty();
				code = "<div id='ajaxPage'>\r\n"
				code += "<ul class='pagination m-0' role='"+ajaxUrl+"'>\r\n"
				
				
				
					code += "<li class='page-item "
					
					code += "' value='"+(pageMaker[0].page+1)+"'><a class='page-link'>더보기</a></li>\r\n" 
								code += "</ul></div>"
				
				$("#"+pageAreaId).append(code)
			}else{
				$("#"+pageAreaId).empty()
			}
		}
		
		
		function refreshSearch(object) {
			object.likeMap = new Object();
			object.equalMap = new Object();
			object.inMap = new Object();
			object.dateGtMap = new Object();
			object.dateLtMap = new Object();
			return object;
		}
	}
	
	
</script>
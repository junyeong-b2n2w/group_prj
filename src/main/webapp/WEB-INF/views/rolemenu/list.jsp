<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>


<div class="content">
	<div class="container">
		<div class="page-header d-print-none">
	<div class=" align-items-center">
		<h3 class="page-title">메뉴 관리</h3>
	</div>
</div>

		
		<div class="mt-3 row row-eq-height">
			
			
			<div class=" col">
			<div class="card p-3">
			<div class="card-header d-flex justify-content-between">
				<h5 class="card-title">메뉴관리</h5>
				
				<button type="button" id="saveBtn" onclick="menuSave()" class="btn btn-primary"
					>메뉴 저장</button>
			</div>
			<div class="card-body menuList">
				<c:forEach items="${ allMenuList}" var="allMenu">
						<div class="row mb-3 d-flex justify-content-center">
							<div class="col-1">
								<span class="badge bg-primary">${allMenu.menu_nm }</span>
							</div>
							<div class="col-auto">
								<label class="form-check form-check-single form-switch"> <input
									class="form-check-input" value="${allMenu.menu_no }" id="menu_${allMenu.menu_no }" type="checkbox"
									>
								</label>
							</div>
						</div>
					
				</c:forEach>
			</div>
		</div>
			</div>
		</div>
	</div>
</div>


<script>
	
	function checkAcitve() {
		$.ajax({
			url : "<%=request.getContextPath()%>/role/getActiveMenu",
			type: "get",
			dataType:"json",
			success: function(activeMenuList){
				console.log(activeMenuList)
				
				$('.menuList input[type="checkbox"]:checked').prop("checked", false);
				
				for(var i = 0; i < activeMenuList.length; i++){
					$('#menu_'+activeMenuList[i].menu_no).prop("checked", true);
				}
				
			}
		})
	}
	
	checkAcitve();
	
	function menuSave(){
		
		if(confirm("메뉴를 저장 하시겠습니까?")){
			checkedList = $('.menuList input[type="checkbox"]:checked');
			
			checkMenuList = [];
			for (var i = 0 ; i < checkedList.length; i++){
				checkMenuList.push(checkedList[i].value);
			}
			
			$.ajax({
				url : "<%=request.getContextPath()%>/role/changeMenu",
				type: "get",
				async: false,
				data : {
						"checkMenuList" : checkMenuList
				},
				dataType:"json",
				success: function(result){
					
					alert(result)
					checkAcitve();
					
				}
			})
		}
		
		parent.location.reload();
	}
	
	


	
</script>


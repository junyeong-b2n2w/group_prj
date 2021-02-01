<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="content">
	<div class="container ">
			<div class="card p-3">
				<div class="card-header d-flex justify-content-between">
					<h3>회사 상세보기</h3>
					<div class="d-flex justify-content-end">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<button type="button" class="btn btn-danger mx-1" onclick="inactive()">비활성화</button>
						<button class="btn btn-primary mx-1" onclick="goList()">목록</button>
					</sec:authorize>
						<a href="modifyForm?comp_no=${comp.comp_no }" class="btn btn-primary mx-1">수정</a>
					</div>
				</div>

				<div class="card-body">
					<div class="row mb-3 align-items-end">
						<div class="col-1">
							<img id="logoImg" alt="logo">
						</div>
						
						<div class="col-5">
							<label class="form-label">회사명</label>
							<span>${comp.comp_nm }</span>&nbsp;
							<c:if test="${comp.comp_actvyn eq 'Y'}">
					  			<span class="badge bg-primary me-1">활성</span>
						    </c:if>
						    <c:if test="${comp.comp_actvyn eq 'N'}">
						  		<span class="badge bg-danger me-1">비활성</span>
						    </c:if>
						</div>
						<div class="col-3">
							<label class="form-label">사업자 등록 번호</label>
							<span>${comp.comp_crno }</span>
						</div>
						<div class="col-3">
							<label class="form-label">대표명</label>
							<span>${comp.comp_delgnm }</span>	
						</div>
					</div>
					
					<div class="row mb-3 align-items-end">
						<label class="form-label">회사 주소</label>
						<div class="col-sm-10">
							<span>${fn:split(comp.comp_addr, ',')[0] }</span>
							<span>${fn:split(comp.comp_addr, ',')[1] }</span>
							<span>${fn:split(comp.comp_addr, ',')[2] }</span>
							<span>${fn:split(comp.comp_addr, ',')[3] }</span>
						</div>
					</div>
				
					<div class="row mb-3 align-items-end">
						<div class="col-6">
							<label class="form-label">회사 대표 전화번호</label>
							<span>${comp.comp_hp }</span>
						</div>
						
						<div class="col-6">
							<div class="col-1">
								<img alt="직인" id="sealImg">
							</div>
						</div>
					</div>
				</div>
				
			</div>
		
		<sec:authorize access="hasRole('ROLE_CM')">
		<div class="card p-3 mt-3">
			<div class="card-header d-flex justify-content-between">
				<h3 class="card-title">메뉴관리</h3>
				
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
		</sec:authorize>
		
			
		<sec:authorize access="hasRole('ROLE_ADMIN')">	
			<div class="card p-3 mt-3">
				<div class="card-header ">
					<h3>회사 관리자 명단</h3>
				</div>
				<div class="card-body">
				<table class="table card-table table-vcenter text-nowrap datatable">
				<thead>
				<tr>
					<th>
						아이디
					</th>
					<th>
						초기화
					</th>
				</tr>
				</thead>
				<tbody>
					 <c:forEach items="${cmList }" var="cm">
					 <tr>
					<td>
						 ${cm.EMP_ID }
					</td>
					<th>
						<button class="btn btn-danger btn-sm" onclick="passwdReset(${cm.emp_id})">
							 		비밀번호 초기화 
							 	</button>
					</th>
				</tr>
					 
					</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
		</sec:authorize>
	</div>
</div>
 <div class="modal modal-blur fade" id="password-modal" tabindex="-1" style="display: none;" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          <div class="modal-status bg-danger"></div>
          <div class="modal-body text-center py-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-danger icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M12 9v2m0 4v.01"></path><path d="M5 19h14a2 2 0 0 0 1.84 -2.75l-7.1 -12.25a2 2 0 0 0 -3.5 0l-7.1 12.25a2 2 0 0 0 1.75 2.75"></path></svg>
            <h3>비밀번호 초기화</h3>
            <div class="text-muted" id="passwordAskBox"><span class="passwordTarget"></span> 님의 비밀번호를 초기화 하시겠습니까?</div>
            <div class="text-muted d-none" id="passwordResultBox"><span class="passwordTarget"></span> 님의 비밀번호가 초기화 되었습니다.
            <div class="mt-2" id="passwordResult" style="border: 1px dashed lightgray; min-height:50px;">
            	
            </div>
            </div>
            
          </div>
          <div class="modal-footer">
            <div class="w-100">
              <div class="row">
                <div class="col"><a href="#" class="btn btn-white w-100" onclick="modalClose()" data-bs-dismiss="modal">
                    취소
                  </a></div>
                <div class="col"><a href="#" id="modalResetPasswordBtn" class="btn btn-danger w-100" data-target-id="" data-bs-dismiss="modal">
                    초기화
                  </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	function logoImg() {
		var logo = "${comp.comp_logo }";
		if(logo != "noImage"){
			$('#logoImg').attr('src', "getLogo?fileName="+logo);
		} else{
			$('#logoImg').attr('src', "<%= request.getContextPath()%>/role/company/getLogo?fileName=noImage.jpg");
		}
	}
	
	function sealImg() {
		var seal = "${comp.comp_seal }";
		if(seal != "noImage"){
			$('#sealImg').attr('src', "getSeal?fileName="+seal);
		} else{
			$('#sealImg').attr('src', "<%= request.getContextPath()%>/role/company/getSeal?fileName=noImage.jpg");
		}
	}
	
	function goList() {
		location.href="<%=request.getContextPath()%>/role/company/list";
	}
	
	function inactive() {
		var compno = "${comp.comp_no }";
		
		if(confirm("${comp.comp_nm}을(를) 비활성화 하시겠습니까?")){
			$.ajax({
				url : "inactive",
				data : {"comp_no" : compno},
				type : "GET",
				success : function (data) {
					alert("${comp.comp_nm}이(가) 비활성화 되었습니다.");
				}
			});
			
			location.href="<%=request.getContextPath()%>/role/company/list";
		}
		else{
			return false;
		}
	}
	
	window.onload = function(){
		logoImg();
		sealImg();
	}

	
	</script>
	<sec:authorize access="hasRole('ROLE_CM')">	
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
	</sec:authorize>
	
	
	
<sec:authorize access="hasRole('ROLE_ADMIN')">	
	
	<script>
	
	function passwdReset(emp_id){
		console.log($('#auth_'+emp_id+' span').text().indexOf('회사'))
		
		
		$('#passwordAskBox').removeClass('d-none');
		$('#passwordResultBox').addClass('d-none');
		
		$('.passwordTarget').text(emp_id);
		$('#modalResetPasswordBtn').removeClass('btn-primary').addClass('btn-danger');
		$('#modalResetPasswordBtn').attr('onclick','passwdResetGo("'+emp_id+'")')
		$('#password-modal').modal('show');
		
		
	}
	
	function passwdResetGo(emp_id){
		$('#modalResetPasswordBtn')
			.removeClass('btn-danger')
			.addClass('btn-primary')
			.text('확인')
			.attr('onclick','modalClose()');
		
		
		$.ajax({
			url : "<%=request.getContextPath()%>/role/emp/resetPw",
			type: "get",
			data : {emp_id : emp_id},
			success: function(data){
				$('#passwordAskBox').addClass('d-none');
				$('#passwordResultBox').removeClass('d-none');
				$('#passwordResult').text("변경된 비밀번호 : "+data);
			}
		})
	}
	function modalClose(){
		$('#password-modal').modal('hide');
	}
	

	</script>
</sec:authorize >	
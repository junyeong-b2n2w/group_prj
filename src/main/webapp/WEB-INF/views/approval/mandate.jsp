<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
    <div class="content">
      <div class="container-fluid row ">
        <div>
          <div class="card container p-3">
            <div class="card-header">
              <h2>위임 관리</h2>
            </div>
			<form action="regMandate" method="post">
	            <div class="card-body row">
		            <div class="table-responsive">
					  	<table class="table table-vcenter card-table">
					        <thead>
					            <tr>
					              <th class="col-2">위임할 대상 부서</th>
					              <td colspan="4"> ${loginUser.dept_nm } </td>
					            </tr>
					            <tr>
						            <th class="col-2">위임기간</th>
						            <td class="col-2">
							            <div class="col"><input type="date" name="mdt_satymd" required class="form-control "></div>
							         </td>
							        <td class="col-2">
							            <div class="col"><input type="date" name="mdt_endymd" required class="form-control "></div>
						            </td>
						            <th class="col-2">수임자</th>
						            <td>
						            	<div class="input-group ">
							              <input type="text" name="mdt_empnm" required readonly class="form-control bg-white" >
							              <input type="hidden" name="mdt_mdtr">
							              <input type="hidden" name="mdt_deptnm">
							              <span class="input-group-text" style="padding: 0px; padding-left: 3px; padding-right: 3px;">
							                 <img alt="" id="peopleBtn" src="<%=request.getContextPath()%>/resources/img/사람.png" width="32px" height="32px" >
							              </span>
						            	</div>
						            </td>
					            </tr>
					            <tr>
					                <th class="col-2">위임 사유</th>
					                <td colspan="6"><input type="text" name="mdt_reason" required class="form-control"></td>
					            </tr>
					        </thead>
					    </table>
		            </div>
			 <!-- </div-table-responsive> -->
	              
	              <div class=" d-flex justify-content-end" style="padding-right: 25px;">
	               	<button type="submit" class="btn btn-primary" id="setting" style="margin-top: 7px; ">위임 설정하기</button>
	              </div>
	            </div>
			</form>
	   <!-- </div-card-body row> -->
            
            <div class="card-body row">
              <div class="table-responsive">
                <table class="table table-vcenter card-table">
                  <thead>
                    <tr>
                      <th><input id="ckAll" type="checkbox"></th>
                      <th>NO</th>
                      <th>위임할 대상부서</th>
                      <th>위임기간</th>
                      <th>수임자</th>
                      <th>위임 사유</th>
                      <th>설정</th>
                      <th>결재내역</th>
                    </tr>
                  </thead>
                  <tbody>
	                  <c:forEach var="mdt" items="${mdtList}" varStatus="status"> 
	                  	<tr>
	                      <td>
	                      	<c:if test="${mdt.mdt_actvyn eq 'y'}">
		                      	<input type="checkbox" name="ckb" value="${mdt.mdt_no }">
	                      	</c:if>
	                      </td>
	                      <td>${status.count }</td>
	                      <td>${mdt.mdt_deptnm }</td>
	                      <td>
	                      	<fmt:formatDate value="${mdt.mdt_satymd}" pattern="yyyy.MM.dd"/> ~ 
	                      	<fmt:formatDate value="${mdt.mdt_endymd}" pattern="yyyy.MM.dd"/>
	                      </td>
	                      <td>${mdt.emp_nm}</td>
	                      <td>${mdt.mdt_reason}</td>
	                      <td>${mdt.mdt_actvyn eq 'y' ? "설정" : "설정해제"}</td>
	                      <td><span class="badge bg-info me-1">상세보기</span></td>
	                    </tr>
	                  </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>

          	<div class="card-footer d-flex justify-content-end">
        	  <button type="button" class="btn btn-primary" id="unset" >설정해제</button>
         	</div>
          </div>
        </div>
      </div>
    </div>
    
    	
    <div class="modal modal-blur fade " id="modal-large" tabindex="-1" style="display: none; padding-right: 16px;" aria-modal="true" role="dialog">
	    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
		    <div class="modal-content">
		    <div class="modal-header">
			    <h5 class="modal-title">조직도</h5>
			    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		    </div>
		    	<div class="modal-body">
				<div class="row">
					<div class="col-sm-4">
						<div class="card">
							<div class="card-body">
								<div class="row" style="height: 675px; overflow-y: scroll;">
									<div class="col-md-12">
										<div id="chart-container" style="background-color:white;width:100%;padding:40px 0">
											<ul id="tree" class="ztree" style="width:100%;overflow:auto;"></ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="card">
							<div class="card-body border-bottom py-3 ps-1">
				                <div class="d-flex">
					                <div class="ms-auto text-muted">
					                 	 <div class="row g-2">
					                         <div class="col searchbox mx-0 px-0" >
					                           <input type="text" class="form-control" placeholder="구성원 이름을 검색해주세요" id="keyword" name="keyword" value="${pageMaker.cri.keyword }">
					                         </div>
					                         <div class="col-auto mx-0 px-0" >
					                           <a href="javascript:searchList_go(1);" class="btn btn-white btn-icon" aria-label="Button">
					                             <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg>
					                           </a>
					                         </div>
<!-- 					                         <div class="col-auto"> -->
<!-- 					                           <a href="javascript:goBack();" class="btn btn-white btn-icon" aria-label="Button"> -->
<!-- 					                           	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="9" y1="6" x2="20" y2="6" /><line x1="9" y1="12" x2="20" y2="12" /><line x1="9" y1="18" x2="20" y2="18" /><line x1="5" y1="6" x2="5" y2="6.01" /><line x1="5" y1="12" x2="5" y2="12.01" /><line x1="5" y1="18" x2="5" y2="18.01" /></svg> -->
<!-- 					                           </a> -->
<!-- 					                         </div> -->
				                        </div>
					                </div>
				                </div>
				              </div>
				              <div class="table-responsive">
				                <table class="table card-table table-vcenter text-nowrap datatable ms-auto">
					                <thead>
					                  <tr>
					                    <th class="w-2">No.</th>
					                   	<th>사원이름</th>
										<th>사원ID</th>
										<th>직급명</th>
					                    <th>부서명</th>
					                    <th class="w-5 text-center">비고</th>
					                  </tr>
					                </thead>
					                <tbody id="empTable">
<%-- 						                <c:forEach items="${dataMap.empAllList }" var="emp" varStatus="status"> --%>
<!-- 							                <tr> -->
<%-- 								                <td><span class="text-muted">${status.count}</span></td> --%>
<%-- 								                <td><span class="text-muted">${emp.emp_nm }</span></td> --%>
<%-- 								                <td><span class="text-muted">${emp.emp_id }</span></td> --%>
<%-- 								                <td><span class="text-muted">${emp.rank_nm }</span></td> --%>
<%-- 								                <td><span class="text-muted">${emp.dept_nm }</span></td> --%>
<!-- 								                <td class="text-center"><span class="text-muted"><button id="mandate" class="btn btn-primary w-20">위임하기</button></span></td> -->
<!-- 							                </tr> -->
<%-- 						                </c:forEach> --%>
					                </tbody>
				                </table>
				              </div><!-- table div -->
				              <div class="card-footer">
								 <div class="row" >
									<div class="col-12" style="display: flex; justify-content: center;">
										<%@include file="../common/pagination.jsp" %>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
	    	</div>
	    </div>
    </div>
</div>
    
    
    <script type="text/javascript">
 		window.onload=function(){
	 		$("#ckAll").on('click', function(){
	 	        if($("#ckAll").prop("checked")){
	 	            $('input[name="ckb"]').prop("checked",true);
	 	        }else{
	 	            $('input[name="ckb"]').prop("checked",false);
	 	        }
	 	    });
	 		
	 		$('#unset').on('click', function () {
		        if(confirm("위임 설정을 해제하시겠습니까?")){
		        	unset();
		        	location.reload();
		        }else{
		        	location.reload();
					return;
		        }
			});
	 		
	 		 function unset() {
	 			var unsetArr = [];
	 			
	 			$('input[name="ckb"]:checked').each(function () {
	 				unsetArr.push($(this).val());
				});
	 			
	 			$.ajax({
	 				url : 'unset',
	 				type : 'post',
					data : {"unsetArr" : unsetArr},
					success:function(data) {
						alert("설정 해제되었습니다.");
					}
	 			});
	 			
	 		   location.href = "<%=request.getContextPath()%>/mandate/main";
			};
	 		
			$('#setting').on('click', function () {
				var start = $('input[name="mdt_satymd"]').val();
				var end = $('input[name="mdt_endymd"]').val();
				
				console.log(start, end);
				
				if(start > end){
					alert("위임 시작 날짜는 마지막 날짜보다 클 수 없습니다.");
					return;
				}
				
				var name = $('input[name="mdt_empnm"]').val();
				
		 		if(confirm(name+"에게 결제권한을 위임하시겠습니까?")){
		        	
		        }else{
					return;
		        }
			});
		 	
			$('#peopleBtn').on('click', function(){
				//alert("123");
				$("#modal-large").modal("show");
			});
			
			$(".btn-close").on('click', function() {
				$("#modal-large").modal("hide");
			})
 		}
	</script>
	<%@ include file="gChart_mandate_js.jsp" %>	

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div class="content">
	<div class="container">
	<div class=" row row-eq-height">
        <div class="page-header d-print-none">
          <div class="row align-items-center">
            <div class="col">
              <h3 class="page-title">
                양식목록
              </h3>
            </div>
          </div>
        </div>
        <!-- 미리보기 -->
	   <div class="col-8">
		   <div class="card p-3 h-100">
		   		<div class="card-header">
		   		<h3>미리보기</h3>
		   		</div>
			   	<div class="card-body d-flex justify-content-center">
					<div class="p-3 " style="width: 660px; border: 1px solid lightblue;">
						<div class="mt-3 ">
							<input type="text" placeholder="양식 제목을 입력해 주세요" name="af_nm" readonly
								class="form-control form-control-lg bg-white" >
						</div>
						<div class="mt-3  d-flex justify-content-end">
							<div
								style="width: 50px; height: 50px; border: 1px solid black; font-size: 0.85rem;">
								결재서명</div>
						</div>
						<div id="approvalBox" class="mt-3 row m-0 d-flex justify-content"
							style="border: 1px dashed lightgray; min-height: 20px;"></div>
						<div class="mt-3">
							<div id="summernotecontent"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- !미리보기 -->
		
		
		
	   <div class="col-4">
        <div class="card p-3 h-100">
        	<div class="card-header d-flex justify-content-between">
		   		<div class="ms-2">
		   		<h3>양식선택</h3>
		   		</div>
		   		<div class="ms-2 d-inline-block">
             
	              <a href="registform" class="btn btn-primary ">
	                등록
	          	  </a>
          		</div>
		   		</div>
		   		
          <div class="card-body border-bottom py-3">
            <div class="d-flex justify-content-end mb-3">
              <div class="text-muted">
                
                <div class="mx-2 d-inline-block">
	                <select name="perPageNum" class="form-control form-control-sm " >
	                	<option value="5" ${pageMaker.cri.perPageNum eq '5' ? 'selected':'' }>5개씩</option>
	                	<option value="10" ${pageMaker.cri.perPageNum eq '10' ? 'selected':'' }>10개씩</option>
	                	<option value="20" ${pageMaker.cri.perPageNum eq '20' ? 'selected':'' }>20개씩</option>
	                </select>
                </div>
                
              </div>
              <div class="ms-auto ">
           
                <div class="searchbox ms-2 d-inline-block">
                  <input type="text" name="keyword" class="form-control form-control-sm" value="${pageMaker.cri.keyword}" aria-label="Search invoice">
                </div>
              </div>
              <div class="ml-1 ms-2 d-inline-block">
             
              <button  class="btn btn-sm btn-primary w-100" onclick="searchList_go(1);">
             	검색
          	  </button>
          		</div>
          		
              
            </div>
         
          <div class="table-responsive">
            
            <table class="table table-vcenter card-table">
              <thead>
                <tr>
                  <th>NO</th>                  
                  <th>양식명</th>
                  <th>수정 / 삭제</th>
                </tr>
              </thead>
              <tbody>
               <c:forEach items="${aprvformList }" var="aprv">
               		<tr>
               			<td>${aprv.af_no }</td>
               			
               			<td><a href="#" onclick="miribogi(${aprv.af_no})">${aprv.af_nm }</a></td>
               			 <td>
               			 <div class="ml-1 ms-2 d-inline-block">
             				  <a href="modifyform?af_no=${aprv.af_no }" onclick="#" class="btn btn-sm btn-warning w-100">
				             	수정
				          	  </a>
				          	  </div>
				       	  <div class="ml-1 ms-2 d-inline-block">
				              <a href="#" onclick="removeForm(${aprv.af_no})" class="btn btn-sm btn-danger w-100">
				             	삭제
				          	  </a>
				          	  </div>
               			 </td>
               		</tr>
               		
               </c:forEach>
               
               
              </tbody>
            </table>
          </div>
           </div>
          <div class="card-footer d-flex justify-content-center">
           <%@include file="../common/pagination.jsp" %>
            
          </div>

        </div>
		</div>
		
		
		

      </div>
	</div>
    </div>
    
    <script>
			function miribogi(af_no){
				$.ajax({
					url : "<%=request.getContextPath()%>/role/aprvform/detail",
					type: "post",
					data : {
							af_no : af_no
					},
					success:function(approvalFormVO){
						if(approvalFormVO){
							$('#approvalBox').empty();
							$('input[name="af_nm"]').val("");
							$('#summernotecontent').html("");
							
							
							//console.log(approvalFormVO);
							$('input[name="af_nm"]').val(approvalFormVO.af_nm);
							$('#summernotecontent').html(approvalFormVO.af_cont);
							
							console.log(approvalFormVO.formComponentList)
							
							if(approvalFormVO.formComponentList){
								
								
								
								for (var i = 0; i < approvalFormVO.formComponentList.length; i++){
									getComponent(approvalFormVO.formComponentList[i].fc_no);
								}
							}
							
							
							
							
						}
					}
				})
				
				function getComponent(cp_no){
					$.ajax({
						url : "<%=request.getContextPath()%>/role/aprvform/componentdetail",
						type: "post",
						async:false,
						data : {
								cp_no : cp_no
						},
						success:function(componentVO){
							
								console.log(componentVO);
								
								var contArr =  componentVO.cp_cont.split(",");
								console.log(contArr);

								data = "";
								data +=	"<div class='dragComponent row p-0 m-0 mb-1'";
								data +=	" style='width: "+ contArr[0] + "px; border:1px solid lightgray' data-cpno='" + componentVO.cp_no +"'>";
								data +=	"<div class='text-center' style='width:" + contArr[1] + "px; font-size: 0.7rem>";
								data +=	"<span class='align-middle'>" + componentVO.cp_nm + "</span>";
								data +=	"</div>";
								data +=	"<div style='width: "+ contArr[2] +"px;'>";
								data +=	"<input class='form-control form-control-sm p-0' style='border: 0px solid;' id='" + componentVO.cp_tag + "' name='" + componentVO.cp_tag + "' " +  contArr[3]  +" />";
								data +=	"</div>"
								data +=	"</div>"
							
								$('#approvalBox').append(data);
								
							
						}
					})
				}
				
				
			}
			
			function removeForm(af_no){
				if(confirm("삭제할까요?")){
					$.ajax({
						url : "<%=request.getContextPath()%>/role/aprvform/remove",
						type: "post",
						data : {
								af_no :af_no
						},
						success:function(){
							alert("삭제 성공하였습니다.");
							location.href="list";
							
							
						}
					})
				}
			}
		
			
		</script>
		
		

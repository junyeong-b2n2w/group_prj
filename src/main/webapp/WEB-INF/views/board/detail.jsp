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

					<h2 class="page-title">게시판 글</h2>
				</div>
			</div>
		</div>
		<!-- page title -->
		
		<div class="row row-deck row-cards">
			<div class="col-12">
			 <div class="card p-3">
			 <div class="card-header" style="border-bottom: 2px solid #206bc4!important;">
		      <h3 class="card-title">게시판글 상세</h3>
		    </div>
                 <div class="card-body py-3" >
			        <div class="form-group mb-3 ">
			          <label class="form-label">제목</label>
			          <div>
			            <input type="hidden" class="form-control bg-white" id="replyPostNo" value="${post.post_no }" readonly>
			            <input type="text" class="form-control bg-white" value="${post.post_title }" readonly>
			          </div>
			       </div>
			        <div class="form-group mb-3 ">
			          <div class="row">
			              <div class="col-lg-6">
			                <div class="mb-3">
			                  <label class="form-label">작성자</label>
			                  <div class="input-group input-group-flat">
			                    <input type="text" class="form-control bg-white ps-0" readonly value="${post.post_pbls }">
			                  </div>
			                </div>
			              </div>
			              <div class="col-lg-4">
			                <div class="mb-3">
			                  <label class="form-label">작성일자</label>
                				  <input type="date" class="form-control bg-white" readonly="readonly" value="<fmt:formatDate value='${post.post_regdt }' pattern='yyyy-MM-dd'/>">
			                </div>
			              </div>
			              <div class="col-lg-2">
			                <div class="input-icon mb-3">
			                  <label class="form-label">조회수</label>
                              <div class="input-icon mb-3">
                              <span class="input-icon-addon">
                                 <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="3" y1="12" x2="6" y2="12" /><line x1="12" y1="3" x2="12" y2="6" /><line x1="7.8" y1="7.8" x2="5.6" y2="5.6" /><line x1="16.2" y1="7.8" x2="18.4" y2="5.6" /><line x1="7.8" y1="16.2" x2="5.6" y2="18.4" /><path d="M12 12l9 3l-4 2l-2 4l-3 -9" /></svg>
                              </span>
                              <input type="text" class="form-control bg-white" value="${post.post_views }" readonly>
                            </div>
			                </div>
			              </div>
			            </div>
			        </div>
			      
			        <div class="form-group mb-3">
					   <div class="col-lg-12">
		                <div>
		                  <label class="form-label">내용</label>
		                  <div class="form-control"style="height: 500px;overflow-y: scroll;">${post.post_cont }</div>
		                </div>
		              </div>
			        </div>
			        
			        
			 	<c:if test="${attachList ne null}">
								<div class="form-group mb-3 row fileDrop">
									<label class="form-label">파일첨부</label>
									<div class="divide-y appendArea" >
										<c:forEach var="attach" items="${attachList }">
											<div>
												<label class="row"> <span class="col">${attach.attc_extnm }
														<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
															<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
																stroke="currentColor" fill="none" stroke-linecap="round"
																stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path
																	d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path
																	d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
													</a>
												</span> 
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
						</c:if>		        
			         
			        
			        
			        <div class="mt-3 d-flex justify-content-between">
			        
				        <!-- 댓글보기 버튼-->
				        
				        <div style="" class="accordion-button" 
				        	data-toggle="collapse" data-target="#collapse-1" aria-expanded="true">
				        	<button class="btn">댓글 보기</button>
				        </div>
				       
				        <!-- 댓글보기 끝 -->
				        
				        <div class="d-flex" style="justify-content: flex-end;">
				         <c:if test="${loginUser.emp_id eq post.post_pbls }"> 
								<a href="" class="btn btn-outline-warning mx-1 " data-keyboard="false"
									data-backdrop="static" data-toggle="modal"
									data-target="#modal-BoardModify" id="modalModifyBtn">수정 </a>
							
								<a href="#" class="btn btn-outline-danger mx-1 " onclick="RemoveBoard(${post.post_brdno})"> 삭제 </a>
							 </c:if> 
							 
				        	<a href="" class="btn btn-primary mx-1" data-keyboard="false" 
				        	data-backdrop="static" data-toggle="modal" data-target="#modal-BoardReply"
				        	 id="modalDapBtn" onclick="dap(${post.post_no},${post.post_brdno })">답글 등록  
				        	 </a> 
				         
				          <button type="button" onclick="PostList(${post.post_brdno})" class="btn btn-primary mx-1">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="9" y1="6" x2="20" y2="6" /><line x1="9" y1="12" x2="20" y2="12" /><line x1="9" y1="18" x2="20" y2="18" /><line x1="5" y1="6" x2="5" y2="6.01" /><line x1="5" y1="12" x2="5" y2="12.01" /><line x1="5" y1="18" x2="5" y2="18.01" /></svg>
	              	  		  목록
							</button>
			        	</div>
			        </div>
                </div>
             
            <div class="card-body">
              <div class="accordion" id="accordion-example">
                <div class="accordion-item">
                  <div id="collapse-1" class="accordion-collapse collapse show" data-parent="#accordion-example">
                    <div class="accordion-body pt-0">
                       <!-- 댓글  -->
       
       
                      
                      <!-- 댓글 리스트 -->
                      <div id="ReplyLists">
                      
                      
                
		             </div>
                      <!-- 댓글 리스트 끝 -->
             
             <!-- 댓글 등록 -->
                 <div class="d-flex" style="justify-content: flex-end;">
                    <div class="">
                      <a href="#" class="btn btn-outline-primary" data-toggle="modal" data-target="#modal-ReplyRegist" style="margin: 17px;">
                        	댓글 등록
                      </a>
                    </div>
                    </div>
                    
                  </div>
                </div>
               
              </div>
            </div>
          </div>
               
                </div><!-- col-12 -->
              </div><!-- row -->
		</div>
	<!-- containew-xl -->
		<!-- 답글 등록 -->

		<div class="modal modal-blur fade" id="modal-BoardReply" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">답글 작성</h5>
							<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="mb-3">
						<input type="hidden" id="DapPostNo">
													
						<input type="hidden" id="DapPostBrdno">	
						
						<input type="hidden" id="DapLevel">
												
								<label class="form-label">제목</label> 
								<input type="text" class="form-control" id="DapPostTitle">
							</div>

							<div class="mb-3" id="summernoteAppendDap">
								<label class="form-label">내용</label>
							</div>
							
							<div class="form-group mb-3 row" id="fileDrop">
							<div class="divide-y" id="appendArea">
								<label class="row"
									style="border: 1px dotted gray; height: 100px;" id="dragHere">
									<span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
								</label>
							</div>
						</div>
					<c:if test="${attachList ne null}">
								<div class="form-group mb-3 row" >
									<label class="form-label">파일첨부</label>
									<div class="divide-y" >
										<c:forEach var="attach" items="${attachList }">
								<div id="fileRow">
											<div>
												<label class="row m-0"> <span class="col">${attach.attc_extnm }
														<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
															<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
																stroke="currentColor" fill="none" stroke-linecap="round"
																stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path
																	d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path
																	d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
													</a>
												</span> <span class="col-auto"> <label class="form-check form-check-single form-switch"> <small
															data-src="${attach.attc_no }" class="newFile"> <a  href="javascript:void(0);" 
													onclick="deleteFileByAttcNo('${attach.attc_no}',this)">
																
																	<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																		width="24" height="24" viewBox="0 0 24 24"
																		stroke-width="2" stroke="currentColor" fill="none"
																		stroke-linecap="round" stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																			<line x1="18" y1="6" x2="6" y2="18"></line>
																			<line x1="6" y1="6" x2="18" y2="18"></line></svg>
															</a>
														</small>
													</label>
												</span>
												</label>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
						</c:if>		

						</div>
						<div class="modal-footer">
							<a href="#" class="btn btn-link link-secondary"
								data-dismiss="modal" onclick="cancelModifyModal()" id="ca"> Cancel </a> 
								
								<a href="" id="ModifyPost" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="DapInsert();"> 
								<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> Create New Board
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 답글 등록 -->
			
			
	<div class="modal modal-blur fade" id="modal-BoardModify" tabindex="-1"
				style="display: none;" aria-hidden="true">
				<div class="modal-dialog modal-lg modal-dialog-centered"
					role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">글 수정</h5>
							<button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="mb-3">
								<input type="hidden" class="post_no" value="${post.post_no }">
								<input type="hidden" class="post_pbls" value="${post.post_pbls }">
								
								<label class="form-label">제목</label> 
								<input type="text" class="form-control post_title post_ModifyTitle" value="${post.post_title }" >
							</div>

							<div class="mb-3">
								<label class="form-label">내용</label>
								<div>
									<textarea class="form-control" id="summernoteContent">${post.post_cont }</textarea>
								</div>
							</div>
							
							
						
							<c:if test="${attachList ne null}">
								<div class="form-group mb-3 row" >
									<label class="form-label">파일첨부</label>
									<div class="divide-y" >
										<c:forEach var="attach" items="${attachList }">
								<div id="fileRow">
											<div>
												<label class="row"> <span class="col">${attach.attc_extnm }
														<a href="<%=request.getContextPath()%>/file/getFile.do?attc_no=${attach.attc_no }&attc_key=${attach.attc_key }">
															<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
																stroke="currentColor" fill="none" stroke-linecap="round"
																stroke-linejoin="round">
																<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																<path
																	d="M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5"></path>
																<path
																	d="M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5"></path></svg>
													</a>
												</span> <span class="col-auto"> <label class="form-check form-check-single form-switch"> <small
															data-src="${attach.attc_no }" class="newFile"> <a  href="javascript:void(0);" 
													onclick="deleteFileByAttcNo('${attach.attc_no}',this)">
																
																	<svg xmlns="http://www.w3.org/2000/svg" class="icon"
																		width="24" height="24" viewBox="0 0 24 24"
																		stroke-width="2" stroke="currentColor" fill="none"
																		stroke-linecap="round" stroke-linejoin="round">
																			<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
																			<line x1="18" y1="6" x2="6" y2="18"></line>
																			<line x1="6" y1="6" x2="18" y2="18"></line></svg>
															</a>
														</small>
													</label>
												</span>
												</label>
											</div>
										</div>
										</c:forEach>
									</div>
								</div>
						</c:if>		        
			        
						<div class="form-group mb-3 row" id="fileDrop">
							<div class="divide-y" id="appendArea">
								<label class="row"
									style="border: 1px dotted gray; height: 100px;" id="dragHere">
									<span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
								</label>
							</div>
						</div>
							</div>
						</div>
						

						</div>
						<div class="modal-footer">
							<a href="#" class="btn btn-link link-secondary"
								data-dismiss="modal" onclick="cancelModifyModal()"> Cancel </a> 
								<a href="" id="ModifyPost" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="ModifyBoard();"> 
								<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> Create New Board
							</a>
						</div>
					</div>
					
					<!--댓글등록 -->
					    <div class="modal modal-blur fade" id="modal-ReplyRegist" tabindex="-1" style="display: none;" aria-hidden="true">
					      <div class="modal-dialog modal-dialog-centered" role="document">
					        <div class="modal-content">
					          <div class="modal-header">
					            <h5 class="modal-title">댓글 등록</h5>
					            
					            <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
					          </div>
					          <div class="modal-body">
					          
					     <div class="mb-3">
						  <label class="form-label">내용 : </label>
						  <input type="text" class="form-control RegistreplyContent" name="example-text-input" placeholder="Input placeholder">
						</div>
					          
					     </div>
					          <div class="modal-footer">
					          
					          <a href="" id="ModifyPost" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="Registreply();"> 
								<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> 등록
							</a>
					            <button type="button" class="btn me-auto" data-dismiss="modal">Close</button>
					          </div>
					        </div>
					      </div>
					    </div>    
                    <!-- 댓글 등록 끝 -->
					
				</div>
				
			</div>
			

<script>
function DapInsert(){
	taNo = [];
	var postPpost = $('#DapPostNo').val();
	var post_Title = $('#DapPostTitle').val();
	var post_Content = $('#summernoteContent').val();
	var post_DapPostBrdno = $('#DapPostBrdno').val();
	
	tanoList = document.querySelectorAll('input[name="ta_no"]');
	for(let i=0; i<tanoList.length; i++){
		taNo.push(tanoList[i].value);
	}
	
	if( post_Title == ""){
		alert("제목을 입력하세요");
		return;
	}
	if( post_Content == ""){
		alert("내용을 입력하세요");
		return;
	}
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/post/regist",
		type : "get",
		traditional : true,
		data : {
					post_brdno: post_DapPostBrdno,
					post_title : post_Title,
					post_cont : post_Content,
					post_ppost : postPpost,
					ta_no : taNo
				},
		success:function(req){
			if(req){
				alert('등록 성공');
				 
				location.reload();
			}
		}
		
	})
}


function dap(postNo,postBrdno,postLevel){
	$("#summernoteAppendModify").empty();
	$("#summernoteAppendRegist").empty();
	$("#summernoteAppendDap").empty();
	code = '<textarea id="summernoteContent" name="post_cont" rows="" cols=""></textarea>'
	$('#summernoteAppendDap').append(code);
	callSummernote(350);
	
	
	$('#DapLevel').val(postLevel);
	$('#DapPostNo').val(postNo);
	$('#DapPostBrdno').val(postBrdno);
}



//파일 삭제버튼 누를 시
function deleteFileByAttcNo(attc_no,tt){
	console.log(tt);
	//파일이 안보여지게 한다
	tt.closest('#fileRow').remove();
	val = "<input type='hidden' name='delfile' value='" + attc_no + "'/>";
	$('.divide-y').append(val);
	//원래 있던파일이랑 새로운 파일을 구분하여 원래 파일을 삭제하면 컨트롤러가 어떻게 구분하는지
	
}




$(document).ready(function() {
	
	//드래그 드랍
	  $(this).on("dragenter dragover drop",function(event){
			//event.preventDefault();
			return false;
		});
	  
	  $("#fileDrop").on("dragenter dragover",function(event){
			return false;
		});
	  

	  $("#fileDrop").on("drop",function(event){
	  	//event.preventDefault();		
		  var files=event.originalEvent.dataTransfer.files;
		  var chkLength = $('.newFile').length + files.length;
			if(chkLength > 5){
				alert("파일을 최대 5개까지 업로드 가능 합니다");
				return false;
			}
			for(var i=0;i<files.length;i++){
				
				addFile(files[i]);
			}
			return false; //파일이 자동으로 열리는 것을 멈추게 한다
	  });
	  

  });//document



function addFile(file){

var formData=new FormData();
formData.append("file",file);
$.ajax({
	
	url : "<%=request.getContextPath()%>/file/upload",
	type : "post",
	data : formData,
	contentType :false,
	processData : false,
	dataType : "json",
	success : function(data){
		
		var code = "";
		code += "<label class='row'>";
		code += "<span class='col'>"+data.filename+"<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'></path><path d='M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5'></path><path d='M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5'></path></svg></span>";
		code += "<span class='col-auto'>"			
		code += "<label class='form-check form-check-single form-switch'>";	
		code+= "<input type='hidden' name='ta_no' value='"+data.ta_no+"'/>";
		code += "<small data-src='"+data.ta_no+"' class='newFile'><a onclick='javascript:deleteFile("+data.ta_no+");'>"
		code += "<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'></path><line x1='18' y1='6' x2='6' y2='18'></line><line x1='6' y1='6' x2='18' y2='18'></line></svg></a>";			
		code += "</label></span></label>";	
		
			 $('#dragHere').addClass('d-none');
			 $("#appendArea").append(code);
	}
})
}


//파일 삭제버튼 누를 시
$('#appendArea').on('click','label  > span  > label > small > a',function(){
	var chk = $(this).closest("div").children("label[class='row']").length;
	$(this).closest("label[class='row']").remove();
	if(chk <2){
		$("#dragHere").removeClass('d-none');
	}
});





function ModifyReply(reno){
	
		 $('.ModifyReply'+reno).css("display", "none");
		 $('.ModifyRegist'+reno).css("display", "inline-block");
		 $('.RemoveReply'+reno).css("display", "none");
		 $('.inputReplyModify'+reno).css("display", "block");
		 $('.inputtypediv'+reno).css("display", "none");
		 $('.backModify'+reno).css("display", "inline-block");
		 
	
}

function backModify(re_no){
	
	 $('.ModifyReply'+re_no).css("display", "inline-block");
	 $('.ModifyRegist'+re_no).css("display", "none");
	 $('.RemoveReply'+re_no).css("display", "inline-block");
	 $('.inputReplyModify'+re_no).css("display", "none");
	 $('.inputtypediv'+re_no).css("display", "block");
	 $('.backModify'+re_no).css("display", "none");
	 $('.DapReplyD'+re_no).css("display", "none");
	 $('.inputDapReply'+re_no).css("display", "none");
	 $('.ModifyReply'+re_no).css("display", "block");
	
}

function Registreply(){
	var replyPostNo = $('.post_no').val();
	var RegistreplyContent = $('.RegistreplyContent').val();
	 $.ajax({
		 url : "<%=request.getContextPath()%>/reply/regist.do",
		 data : {
			 		re_postno : replyPostNo,
			 		re_cont : RegistreplyContent
			 		
		 		},
		 type : "get",
		 success:function(req){
			 if(req){
				 alert('등록 성공!');
				 location.reload();
			 }
		 }
	 })
	
}

function RemoveReply(reno){
	 $.ajax({
		 url : "<%=request.getContextPath()%>/reply/remove.do",
		 data : {
			 		re_no : reno
		 		},
		 type : "get",
		 success:function(req){
			 if(req){
				 alert('삭제 성공!');
				location.reload();
			 }
		 }
	 })
}


function ModifyRegist(reno){
	var Re_Cont = $('.inputReplyModify'+reno).val();
	
	 $.ajax({
		 url : "<%=request.getContextPath()%>/reply/modify.do",
		 data : {
			 		re_cont : Re_Cont,
			 		re_no : reno
		 		},
		 type : "get",
		 success:function(req){
			 if(req){
				 alert("수정 완료!!");
				 $('.ModifyRegist'+reno).css("display", "none");
				 $('.ModifyReply'+reno).css("display", "inline-block");
				 $('.RemoveReply'+reno).css("display", "inline-block");
				 $('.inputReplyModify'+reno).css("display", "none");
				 $('.inputtypediv'+reno).css("display", "block").text(req);
				 $('.backModify'+reno).css("display", "none");
			 }
		 }
	 })
}	

function DapTextarea(reNo){
	 $('.inputDapReply'+reNo).css("display", "block");
	 $('.ModifyReply'+reNo).css("display", "none");
	 $('.RemoveReply'+reNo).css("display", "none");
	 $('.DapReplyD'+reNo).css("display", "inline-block");
	 $('.backModify'+reNo).css("display","inline-block");
}


function DapReplyRegist(reNo,repostNo){
	
	var Daptextarea = $('.inputDapReply'+reNo).val();
	
	$.ajax({
		 url : "<%=request.getContextPath()%>/reply/regist.do",
		 data : {
			 		re_cont : Daptextarea,
			 		re_pcommno : reNo,
			 		re_postno : repostNo
		 		},
		 type : "get",
		 success:function(req){
			 if(req){
				 alert('등록 성공!');
				 location.reload();
			 }
		 }
	 })
}


function ReplyList(){
  var code = "";
  var post_no = $('#replyPostNo').val();
  
	 $.ajax({
	    	url: "<%=request.getContextPath()%>/reply/list.do?re_postno="+post_no,
	    	type:"get",
	    	success:function(ReplyLists){
	    		code += "<div class='card'>";
	    		code += "<div class='list-group list-group-flush overflow-auto'>";
	    		
	    		
	    		for(let i=0; i<ReplyLists.length; i++){
	    		code += "<div class='list-group-item'>";
	    		code += "<div class='row'>";
	    		
	    		if(ReplyLists[i].re_pcommno != null){
			    	 if(ReplyLists[i].level > 1){
	    			    	 for(let j=0; j< ReplyLists[i].level-1; j++){
	 							code+="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
	    			    	 }
	    			     }
	    		code += '<svg xmlns="http://www.w3.org/2000/svg" style="width: 2.25rem;" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"> <path stroke="none" d="M0 0h24v24H0z" fill="none" /> <path d="M6 6v6a3 3 0 0 0 3 3h10l-4 -4m0 8l4 -4" /></svg>'
	    			}
	    		
	    		
	    		code += "<div class='col-auto'>";
	    		code += '<a href="#">';
	    		code += "<span class='avatar' style='background-image: url(./static/avatars/023f.jpg);position: relative; top: 20px; '></span>";
	    		code += '</a>';
	    		code += '</div>';
	    		
	    		code += '<div class="col text-truncate">';
	    		code += ' <div class="d-flex justify-content-between" >'
	    		code += "<a href='#' class='text-body reWriterId'>"+ReplyLists[i].re_writerid +"</a> ";
	    		code += '<div style="display :inline-block" class="text-muted">'+ReplyLists[i].re_regdt+'</div></div>';
	    		
	    		code += "<div class='text-truncate mt-n1 inputtypediv"+ReplyLists[i].re_no+"'>"+ReplyLists[i].re_cont +"</div>";
	    		
	    		code += '<div class="d-flex justify-content-between">';
	    		code +='<div style="width:70%"><div class="text-muted text-decoration-underline mt-2 DapReplyRegist'+ReplyLists[i].re_no+'" onclick="DapTextarea('+ReplyLists[i].re_no+')">';
	    		code +='답글 등록</div>'
	    			
	    		code +='<textarea class="inputDapReply'+ReplyLists[i].re_no+' form-control" style="display:none; height:50px;"></textarea>';
	    		code +='';
	    		
	    		code += "<textarea class='inputReplyModify"+ReplyLists[i].re_no+" form-control' style='display:none; height:50px;'>"+ReplyLists[i].re_cont+"</textarea> </div>";
	    		
	    		
				
	    		code += '<div>';
	    		 if("${loginUser.emp_id}" == ReplyLists[i].re_writerid){ 
	    		code += '<div class="" style="display:inline-block;">';
	    		code += '<div class=""><a  class="btn btn-sm btn-outline-warning mx-1 w-100 ModifyReply'+ReplyLists[i].re_no+'" onclick="ModifyReply('+ReplyLists[i].re_no+')">수정</a></div></div>';
	    		
	    		code += '<div class="" style="display:inline-block;">';
	    		code += '<div class=""><a  class="btn btn-sm btn-outline-danger mx-1 w-100 RemoveReply'+ReplyLists[i].re_no+'" onclick="RemoveReply('+ReplyLists[i].re_no+')">삭제</a></div></div>';
	    			 } 
	    		code += '<div class="" style="display:inline-block;">'; 
	    		code += '<div class=""><a  class="btn btn-sm btn-outline-primary mx-1 w-100 ModifyRegist'+ReplyLists[i].re_no+'" style="display:none;" onclick="ModifyRegist('+ReplyLists[i].re_no+')">저장</a></div></div>';
	    		
	    		code += '<div class="" style="display:inline-block;">'; 
	    		code += '<div class=""><a  class="btn btn-sm btn-outline-primary mx-1 w-100 DapReplyD'+ReplyLists[i].re_no+'" style="display:none;" onclick="DapReplyRegist('+ReplyLists[i].re_no+','+ReplyLists[i].re_postno+')">답글 저장</a></div></div>';
	    		
	    		
	    		code += '<div class="" style="display:inline-block;">';
	    		code += '<div class=""><a  class="btn btn-sm btn-outline-danger mx-1 w-100 backModify'+ReplyLists[i].re_no+'" style="display:none;" onclick="backModify('+ReplyLists[i].re_no+')">취소</a></div></div>';
	    		
	    		code += '</div></div>';
	    		
	    		code += '</div></div></div></div></div>';
	    		}
	    		 document.querySelector('#ReplyLists').innerHTML=code;
	    	}
	    })
}
ReplyList(); 






function PostList(post_brdno){
	location.href="<%=request.getContextPath()%>/post/list.do?post_brdno="+post_brdno+"&NowPage="+${param.NowPage};
}



<!-- 글 수정 -->
function ModifyBoard(){
	taNo = [];
	Delfile=[];
	var postpbls = $('.post_pbls').val();
	var postNo = $('.post_no').val();
	var post_ModifyTitle = $('.post_ModifyTitle').val();
	var post_ModifyContent = $('#summernoteContent').val();
	
	delfileList = document.querySelectorAll('input[name="delfile"]');
	for(let i=0; i<delfileList.length; i++){
		Delfile.push(delfileList[i].value);
	}
	
	tanoList = document.querySelectorAll('input[name="ta_no"]');
	for(let i=0; i<tanoList.length; i++){
		taNo.push(tanoList[i].value);
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/post/modify.do",
		type : "post",
		traditional : true,
		data : {
				 	post_no : postNo, 
					post_title : post_ModifyTitle ,
					post_cont : post_ModifyContent,
					post_pbls : postpbls,
					ta_no : taNo,
					delfile : Delfile
				},
		success:function(msg){
				alert(msg)
				location.reload();
		}
	})
} 
function RemoveBoard(post_brdno){
	var postpbls = $('.post_pbls').val();
	var postNo = $('.post_no').val();
	
	$.ajax({
		url : "<%=request.getContextPath()%>/post/remove.do",
		type : "get",
		data :{
					post_no : postNo,
					post_pbls : postpbls
		},
		success:function(req){
			if(req){
				alert(req);
				var NowPage = ${param.NowPage}
				var PageNum =${param.value}
				
				if(PageNum == 1){
					NowPage = NowPage -1
				}
				location.href="<%=request.getContextPath()%>/post/list.do?post_brdno="+post_brdno+"&NowPage="+NowPage;
			}
		}
	})
}


$("#modalModifyBtn").on("click", function() {
	
	
	callSummernote(350);
	
})
</script>
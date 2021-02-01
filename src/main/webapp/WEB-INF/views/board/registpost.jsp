<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>


<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<h2 class="page-title">게시글</h2>
				</div>
				<!-- Page title actions -->
				<div class="col-auto ms-auto d-print-none">
					<button type="button" class="btn btn-primary" onclick="javascript:goNoticeList();">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<line x1="9" y1="6" x2="20" y2="6" />
							<line x1="9" y1="12" x2="20" y2="12" />
							<line x1="9" y1="18" x2="20" y2="18" />
							<line x1="5" y1="6" x2="5" y2="6.01" />
							<line x1="5" y1="12" x2="5" y2="12.01" />
							<line x1="5" y1="18" x2="5" y2="18.01" /></svg>
						목록
					</button>
				</div>
			</div>
		</div>

		<div class="card p-3">
			<div class="card-header">
				<h3 class="card-title">게시글 등록</h3>
			</div>
			<div class="card-body">
				<input type="hidden" id="Registpost_brdno" value="${postvo.post_brdno }">
	
	
				<div class="mb-3">
					<label class="form-label">제목</label> <input type="text" class="form-control" id="Registpost_title" placeholder="Title">
				</div>
	
				<div class="mb-3" id="summernoteAppendRegist">
					<label class="form-label" class="post_content">내용</label>
				</div>
	
				<input type="hidden" value='0' id="Registpost_ppost">
				
				
				<input multiple="multiple" type="file" id="ajaxFile" onChange="fileChange();" style="display: none;">
	
				<div class="form-group mb-3 row" id="fileDrop">
				<div class="d-flex justify-content-between">
					<label class="form-label">파일첨부</label>
					
					<button type="button" class="btn mb-1" onclick="ajaxFileUpload();">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
				<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
				<path d="M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2"></path>
				<polyline points="7 9 12 4 17 9"></polyline>
				<line x1="12" y1="4" x2="12" y2="16"></line></svg>
					Upload
				</button>
					</div>
					<div class="divide-y" id="appendArea">
						<label class="row m-0" style="border: 1px dotted gray; height: 100px;" id="dragHere"> <span class="text-center p-4">여기에 파일을 drag &amp; drop 해주세요</span>
						</label>
					</div>
				</div>
			</div>

			<div class="card-footer d-flex justify-content-end">
				<a href="#" class="btn btn-primary ms-auto" data-dismiss="modal" onclick="BoardInsert(history.go(-1));"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<line x1="12" y1="5" x2="12" y2="19"></line>
									<line x1="5" y1="12" x2="19" y2="12"></line></svg> 등록
				</a>
			</div>
		</div>
	</div>
</div>

<script>



$(document).ready(function() {
	code = '<textarea id="summernoteContent" name="post_cont" rows="" cols=""></textarea>'
		$("#summernoteAppendRegist").append(code)
		callSummernote(350);
	
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


  function ajaxFileUpload(){
	  $('#ajaxFile').click();
  }
  
  function fileChange(){
	  const fileList = $('#ajaxFile')[0].files;
	  
	  var chkLength = $('.newFile').length + fileList.length;
		if(chkLength > 5){
			alert("파일을 최대 5개까지 업로드 가능 합니다");
			return false;
		}
		
	  for(let i=0; i<fileList.length; i++){
		  addFile(fileList[i]);
	  }
  }
  
  

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



function BoardInsert(){
	taNo = [];
	var Registbrdno =  $('#Registpost_brdno').val()
	var Registtitle = $('#Registpost_title').val()
	var post_Content = $('#summernoteContent').val();
	tanoList = document.querySelectorAll('input[name="ta_no"]');
	for(let i=0; i<tanoList.length; i++){
		taNo.push(tanoList[i].value);
	}
	$.ajax({
		url : "<%=request.getContextPath()%>
	/post/regist.do",
			traditional : true,
			type : "get",
			data : {
				post_brdno : Registbrdno,
				post_title : Registtitle,
				post_cont : post_Content,
				ta_no : taNo
			},
			success : function(req) {
				if (req) {
					alert(req);
				}

			}

		})
	}
</script>


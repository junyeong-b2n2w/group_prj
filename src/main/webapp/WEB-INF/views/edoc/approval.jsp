<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="card mt-3">
	
	<div class="card-status-top bg-primary"></div>
	<div class="card-header">
		<h3 class="m-0 card-title">결&nbsp;&nbsp;재</h3>
	</div>
	<div class="card-body">
		<form role="aprvRegistForm">
			<input type="hidden" name="aprv_no" value="${gno}">
			<input type="hidden" name="aprv_as" value="${code}">
			<input type="hidden" name="aprv_edno" value="${edno}">
			<input type="hidden" name="aprv_empid" value="${loginUser.emp_id}">
			<textarea name="aprv_comm"style="resize: none;width: 100%;overflow-y: scroll;height: 150px;" placeholder="의견을 작성해주세요."></textarea>
			<div class="form-group row" id="fileDrop">
				<label class="form-label mt-1">파일첨부</label>
				<div class="divide-y" id="appendArea">
					<label style="border: 1px dotted gray; height: 50px;width: 100%; text-align: center; font-size: smaller;" id="dragHere"> 
					<br>
						여기에 파일을 drag &amp; drop 해주세요
					</label>
				</div>
			</div>
		</form>
	</div>
	<!-- Card footer -->
	<div class="card-footer text-right">
		<a href="javascript:CloseWindow()" class="btn btn-link" style="float: left;">닫기</a>
		<a href="#" class="btn btn-warning" onclick="aprvRetn()">반려</a>
		<a href="#"	class="btn btn-primary" onclick="aprvAprv()">결재</a>
	</div>

</div>
<script>
function aprvRetn() {
	var form = $("form[role='aprvRegistForm']")
	var chk = confirm("정말 반려하시겠습니까?")
	if(chk){
		$.ajax({
			url : "importantReturn",
			type : "post",
			data : form.serialize(),
			success: function(res) {
				window.opener.alert("반려되었습니다.");
				window.opener.onbeforeunload = null;
				window.opener.location.reload(true);
				window.close();
			}
		})
	}
}
function aprvAprv() {
	var form = $("form[role='aprvRegistForm']")
	var chk = confirm("정말 결재하시겠습니까?")
	if(chk){
		$.ajax({
			url : "importantApproval",
			type : "post",
			data : form.serialize(),
			success: function(res) {
				window.opener.alert("결재되었습니다.");
				window.opener.onbeforeunload = null;
				window.opener.location.reload(true);
				window.close();
			}
		})
	}
}


$(document).ready(function() {
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
	  var chkLength = $('.newFile').length + files.length + $(".oldFile").length;
		if(chkLength > 5){
			alert("파일을 최대 5개까지 업로드 가능 합니다");
			return false;
		}
		for(var i=0;i<files.length;i++){
			addFile(files[i]);
		}
		return false; //파일이 자동으로 열리는 것을 멈추게 한다
	 });
	 
})
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
				async : true,
				success : function(data){
					var code = "";
					 code += "<label class='row'>";
					 code += "<span class='col'>"+data.filename+"<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'></path><path d='M10 14a3.5 3.5 0 0 0 5 0l4 -4a3.5 3.5 0 0 0 -5 -5l-.5 .5'></path><path d='M14 10a3.5 3.5 0 0 0 -5 0l-4 4a3.5 3.5 0 0 0 5 5l.5 -.5'></path></svg></span>";
					code += "<span class='col-auto'>"			
					code += "<label class='form-check form-check-single form-switch'>";	
					code+= "<input type='hidden' name='ta_no' value='"+data.ta_no+"'/>";
					code += "<small data-src='"+data.ta_no+"' class='newFile'><a onclick='javascript:deleteFileDm(this);'>"
					code += "<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'></path><line x1='18' y1='6' x2='6' y2='18'></line><line x1='6' y1='6' x2='18' y2='18'></line></svg></a>";			
					code += "</label></span></label>";	
					
		   			 $('#dragHere').addClass('d-none');
					$("#appendArea").append(code);
				}
				
			})
		}
		function deleteFileDm(item) {
			$(item).closest(".row").remove()
			if($(".newFile").length == 0){
				$('#dragHere').removeClass('d-none');
			}
		}
</script>


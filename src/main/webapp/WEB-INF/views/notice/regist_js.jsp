<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<input type="hidden" name="ntc_popyn"/>
<script>


 $(document).ready(function() {
		 $("input[name=ntc_popyn]").val("N")
	
		//팝업체크 확인	  
		  $("input[name=ntc_popyn]").change(function(){
		        
	
		        if($("input[name=ntc_popyn]").is(":checked")){//팝업 체크시 
		        	$("input[name=ntc_popyn]").val("Y")
		        	 if($('input[name="ntc_title"]').val() == ""){ //타이틀 미입력시 
			        		alert("제목을 입력해주세요");
			        		$('input[name="ntc_title"]').focus();
			        		$('input[name=ntc_popyn]').prop('checked', false).change(); //check박스 false로 변환
			        		return false;
			        	}
					  else{
						  
						 $('.previewBtn').show();
				         $('.popupDate').show();
					  }
		        }else{
		        	$("input[name=ntc_popyn]").val("N")
		        	$('.previewBtn').hide();
		        	$('.popupDate').hide();
		        }
		    });
		  
		
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
 
 
function previewPopupOpen(){
	  $("#preview_title").text($('input[name="ntc_title"]').val().trim());
	  var summernoteContent = $("#summernoteContent").val();
      var previewContent = $('.previewContent');
	  if(summernoteContent == ""){
		  alert("내용입력 시 해당 내용을 미리 볼 수 있습니다");
  			$('#summernoteContent').focus();
  			return false;
	  }else{
		 $('#preViewPopup').modal('show');
      	previewContent.html(summernoteContent);
	  }
}

$("input[type=datetime-local]").on('change',function(){

	
		var now=new Date();
	
		 var  ntc_popsatymd = $("input[name=ntc_popsatymd]").val();
		 var  ntc_popendymd = $("input[name=ntc_popendymd]").val();
		 
		  
		var now = new Date(now.getTime()-now.getTimezoneOffset()*60000).toISOString().substring(0,16);
			 
		if(now > ntc_popsatymd){ //현재 날짜보다 이전 시간을 클릭할 경우 리턴한다
			
			alert("현재날짜 이후의 시간만 선택 가능합니다");
			$("input[name=ntc_popsatymd]").focus();
			return;
		}else if($('input[name="ntc_popendymd"]').val() == "" || $('input[name="ntc_popendymd"]').val() == "undefined"){
					alert("팝업 종료 일자 입력은 필수 입니다");
					return;
		}else if(ntc_popsatymd > ntc_popendymd){
			alert("시작일자 이후의 날짜만 선택 가능 합니다");
			return;
		}
	
})


//등록버튼 누를 시
function registNoticeBtn(){
		 
	var fileLength = $('.newFile').length;
	var form = $('form[name="registForm"]');
	
	if($('input[name="ntc_popyn"]').val() == "Y"){
		if($('input[name="ntc_popsatymd"]').val() == "" || $('input[name="ntc_popsatymd"]').val() == "undefined"){
			alert("팝업 선택 시 일자 입력은 필수 입니다");
			return;
		}
	}
// 	console.log($('input[name="ntc_popyn"]').val() );
// 	console.log(form.serialize());
	form.submit();
	
}

	  
//목록으로 돌아가기
function goNoticeList(){
	
	location.href="<%=request.getContextPath()%>/notice/list";
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
})

//summernote
window.addEventListener("load", function() {
	callSummernote(400);
	$(".note-editable").text("${form.af_cont}");
	 
})

function AjaxuploadFile(){
	
		var c = $('#chFile')[0].files;
		
		 var chkLength = $('.newFile').length + c.length;
			if(chkLength > 5){
				alert("파일을 최대 5개까지 업로드 가능 합니다");
				return false;
			}
		
		for(var i =0; i<c.length;i++){
			addFile(c[i]);
		}
}
function chooseFile(){
	$('#chFile').click();
	
}

 </script>
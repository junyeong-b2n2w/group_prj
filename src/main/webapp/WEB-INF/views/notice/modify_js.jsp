<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form name="modifyForm" action="<%=request.getContextPath()%>/notice/modify" method="post">
	<input type="hidden" name="ntc_no" value="${notice.ntc_no }" /> 
	<input type="hidden" name="ntc_title" />
	 <input type="hidden" name="ntc_cont" /> 
	 <input type="hidden" name="ntc_popyn" />
	  <input type="hidden" name="ntc_popsatymd" />
		 <input type="hidden" name="ntc_popendymd" /> 
		<input type="hidden" name="ntc_writerid"  value="${loginUser.emp_id }"/>
		 <input type="hidden" name="ntc_attckey" value="${notice.ntc_attckey }" /> 
</form>

<script>
<c:if test="${msg ne null}">
	alert('<c:out value="${msg}"/>');
</c:if>

var checkpopyn = "${notice.ntc_popyn}";
var checkNtcPopSatymd = "${notice.ntc_popsatymd}";
var checkNtcPopEndymd = "${notice.ntc_popendymd}";


 $(document).ready(function() {
	 
	 /* 팝업 관련 자바스크립트 */
	 	if(checkpopyn == "Y"){ //팝업일경우
	 		
	 		$('input:checkbox[id="ntc_popyn"]').is(":checked") == true; 
	 		$('input:checkbox[id="ntc_popyn"]').prop('checked', true).change(); //check박스 true로 변환
	 		
	 		
	 		//start date변환
	 		var input = checkNtcPopSatymd.replace( " " , "T" ) ;
	 		var changeStDt = new Date(input)
	 		var changeStDt2 =  new Date(changeStDt.getTime()-changeStDt.getTimezoneOffset()*60000).toISOString().substring(0,16);
	 		//end date변환
	 		var input2 = checkNtcPopEndymd.replace( " " , "T" ) ;
	 		var changeEnDt = new Date(input2)
	 		var changeEnDt2 =  new Date(changeEnDt.getTime()-changeEnDt.getTimezoneOffset()*60000).toISOString().substring(0,16);
	 		
	 		 $('#startDate').val(changeStDt2);
	 		 $('#endDate').val(changeEnDt2);
	 		 
	 		 $('.previewBtn').show();
	         $('.popupDate').show();
	 	}else{
	 		$('input:checkbox[id="ntc_popyn"]').val("N");
	 	}
	 
		  
		 $('input:checkbox[id="ntc_popyn"]').change(function(){ //팝업체크 수정 시
		        
		        if($('input:checkbox[id="ntc_popyn"]').is(":checked")){//팝업 체크시 
		        	
		        	$('input:checkbox[id="ntc_popyn"]').val("Y")
		        	
			        	 if($('input:checkbox[id="ntc_popyn"]').val() == ""){ //타이틀 미입력시 
				        		alert("제목을 입력해주세요");
				        		$('input[id="ntc_title"]').focus();
				        		$('input:checkbox[id="ntc_popyn"]').prop('checked', false).change(); //check박스 false로 변환
				        		return false;
				        	}
						  else{
							  
							 $('.previewBtn').show();
					         $('.popupDate').show();
						  }
		        }else{
		        	$('input:checkbox[id="ntc_popyn"]').val("N")
		        	$('.previewBtn').hide();
		        	$('.popupDate').hide();
		        }
		    });
		
		 /* 파일 관련 자바스크립트 */
		 
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
	  

//미리보기 모달
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

// 팝업 시작/종료일시 변경 시 
$("input[type=datetime-local]").on('change',function(){

		var now=new Date();
	
		 var  ntc_popsatymd = $("input[id='startDate']").val();
		 var  ntc_popendymd = $("input[id='endDate']").val();
		 
		var now = new Date(now.getTime()-now.getTimezoneOffset()*60000).toISOString().substring(0,16);
			 
		if(now > ntc_popsatymd){ //현재 날짜보다 이전 시간을 클릭할 경우 리턴한다
			
			alert("현재날짜 이후의 시간만 선택 가능합니다");
			$("input[name=ntc_popsatymd]").focus();
			return;
		}else if(ntc_popsatymd > ntc_popendymd){
			alert("시작일자 이후의 날짜만 선택 가능 합니다");
			return;
		}
	
})


//목록으로 돌아가기
function goNoticeList(){
	
	location.href="<%=request.getContextPath()%>/notice/list";
}

//등록버튼 누를 시
function modNoticeBtn(){
		 
	var fileLength = $('.newFile').length;
	var form = $('form[name="modifyForm"]');
	"src/main/webapp/WEB-INF/views/gchart/main.jsp"
	$('input[name="ntc_title"]').val($('input[id="ntc_title"]').val());
	$('input[name="ntc_cont"]').val($('textarea[id="summernoteContent"]').val());
	$('input[name="ntc_popyn"]').val($('input[id="ntc_popyn"]').val());
	$('input[name="ntc_popsatymd"]').val($('input[id="startDate"]').val());
	$('input[name="ntc_popendymd"]').val($('input[id="endDate"]').val());
	
	"src/main/webapp/WEB-INF/views/gchart/main.jsp"
	
	if($('input[name="ntc_popyn"]').val() == "Y"){
		if($('input[name="ntc_popsatymd"]').val() == "" || $('input[name="ntc_popsatymd"]').val() == "undefined"){
			alert("팝업 선택 시 일자 입력은 필수 입니다");
			return;
		}
		if($('input[name="ntc_popendymd"]').val() == "" || $('input[name="ntc_popendymd"]').val() == "undefined"){
			alert("팝업 선택 시 일자 입력은 필수 입니다");
			return;
		}
	}
	console.log(form.serialize());
	
	form.submit();
	
}


//임시 저장용 파일들 지우기(단순히 아이콘만 삭제한다)
$('#appendArea').on('click','label  > span  > label > small.newFile',function(){
	$(this).closest("#fileRow").remove();
	
})

var chkFileNewAmt = 0;
//임시파일에 파일 업로드 하기 
function addFile(file){
	var chkFileOriginAmt = $('div.divide-y').children('div#fileRow').length;
	if(file){
		chkFileNewAmt++;
	}
	if(chkFileNewAmt + chkFileOriginAmt > 5 || chkFileOriginAmt == 5){
		alert("가능한 첨부 파일 업로드 개수는 5개까지입니다");
		return false;
	}
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
			 code += "<div id='fileRow'>";
			 code += "<label class='row'>";
			 code += "<span class='col'>"+data.filename+"<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><path d='M4 17v2a2 2 0 0 0 2 2h12a2 2 0 0 0 2 -2v-2' /><polyline points='7 9 12 4 17 9' /><line x1='12' y1='4' x2='12' y2='16' /></svg></span>";
			code += "<span class='col-auto'>"	
			code+= "<input type='hidden' name='ta_no' value='"+data.ta_no+"'/>";
			code += "<label class='form-check form-check-single form-switch'>";			
			code += "<small data-src='"+data.ta_no+"' class='newFile'><a href='javascript:void(0);'>"
			code += "<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'></path><line x1='18' y1='6' x2='6' y2='18'></line><line x1='6' y1='6' x2='18' y2='18'></line></svg></a>";			
			code += "</label></span></label>";	
			 code += "</div>";
			  
			 val = "<input type='hidden' name='ta_no' value='"+data.ta_no+"'/>";
   			 
   			 $('#dragHere').addClass('d-none');
			$("#appendArea").append(code);
			$('form[name="modifyForm"]').append(val);
		}
		
	})
}


//파일 삭제버튼 누를 시
function deleteFileByAttcNo(attc_no,tt){
	//파일이 안보여지게 한다
	$(tt).closest('#fileRow').addClass('d-none');
	val = "<input type='hidden' name='delfile' value='" + attc_no + "'/>";
	$('form[name="modifyForm"]').append(val);
	//원래 있던파일이랑 새로운 파일을 구분하여 원래 파일을 삭제하면 컨트롤러가 어떻게 구분하는지
}


//summernote
window.addEventListener("load", function() {
	callSummernote(400);
	$(".note-editable").html('${notice.ntc_cont}');
	
	 
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

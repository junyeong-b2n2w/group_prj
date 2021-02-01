<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <form role="approvalRegistForm" method="post" action="<%=request.getContextPath()%>/edoc/regist">
    	<input type="hidden" name="ed_formno" value="${form.af_no}">
    	<input type="hidden" name="ed_dftr" value="${loginUser.emp_id}">
    	<input type="hidden" name="ed_deptno">
    	<input type="hidden" name="ed_regymd">
    	<input type="hidden" name="ed_aprvtitle">
    	<input type="hidden" name="ed_aprvstt">
    	<input type='hidden' name='ed_no' value='0'>
    	<input type='hidden' name='ed_attckey' value='0'>
    </form>
<script>
	window.onbeforeunload = function(e) {
	    var dialogText = 'Dialog text here';
	    e.returnValue = dialogText;
	    return dialogText;
	};
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
	$('#appendArea').on('click','label  > span  > label > small > a',function(){
		var chk = $(this).closest("div").children("label[class='row']").length;
		$(this).closest("label[class='row']").remove();
		if(chk <2){
			$("#dragHere").removeClass('d-none');
		}
	})
	 $(document).ready(function() {
		callSummernote(550);
		$(".note-editable").text("${form.af_cont}");
		$(".note-editable").css("background", "white");
		
		$("#aprvDept").val("${loginUser.dept_nm}")
		$("#aprvDept").attr("role","${loginUser.dept_no}")
		$("#aprvEdocNumber").attr("placeholder","자동채번")
		$("#aprvReciveTarget").attr("placeholder","수신처 선택")
		
		var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth()+1;
		var date = today.getDate();
		$("#aprvRegDate").val(year + "/" + month + "/" + date)
		$("#aprvReference").attr("placeholder","참조 선택")
		$("#aprvRegistUser").val("${loginUser.emp_nm}")
		$("#aprvTaskNumber").attr("placeholder","자동채번")
	})
	
	$("input[name='aprvReciveTarget']").on("click", function () {
		$("#receiverRefModal").modal("show")
		$("#receiverRefModalTitle").text("수신자 설정")
		$("#receiverRefModalGB").val("susin")
		var refList = $("#aprvReciveTarget").attr("role")
		if(refList){
			refList = refList.split("&&")
			for(i=0; i<refList.length-1; i++){
				dept = refList[i].split("/")[0]
				name = refList[i].split("/")[1]
				id = refList[i].split("/")[2]
				appendRRData(id,name,dept)
			}
		}
		
	})
	$("input[name='aprvReference']").on("click", function () {
		$("#receiverRefModal").modal("show")
		$("#receiverRefModalTitle").text("참조자 설정")
		$("#receiverRefModalGB").val("cham")
		var recList = $("#aprvReference").attr("role")
		if(recList){
			recList = recList.split("&&")
			for(i=0; i<recList.length-1; i++){
				dept = recList[i].split("/")[0]
				name = recList[i].split("/")[1]
				id = recList[i].split("/")[2]
				appendRRData(id,name,dept)
			}
		}
	})
	
	
	// 임시저장 버튼
	$(".tempSaveBtn").on("click", function() {
		window.onbeforeunload = null;	// 윈도우 나감방지 문자
		// 결재제목 입력여부 확인(필수)
		var title = $("#aprvTitle").val()
		if(title == ""){				
			alert("제목은 필수입력 사항입니다.")
			$("#aprvTitle").focus();
			return false
		}
		var tempSaveForm = $("form[role='approvalRegistForm']")
		aprvFormInputCheck(tempSaveForm)
		$("input[name='ed_deptno']").val($("#aprvDept").attr("role"))		// 부서번호 설정
		$("input[name='ed_regymd']").val($("#aprvRegDate").val())	// 등록일자 설장
		$("input[name='ed_aprvtitle']").val($("#aprvTitle").val())	// 제목 설정
		$("input[name='ed_aprvstt']").val("DED02")	// 상태코드 설정(임시저장)
		
		tempSaveForm.submit()
	})
	$(".aprvFormRegistBtn").on("click", function() {
		window.onbeforeunload = null;
		var tempSaveForm = $("form[role='approvalRegistForm']")
		var aprvLn = $("td[name='aprvLnEmps']")
		// 결재제목 입력여부 확인(필수)
		var title = $("#aprvTitle").val()
		if(title == ""){				
			alert("제목은 필수입력 사항입니다.")
			$("#aprvTitle").focus();
			return false
		}
		if(aprvLn.length < 1){		
			alert("결재선을 지정해주세요.")
			$(".aprvFormRegistBtn:first").focus();
			return false
		}
		var content = $("#summernoteContent").val()
		if(content == ""){
			alert("내용입력은 필수입니다.")
			$("#summernoteContent").focus();
			return false
		}
		aprvFormInputCheck(tempSaveForm)
		$("input[name='ed_deptno']").val($("#aprvDept").attr("role"))		// 부서번호 설정
		$("input[name='ed_regymd']").val($("#aprvRegDate").val())	// 등록일자 설장
		$("input[name='ed_aprvtitle']").val($("#aprvTitle").val())	// 제목 설정
		$("input[name='ed_aprvstt']").val("DED01")	// 상태코드 설정(기안상신)
		
		tempSaveForm.submit()
	})
	
	function aprvFormInputCheck(tempSaveForm) {
		// 수신처 지정여부(있을경우)
		var aprvRefLn = $("#aprvReciveTarget")
		if(!(aprvRefLn.val() == "")){
			var idList = splitGetID(aprvRefLn.attr("role"))
			var code = "";
			$.each(idList, function(i) { 	// id개수만큼 form에 input데이터 추가
				code += "<input type='hidden' name='rec_empid' value='"+idList[i]+"'>"
			})
			tempSaveForm.append(code)
		}
		
		// 참조 지정여부(있을경우)
		var aprvRefLn = $("#aprvReference")
		if(!(aprvRefLn.val() == "")){
			var idList = splitGetID(aprvRefLn.attr("role"))
			var code = "";
			$.each(idList, function(i) { 	// id개수만큼 form에 input데이터 추가
				code += "<input type='hidden' name='ar_empid' value='"+idList[i]+"'>"
			})
			tempSaveForm.append(code)
		}
		
		// 결재선 지정여부(있을경우)
		var aprvLn = $("td[name='aprvLnEmps']")
		if(aprvLn.length >= 1){
			var code = "";
			var byeongFlag = false;			// 병렬합의가 첫번째일 경우
			$.each(aprvLn, function(i, ob) {
				var option = $(ob).data("gb")	// 옵션값 consOp(합의) aprvOp(결재) aprvPreOp(전결)
				var id = $(ob).data("id")		// id값
				var seq = $(ob).data("seq")		// 순서
				// 최종결재자 추가
				if(seq == aprvLn.length){
					code += "<input type='hidden' name='ed_lastapvr' value='"+id+"'>"
				}
				if(seq == "1"){
					if(option == "aprvOp"){		// 결재일경우
						code += "<input type='hidden' name='aprv_empid' value='"+id+"'>"
						code += "<input type='hidden' name='aprv_as' value='DAP05'>"
						code += "<input type='hidden' name='aprv_ord' value='"+seq+"'>"
					}
					if(option == "consOp"){		// 합의일경우
						code += "<input type='hidden' name='cons_empid' value='"+id+"'>"
						if($("#agreeGB").val()=="byeong"){
							code += "<input type='hidden' name='cons_agrestt' value='DAP25'>"
							byeongFlag = true;
						}else{
							code += "<input type='hidden' name='cons_agrestt' value='DAP15'>"
						}
						code += "<input type='hidden' name='cons_ord' value='"+seq+"'>"
					}
					if(option == "aprvPreOp"){	// 전결일경우
						code += "<input type='hidden' name='aprv_empid' value='"+id+"'>"
						code += "<input type='hidden' name='aprv_as' value='DAP35'>"
						code += "<input type='hidden' name='aprv_ord' value='"+seq+"'>"
					}
				}else{
					if(option == "aprvOp"){		// 결재일경우
						code += "<input type='hidden' name='aprv_empid' value='"+id+"'>"
						code += "<input type='hidden' name='aprv_as' value='DAP01'>"
						code += "<input type='hidden' name='aprv_ord' value='"+seq+"'>"
						byeongFlag=false
					}
					if(option == "consOp"){		// 합의일경우
						code += "<input type='hidden' name='cons_empid' value='"+id+"'>"
						if($("#agreeGB").val()=="byeong"){
							if(byeongFlag){
								code += "<input type='hidden' name='cons_agrestt' value='DAP25'>"
							}else{
								code += "<input type='hidden' name='cons_agrestt' value='DAP21'>"
							}
						}else{
							code += "<input type='hidden' name='cons_agrestt' value='DAP11'>"
						}
						code += "<input type='hidden' name='cons_ord' value='"+seq+"'>"
					}
					if(option == "aprvPreOp"){	// 전결일경우
						code += "<input type='hidden' name='aprv_empid' value='"+id+"'>"
						code += "<input type='hidden' name='aprv_as' value='DAP31'>"
						code += "<input type='hidden' name='aprv_ord' value='"+seq+"'>"
						byeongFlag=false
					}
				}
			})
			
			
			tempSaveForm.append(code)
		}
		
		// 내용작성 여부(있을경우)
		var content = $("#summernoteContent").val()
		if(!(content == "")){
			var code = "<input type='hidden' name='ed_aprv' value='"+content+"'>"
			tempSaveForm.append(code)
		}
		
		
		var fileList = $("input[name='ta_no']")
		if(fileList){
			var code = ""
			$.each(fileList, function(i) {
				code += "<input type='hidden' name='ta_no' value='"+$(fileList[i]).val()+"'>"
			})
			tempSaveForm.append(code)
		}
	}
	
	function splitGetID(string) {	// 수신처, 참조자 스트링배열 자르기(부서/이름/아이디&&부서/이름/아이디 형식)
		var splitAnd = string.split("&&");
		var idList = new Array()
		for(i=0; i<splitAnd.length-1; i++){
			var id = splitAnd[i].split("/")[2];
			idList.push(id)
		}
		return idList;
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
	
	function chooseFile() {
		$("#aprvAddFile").click()
	}
	function ajaxUploadFile() {
		var addFile2 = $("#aprvAddFile")[0].files;
		
		var chkLength = $('.newFile').length + addFile2.length + $(".oldFile").length;
		if(chkLength > 5){
			alert("파일을 최대 5개까지 업로드 가능 합니다");
			return false;
		}
		for(var i=0;i<addFile2.length;i++){
			addFile(addFile2[i])
		}
	}
	function deleteFileByAttcNo(attc_no,tt){
		//파일이 안보여지게 한다
		$(tt).closest('#fileRow').addClass('d-none');
		val = "<input type='hidden' name='delfile' value='" + attc_no + "'/>";
		$("form[role='approvalRegistForm']").append(val);
		//원래 있던파일이랑 새로운 파일을 구분하여 원래 파일을 삭제하면 컨트롤러가 어떻게 구분하는지
	}
</script>
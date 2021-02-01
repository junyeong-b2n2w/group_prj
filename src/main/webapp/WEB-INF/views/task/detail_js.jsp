<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    
<script>

//파일 삭제버튼 누를 시
function deleteFileByAttcNo(attc_no,tt){
	//파일이 안보여지게 한다
	tt.closest('#fileRow').remove();
	val = "<input type='hidden' name='delfile' value='" + attc_no + "'/>";
	$('.divide-y').append(val);
	//원래 있던파일이랑 새로운 파일을 구분하여 원래 파일을 삭제하면 컨트롤러가 어떻게 구분하는지
	
}

function RemoveTask(tascNo){
	$.ajax({
		url : "<%=request.getContextPath()%>/task/remove",
		type : "get",
		data : {
					tasc_no : tascNo,
					perf_tascno : tascNo
				},
		success:function(req){
			alert(req);
			location.href = "<%=request.getContextPath()%>/task/list.do?tasc_no="+tascNo;
		}
	})
}

function BackTaskListGo(tascNo){
	location.href = "<%=request.getContextPath()%>/task/list.do?tasc_no="+tascNo;
}

function TaskModify(){
	taNo = [];
	Delfile=[];
	var title = $('#Registtask_title').val();
	var shape = $('input[name="chk_info"]:checked').val();
	var impt = $('input[name="chk_Importance"]').val();
	var ddlndt = $('input[type="date"]').val();
	var cont = $('#summernoteContent').val();
	var empid = $('#id').val();
	var tascNo = $('#tascNo').val();
	var perfids = [];
	
	
	if(shape=="나의 할일"){
		perfids = $('input[name="loginUserId"]').val();
	}
	
	perfidList = document.querySelectorAll('input[name="peopleList"]');
	for(let i=0; i<perfidList.length; i++){
		perfids.push(perfidList[i].value);
	}
	
	console.log(perfidList)
	console.log(perfids)
	
	delfileList = document.querySelectorAll('input[name="delfile"]');
	for(let i=0; i<delfileList.length; i++){
		Delfile.push(delfileList[i].value);
	}
	
	tanoList = document.querySelectorAll('input[name="ta_no"]');
	for(let i=0; i<tanoList.length; i++){
		taNo.push(tanoList[i].value);
	}
	
	
	$.ajax({
		 url : "<%=request.getContextPath()%>/task/modify", 
		 type : "get",
		 traditional : true,
		 data : {
			 		task_title : title,
			 		task_shape : shape,
			 		task_impt : impt,
			 		task_ddlndt : ddlndt,
			 		task_cont : cont,
			 		task_empid : empid,
			 		perf_newempid : perfids,
			 		tasc_no : tascNo,
			 		perf_tascno : tascNo,
			 		ta_no : taNo,
					delfile : Delfile
		 		},
		 success:function(req){
			 if(req){
				 alert(req);
				 location.reload();
			 }
		 }
	})
}
</script>
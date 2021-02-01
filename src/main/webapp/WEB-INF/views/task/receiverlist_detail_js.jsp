<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript">
window.addEventListener("load",function(){
	
	var setting = {
			table : "task",			// DB테이블명(필수)
			primarykey : "tasc_no",		// DB기본키명(필수)S
			selLikeMap : {selName : "searchtaskType", input : "task_search"},
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				if(res != null){
					code = "";
					code2 = "";

					$.each(res, function(i, obj) {
						code += "<tr>";
						code += '<td>'+res[i].tasc_no+'</td>';
						code += '<td><a href='+'"<%=request.getContextPath() %>/task/receivedetail.do?tasc_no='+res[i].tasc_no+'&perf_empid='+res[i].perf_empid+'+&from=0+"'+'id="taskModalDetail" >'+res[i].task_title+'</a></td>';
						code += '<td>'+res[i].rank_nm+'&nbsp; '+res[i].emp_nm+'</td>';
						code += '<td>'+res[i].task_regdt+'</td>';
						code += '<td>'+res[i].task_ddlndt+'</td>';
						code += '<td>'+res[i].perf_stt+'</td>';
						code += '<input type="hidden" value="'+res[i].perf_tascno+'" class="pserftascNO'+res[i].tasc_no+'">'
						code += '<input type="hidden" value="'+res[i].perf_empid+'" class="pserfid'+res[i].tasc_no+'">'
						code += "</tr>";
					})
				}else{
					code = "<div>없다!</div>"
				}
				$("#TaskList").empty();
				$("#TaskList").append(code); 
			},
			searchBtn : "searchtaskType",// 검새버튼 아이디 추가
// 			refreshbtn : "refreshbtn", // 전체목록조회 돌아가기버튼 id 
// 			equalMap : "ntc_writerid",// =조건 검색추가시 추가 컬럼명(TAGNAME)
// 			likeMap : "ntc_title",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
// 			dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
// 			dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
// 			checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
// 			radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임)
			displaypage : 3,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 10		// 한페이지당 보여줄 리스트 개수
		}
		var test = new Pagination(setting);	// pagination 객체생성
		test.setPagenation("post_lists","cri2", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수

})

function MainGoPage(){
			location.href = "<%=request.getContextPath()%>/widgetord/list.do"
		}


function Bokay(value,perfempid){
	var perftascno = $('.tascNO').val();
			$.ajax({
				url : "<%=request.getContextPath()%>/performer/modify",
				type : "post",
				data : {
							tasc_no : perftascno,
							task_stt : value,
							perf_stt : value,
							perf_tascno : perftascno
// 							perf_empid : perfempid
						},
				success:function(req){
					alert(req)
					location.reload();
				}
			})
			
		}
		
function BackTaskListGo(tascNo){
	location.href = "<%=request.getContextPath()%>/task/receivelist.do";
}

function Bdel(value,tascNo){
	var perfrere = $('#returnCont').val();
	var pserfid = $('.pserfid').val();
	$.ajax({
		url : "<%=request.getContextPath()%>/performer/modify",
		type : "post",
		data : {
					perf_rere : perfrere,
					tasc_no : tascNo,
					task_stt : value,
					perf_stt : value,
					perf_tascno : tascNo,
					perf_empid : pserfid
				},
		success:function(req){
			alert(req)
			location.href="<%=request.getContextPath()%>/task/receivelist.do";
		}
	})
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
function deleteFileByAttcNo(attc_no,tt){
	//파일이 안보여지게 한다
	tt.closest('#fileRow').remove();
	val = "<input type='hidden' name='delfile' value='" + attc_no + "'/>";
	$('.divide-y').append(val);
	//원래 있던파일이랑 새로운 파일을 구분하여 원래 파일을 삭제하면 컨트롤러가 어떻게 구분하는지
	
}

//파일 삭제버튼 누를 시
$('#appendArea').on('click','label  > span  > label > small > a',function(){
	var chk = $(this).closest("div").children("label[class='row']").length;
	$(this).closest("label[class='row']").remove();
	if(chk <2){
		$("#dragHere").removeClass('d-none');
	}
});


function completeButton(){
	taNo = [];
	Delfile=[];
	var perfprogress = $('#percentValue').val();
	var perfcont = $('#summernoteContent').val();
	var perftascno = $('.tascNO').val();
	
	if(perfprogress == "" || perfprogress == null){
		perfprogress = $('#emptyBar').val();	
	}
	
	alert(perfprogress);
	
	delfileList = document.querySelectorAll('input[name="delfile"]');
	for(let i=0; i<delfileList.length; i++){
		Delfile.push(delfileList[i].value);
	}
	
	tanoList = document.querySelectorAll('input[name="ta_no"]');
	for(let i=0; i<tanoList.length; i++){
		taNo.push(tanoList[i].value);
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/performer/performermodify",
		type: "post",
		traditional : true,
		data : {
					perf_tascno:perftascno,
					perf_cont:perfcont,
					perf_progress:perfprogress,
			 		ta_no : taNo,
					delfile : Delfile
				},
		success:function(req){
				alert(req)
				location.reload();
		}	
	})
}

function per0(value){
	$('#percentTaskBar').css("width","0%");
	$('#percentBarContent').text("0%");
	$('#percentValue').val(value);
}
function per20(value){
	$('#percentTaskBar').css("width","20%");           
	$('#percentBarContent').text("20%");
	$('#percentValue').val(value);
}
function per40(value){
	$('#percentTaskBar').css("width","40%");           
	$('#percentBarContent').text("40%")
	$('#percentValue').val(value);
}
function per60(value){
	$('#percentTaskBar').css("width","60%");           
	$('#percentBarContent').text("60%")
	$('#percentValue').val(value);
}
function per80(value){
	$('#percentTaskBar').css("width","80%");           
	$('#percentBarContent').text("80%")
	$('#percentValue').val(value);
}
function per100(value){
	$('#percentTaskBar').css("width","100%");           
	$('#percentBarContent').text("100%")
	$('#percentValue').val(value);
}





	
</script>
<%@ include file="/WEB-INF/views/common/pagination2.jsp" %>

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
					console.log(res);
					$.each(res, function(i, obj) {
						var count = res[i].count;
						var value = count -1;
						code += "<tr>";
					//	code += '<td><input class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>';
						code += '<td>'+res[i].tasc_no+'</td>'
						code += '<td><a class="NmgListClick" href='+'"<%=request.getContextPath() %>/task/detail.do?tasc_no='+res[i].tasc_no+'"'+'"id="taskModalDetail">'+res[i].task_title+'</a></td>';
						if(res[i].count > 1){
						code += '<td>'+res[i].emprank+'&nbsp;'+res[i].empnm+'&nbsp;외&nbsp;'+value+'명';
// 						code += ' <div class="row" style="width: 0px; display: inline-block;">'
// 						code += ' <div class="btn-group">'
// 						code += '<span class="btn btn-secondary dropdown-toggle" data-hover="dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background: #f4f6fa;color: #2b14bb; cursor: pointer" onclick="NmgList('+res[i].tasc_no+')">'+value+'명</span>';
// 						code += '<div class="dropdown-menu'+res[i].tasc_no+'">'
// 						code += '<div class="dropdown-divider"></div>'
// 						code += '</div></div></div>';
						code += '</td>'
						}else{
						code += '<td>'+res[i].emprank+'&nbsp;'+res[i].empnm+'</td>';
						}
						code += '<td>'+res[i].task_regdt+'</td>';
						code += '<td>'+res[i].task_ddlndt+'</td>';
						code += '<td>'+res[i].task_stt+'</td>';
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
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 10		// 한페이지당 보여줄 리스트 개수
		}
		var test = new Pagination(setting);	// pagination 객체생성
		test.setPagenation("post_lists","cri", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수

})



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

  
 function ReceiverDetail(){
		
	  
	  
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

function CustomerS(){
	$('.Customer').css("display","none");
	
}

function TaskHistory(){
	$('.Customer').css("display","block");
}


function TaskBogo(){
	$('.Customer').css("display","block");
}

function TaskSend(){
	$('.Customer').css("display","block");
	
}
	
	
	
	

$("input[name='aprvReference']").on("click", function () {
	$("#receiverRefModal").modal("show")
	$("#receiverRefModalTitle").text("사용자 선택")
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
$('#modalRegistBtn').on("click",function(){
	$("#summernoteAppendRegist").empty();
	$("#summernoteAppendDap").empty();
code = '<textarea id="summernoteContent" name="post_cont" rows="" cols=""></textarea>'
$("#summernoteAppendRegist").append(code)
callSummernote(350);
})






	var zTree2;
	var demoIframe2;
	var chkDept2 = new Array(); //empList가 없는 deptNo를담을 array
	var setting2 = {
		view : {
			dblClickExpand : false,
			showLine : true,
			selectedMulti : false
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeClick : beforeClick2,
			onCheck : onCheck2
		},
		check : { //체크박스 버튼 만들기
			enable : true,
			chkStyle : "checkbox",
			chkboxType : {
				"Y" : "sp",
				"N" : "sp"
			}
		}
	};

	var zNodes2 = []
	var jsonArray2 = ${deptList}

	for (var i = 0; i < jsonArray2.length; i++) {
		if (i == 0) {
			zNodes2.push({
				id : jsonArray2[i].dept_no,
				pId : jsonArray2[i].dept_updept,
				name : jsonArray2[i].dept_nm,
				open : true
			});
		} else {
			zNodes2.push({
				id : jsonArray2[i].dept_no,
				pId : jsonArray2[i].dept_updept,
				name : jsonArray2[i].dept_nm
			});
		}

		if (jsonArray2[i].empList == null || jsonArray2[i].empList.length == 0) {
			chkDept2.push(jsonArray2[i].dept_no);
		}
		for (var j = 0; j < jsonArray2[i].empList.length; j++) {

			zNodes2.push({
				id : jsonArray2[i].empList[j].emp_id,
				pId : jsonArray2[i].empList[j].emp_deptno,
				name : jsonArray2[i].empList[j].rank_nm + " "
						+ jsonArray2[i].empList[j].emp_nm,
				rlevel : jsonArray2[i].empList[j].rlevel,
				dept_nm : jsonArray2[i].empList[j].dept_nm
			});
		}
	}

	$(document).ready(function() {
		var t = $("#rrtree");
		$.fn.zTree.init(t, setting2, zNodes2);
		fixIcon2();
	});

	function myBeforeEditName(treeId, treeNode) {
		return !treeNode.isParent;
	}

	function beforeClick2(treeId, treeNode) {

		var zTree = $.fn.zTree.getZTreeObj("rrtree");

		if (treeNode.isParent) {
			zTree.expandNode(treeNode);
			return false;
		} else {
			return true;
		}
	}

	function loadReady() {
		var bodyH = demoIframe2.contents().find("body").get(0).scrollHeight, htmlH = demoIframe2
				.contents().find("html").get(0).scrollHeight, maxH = Math.max(
				bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = demoIframe2
				.height() >= maxH ? minH : maxH;
		if (h < 530)
			h = 530;
		demoIframe2.height(h);
	}

	function fixIcon2() {
		var treeObj = $.fn.zTree.getZTreeObj("rrtree");

		 var folderNode = treeObj.getNodesByFilter(function(node) {
			for (var i = 0; i < chkDept2.length; i++) {

				if (chkDept2[i] == node.id) {
					return node.id;
				}
			}
		});
		for (k = 0; k < folderNode.length; k++) {
			folderNode[k].isParent = true;
		}
		treeObj.refresh(); 
	}

	var checkedEmps2 = new Array();
	var allCheckNode2 = new Array()
	function onCheck2(e, treeId, treeNode) {

		var zTree = $.fn.zTree.getZTreeObj("rrtree");

		var nodes = zTree.getCheckedNodes(true);

		checkedEmps2 = new Array();
		allCheckNode2 = new Array();
		for (var i = 0; i < nodes.length; i++) {
			allCheckNode2.push(nodes[i])
			if (!nodes[i].isParent) {
				checkedEmps2.push(nodes[i]);
			}
		}
	}

	function searchAprvLn2(btn) {
		var searchText = $(btn).siblings('input[type="text"]').val()
		$
				.ajax({
					url : "searchAprvLn",
					data : {
						"text" : searchText
					},
					type : "post",
					success : function(data) {
						$("#rrsearchResult").empty();
						if (data.length > 0) {
							var code = "<table class='text-center table card-table table-vcenter text-nowrap datatable'>";
							code += "<thead><tr>"
							code += "<th style='width:10%'><input type='checkbox' id='allCheck3'>"
							code += "<th style='width:40%'>부서</th>";
							code += "<th style='width: 20%'>직급</th>";
							code += "<th style='width: 30%'>이름</th></tr></thead><tbody>";
							$
									.each(
											data,
											function(i) {
												code += "<tr><td><input type='checkbox' name='searchChecks2' value='"+data[i].emp_id+"' role='"+data[i].rank_nm+" "+data[i].emp_nm+"' data-dept_nm='"+data[i].dept_nm+"'></td>"
												code += "<td>"
														+ data[i].dept_nm
														+ "</td>";
												code += "<td>"
														+ data[i].rank_nm
														+ "</td>";
												code += "<td>" + data[i].emp_nm
														+ "</td></tr>";
											})
							code += "</tbody></table>";
						} else {
							var code = "<table class='text-center table card-table table-vcenter text-nowrap datatable'>";
							code += "<tr><th>검색 결과가 없습니다.</th></tr></table>"

						}
						$("#rrsearchResult").append(code)
					}
				})
		$(btn).siblings('input[type="text"]').val("")
	}
	$('.nav-tabs2 a').click(function() {
		var zTree = $.fn.zTree.getZTreeObj("rrtree");
		for (var i = 0; i < allCheckNode2.length; i++) {
			allCheckNode2[i].checked = false
			zTree.refresh(allCheckNode2[i])
		}
		$(this).tab('show');
		$("#tabs-search-10 span").trigger("click")
	})
	$("#receiverRefModal").on("change", "#allCheck3", function() {
		checkList = $("input[name='searchChecks2']")
		if ($("#allCheck3").prop("checked")) {
			for (i = 0; i < checkList.length; i++) {
				$(checkList[i]).prop("checked", true)
			}
		} else {
			for (i = 0; i < checkList.length; i++) {
				$(checkList[i]).prop("checked", false)
			}
		}
	})
	
	function cleanCheck() {
		var zTree = $.fn.zTree.getZTreeObj("rrtree");
		for (var i = 0; i < allCheckNode2.length; i++) {
			allCheckNode2[i].checked = false
			zTree.refresh(allCheckNode2[i])
		}
		checkList = $("input[name='searchChecks2']")
		$("#allCheck3").prop("checked", false)
		for (i = 0; i < checkList.length; i++) {
			$(checkList[i]).prop("checked", false)
		}
		checkedEmps2 = new Array();
	}
	
	$("#receiverRefModal").on("hide.bs.modal", function() {
		cleanCheck()
		$("#rrAddList").empty()
	})
	
	$("#rrAddBtn").on("click", function() {
		var allList = $("input[name='searchChecks2']")
		var checkList = new Array()
		
		$.each(allList, function(index, obj) {
			if($(obj).prop("checked")){
				checkList.push($(obj))
			}
		})
		if(checkedEmps2.length > 0){
			$.each(checkedEmps2, function(i, obj) {
				var id = obj.id
				var name = obj.name
				var dept = obj.dept_nm
				appendRRData(id, name, dept)
			})
		}else{
			$.each(checkList, function(i, obj) {
				var id = $(obj).attr("value")
				var name = $(obj).attr("role")
				var dept = $(obj).data("dept_nm")
				appendRRData(id, name, dept)
			})
		}
		
		cleanCheck()
	})
	
	function appendRRData(id, name, dept) {
		var list = $("#rrAddList").find("tr")
		var flag = true;
		if(id == '${loginUser.emp_id}'){
			alert("본인은 추가할 수 없습니다.")
			return false;
		}
		$.each(list, function(i, ob) {
			var val = $(ob).find("td.rrEmpList").attr("value")
			if(val == id){
				flag = false
			}
		})
		if(flag){
			code = "<tr><td>" + dept + "</td>";
			code += "<td value='"+id+"' class='rrEmpList' data-dept_nm='"+dept+"'>" + name + "</td>";
			code += "<td><i class='far fa-times-circle' style='color: red;' onclick='deleterr(this)'></i></td></tr>";
			$("#rrAddList").append(code)
		}
	}
	function deleterr(btn) {
		$(btn).parents("tr").remove();
	}
	

	$("#rrListAddBtn").on("click", function() {
		var addList = $("#rrAddList").find("tr");
		var code = "";
		var code2 = "";
		var inputValues = "";
		$.each(addList, function(i, ob) {
			id = $(ob).find("td.rrEmpList").attr("value")
			dept = $(ob).find("td.rrEmpList").data("dept_nm")
			name = $(ob).find("td.rrEmpList").text()
			inputValue =  id;
			inputValues += inputValue
			code += '<input type="hidden" name="peopleList" value="'+id+'">';
			code2 += name+","; 
		})
		
		$("#Registtast").val(code2);
		$(".peopleList").html(code);
		$("#Registtast").attr("role", inputValues)
		
		$('#modal-report').css("overflow","scroll")
			
			
	})
	
	function ModifyTaskimpossible(){
		alert('진행중인 업무 입니다 변경,삭제가 불가능 합니다');
	}
	
	function TaskInsert(){
		taNo = [];
		var title = $('#Registtask_title').val();
		var shape = $('input[name="chk_info"]:checked').val();
		var impt = $('input[name="chk_Importance"]').val();
		var ddlndt = $('input[type="date"]').val();
		var cont = $('#summernoteContent').val();
		var empid = $('#id').val();
		var perfid = [];
		
		tanoList = document.querySelectorAll('input[name="ta_no"]');
		for(let i=0; i<tanoList.length; i++){
			taNo.push(tanoList[i].value);
		}
		
		
		
		if(shape=="나의 할일"){
			perfid = $('input[name="loginUserId"]').val();
		}else{
			perfidList =  document.querySelectorAll("input[name='peopleList']");
			
			for(let i=0; i<perfidList.length; i++){
				perfid.push(perfidList[i].value);
			}
			
		}
		
		$.ajax({
			 url : "<%=request.getContextPath()%>/task/regist",
			 traditional : true,
			 type : "get",
			 data : {
				 		task_title : title,
				 		task_shape : shape,
				 		task_impt : impt,
				 		task_ddlndt : ddlndt,
				 		task_cont : cont,
				 		task_empid : empid,
				 		perf_empid : perfid,
				 		ta_no : taNo
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
<%@ include file="/WEB-INF/views/common/pagination2.jsp" %>

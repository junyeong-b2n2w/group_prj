<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="modal modal-blur fade" id="receiverRefModal" tabindex="-1" data-keyboard="false" data-backdrop="static"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-xl modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="receiverRefModalTitle"></h5>
				<input type="hidden" id="receiverRefModalGB">
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="height: 500px">
					<div class="card" style="height: 70%">
						<ul class="nav nav-tabs nav-tabs-alt nav-tabs2"
							data-bs-toggle="tabs">
							<li class="nav-item"><a href="#tabs-gchart-10"
								class="nav-link active" data-bs-toggle="tab">조직도</a></li>
							<li class="nav-item"><a href="#tabs-search-10"
								class="nav-link" data-bs-toggle="tab">검색</a></li>
						</ul>
						<div class="card-body">
							<div class="tab-content">
								<div class="tab-pane active" id="tabs-gchart-10">
									<ul id="rrtree" class="ztree"
										style="width: 100%; overflow-y: scroll; height: 190px"></ul>
								</div>
								<div class="tab-pane show" id="tabs-search-10">
									<div class="input-group">
										<input type="text" class="form-control"
											placeholder="사원, 부서 검색.."> <span
											class="input-group-text" onclick="searchAprvLn2(this)">
											<svg xmlns="http://www.w3.org/2000/svg" class="icon"
												width="24" height="24" viewBox="0 0 24 24" stroke-width="2"
												stroke="currentColor" fill="none" stroke-linecap="round"
												stroke-linejoin="round">
													<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
													<circle cx="10" cy="10" r="7"></circle>
													<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</span>
									</div>
									<div class="card" id="rrsearchResult"
										style="height: 150px; overflow-y: scroll;"></div>
								</div>
							</div>
						</div>
						<div class="card-footer text-right">
							<input type="button" class="btn btn-success" value="추가"
								id="rrAddBtn">
						</div>
					</div>
					<div class="card" style="overflow-y: scroll; height: 30%">
						<table
							class="text-center table table-bordered">
							<thead>
								<tr>
									<th style="width: 40%">부서</th>
									<th style="width: 50%">이름</th>
									<th style="width: 10%">삭제</th>
								</tr>
							</thead>
							<tbody id="rrAddList" style="font-size: x-small;">
							</tbody>
						</table>
					</div>
			</div>

		
		<div class="modal-footer">
			<a href="#" class="btn btn-link link-secondary" data-dismiss="modal">
				닫기 </a> <a href="#" class="btn btn-primary" data-dismiss="modal" id="rrListAddBtn">
				확인 </a>
		</div>
		</div>
		<input type="hidden" id="ednoInput">
	</div>
</div>

<script type="text/javascript">
$("#aprvListAppend").on("click","input[name='aprvReference']", function () {
	$("#ednoInput").val($(this).attr("role"))
	$("#rrsearchResult").empty()
	$("#rrAddList").empty()
	$("#receiverRefModal").modal("show")
	$("#receiverRefModalTitle").text("열람권한 설정")
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

var jsonArray2
$.ajax({
	url : "getdeptList",
	type : "post",
	async:false,
	success : function(res) {
		jsonArray2 = res;
	}
})
var zNodes2 = []

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
		code = "<tr><td class='p-1'>" + dept + "</td>";
		code += "<td value='"+id+"' class='rrEmpList p-1' data-dept_nm='"+dept+"'>" + name + "</td>";
		code += "<td class='p-1'><i class='far fa-times-circle' style='color: red;' onclick='deleterr(this)'></i></td></tr>";
		$("#rrAddList").append(code)
	}
}


})
function deleterr(btn) {
	$(btn).parents("tr").remove();
}
function searchAprvLn2(btn) {
	var searchText = $(btn).siblings('input[type="text"]').val()
	$.ajax({
				url : "<%=request.getContextPath()%>/aprv/searchAprvLn",
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
						code += "<th style='width: 30%'>이름</th></tr></thead><tbody style='fons-size:smaller'>";
						$
								.each(
										data,
										function(i) {
											code += "<tr><td class='p-1'><input type='checkbox' name='searchChecks2' value='"+data[i].emp_id+"' role='"+data[i].rank_nm+" "+data[i].emp_nm+"' data-dept_nm='"+data[i].dept_nm+"'></td>"
											code += "<td class='p-1'>"
													+ data[i].dept_nm
													+ "</td>";
											code += "<td class='p-1'>"
													+ data[i].rank_nm
													+ "</td>";
											code += "<td class='p-1'>" + data[i].emp_nm
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
$("#rrListAddBtn").on("click", function() {
	var ajaxList  = new Array();
	var addList = $("#rrAddList").find("tr");
	$.each(addList, function(i, ob) {
		id = $(ob).find("td.rrEmpList").attr("value")
		ajaxList.push(id);
	})
	$.ajax({
		url : "readingAuth",
		type : "post",
		dataType    :   "json",
        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
		data : {
			edno : $("#ednoInput").val(),
			list : ajaxList
		},
		success : function(res) {
			alert("sadas")
		}
	}) 
})
</script>

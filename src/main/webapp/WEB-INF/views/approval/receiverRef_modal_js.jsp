<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">
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
		var inputValues = "";
		$.each(addList, function(i, ob) {
			id = $(ob).find("td.rrEmpList").attr("value")
			dept = $(ob).find("td.rrEmpList").data("dept_nm")
			name = $(ob).find("td.rrEmpList").text()
			inputValue = dept +"/" + name +"/" + id;
			inputValues += inputValue + "&&"
			code += name+","
		})
		
		if($("#receiverRefModalGB").val() == "cham"){
			$("#aprvReference").val(code)
			$("#aprvReference").attr("role", inputValues)
		}else{
			$("#aprvReciveTarget").val(code)
			$("#aprvReciveTarget").attr("role", inputValues)
		}
	})

</script>

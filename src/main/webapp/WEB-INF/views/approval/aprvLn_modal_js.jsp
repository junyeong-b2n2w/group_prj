<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script type="text/javascript">
$(document).ready( function() {
	var setting = {
			primarykey : "UDAL_NO",		// DB기본키명(필수)
			searchno : "${loginUser.emp_id}",
			defaultorderby : "UDAL_REGYMD",
			orderby : "userAprvLnOrder",
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				code = "";
				if(res != null && res.length != 0){
					$.each(res, function(i, ob) {
						code += "<tr class='udalChoice'>";
						code += "<td class='udal_no' role='"+ob.udal_no+"'>"+ob.udal_no+ "</td>";
						code += "<td>"+ob.udal_aprvlnnm + "</td>";
						code += "<td>"+ob.udal_regymd + "</td>";
						code += "</tr>";
					})
				}else{
					code += "<tr><td colspan='3'>조회 결과가 없습니다.</td></tr>";
				}
				$("#udalListAppend").empty();
				$("#udalListAppend").append(code);
			},
			searchBtn : "udalSearchBtn",// 검새버튼 아이디 추가
			refreshBtn : "udalRefreshBtn", // 전체목록조회 돌아가기버튼 ID 
			likeMap : "udal_aprvlnnm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 3		// 한페이지당 보여줄 리스트 개수
	}
	var page = new Pagination(setting);	// pagination 객체생성
	page.setPagenation("udalListPaging","udalPageList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
})
	var zTree;
	var demoIframe;
	var chkDept = new Array(); //empList가 없는 deptNo를담을 array
	var setting = {
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
			beforeClick : beforeClick,
			onCheck : onCheck
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

	var zNodes = []
	var jsonArray = ${deptList}

	for (var i = 0; i < jsonArray.length; i++) {
		if(i == 0){
			zNodes.push({
				id : jsonArray[i].dept_no,
				pId : jsonArray[i].dept_updept,
				name : jsonArray[i].dept_nm,
				open : true
			});
		}else{
			zNodes.push({
				id : jsonArray[i].dept_no,
				pId : jsonArray[i].dept_updept,
				name : jsonArray[i].dept_nm
			});
		}

		if (jsonArray[i].empList == null || jsonArray[i].empList.length == 0) {
			chkDept.push(jsonArray[i].dept_no);
		}
		for (var j = 0; j < jsonArray[i].empList.length; j++) {

			zNodes.push({
				id : jsonArray[i].empList[j].emp_id,
				pId : jsonArray[i].empList[j].emp_deptno,
				name : jsonArray[i].empList[j].rank_nm + " "
						+ jsonArray[i].empList[j].emp_nm ,
				rlevel : jsonArray[i].empList[j].rlevel,
				dept_nm : jsonArray[i].empList[j].dept_nm
			});
		}
	}

	$(document).ready(function() {
		var t = $("#tree");
		$.fn.zTree.init(t, setting, zNodes);
		fixIcon();
	});

	function myBeforeEditName(treeId, treeNode) {
		return !treeNode.isParent;
	}

	function beforeClick(treeId, treeNode) {

		var zTree = $.fn.zTree.getZTreeObj("tree");

		if (treeNode.isParent) {
			zTree.expandNode(treeNode);
			return false;
		} else {
			return true;
		}
	}

	function loadReady() {
		var bodyH = demoIframe.contents().find("body").get(0).scrollHeight, htmlH = demoIframe
				.contents().find("html").get(0).scrollHeight, maxH = Math.max(
				bodyH, htmlH), minH = Math.min(bodyH, htmlH), h = demoIframe
				.height() >= maxH ? minH : maxH;
		if (h < 530)
			h = 530;
		demoIframe.height(h);
	}

	function fixIcon() {
		var treeObj = $.fn.zTree.getZTreeObj("tree");

		var folderNode = treeObj.getNodesByFilter(function(node) {
			for (var i = 0; i < chkDept.length; i++) {

				if (chkDept[i] == node.id) {
					return node.id;
				}
			}
		});
		for (k = 0; k < folderNode.length; k++) {
			folderNode[k].isParent = true;
		}
		treeObj.refresh();
	}

	var checkedEmps = new Array();
	var allCheckNode = new Array()
	function onCheck(e, treeId, treeNode) {

		var zTree = $.fn.zTree.getZTreeObj("tree");

		var nodes = zTree.getCheckedNodes(true);

		checkedEmps = new Array();
		allCheckNode = new Array();
		for (var i = 0; i < nodes.length; i++) {
			allCheckNode.push(nodes[i])
			if (!nodes[i].isParent) {
				checkedEmps.push(nodes[i]);
			}
		}
	}
	function putAprvLnEmp(){
		if($("#tabs-home-10").hasClass("active")){
			putAprvLn(checkedEmps)
		}else{
			var searchArr = new Array();
			searchChk = $("input[name='searchChecks']")
			$.each(searchChk, function(i) {
				if($(searchChk[i]).prop("checked")){
					var sea = new Object();
					sea.id = $(searchChk[i]).val()
					sea.name = $(searchChk[i]).attr("role")
					sea.dept_nm = $(searchChk[i]).data("dept_nm")
					searchArr.push(sea)
				}
			})
			putAprvLn(searchArr)
		}
	}
	function outAprvLnEmp(){
		checkList = $("input[name='empChecks']")
		for(i = 0; i<checkList.length; i++){
			if($(checkList[i]).prop("checked")){
				$(checkList[i]).parents("tr").remove()
			}	
		}
		$("#allCheck").prop("checked", false)
		$("#allCheck").trigger("change")
		refreshIcon()
	}
	
	$("#allCheck").on("change", function() {
		checkList = $("input[name='empChecks']")
		if($("#allCheck").prop("checked")){
			for(i = 0; i<checkList.length; i++){
				$(checkList[i]).prop("checked", true)	
			}
		}else{
			for(i = 0; i<checkList.length; i++){
				$(checkList[i]).prop("checked", false)	
			}
		}
	})
	$('.nav-tabs a').click(function(){
	  $(this).tab('show');
	  $("#tabs-profile-10 span").trigger("click")
	})
	
	function searchAprvLn(btn) {
		var searchText = $(btn).siblings('input[type="text"]').val()
		$.ajax({
			url : "searchAprvLn",
			data : {"text" : searchText},
			type : "post",
			success : function(data) {
				$("#searchResult").empty();
				if(data.length > 0){
					var code = "<table class='text-center table card-table table-vcenter text-nowrap datatable'>";
					code +="<thead><tr>"
					code +="<th style='width:10%'><input type='checkbox' id='allCheck2'>"
					code +="<th style='width:40%'>부서</th>";
					code +="<th style='width: 20%'>직급</th>";
					code +="<th style='width: 30%'>이름</th></tr></thead><tbody>";
					$.each(data, function(i) {
						code +=	"<tr><td><input type='checkbox' name='searchChecks' value='"+data[i].emp_id+"' role='"+data[i].rank_nm+" "+data[i].emp_nm+"' data-dept_nm='"+data[i].dept_nm+"'></td>"
						code += "<td>" +data[i].dept_nm + "</td>";
						code += "<td>" +data[i].rank_nm + "</td>";
						code += "<td>" +data[i].emp_nm + "</td></tr>";
					})						
					code += "</tbody></table>";
				}else{
					var code = "<table class='text-center table card-table table-vcenter text-nowrap datatable'>";
					code += "<tr><th>검색 결과가 없습니다.</th></tr></table>"
					
				}
				$("#searchResult").append(code)
			}
		})
		$(btn).siblings('input[type="text"]').val("")
	}
	$("#approvalRegistModal").on("change", "#allCheck2", function() {
		checkList = $("input[name='searchChecks']")
		if($("#allCheck2").prop("checked")){
			for(i = 0; i<checkList.length; i++){
				$(checkList[i]).prop("checked", true)	
			}
		}else{
			for(i = 0; i<checkList.length; i++){
				$(checkList[i]).prop("checked", false)	
			}
		}
	})
	
	function putAprvLn(checkedEmps) {
		if(checkedEmps.length < 1){
			alert("직원을 선택해주세요")
			return false
		}
		for(i=0; i<checkedEmps.length; i++){
			var flag = true
			code = "<tr>"
			code +="<td><input type='checkbox' name='empChecks'></td>"
			code +="<td>"
			code +="<select class='form-select m-0 p-0' name='aprvSelect'>"
			code +="<option value='aprvOp'>결재</option>"
			code +="<option value='consOp'>합의</option>"
			code +="<option value='aprvPreOp'>전결</option>"
			code +="</select></td>"
			code +="<td name='emps' value='"+checkedEmps[i].id+"' data-name = '"+checkedEmps[i].dept_nm+"/"+checkedEmps[i].name.split(" ")[0]+"/"+checkedEmps[i].name.split(" ")[1]+"'>"+checkedEmps[i].name+"("+checkedEmps[i].dept_nm+")</td>"
			if(i == checkedEmps.length-1){
				code +="<td name='icons'>최종</td>"
			}else{
				code +="<td name='icons'><svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><line x1='4' y1='12' x2='20' y2='12' /><polyline points='8 8 12 4 16 8' /><polyline points='16 16 12 20 8 16' /></svg></td>"
			}
			code +="</tr>"
			empList = $("td[name='emps']")
			$.each(empList, function(j) {
				if($(empList[j]).attr("value") == checkedEmps[i].id){
					flag = false;
				}	
			})
			if(flag){
				$("#aprvLn").append(code)
			}else{
				if(checkedEmps.length == 1) alert("이미 추가된 항목입니다.")
				
			}
		}
		$("#allCheck2").prop("checked", false)
		$("#allCheck2").trigger("change")
		var zTree = $.fn.zTree.getZTreeObj("tree");
		for(var i=0; i<allCheckNode.length; i++){
			allCheckNode[i].checked = false
			zTree.refresh(allCheckNode[i])
		}
		refreshIcon()
	}
	function refreshIcon(){
		refreshList = $("td[name='icons']")
		for(i = 0; i<refreshList.length; i++){
			if(i == refreshList.length-1){
				$(refreshList[i]).html("최종")
				$(refreshList[i]).siblings("td").find("select").prop("disabled", true)
			}else{
				$(refreshList[i]).html("<svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><line x1='4' y1='12' x2='20' y2='12' /><polyline points='8 8 12 4 16 8' /><polyline points='16 16 12 20 8 16' /></svg>")
				$(refreshList[i]).siblings("td").find("select").prop("disabled", false)
			}
		}
	}
	
	$("#addAprvLnBtn").on("click", function() {
		userAprvLnName = $("input[name='userAprvLnName']") 
		if(userAprvLnName.val() == ""){
			alert("결재선명을 입력해주세요")
			userAprvLnName.focus();
			return false;
		}
		emps = $("td[name=emps]") 
		if(emps.length < 2){
			alert("결재자를 추가해주세요.")
			return false;
		}
		
		
		var dataUdal = {
				udal_crt : "${loginUser.emp_id}",
				udal_aprvlnnm : userAprvLnName.val()
				}
		ualgList = []
		for(i=1; i<emps.length; i++){
			var ualg = new Object()
			ualg.ualg_empid = $(emps[i]).attr("value") 
			ualg.ualg_ord = i
			ualg.ualg_aprvtype = $(emps[i]).siblings("td").find("select[name='aprvSelect']").val()
			ualgList.push(ualg)
		}
		dataUdal.ualgList = ualgList
		$.ajax({
			url : "registAprvLn",
			type : "post",
			data : JSON.stringify(dataUdal),
			dataType: "json",         
            contentType: "application/json",
			success: function(res) {
				alert("등록 되었습니다.");
				userAprvLnName.val("");
				$("#udalRefreshBtn").trigger("click");
			}
		})
		
	})
	function getAprvLn(udal_no) {
		$.ajax({
			url : "selectAprvLn",
			type : "post",
			data : {udal_no : udal_no},
			success : function(res) {
				$("#aprvLn").empty()
				code = "";
				$.each(res, function(i) {
					code += "<tr>";
					code +="<td><input type='checkbox' name='empChecks'></td>";
					code +="<td>";
					if(i == res.length-1){
						code +="<select class='form-select m-0 p-0' name='aprvSelect' disabled>";
					}else{
						code +="<select class='form-select m-0 p-0' name='aprvSelect'>";
					}
					if(res[i].ualg_aprvtype == "aprvOp"){
						code +="<option value='aprvOp' selected>결재</option>";
						code +="<option value='consOp'>합의</option>";
						code +="<option value='aprvPreOp'>전결</option>"
					}else if(res[i].ualg_aprvtype == "consOp"){
						code +="<option value='aprvOp'>결재</option>";
						code +="<option value='consOp' selected>합의</option>";
						code +="<option value='aprvPreOp'>전결</option>"
					}else{
						code +="<option value='aprvOp'>결재</option>";
						code +="<option value='consOp'>합의</option>";
						code +="<option value='aprvPreOp' selected>전결</option>"
					}
					code +="</select></td>";
					code +="<td name='emps' value='"+res[i].ualg_empid+"' data-name='"+res[i].dept_nm+"/"+res[i].rank_nm+"/"+res[i].emp_nm+"'>"+res[i].rank_nm +" "+res[i].emp_nm+"("+res[i].dept_nm+")</td>";
					if(i == res.length-1){
						code +="<td name='icons'>최종</td>";
					}else{
						code +="<td name='icons'><svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><line x1='4' y1='12' x2='20' y2='12' /><polyline points='8 8 12 4 16 8' /><polyline points='16 16 12 20 8 16' /></svg></td>";
					}
					code +="</tr>";
				})
				$("#aprvLn").append(code);
			}
		})
	}
	
	$("#deleteAprvLnBtn").on("click", function() {
		if(!$("#selectedUdalNo").val()){
			return false;
		}
		var flag = confirm("정말 삭제하시겠습니까?")
		if(flag){
			$.ajax({
			url : "removeAprvLn",
			type : "post",
			data : {udal_no : $("#selectedUdalNo").val()},
			success : function(res) {
				$("#selectedUalg").empty();
				$("#selectedUdalNo").val("");
				$("#udalRefreshBtn").trigger("click")
			}
			})
		}
	})
	
	$("#approvalRegistModal").on("change","select[name='aprvSelect']", function() {
		var sel = $("select[name='aprvSelect']")
		if($(this).val() == 'aprvPreOp'){
			var cnt = 0
			var preSel = []
			$.each(sel, function (i) {
				if($(sel[i]).val()=='aprvPreOp'){
					cnt += 1
					preSel.push($(sel[i]))
				}
				if(cnt > 1){
					alert("전결자는 한명만 선택가능합니다.")
					$(preSel[0]).val("aprvOp").prop("selected", true)
					return false;
				}
			})
		}
		
	})
	
	// 결재선등록 버튼
	$("#aprvLnAddBtn").on("click", function() {
		$("#consLnTable").addClass("d-none");
		$("#aprvLnTrRank").find("th").not(".noneRemove").remove();
		$("#aprvLnTrName").find("td").not(".noneRemove").remove();
		$("#consLnTrRank").find("th").not(".noneRemove").remove();
		$("#consLnTrName").find("td").remove();
		
		
		// 결재선 선택된 직원목록
		var empList = $("td[name='emps']")
		
		
		if(empList.length < 1){	// 기본 로그인유저 1명
			alert("결재선을 1명이상 등록해주세요")
			return false
		}
		
		
		var agreeGB = $("input[name=agreeGB]")	// 합의구분(순차, 병렬)
		$.each(agreeGB, function(i) {	// 선택된 구분 찾아서 값넣어주기
			if(agreeGB[i].checked){
				$("#agreeGB").val(agreeGB[i].value)		
			}
		})
		
		var seq = 1
		$.each(empList, function(i) {
			var aprvOp = $(empList[i]).siblings("td").find("select").val()	// 결재옵션(결재, 합의, 전결)
			var empId = $(empList[i]).attr("value")	// 직원ID
			var fullName = $(empList[i]).data("name")	// 부서이름/직급이름/직원이름
			var dept_nm = fullName.split("/")[0]	// 부서이름 
			var rank_nm = fullName.split("/")[1]	// 직급이름 
			var emp_nm = fullName.split("/")[2]	// 직원이름 
			
			var rankCode = ""
			var nameCode = ""
			
			rankCode += "<th>"+rank_nm+"</th>";
			
			nameCode += "<td height='60' name='aprvLnEmps'"
			nameCode += " data-seq='"+seq+"'"
			nameCode += " data-id='"+empId+"'"
			nameCode += " data-gb='"+aprvOp+"'"
			if(aprvOp == "aprvPreOp"){
				nameCode += ">"+emp_nm+"<br>(전결)</td>"
			}else{
				if(empList.length-1 == i){
					nameCode += ">"+emp_nm+"<br>(최종)</td>"
				}else{
					nameCode += ">"+emp_nm+"</td>"
				}
			}
			nameCode += "</td>"
			if(aprvOp == "aprvOp"){		//결재
				$("#aprvLnTrRank").append(rankCode);
				$("#aprvLnTrName").append(nameCode);
				seq += 1;
			}else if(aprvOp == "consOp"){	// 합의
				$("#consLnTable").removeClass("d-none");	// 합의선 테이블 디스플레이쇼
				$("#consLnTrRank").append(rankCode);
				$("#consLnTrName").append(nameCode);
				seq += 1
			}else{	// 전결
				$("#aprvLnTrRank").append(rankCode);
				$("#aprvLnTrName").append(nameCode);
				seq += 1
			}
		})
	})
	
	$('#udalListAppend').on('mouseenter', '.udalChoice', function( event ) {
	    $(this).css("background","lightblue");
	}).on('mouseleave', '.udalChoice', function( event ) {
		$(this).css("background","white");
	})
	
	$('#udalListAppend').on('click', '.udalChoice', function() {
		var udal_no = $(this).find(".udal_no").attr("role");
		$.ajax({
			url : "selectAprvLn",
			type : "post",
			data : {udal_no : udal_no},
			success : function(res) {
				$("#selectedUalg").empty();
				code = "";
				$.each(res, function(i,ob){
					code += "<tr>";
					code += "<td>" + ob.ualg_ord + "</td>";
					if(ob.ualg_aprvtype == "aprvOp"){
						code += "<td>결재</td>";
					}else if(ob.ualg_aprvtype == "consOp"){
						code += "<td>합의</td>";
					}else{
						code += "<td>전결</td>";
					}
					code += "<td>" + ob.dept_nm + "</td>";
					code += "<td>" + ob.rank_nm+" "+ob.emp_nm + "</td>";
				})
				$("#selectedUdalNo").val(udal_no);
				$("#selectedUalg").append(code);
			}
		})
	})
	$("#inAprvLnUdalBtn").on("click", function() {
		if(!$("#selectedUdalNo").val()){
			alert("사용자 결재선을 선택해주세요.")
			return false;
		}else{
			getAprvLn($("#selectedUdalNo").val())
		}
	})
</script>
<%@ include file="../common/pagination2.jsp" %>

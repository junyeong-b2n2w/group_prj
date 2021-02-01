<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true" %>
<style type="text/css">
div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
div#rMenu ul li{
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
}
ol, ul {
    /* margin: 0 0 1rem 0; */
    /* -webkit-margin-start: 1rem; */
    /* margin-inline-start: 1rem; */
    padding: 0;
    /* -webkit-padding-start: 1rem; */
    /* padding-inline-start: 1rem; */    
     -webkit-margin-start: 0rem;
}
	</style>
<div id="rMenu">
	<ul>
		<li id="m_add" onclick="addTreeNode();">폴더 등록</li>
		<li id="m_del" onclick="removeTreeNode();">폴더 삭제</li>
		<li id="m_check" onclick="modifyFolder();">폴더 수정</li>
<!-- 		<li id="m_unCheck" onclick="checkTreeNode(false);">Uncheck Node</li> -->
<!-- 		<li id="m_reset" onclick="resetTree();">새로고침</li> -->
	</ul>
</div>

<script>

let trid;
let trpId;

function setTrid(id,pid){
	trid = id;
	trpId = pid;
}

function removeTreeNode(){
	hideRMenu();
	const flag = confirm("삭제?");
	if(flag){
		$.ajax({
			url:"<%=request.getContextPath()%>/bdoc/remove.do",
			type:"post",
			data : { "bd_no" : trid, "removeType" : pType},
			success: function(res){
				if(res == '성공'){
					getFolerList();
					goFolder(pType,$('.uploadedList').attr('data-num'));
				}
			}	
		});
	}
}

function modifyFolder(treeNode){
	hideRMenu();
	$('input[name="bd_no"]').val(trid);
	$('#modal-report').modal('show');
}

//zTree
var zTree, rMenu;
var setting = {
view: {
	dblClickExpand: false,
// 	addHoverDom: addHoverDom,
	showLine: true,
	selectedMulti: false,
	showIcon: true,
	dblClickExpand: false
},
data: {
	simpleData: {
		enable:true
	}
},
callback: {
    beforeEditName: beforeEditName,  // 수정 버튼을 클릭했을 때 콜백 함수를 지정한다.(확인창)
    beforeRemove: beforeRemove,      // 삭제 버틀을 클릭했을 때 콜백 함수를 지정한다.(확인창)
    beforeRename: beforeRename,      // 수정 후의 콜백 함수를 지정한다.(수정한이름이 빈값일때)
    beforeClick: beforeClick,
    onRightClick: OnRightClick

},
edit: {
    enable: true,
    editNameSelectAll: true,        //노드 이름을 편집 할 때 입력 텍스트를 전체 선택한다.
    showRemoveBtn: true,            //제거 버튼을 보이거나 숨기도록 설정한다.
    showRenameBtn: true,        //이름 바꾸기 버튼을 보이거나 숨기도록 설정한다.
    removeTitle : "삭제",
    renameTitle : "수정"
}
};



function makeTree(jsonArray){

var zNodes =[{id:0, name:'최상위', open:true}]
for(var i =0; i<jsonArray.length;i++){
	zNodes.push({id:jsonArray[i].bd_no, pId:jsonArray[i].bd_upfd, name:jsonArray[i].bd_nm, open: true});
}	

var t = $('#tree');
$.fn.zTree.init(t, setting, zNodes);
zTree = $.fn.zTree.getZTreeObj("tree");
rMenu = $("#rMenu");
}
		
let jsonArray;
function moveJson(res){
	jsonArray = res;
	makeTree(jsonArray);
}

function getFolerList(){
	$.ajax({
		url:"<%=request.getContextPath()%>/bdoc/folderList.do",
		type:"get",
		data : {"shareType" : pType},
		success: function(res){
			moveJson(res)
		},
		dataType: "json"
	});
}
function beforeClick(treeId, treeNodes){
	goFolder(pType,treeNodes.id,treeNodes.pId);
}


function beforeEditName(treeId, treeNode) { // 이름 바꾸는 폼 들어가기 
    zTree.selectNode(treeNode);
    $('input[name="bd_no"]').val(treeNode.id);
    $('#modal-report').modal('show');
    return false;
}

function beforeRemove(treeId, treeNode) { // 삭제
    zTree.selectNode(treeNode);
    const flag = confirm("삭제?");
    if(flag){
	    $.ajax({
			url:"<%=request.getContextPath()%>/bdoc/remove.do",
			type:"post",
			data : { "bd_no" : treeNode.id, "removeType" : pType},
			success: function(res){
				if(res == '성공'){
					getFolerList();
					goFolder(pType,$('.uploadedList').attr('data-num') );
				}
			}	
		});
    }
    return false;
}

function beforeRename(treeId, treeNode, newName, isCancel) { // 이름 바꾸는 폼에서 변경하기  ajax 가기 
    if (newName.length == 0) {
        setTimeout(function() {
            var zTree = $.fn.zTree.getZTreeObj("tree");
            zTree.cancelEditName();
            alert("이름을 입력해주세요.");
        }, 0);
        return false;
    }
    
    return true;
}


function OnRightClick(event, treeId, treeNode) {
	if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) {
		zTree.cancelSelectedNode();
		showRMenu("root", event.clientX, event.clientY);
	} else if (treeNode && !treeNode.noR) {
		zTree.selectNode(treeNode);
		showRMenu("node", event.clientX, event.clientY);
	}
	setTrid(treeNode.id,treeNode.pId);
}

function showRMenu(type, x, y) {
	$("#rMenu ul").show();
	if (type=="root") {
		$("#m_del").hide();
		$("#m_check").hide();
		$("#m_unCheck").hide();
	} else {
		$("#m_del").show();
		$("#m_check").show();
		$("#m_unCheck").show();
	}

    y += document.body.scrollTop;
    x += document.body.scrollLeft;
    rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

	$("body").bind("mousedown", onBodyMouseDown);
}
function hideRMenu() {
	if (rMenu) rMenu.css({"visibility": "hidden"});
	$("body").unbind("mousedown", onBodyMouseDown);
}
function onBodyMouseDown(event){
	if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
		rMenu.css({"visibility" : "hidden"});
	}
}
function addTreeNode() {
	hideRMenu();
	$('#modal-report2').modal('show');
}
</script>
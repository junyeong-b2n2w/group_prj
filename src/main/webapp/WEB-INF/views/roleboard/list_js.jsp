<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    


<script>
function modifyNboardBtn(name,pboard,boardno){
	$('#BoardInsert').css("display","none");
	$('#BoardModiFys').css("display","none");
	$('#NBoardModiFy').css("display","block");
	$('input[name="modfiyboard_nm2"]').val(name);
	$('input[name="modfiyboard_pboardno2"]').val(pboard);
	$('input[name="modfiyBoard_NO2"]').val(boardno);
	$('.Nboard').prop('selected',true);
}

function modifyNboard(){
	var boardNO = $('input[name="modfiyBoard_NO2"]').val();
	var boardname = $('input[name="modfiyboard_nm2"]').val();
	var boardpboardno = $('select[name="modfiyboard_pboardno2"]').val();
	var boardactvyn = $('input[name="modfiyboard_actvyn2"]:checked').val();
	
	$.ajax({
		url : "<%=request.getContextPath()%>/role/board/modify.do",
		type : "post",
		data : {
			board_no: boardNO,
			board_pboardno: boardpboardno,
			board_nm: boardname,
			board_actvyn: boardactvyn
		},
		success : function(req){
			if(req){
				alert(req);
			parent.location.reload();
			location.reload();
			
			}
		}
		
	})
	
}

var folderArray =[]; 
    
function boardListShows(){
  var code = "";
	 $.ajax({
	    	url: "<%=request.getContextPath()%>/role/board/lists.do",
	    	type:"get",
	    	dataType:"json",
	    	success:function(boardLists){
	    		code+= "<option class='optionselect' value='0'>선택X</option>";
	    		for(let i=0; i<boardLists.length; i++){
	    		code += "<option value='"+ boardLists[i].board_no +"'>"+boardLists[i].board_nm +"</option>";
	    		}
	    		 document.querySelector('#selects').innerHTML=code;
	    		 document.querySelector('#selectss').innerHTML=code;
	    	}
	    })
}
boardListShows();


	function ChangeBoardType(){
		$('#BoardInsert').css("display","block");
		$('#BoardModiFys').css("display","none");
		$('#NBoardModiFy').css("display","none");
	}

    function createBoard() {
    	var form = $('form[role="form"]');
    	form.submit();
    	alert('등록 완료!!');
    }

     //테스트용 데이터 (나중에는 json활용)
    
    
    const setting = {
    		view: {
                addHoverDom: addHoverDom,       // 마우스를 노드 위로 움직였을 때 액션을 지정할수 있다.
                removeHoverDom: removeHoverDom  // 마우스를 노드 밖으로 이동할 때 액션을 지정할수 있다. 
            },
            edit: {
                enable: true,
                showRemoveBtn: true,            //제거 버튼을 보이거나 숨기도록 설정한다.
                showRenameBtn: true             //이름 바꾸기 버튼을 보이거나 숨기도록 설정한다.
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeDrag: beforeDrag,          // 드래그 기능 활성화 또는 비활성화
                beforeEditName: beforeEditName,  // 수정 버튼을 클릭했을 때 콜백 함수를 지정한다.(확인창)
                beforeRemove: beforeRemove,      // 삭제 버틀을 클릭했을 때 콜백 함수를 지정한다.(확인창)
                beforeRename: beforeRename,      // 수정 후의 콜백 함수를 지정한다.(수정한이름이 빈값일때)
                beforeClick: beforeClick
                // 기본값은 null 
                // null이라고 적용이 안되는건 아님 
                // null이 아니고 함수를 적어줄경우 함수를 거치고 해당 명령 수행
                // null일경우 명령 바로 수행
            },
            check: { //체크박스 버튼 만들기
        		enable: true,
        		chkStyle: "checkbox"
        	}
    }

    function beforeClick(treeId, treeNodes){
    	 
    	 
    	var zTree = $.fn.zTree.getZTreeObj("treeDemo"); // 전체 트리 가져오기
    	if (treeNodes.isParent) { // treeNodes : 현재노드 
    		zTree.expandNode(treeNodes); //노드 펼치기 (전체노드.expandNode(펼칠노드) )
    		return false;
    	} else {
// 			goPage("/post/list.do?post_brdno="+treeNodes.id,"M040000");
			
    	}
    }

    function beforeDrag(treeId, treeNodes) {
        return false;
    }

    function beforeEditName(treeId, treeNode) { // 이름 바꾸는 폼 들어가기 
    	$('#BoardInsert').css("display","none");
		$('#BoardModiFys').css("display","block");
		$('#NBoardModiFy').css("display","none");
    	$('input[name="modfiyBoard_NO"]').val(treeNode.id)
    	$('input[name="modfiyboard_nm"]').val(treeNode.name) 	   	
    	
    	if(treeNode.pId == null){
    		
    	var a =$('.optionselect').val();
    	
    	$('select[name="modfiyboard_pboardno"]').val(a)
    	
    	}else{
    		
    	$('select[name="modfiyboard_pboardno"]').val(treeNode.pId)
    		
    	}
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode); 
        setTimeout(function() {
            if (true) {
                setTimeout(function() {
                }, 0);
            }
        }, 0);
        return false;
    }

    function beforeRemove(treeId, treeNode) { // 삭제
    	 var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    	    zTree.selectNode(treeNode);
    	var boardNo = treeNode.id;
    	
    	     confirm("정말  '" + treeNode.name + "' 를 삭제 하시겠습니까?");
    if(confirm){
    	$.ajax({
    		url : "<%=request.getContextPath()%>/role/board/remove.do",
    		type:"get",
    		data : {
    					board_no : boardNo
    				},
    		success:function(req){
    			if(req){
    			}
    		}
    	})
    	     }else{
    	    	 return;
    	     }
    }


 	
    function beforeRename(treeId, treeNode) { // 이름 바꾸는 폼에서 변경하기 
        var boardNO = $('input[name="modfiyBoard_NO"]').val();
    	var boardname = $('input[name="modfiyboard_nm"]').val();
    	var boardpboardno = $('select[name="modfiyboard_pboardno"]').val();
    	var boardactvyn = $('input[name="modfiyboard_actvyn"]:checked').val();
    	            $.ajax({
    	        		url : "<%=request.getContextPath()%>/role/board/modify.do",
    	        		type:"get",
    	        		data : {
    	        				    board_no: boardNO,
    	        					board_pboardno: boardpboardno,
    	        					board_nm: boardname,
    	        					board_actvyn: boardactvyn
    	        				},
    	        		success:function(req){
    	        			if(req){
    	        				alert(req);
    	        			location.reload();
    	        			}
    	        		}
    	        	})
    	     
    }

    var newCount = 1;

    function addHoverDom(treeId, treeNode) {// 노드 등록하기
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function(){
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"new node" + (newCount++)});
            return false;
        });
    };

    function removeHoverDom(treeId, treeNode) { // 삭제하기
    	  $("#addBtn_"+treeNode.tId).unbind().remove();
    };

    var t = $("#treeDemo");
    
    
    function showboardList(){
        $.ajax({
        	url: "<%=request.getContextPath()%>/role/board/list.do",
        	type:"get",
        	success:function(jsonArray){
        		if(jsonArray){
        		    for(let i = 0 ; i< jsonArray.length ; i++){
        		    	 folderArray.push({ id : jsonArray[i].board_no, pId :jsonArray[i].board_pboardno ,name:jsonArray[i].board_nm });
        		    }
        		     $('.navbar-menu').prepend($.fn.zTree.init(t, setting, folderArray));  
        		}
        	}
        })
    }  
    showboardList();
    
</script>
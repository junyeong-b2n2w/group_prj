<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page trimDirectiveWhitespaces="true"%>    


<%@ include file="../common/scrollpagination.jsp" %>

</body>
<!-- 	<script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/css/zTreeStyle/zTreeStyle.min.css"/>
   <script>

   function goAlramPageNation(){
	   $("#alramList").empty();
	   var setPage = {
				table : "notification",			// DB테이블명(필수)
				primarykey : "noti_no",		// DB기본키명(필수)
				defaultorderby : "noti_no",		// DB정렬기준 컬럼(필수)
				onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
					var changRes = "";
					if(res != null){
						
						code = "";
						if(res.length == 0){
							code += '<div>';
							  code += '<div class="row">';
							  code += '  <div class="col">';
							  code += '    <div class="text-center">';
							  code += '<strong>조회되는 알림이 없습니다</strong>';
							  code += '</div></div></div></div>';
						}else{
							$.each(res, function(i) {
							
							  code += '<div id="'+res[i].noti_no+'">';
							  code += '<div class="row">';
							  code += '  <div class="col">';
							  code += '    <div class="text-truncate">';
							  code += '     <strong>'+res[i].noti_type+'</strong>'+res[i].noti_cont+'<strong>"</strong>';
							  code += '   </div>';
							  code += '  <div class="text-muted">'+res[i].noti_regdt+'</div>';
							  code += '</div>';
							  code += ' <div class="col-auto align-self-center">';
							  code += '   <a href="javascript:void(0);" class="text-muted" onclick="changeReadY(\''+res[i].noti_no+'\');">';
							  code += '  <i class="far fa-window-close" style="color: #1a569d;font-size: 25px;"></i>';
							  code += '</a>';
							  code += '</div>';
							  code += ' </div>';
							  code += '</div>';
		                    
						})
							
						}
					}else{
						code = '<div>';
						  code += '<div class="row">';
						  code += '  <div class="col">';
						  code += '    <div class="text-center">';
						  code += '<strong>조회되는 알림이 없습니다</strong>';
						  code += '</div></div></div></div>';
					}
					$("#alramList").append(code);
					$(".lastdiv").scrollTop($(".lastdiv")[0].scrollHeight);
				},
				searchBtn : "searchBtn",// 검새버튼 아이디 추가
				refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
// 				likeMap : "noti_no",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
				displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
				perPageNum : 5		// 한페이지당 보여줄 리스트 개수
			}
			var test = new Pagination(setPage);	// pagination 객체생성
			test.setPagenation("alrampaginationDiv","alramList", 1)  // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
   }
  
$(document).ready(function(){
	
	
	$('.dropdown-menu-card').on('click',function(){
		return false;
	})
})
function changeReadY(notino){
	
	$.ajax({
		url : "<%=request.getContextPath()%>/attend/test/changeRead",
		data :{"noti_no":notino},
		type : "POST",
		success : function(res){
			console.log(res);
			if(res == "성공"){
				$('#'+notino).remove();
				goAlramPageNation();
			}
		},
		error :function(req){
			
			alert("서버오류입니다. 관리자에게 문의하세요")
		}
	})
}
function getShortCut(){
	$.ajax({
		url:'<%=request.getContextPath()%>/mypage/getShortCut',
		success : function(result){
			JSON_ShortCut = JSON.stringify(result);
			localStorage.setItem("${loginUser.emp_id}",JSON_ShortCut )
		}
	
	})
}
getShortCut();
</script>
   
    <script>
    
    
    
var folderArray =[]; 
    
// function boardListShows(){
//   var code = "";
// 	 $.ajax({
<%-- 	    	url: "<%=request.getContextPath()%>/role/board/lists.do", --%>
// 	    	type:"get",
// 	    	dataType:"json",
// 	    	success:function(boardLists){
// 	    		code+= "<option class='optionselect' value='0'>선택X</option>";
// 	    		for(let i=0; i<boardLists.length; i++){
// 	    		code += "<option value='"+ boardLists[i].board_no +"'>"+boardLists[i].board_nm +"</option>";
// 	    		}
// 	    		 document.querySelector('#selects').innerHTML=code;
// 	    		 document.querySelector('#selectss').innerHTML=code;
// 	    	}
// 	    })
// }
// boardListShows();




    function createBoard() {
    	var form = $('form[role="form"]');
    	form.submit();
    }

     //테스트용 데이터 (나중에는 json활용)
    
    
    const setting = {
    		view: {
                addHoverDom: addHoverDom,       // 마우스를 노드 위로 움직였을 때 액션을 지정할수 있다.
                removeHoverDom: removeHoverDom  // 마우스를 노드 밖으로 이동할 때 액션을 지정할수 있다. 
            },
            edit: {
                enable: true,
                showRemoveBtn: false,            //제거 버튼을 보이거나 숨기도록 설정한다.
                showRenameBtn: false             //이름 바꾸기 버튼을 보이거나 숨기도록 설정한다.
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
    	} 
    	else {
			goPage("/post/list.do?post_brdno="+treeNodes.id+"&NowPage=1","M040000");
			
    	}
    }

    function beforeDrag(treeId, treeNodes) {
        return false;
    }

    function beforeEditName(treeId, treeNode) { // 이름 바꾸는 폼 들어가기 
    	
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
                	$('.modifyTree').css('display','block')
                	$('#modal-reportss').modal({backdrop:'static',keyboard:false},'show') 
                }, 0);
            }
        }, 0);
        return false;
    }

    function beforeRemove(treeId, treeNode) { // 삭제
    	 var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    	    zTree.selectNode(treeNode);
    	var boardNo = treeNode.id;
    	
    	     confirm("Confirm delete node '" + treeNode.name + "' it?");
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
        		    	 folderArray.push({ id : jsonArray[i].board_no, pId :jsonArray[i].board_pboardno , name:jsonArray[i].board_nm});
        		    }
        		     $('.navbar-menu').prepend($.fn.zTree.init(t, setting, folderArray));  
        		}
        	}
        })
    }  
    showboardList();
    
  

	 function back(){
		 $('#trash').removeClass('d-none');
		 $('.ss').removeClass('d-none');
	 }
 
	 function hiddenbar(){
	 }
	 
	 
	 
 
$( function() {
	    var $gallery = $( "#gallery" ),
	      $trash = $( "#trash" );
         
	    $( "li", $gallery ).draggable({
	      connectToSortable: '#gallery',
	      cancel: "a.ui-icon", 
	      revert: "invalid", 
	      containment: "document",
	      cursor: "move"
	    });
	 
	    $trash.droppable({
	      accept: "#gallery > li",
	      classes: {
	    	  "ui-droppable-active": "ui-state-highlight"
	      },
	      drop: function( event, ui ) {
	          deleteImage( ui.draggable );
	        }
	    });
	 
	    $gallery.droppable({
	      accept: "#trash li",
	      classes: {
	        "ui-droppable-active": "custom-state-active"
	      },
	      drop: function( event, ui ) {
	        recycleImage( ui.draggable );
	      }
	      
	    });
	 
	    
	   
	    var recycle_icon = "<a href='link/to/recycle/script/when/we/have/js/off' title='Recycle this image' class='ui-icon ui-icon-refresh' style='display:none'>Recycle image</a>";
	    function deleteImage( $item ) {
	      $item.fadeOut(function() {
	        var $list = $( "ul", $trash ).length ?
	          $( "ul", $trash ) :
	          $( "<ul class='gallery ui-helper-reset'/>" ).appendTo( $trash );
	 
	        $item.find( "a.ui-icon-trash" ).remove();
	        $item.append( recycle_icon ).appendTo( $list ).fadeIn(function() {
	          $item
	            .animate({ width: "90px" })
	            .css("position","static")
	            .find( "img" )
	              .animate({ height: "36px" });
	        });
	      });
	    }
	 
	    var trash_icon = "<a href='link/to/trash/script/when/we/have/js/off' title='Delete this image' class='ui-icon ui-icon-trash'>Delete image</a>";
	    function recycleImage( $item ) {
	      $item.fadeOut(function() {
	        $item
	         .find( "a.ui-icon-refresh" )
             .css("display","none")
	          .css( "width", "90px")
	          .find( "img" )
	            .css( "height", "50px" )
	            .css( "width", "50px" )
	          .end()
	          .appendTo( $gallery )
	          .fadeIn();
	      });
	    }
	 
	    function viewLargerImage( $link ) {
	      var src = $link.attr( "href" ),
	        title = $link.siblings( "img" ).attr( "alt" ),
	        $modal = $( "img[src$='" + src + "']" );
	 
	      if ( $modal.length ) {
	        $modal.dialog( "open" );
	      } else {
	        var img = $( "<img alt='" + title + "' width='384' height='288' style='display: none; padding: 8px;' />" )
	          .attr( "src", src ).appendTo( "body" );
	        setTimeout(function() {
	          img.dialog({
	            title: title,
	            width: 400,
	            modal: true
	          });
	        }, 1 );
	      }
	    }
	 
	    $( "ul.gallery > li" ).on( "click", function( event ) {
	      var $item = $( this ),
	        $target = $( event.target );
	 
	      if ( $target.is( "a.ui-icon-trash" ) ) {
	        deleteImage( $item );
	      } else if ( $target.is( "a.ui-icon-zoomin" ) ) {
	        viewLargerImage( $target );
	      } else if ( $target.is( "a.ui-icon-refresh" ) ) {
	        recycleImage( $item );
	      }
	 
	      return false;
	    });
	  } );
  
  $( function() {
    $( "#gallery" ).sortable();
    $( "#sortable" ).sortable();
    $( "#sortable" ).disableSelection();
  });
	
	   var menuBtn = document.querySelector('.menu-btn');
	   var nav = document.querySelector('nav');
	   var lineOne = document.querySelector(' .menu-btn .line--1');
	   var lineTwo = document.querySelector(' .menu-btn .line--2');
	   var lineThree = document.querySelector(' .menu-btn .line--3');
	   var link = document.querySelector(' .nav-links');
	   var navside = document.querySelector('.navside');
	   $(menuBtn).on('click', function(){
	       nav.classList.toggle('nav-open');
	       lineOne.classList.toggle('line-cross');
	       lineTwo.classList.toggle('line-fade-out');
	       lineThree.classList.toggle('line-cross');
	       link.classList.toggle('fade-in');
	       navside.classList.toggle('d-none');
	       
	   });
	 
  </script>
  <%@ include file="footer_js.jsp" %>
</html>

































<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
 
   <script src="https://cdnjs.cloudflare.com/ajax/libs/zTree.v3/3.5.42/js/jquery.ztree.all.min.js"></script>
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/metroStyle/metroStyle.css"/>
    	
    	
    	<div class="my-3 my-md-5">
				<div class="container">
			<ul id="tree" class="ztree" style="width:100%;overflow:auto;"></ul>
				</div>
			</div>
	
	<script type="text/javascript">
			var zTree;
			var demoIframe;
			var chkDept = new Array(); //empList가 없는 deptNo를담을 array
			var setting = {
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false
				},
				data: {
					simpleData: {
						enable:true
					}
				},
				callback: {
					beforeClick: beforeClick,
					onCheck: onCheck
				},
			  check: { //체크박스 버튼 만들기
		    		enable: true,
		    		chkStyle: "checkbox",
		    		chkboxType: { "Y": "s", "N": "" } 
		    	}
			};
			
			
			var zNodes =[]
			var jsonArray = ${deptList}
		
			for(var i =0; i<jsonArray.length;i++){
				
					zNodes.push({id:jsonArray[i].dept_no, pId:jsonArray[i].dept_updept, name:jsonArray[i].dept_nm + " " + jsonArray[i].dept_no});
				
					if(jsonArray[i].empList == null || jsonArray[i].empList.length == 0){
						chkDept.push(jsonArray[i].dept_no);
					}
						for(var j = 0; j<jsonArray[i].empList.length;j++){
				
							zNodes.push({id:jsonArray[i].empList[j].emp_id, pId:jsonArray[i].empList[j].emp_deptno, name:jsonArray[i].empList[j].rank_nm + " " +jsonArray[i].empList[j].emp_nm + " " +jsonArray[i].empList[j].emp_id});
						}
			}			
			
			$(document).ready(function(){
				var t = $("#tree");
				$.fn.zTree.init(t, setting, zNodes);
				fixIcon();
			});
				
			function myBeforeEditName(treeId, treeNode) {
				return !treeNode.isParent;
			}
															
			function beforeClick(treeId, treeNode){
				
					var zTree = $.fn.zTree.getZTreeObj("tree");
					
					if (treeNode.isParent) {
						zTree.expandNode(treeNode);
						return false;
					}else {
						return true;
					}
			}
			
			function loadReady() {
				var bodyH = demoIframe.contents().find("body").get(0).scrollHeight,
				htmlH = demoIframe.contents().find("html").get(0).scrollHeight,
				maxH = Math.max(bodyH, htmlH), minH = Math.min(bodyH, htmlH),
				h = demoIframe.height() >= maxH ? minH:maxH ;
				if (h < 530) h = 530;
				demoIframe.height(h);
			}
			
			function fixIcon(){
			    var treeObj = $.fn.zTree.getZTreeObj("tree");
			
			    var folderNode = treeObj.getNodesByFilter(
			    		function (node) {
			    			for(var i =0; i<chkDept.length;i++){
			    				
			    				if(chkDept[i] == node.id){
						    			return node.id;
			    				}
			    			}
			    		}
			    );
			    for(k=0 ; k<folderNode.length; k++){
			        folderNode[k].isParent = true;
			    }
			    treeObj.refresh();
			}
			
			function onCheck(e, treeId, treeNode) {
			
                var zTree = $.fn.zTree.getZTreeObj("tree");
                
                  var  nodes = zTree.getCheckedNodes(true);
                  
                var  v = new Array();
                
                for (var i = 0; i <nodes.length; i++) {
                	  
              	  if (!nodes[i].isParent) {
                   		v.push( nodes[i].id);
			        }
                }
            }
</script>
			
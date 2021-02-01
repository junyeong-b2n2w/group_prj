<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
			var zTree;
			var demoIframe;
			var chkDept = new Array();
			var setting = {
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false,
					 showIcon:false
				},
				data: {
					simpleData: {
						enable:true
					}
				},
				callback: {
					beforeClick: beforeClick,
					 onClick : zTreeOnClick,

				}
			};
			
			
			var zNodes =[];
			var jsonArray = ${deptList}
		
			for(var i =0; i<jsonArray.length;i++){
				
						zNodes.push({id:jsonArray[i].dept_no, pId:jsonArray[i].dept_updept, name:jsonArray[i].dept_nm});
				
					if(jsonArray[i].empList == null || jsonArray[i].empList.length == 0){
						chkDept.push(jsonArray[i].dept_no);
					}
			}			
			
			$(document).ready(function(){
				var t = $("#tree");
				$.fn.zTree.init(t, setting, zNodes);
				
			});
				
			function myBeforeEditName(treeId, treeNode) {
				return !treeNode.isParent;
			}
															
			function beforeClick(treeId, treeNode){
				
					var zTree = $.fn.zTree.getZTreeObj("tree");
					
					if (treeNode.isParent) {
						zTree.expandNode(treeNode);
						return false;
					}
					else {
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
			
			
			function zTreeOnClick(event, treeId, treeNode) {
		        if (treeNode.isParent) {
		            return;
		        }
		        var dept_no =treeNode.id;
		        console.log(typeof dept_no);
		        
		        $.ajax({
        			url:"<%=request.getContextPath()%>/gchart/empList",
        			type:"POST",
        			data:{"dept_no" : dept_no},
        			dataType:"json",
        			success:function(data){
        				var htm = "";
        				
						if(data.length == "" || data.length == 0) {
							alert("해당 부서에 존재하는 직원이 없습니다");
						}
						
        				var code = ""; 
        				
        				$.each(data,function (index) {
        					code += "<tr>";
        					code += "<td><span class='text-muted'>"+(index+1)+"</span></td>";
        					code += "<td><span class='text-muted'>"+data[index].emp_nm+"</span></td>";
        					code += "<td><span class='text-muted'>"+data[index].emp_id+"</span></td>";
        					code += "<td><span class='text-muted'>"+data[index].rank_nm+"</span></td>";
        					code += "<td><span class='text-muted'>"+data[index].dept_nm+"</span></td>";
        					code += "<td class='text-center'>";
        					code += "<span class='text-muted'>";
        					code += "<a href='javascript:mandate(\""+data[index].emp_id + "\",\"" +data[index].emp_nm + "\",\"" +data[index].dept_nm + "\");'";
        					
        					code +=" class='btn btn-primary w-20'>위임하기</a>"
        					code +="</span></td></tr>";
                        });
        				
        				code += "<div class='card-footer'>";
        				code += "<div class='row' >";
        				code += "<div class='col-12' style='display: flex; justify-content: center;'>";
        				code += "</div>";
        				code += "</div>";
        				code += "</div>";

       	                $("#empTable").html(code);  
//        	                $("ul.pagination").hide();
        			},
        			error:function(error){
        				alert('등록을 실패했습니다.');	
        			}
		        	
		        });
		        
		    }
			
			function onCheck(e, treeId, treeNode) {
			
	            var zTree = $.fn.zTree.getZTreeObj("tree");
	            var  nodes = zTree.getCheckedNodes(true);
	              
	            zTree.checkNode(nodes[3].children[3], true, true);
	            var  v = new Array();
	            
	            for (var i = 0; i <nodes.length; i++) {
		            if (!nodes[i].isParent) {
		            	v.push( nodes[i].id);
					}
	            }
            }
			
// 			function goBack(){
<%-- 		   		location.href = "<%=request.getContextPath()%>/gchart/list"; --%>
// 		    }
		
		function mandate(emp_id, emp_nm, dept_nm) {
			$('#modal-large').modal('hide');
			
			$('input[name="mdt_empnm"]').val(emp_nm);
			$('input[name="mdt_mdtr"]').val(emp_id);
			$('input[name="mdt_deptnm"]').val(dept_nm);
		}

</script>
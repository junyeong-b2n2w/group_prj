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
// 				     showLine:false 
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
			
			
			var zNodes =[]
			var jsonArray = ${deptList}
		
			for(var i =0; i<jsonArray.length;i++){
				
						zNodes.push({id:jsonArray[i].dept_no, pId:jsonArray[i].dept_updept, name:jsonArray[i].dept_nm,open:true});
				
					if(jsonArray[i].empList == null || jsonArray[i].empList.length == 0){
						chkDept.push(jsonArray[i].dept_no);
					}
			}			
			
			//ztree 초기 부르는 곳
			$(document).ready(function(){
				var t = $("#tree");
				$.fn.zTree.init(t, setting, zNodes);
				
			});
				
															
			function beforeClick(treeId, treeNode){
					var zTree = $.fn.zTree.getZTreeObj("tree");
					if (treeNode.isParent) {
						
						for ( var i = 0; i <nodes.length; i ++) {

	 			        	  zTree.expandNode (nodes [i], true , true , true ); // 기본적으로 첫 번째 수준 노드 확장

	 			          }
// 						zTree.expandNode(treeNode);
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
			
			//부서노드 클릭시
			function zTreeOnClick(event, treeId, treeNode) {
				
				$("div.searchbox input[name='keyword']").val("");
		        if (treeNode.isParent) {
		            return;
		        }
		    	
		        var dept_no =treeNode.id;
// 		        $('input[name="emp_deptno"]').val(dept_no);
		      
		        //부서클릭 시 해당 부서의 직원 목록 가져오기
		        	var setting2 = {
								table : "employee",			// DB테이블명(필수)
								primarykey : "emp_id",		// DB기본키명(필수)S
								orderby : "emp_regdt",		// DB정렬기준 컬럼(필수)
								onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
									if(res != null){
										code = "";
										$.each(res, function(i, obj) {
											code += "<tr>";
					 	  					code += "<td><span class='text-muted'>"+(i+1)+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].emp_nm+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].emp_id+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].rank_nm+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].dept_nm+"</span></td>";
					 	  					code += "<td class='text-center'><span class='text-muted'><a href='javascript:detailEmpInfo(\""+res[i].emp_id+"\");' class='btn btn-primary w-20'>상세보기</a></span></td></tr>";
											
										})
									}
									if(res.length == 0){
											code = "<tr>";
											code += "<td colspan='6' rowspan='2'class='text-center'><span class='text-secondary'>조회되는 사원이 없습니다</span></td>";
											code += "</tr>";
									}
									$("#empTable").empty();
									$("#empTable").append(code)
								},
								searchBtn : "searchBtn",// 검새버튼 아이디 추가
								refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
								searchno : dept_no,// =조건 검색추가시 추가 컬럼명(TAGNAME)
								likeMap : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
								displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
								perPageNum : 10		// 한페이지당 보여줄 리스트 개수
							}
							var test2 = new Pagination(setting2);	// pagination 객체생성
							test2.setPagenation("paginationDiv","empList", 1) ;// (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
		        
		        
		    }
			
			 function goBack(){
			    	location.href = "<%=request.getContextPath()%>/gchart/list";
			    }
			 
			 
			 /* 페이징 처리부분 시작   */
			 
			 window.addEventListener('load',function(){

					var setting = {
								table : "employee",			// DB테이블명(필수)
								primarykey : "emp_id",		// DB기본키명(필수)S
								orderby : "emp_regdt",		// DB정렬기준 컬럼(필수)
								onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
									if(res != null){
										code = "";
										$.each(res, function(i, obj) {
											code += "<tr>";
					 	  					code += "<td><span class='text-muted'>"+(i+1)+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].emp_nm+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].emp_id+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].rank_nm+"</span></td>";
					 	  					code += "<td><span class='text-muted'>"+res[i].dept_nm+"</span></td>";
					 	  					code += "<td class='text-center'><span class='text-muted'><a href='javascript:detailEmpInfo(\""+res[i].emp_id+"\");' class='btn btn-primary w-20'>상세보기</a></span></td></tr>";
											
										})
									}else{
										code = "<tr>";
										code += "<td colspan='6' rowspan='2'>조회되는 사원이 없습니다</td>";
										code += "</tr>";
									}
									$("#empTable").empty();"src/main/webapp/WEB-INF/views/notice/modify_js.jsp"
									$("#empTable").append(code)
								},
								searchBtn : "searchBtn",// 검새버튼 아이디 추가
								refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
// 								equalMap : "ntc_writerid",// =조건 검색추가시 추가 컬럼명(TAGNAME)
								likeMap : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
// 								dateGtMap : {col : "ntc_regdt", name : "regdtGt"},	// 날짜검색 (>=조건)  (col:컬럼명, name:인풋태그네임)
// 								dateLtMap : {col : "ntc_regdt", name : "regdtLt"}, // 날짜검색 (<=조건)  (col:컬럼명, name:인풋태그네임)
// 								checkbox : {col : "ntc_writerid", name : "inmap"}, // 체크박스 (col:컬럼명, name:인풋태그네임)
// 								radio : {col : "ntc_writerid", name : "inmap"}, // 라디오 (col:컬럼명, name:인풋태그네임)
								displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
								perPageNum : 10		// 한페이지당 보여줄 리스트 개수
							}
							var test = new Pagination(setting);	// pagination 객체생성
							test.setPagenation("paginationDiv","empList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
				})
				
			 //상세보기 클릭 시 사원의 정보 보이기
			 function detailEmpInfo(emp_id){
					
					$.ajax({
						url : "<%=request.getContextPath()%>/gchart/detailEmp",
						type :"POST",
						data :{"emp_id":emp_id},
						dataType : "json",
						success:function(data){
							console.log(data);
							
								$('div.modal').modal();
								$('#emp_nm').val(data.emp_nm);
								$('#emp_email').val(data.emp_inemail);
								$('#emp_email2').val(data.emp_outemail);
								$('#emp_tel').val(data.emp_ph);							
								 $('#emp_pic').css('background-image', 'url(\"'+'<%=request.getContextPath()%>'+'/img/getImg?fileName='+data.emp_pic+'\")');
								 'url("img/jsp")'

						},
						error : function(error){
							alert("서버오류입니다. 관리자에게 문의하세요");
						}
					})
				}
			 
</script>

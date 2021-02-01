<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!---------------검색, 수정, 비활성  from ---------------->
	
	<form id="searchForm" action="<%=request.getContextPath()%>/role/dept/list" method="post">
		<input type="hidden" id="cri_keyword" name="keyword" />
		<input type="hidden" id="cri_searchType" name="searchType"  value="dName" />
	</form>

	
	<form id="modifyForm" action="<%=request.getContextPath()%>/role/dept/modifyDept" method="post">
		<input type="hidden" id="dept_no" name="dept_no" />
		<input type="hidden" id="dept_nm" name="dept_nm" />
		<input type="hidden" id="dept_loc" name="dept_loc" />
		<input type="hidden" id="dept_updept" name="dept_updept"/>
		<input type="hidden" id="dept_ph" name="dept_ph" />
		<input type="hidden" id="dept_actvyn" name="dept_actvyn" />
		<input type="hidden" id="depthd_empid" name="depthd_empid" />
	</form>
	

 	<form id="modifyActvYnForm" action="<%=request.getContextPath() %>/role/dept/modifyActvYn" method="GET">
		<input type="hidden"  id="checkActvYn" name="dept_no" >
	</form>
    
    
    
    <script>
    
    
    $(document).ready(function() {
    	
    	<c:if test="${msg != null}">
		alert("${msg}");
		</c:if> 
		
		
		/* 상세보기  */
		$(".detailView").on("click", function(){
			
			var chkEmpId = $("input[name=emp_headid]");
			for(var i =0; i<chkEmpId.length;i++){
				if(chkEmpId[i].checked){
					chkEmpId[i].checked = false;
				}
			}
			 
			 
			var comp_no = $(this).data().companycode;
			var dept_no = $(this).data().deptcode;
			var upname = $(this).data().updeptname;
			var updeptno =$(this).data().updeptno;
			var actyn = $(this).data().dept_actvyn;
			
			$("#companycode").val($(this).data().companycode);
			$("#deptcode").val($(this).data().deptcode);
			$("#deptname").val($(this).data().deptname);
			
			$("#updeptname").append("<option selected='' value='"+updeptno+"'>"+upname+"</option>");
			
			$("#deptloc").val($(this).data().deptloc);
			$("#deptph").val($(this).data().deptph);

			if($(this).data().dept_actvyn =='Y'){
					$("#deptactvyn").append("<option value='"+actyn+"' selected=''>활성</option>");
					$("#deptactvyn").append("<option value='N' >비활성</option>");
				}
				else if($(this).data().dept_actvyn=='N'){
					$("#deptactvyn").append("<option value='"+actyn+"' selected=''>비활성</option>");
					$("#deptactvyn").append("<option value='Y' >활성</option>");
				}
			
				$.ajax({
				
					url:"<%=request.getContextPath()%>/role/dept/minusMyDeptList",
					type:"POST",
					data:{
						"dept_compno" :comp_no,
						"dept_no":dept_no
						},
					
					dataType:"json",
					success:function(data){
						console.log(data.deptList)
						$.each(data.deptList,function(index){
							$("#updeptname").append("<option value='"+data.deptList[index].dept_no+"'>"+data.deptList[index].dept_nm+"</option>");	
								
							if(data.dhead){
								
							if(data.dhead.depthd_deptno  == dept_no){
								
								$('#depthead').val(data.dhead.depthd_empnm);
								$('#deptheadid').val(data.dhead.depthd_empid );
									
								}else{
									
									$('#depthead').val("");
									$('#deptheadid').val("");
								}
								
							}else{
								$('#depthead').val("");
								$('#deptheadid').val("");
							}
							
						})
						
					},
					error:function(error){
						alert("서버오류입니다 관리자에게 문의바랍니다");
					},
					beforeSend:function(){

					 }
			});//ajax
		});//click
		
		
		var setting = {
				table : "employee",			// DB테이블명(필수)
				primarykey : "emp_id",		// DB기본키명(필수)
				defaultorderby : "emp_nm",		// DB정렬기준 컬럼(필수)
				onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
					
					var changRes = "";
					if(res != null){
						code = "";
						$.each(res, function(i, obj) {
							code += "<tr>";
							code += "<td class='w-1'><input class='form-check-input m-0 align-middle' type='checkbox' aria-label='Select invoice' name='emp_headid' value='"+res[i].emp_id+"' onclick='doOpenCheck(this)'></td>"
							code += " <td>"+res[i].emp_id+"</td>";
					      	code += " <td class='text-muted'>"+res[i].emp_ranknm+"</td>";
					        code += " <td class='text-muted'>"+res[i].emp_nm+"</td>";
							code += "</tr>";
						})
					}else{
						code = "<tr>";
						code += " <td colspan='3'>직원 목록이 존재하지 않습니다</td>";
						code += "</tr>";
					}
					$("#empList").empty();
					$("#empList").append(code)
				},
				searchBtn : "searchBtn",// 검새버튼 아이디 추가
				refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
				likeMap : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
				displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
				perPageNum : 5		// 한페이지당 보여줄 리스트 개수
			}
			var test = new Pagination(setting);	// pagination 객체생성
			test.setPagenation("paginationDiv","empList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
		
		
		var setting = {
				table : "employee",			// DB테이블명(필수)
				primarykey : "emp_id",		// DB기본키명(필수)
				defaultorderby : "emp_nm",		// DB정렬기준 컬럼(필수)
				onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
					
					var changRes = "";
					if(res != null){
						code = "";
						$.each(res, function(i, obj) {
							code += "<tr>";
							code += "<td class='w-1'><input class='form-check-input m-0 align-middle' type='checkbox' aria-label='Select invoice' name='emp_headid' value='"+res[i].emp_id+"' onclick='doOpenCheck(this)'></td>"
							code += " <td class='td_empid'>"+res[i].emp_id+"</td>";
					      	code += " <td class='text-muted'>"+res[i].emp_ranknm+"</td>";
					        code += " <td class='text-muted td_empnm'>"+res[i].emp_nm+"</td>";
							code += "</tr>";
						})
					}else{
						code = "<tr>";
						code += " <td colspan='3'>직원 목록이 존재하지 않습니다</td>";
						code += "</tr>";
					}
					$("#empList2").empty();
					$("#empList2").append(code)
				},
				searchBtn : "searchBtn2",// 검새버튼 아이디 추가
				refreshBtn : "refreshBtn2", // 전체목록조회 돌아가기버튼 ID 
				likeMap2 : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
				displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
				perPageNum : 5		// 한페이지당 보여줄 리스트 개수
			}
			var test2 = new Pagination(setting);	// pagination 객체생성
			test2.setPagenation("paginationDiv2","empList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
		
		
		
		
		
		
		
		//번호 입력시 -자동생성
		$('input[name="dept_ph"]').keyup(function (event) {
			  event = event || window.event;
			  var _val = this.value.trim();
			  this.value = autoHypenTel(_val);
		});
		
	});
	
	
    function goBack(){
    	
    	location.href = "<%=request.getContextPath()%>/role/dept/list";
    }
	function modifyDeptBtn(){
		
		var form = $("#modifyForm");
		
			$("#dept_no").val($("#deptcode").val());
			$("#dept_nm").val($("#deptname").val());
			$("#dept_loc").val($("#deptloc").val());
			$("#dept_updept").val($("#updeptname").val());
			$("#dept_ph").val($("#deptph").val());
			 $("#dept_actvyn").val($("#deptactvyn").val());
			 
			$('#depthd_empid').val($('#deptheadid').val());
		if($("#dept_nm").val().trim()==""){
				alert("부서명을 입력하세요");
				$("#deptname").focus();
				return false;
			}
		if($("#dept_loc").val().trim()==""){
				alert("부서 위치를 입력하세요");
				$("#deptloc").focus();
				return false;
			}
		if($("#dept_updept").val().trim()==""){
				alert("상위 부서를 선택해주세요");
				$("#updeptname").focus();
				return false;
			}
		if($("#dept_ph").val().trim()==""){
				alert("부서 전화번호를 입력하세요");
				$("#deptph").focus();
				return false;
			}
		
 		$("#modifyForm").submit();
  
	}
	
	function registDeptBtn(){
		
		var form = $('#registForm');
		
		if($('#regDeptNm').val().trim() == ""){
			alert("부서명을 입력하세요.");
			$('#regDeptNm').focus();
			return false;
		}
		if($('#regDeptLoc').val().trim() == ""){
			alert("부서 위치를 입력하세요.");
			$('#regDeptLoc').focus();
			return false;
		}
		if($('#regDeptPh').val().trim() == ""){
			alert("전화번호를 입력하세요.");
			$('#regDeptPh').focus();
			return false;
		}
		
		$('#registForm').submit();	
	}
	


	function checkDept(){
		var checkRow = "";
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val()+",";
		});
			checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  
	
			$("#checkActvYn").val(checkRow);
			
		if(checkRow === ""){		
			alert("삭제할 대상을 선택하세요");
			return false;
		}
	 
		$("#modifyActvYnForm").submit();
	}
	
	function doOpenCheck(chk){
		
	    var obj = $("input[name=emp_headid]");
	    for(var i=0; i<obj.length; i++){
	        if(obj[i] != chk){
	            obj[i].checked = false;
	        }else{
	        	$('#depthead').val( $(chk).parent().siblings('.td_empnm').text());
				$('#deptheadid').val( $(chk).parent().siblings('.td_empid').text());
	        	
	        }
	    }
	}

// 	.siblings('.td_empnm').text()
	/* 전체선택 */
	function allCheck() {
		if ($("input[name='allCheck']").is(':checked')) {
		
				$("input[name=checkRow]").prop("checked", true);
			} else {
				$("input[name=checkRow]").prop("checked", false);
			}
		}	


	function autoHypenTel(str) {
		  str = str.replace(/[^0-9]/g, '');
		  var tmp = '';
	
		  if (str.substring(0, 2) == 02) {
		    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
		    if (str.length < 3) {
		      return str;
		    } else if (str.length < 6) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2);
		      return tmp;
		    } else if (str.length < 10) {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 3);
		      tmp += '-';
		      tmp += str.substr(5);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 2);
		      tmp += '-';
		      tmp += str.substr(2, 4);
		      tmp += '-';
		      tmp += str.substr(6, 4);
		      return tmp;
		    }
		  } else {
		    // 핸드폰 및 다른 지역 전화번호 일 경우
		    if (str.length < 4) {
		      return str;
		    } else if (str.length < 7) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3);
		      return tmp;
		    } else if (str.length < 11) {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 3);
		      tmp += '-';
		      tmp += str.substr(6);
		      return tmp;
		    } else {
		      tmp += str.substr(0, 3);
		      tmp += '-';
		      tmp += str.substr(3, 4);
		      tmp += '-';
		      tmp += str.substr(7);
		      return tmp;
		    }
		  }
	
		  return str;
		}
		
	</script>
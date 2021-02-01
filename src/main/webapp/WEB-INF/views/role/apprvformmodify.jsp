<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript"
	src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

		$(function() {
			$("#approvalBox").sortable({
				forceHelperSize : true,
				receive: function(e, ui) { sortableIn = 1; },
				over: function(e, ui) { sortableIn = 1; },
				out: function(e, ui) { sortableIn = 0; },
				beforeStop: function(e, ui) {
				   if (sortableIn == 0) { 
				      ui.item.remove(); 
				   } 
				}

			});
			$(".dragComponent").draggable({
				connectToSortable : "#approvalBox",
				helper:'clone',
				opacity : 0.7,
				start:function(){
					//console.log($('#approvalBox').find("input").attr("id"))
					
					arr = $('#approvalBox').find("input");
					//console.log(arr);
					
					idArr=[];
					for ( var i =0; i < arr.length; i++){
						idArr.push(arr[i].getAttribute("id"));
					}
					//console.log(idArr);
					
					//console.log($(this).find("input").attr("id"))
					
					var id = $(this).find("input").attr("id");
					
					if(idArr.indexOf(id) > -1){
						alert("이미 등록된 요소입니다.")
						return false;	
					} 
				}
				

			});
			$("#sortable").disableSelection();
		});
		
		
		
		
</script>
</head>
<body>


	<div class="content ">
		<div class="container mx-auto row row-eq-height">
	<div class="page-header d-print-none">
          <div class="row align-items-center">
            <div class="col">
              <h3 class="page-title">
                결재양식 수정하기
              </h3>
            </div>
          </div>
        </div>
			<div class="col-8">
			<div class="card  p-3 h-100">
				<div class="card-header"><h3>결재양식</h3></div>
				<div class="card-body d-flex justify-content-center">
					<div class="p-3 " style="width: 660px; border: 1px solid lightblue;">
						<div class="mt-3 ">
							<input type="text" placeholder="양식 제목을 입력해 주세요" name="af_nm"
								class="form-control form-control-lg">
						</div>
						<div class="mt-3  d-flex justify-content-end">
							<div
								style="width: 50px; height: 50px; border: 1px solid black; font-size: 0.85rem;">
								결재서명</div>
						</div>
						<div id="approvalBox" class="mt-3 row m-0 d-flex justify-content"
							style="border: 1px dashed lightgray; min-height: 20px;"></div>
						<div class="mt-3">
							<textarea id="summernoteContent"></textarea>
						</div>
					</div>
				</div>
				<div class="card-footer d-flex justify-content-end">
					<a href="#" id="formModifyBtn" class="btn btn-warning mr-1">수정</a>
					<a href="list" class="btn btn-danger">취소</a>
				</div>
			</div>
			</div>

			<div class=" col-4">
				<div class="card p-3 h-100">
					<div class="card-header"><h3>결재 양식 제작용 컴포넌트</h3></div>
					<div class="card-body">
						<div class="card p-3 row ">

							<c:forEach items="${componentList }" var="component">
								<c:set var="contArr" value="${fn:split(component.cp_cont,',')}" />
								
									<div class="dragComponent row p-0 m-0 mb-1"
										style="width: ${contArr[0]}px; border:1px solid lightgray" data-cpno="${component.cp_no }">
										<div class="text-center" style="width: ${contArr[1]}px; font-size: 0.7rem">
										<span class="align-middle">${component.cp_nm }</span>
										</div>
										<div style="width: ${contArr[2]}px;">
											<input class="form-control form-control-sm p-0" style="border: 0px solid;" id="${component.cp_tag }" name="${component.cp_tag }" ${contArr[3]} />
										</div>
							
									</div>
							
							</c:forEach>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
	<script>
// 		 $('#approvalBox').on("mouseover", '.dragComponent',
// 		        function() {
// 		            $(this).append('<div class="rmbox position-absolute" style="left:80%;z-index:3">x</div>')
// 		            })
		            
		        


	
	
		$('#formModifyBtn').on('click',function(){
			elementBox = document.querySelectorAll('#approvalBox .dragComponent');
			apprOrd =[];
			for(var i =0; i<elementBox.length; i++){
				//console.log(elementBox[i].getAttribute('data-cpno'));
				apprOrd.push(elementBox[i].getAttribute('data-cpno'));
			}
			
			console.log(apprOrd);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/role/aprvformmodify",
				type: "post",
				data : {
						af_no : parseInt(getParameter("af_no")),
						af_compno : ${loginUser.emp_compno},
						af_nm:$('input[name="af_nm"]').val().trim(),
						af_cont:$('#summernotecontent').val(),
						componentArr : JSON.stringify(apprOrd)
				}, 
				success:function(req){
					alert("수정 성공하였습니다.");
					location.href="<%=request.getContextPath()%>/role/aprvform/list";
				}
			})
		})
		
		
		function miribogi(af_no){
				$.ajax({
					url : "<%=request.getContextPath()%>/role/aprvform/detail",
					type: "post",
					data : {
							af_no : af_no
					},
					success:function(approvalFormVO){
						if(approvalFormVO){
							$('#approvalBox').empty();
							$('input[name="af_nm"]').val("");
							$('#summernotecontent').html("");
							
							
							//console.log(approvalFormVO);
							$('input[name="af_nm"]').val(approvalFormVO.af_nm);
							$('#summernotecontent').html(approvalFormVO.af_cont);
							
							console.log(approvalFormVO.formComponentList)
							
							if(approvalFormVO.formComponentList){
								
								
								
								for (var i = 0; i < approvalFormVO.formComponentList.length; i++){
									getComponent(approvalFormVO.formComponentList[i].fc_no);
								}
							}
							
							
							
							
						}
					}
				})
				
				function getComponent(cp_no){
					$.ajax({
						url : "<%=request.getContextPath()%>/role/aprvform/componentdetail",
						type: "get",
						async:false,
						data : {
								cp_no : cp_no
						},
						success:function(componentVO){
							
								console.log(componentVO);
								
								var contArr =  componentVO.cp_cont.split(",");
								console.log(contArr);

								data = "";
								data +=	"<div class='dragComponent row p-0 m-0 mb-1'";
								data +=	" style='width: "+ contArr[0] + "px; border:1px solid lightgray' data-cpno='" + componentVO.cp_no +"'>";
								data +=	"<div class='text-center' style='width:" + contArr[1] + "px; font-size: 0.7rem>";
								data +=	"<span class='align-middle'>" + componentVO.cp_nm + "</span>";
								data +=	"</div>";
								data +=	"<div style='width: "+ contArr[2] +"px;'>";
								data +=	"<input class='form-control form-control-sm p-0' style='border: 0px solid;' id='" + componentVO.cp_tag + "' name='" + componentVO.cp_tag + "' " +  contArr[3]  +" />";
								data +=	"</div>"
								data +=	"</div>"
							
								$('#approvalBox').append(data);
								
							
						}
					})
				}
				
				
			}
		
		function getParameter(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    console.log(results)
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}
		
		miribogi(getParameter("af_no"));
	</script>
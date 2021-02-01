<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function miribogi(af_no){
		$(".summernoteArea").empty()
		$.ajax({
			url : "<%=request.getContextPath()%>/role/aprvform/detail",
			type: "post",
			data : {
					af_no : af_no
			},
			success:function(approvalFormVO){
				if(approvalFormVO){
					$('#approvalBox').empty();
					$('input[name="af_nm"]').val(approvalFormVO.af_nm);
					$('.summernoteArea').html(approvalFormVO.af_cont);
					if(approvalFormVO.formComponentList){
						for (var i = 0; i < approvalFormVO.formComponentList.length; i++){
							getComponent(approvalFormVO.formComponentList[i].fc_no, af_no);
						}
					}
				}
			}
		})
		
		function getComponent(cp_no, af_no){
			$.ajax({
				url : "<%=request.getContextPath()%>/role/aprvform/componentdetail",
				type: "post",
				data : {
						cp_no : cp_no
				},
				success:function(componentVO){
					
						var contArr =  componentVO.cp_cont.split(",");
						data = "<span id='inputChk' style='display:none' value='"+af_no+"'></span>";
						data +=	"<div class='dragComponent row p-0 m-0 mb-1'";
						data +=	" style='width: "+ contArr[0] + "px; border:1px solid lightgray' data-cpno='" + componentVO.cp_no +"'>";
						data +=	"<div class='text-center' style='width:" + contArr[1] + "px; font-size: 0.7rem>'";
						data +=	"<span class='align-middle'>" + componentVO.cp_nm + "</span>";
						data +=	"</div>";
						data +=	"<div style='width: "+ contArr[2] +"px;'>";
						data +=	"<input class='form-control form-control-sm p-0' style='border: 0px solid;'"; 
						data += "id='" + componentVO.cp_tag + "' name='" + componentVO.cp_tag + "' " +  contArr[3]  +" />";
						data +=	"</div>";
						data +=	"</div>";
					
						$('#approvalBox').append(data);
				}
			})
		}
	}
	
	$("input[name='favoriteSel']").on("change", function() {
		icon = $(this).siblings("label").find("i")
		if(icon.hasClass("far")){
			icon.removeClass("far")
			icon.addClass("fas")
			$.ajax({
				url : "addFormFavorite",
				data : {
						ff_empid : "${loginUser.emp_id}",
						ff_no : $(this).attr("role")
					},
				success : function() {
					alert("즐겨찾기 추가되었습니다")
				}
			})
		}else{
			icon.addClass("far")
			icon.removeClass("fas")
			$.ajax({
				url : "removeFormFavorite",
				data : {ff_no : $(this).attr("role")},
				success : function() {
					alert("즐겨찾기 삭제되었습니다")
				}
			})
		}
	})
	
	$("#moveAprvPageBtn").on("click", function() {
		if($("#inputChk").length == 0){
			alert("양식을 선택해주세요")
			$("input[name='af_nm']").focus()
			return false
		}
		var form = $("form[role='moveAprvPageForm']")
		$("#aprvFormNo").val($("#inputChk").attr("value"))
		form.submit()		
	})
</script>
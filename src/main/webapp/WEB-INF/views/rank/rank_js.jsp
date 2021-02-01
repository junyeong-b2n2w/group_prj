<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form id="registRankForm"
	action="<%=request.getContextPath()%>/rank/regist" method="post">
	<input type="hidden" name="rank_nm" id="regRankName2"> <input
		type="hidden" name="rank_uprank" id="uprank2">
</form>
<form id="delForm" action="<%=request.getContextPath()%>/rank/remove"
	method="GET">
	<input type="hidden" name="rank_no" id="delRankNo">
</form>

<script>

$(document).ready(function() {
	
	$("input[name=checkRow]").on('click',function(){
		if ($("input[name='checkRow']").is(':checked')) {
			$('#delRankBtn').focus();
		}
	})
	

});


function registBtn(){
	
	$('#regRankName2').val($('#regRankName').val());
	$('#uprank2').val($('#uprank').val());
	var aa =$('#regRankName2').val();
	var zz =$('#uprank2').val();
	console.log(aa +""+zz);
	
	if($('#regRankName2').val().trim() == ""){
		alert("부서명 입력은 필수입니다");
		$('#regRankName').focus();
		return false;
	}
	$('#registRankForm').submit();
	
}

function modifyRankForm(rank_no){
	$.ajax({

		url :"<%=request.getContextPath()%>/rank/modifyForm",
			data : {
				"rank_no" : rank_no
			},
			dataType : "json",
			method : "POST",
			success : function(data) {
				$('#modRankNO').val(data.rank_no);
				$('#modRankNm').val(data.rank_nm);
				$('#modUprank').val(data.rank_uprank);

			}
		})

	}

	function modBtn() {
		var form = $('#modForm');

		if ($('#modUprank').val() == $('#modRankNO').val()) {
			alert("동일 직급을 상위직급으로 선택할 수 없습니다");
			return false;
		}
		if ($('#modRankNm').val().trim() == "") {
			alert("직급명을 입력해주세요");
			$('#modRankNm').focus();
			return false;
		}
		form.submit();
	}

	function delRank() {
		var checkRow = "";
		$("input[name=checkRow]:checked").each(function() {
			checkRow += $(this).val() + ",";
			
		});
		checkRow = checkRow.substring(0, checkRow.lastIndexOf(",")); //맨끝 콤마 지우기  

		$("#delRankNo").val(checkRow);

		if (checkRow === "") {
			alert("삭제할 대상을 선택하세요");
			return false;
		}
		$("#delForm").submit();
	}

	/* 전체선택삭제 */
	function allCheck() {
		if ($("input[name='allCheck']").is(':checked')) {

			$("input[name=checkRow]").prop("checked", true);
			$('#delRankBtn').focus();
		} else {
			$("input[name=checkRow]").prop("checked", false);
		}
	}
</script>
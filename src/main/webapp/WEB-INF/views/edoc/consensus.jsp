<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="card mt-3">
	
	<div class="card-status-top bg-primary"></div>
	<div class="card-header">
		<h3 class="m-0 card-title">합&nbsp;&nbsp;의</h3>
	</div>
	<div class="card-body">
		<form role="aprvRegistForm">
			<input type="hidden" name="cons_no" value="${gno}">
			<input type="hidden" name="cons_agrestt" value="${code}">
			<input type="hidden" name="cons_edno" value="${edno}">
			<input type="hidden" name="cons_empid" value="${loginUser.emp_id}">
			<input type="hidden" name="checkCons" id="checkCons">
			<textarea name="cons_comm"style="resize: none;width: 100%;overflow-y: scroll;height: 150px;" placeholder="의견을 작성해주세요."></textarea>
		</form>
	</div>
	<!-- Card footer -->
	<div class="card-footer text-right">
		<a href="javascript:CloseWindow()" class="btn btn-link" style="float: left;">닫기</a>
		<a href="#" class="btn btn-warning" onclick="consNo()">반대</a>
		<a href="#"	class="btn btn-primary" onclick="consYes()">찬성</a>
	</div>

</div>
<script>
function consNo() {
	var form = $("form[role='aprvRegistForm']")
	var chk = confirm("정말 반대하시겠습니까?")
	$("#checkCons").val("1")
	if(chk){
		$.ajax({
			url : "importantConsensus",
			type : "post",
			data : form.serialize(),
			success: function(res) {
				window.opener.alert("반대처리 되었습니다.");
				window.opener.onbeforeunload = null;
				window.opener.location.reload(true);
				window.close();
			}
		})
	}
}
function consYes() {
	var form = $("form[role='aprvRegistForm']")
	var chk = confirm("정말 찬성하시겠습니까?")
	$("#checkCons").val("2")
	if(chk){
		$.ajax({
			url : "importantConsensus",
			type : "post",
			data : form.serialize(),
			success: function(res) {
				window.opener.alert("찬성처리 되었습니다.");
				window.opener.onbeforeunload = null;
				window.opener.location.reload(true);
				window.close();
			}
		})
	}
}
</script>



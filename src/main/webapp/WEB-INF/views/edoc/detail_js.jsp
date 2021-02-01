<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready( function() {
		// 수신처
		removeInput("aprvReciveTarget", "하단 참조")
		// 참조
		removeInput("aprvReference", "하단 참조")
		// 부서명
		removeInput("aprvDept", "${edoc.ed_deptnm}")
		// 문서번호
		removeInput("aprvEdocNumber", "${edoc.ed_deptnm}".substr(0,3)+"-${edoc.ed_no}")
		// 등록일자
		removeInput("aprvRegDate", "${edoc.ed_regymd}".substr(0,10))
		// 기안자
		removeInput("aprvRegistUser", "${edoc.ed_empnm}")
		// 업무번호
		if("${edoc.ed_taskno}"){
			removeInput("aprvTaskNumber", "${edoc.ed_taskno}")
		}else{
			removeInput("aprvTaskNumber", "없음")
		}	
		// 제목
		removeInput("aprvTitle", "${edoc.ed_aprvtitle}")
	})
	
	
	// 기존 인풋태그 삭제후 값에 맞게 어펜드
	function removeInput(inputId, value) {
		var paDiv = $("#"+inputId).closest("div")	// 인풋태그를 감싸고 있는 div
		paDiv.css("padding", "0px")
		$("#"+inputId).remove()						// 인풋태그 삭제
		code = "<div style='font-size: smaller;background: darkgray;' class='px-1 text-center'><span>"+value+"</span></div>"
		paDiv.append(code)
	}
	
	// 재기안
	function reAprvClick() {
		window.onbeforeunload = null; //나감방지 해제
		window.opener.location="<%=request.getContextPath()%>"+"/aprv/moveAprvPage?edno="+${edoc.ed_no};
		window.close()
	}
	
	// 나감방지
	window.onbeforeunload = function(e) {
	    var dialogText = 'Dialog text here';
	    e.returnValue = dialogText;
	    return dialogText;
	};
	
	
	// 삭제버튼
	$("#edocDeleteBtn").on("click", function() {
		var chk = confirm("정말 삭제하시겠습니까?")
		if(chk){
			$.ajax({
				url : "deleteEdoc",
				type : "post",
				data : {"edno" : "${edoc.ed_no}"},
				success: function(res) {
					alert("삭제되었습니다.");
					window.onbeforeunload = null;
					window.opener.location.reload(true);
					window.close();
				}
			})
		}
	})
	
	// 회수 버튼
	$("#edocCollectBtn").on("click", function() {
		var chk = confirm("정말 회수하시겠습니까?")
		if(chk){
			$.ajax({
				url : "collectEdoc",
				type : "post",
				data : {"edno" : "${edoc.ed_no}"},
				success: function(res) {
					alert("회수되었습니다.");
					window.onbeforeunload = null;
					window.opener.location.href = "<%=request.getContextPath()%>/edoc/saveList"
					window.close();
				}
			})
		}
	})
	function movePdfPage(edno) {
		OpenWindow("<%=request.getContextPath()%>/itext/test?edno="+ edno, 'PDF출력', '700', '850')
	}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>


// 질문 추가하기 버튼 호버이벤트
var originCol;
$('.addQuestion').on('mouseenter', function( event ) {
	originCol = $(this).css("background")
    $(this).css("background","lightblue");
}).on('mouseleave', function( event ) {
	$(this).css("background",originCol);
})
// 처음시작시 설문조사 제목에 포커스
$("input[name='pollTitle']").focus();


// 맨위로버튼 클릭시 스크롤 맨위로
$(".onTheTop").on("click", function() {
	document.body.scrollIntoView(true)
})

// 질문 추가하기 버튼 클릭시
$('.addQuestion').on("click", function() {
	
	code = "<div class='card m-3 questionCard show'>"
	code += "<div class='card-status-top bg-primary'></div>"
	code += "<div class='card-header p-2'>"
	code += "<div class='input-group'>"
	code += "<input type='text' class='form-control questionTitle' value='제목없는 질문'>"
	code += "<span class='input-group-text font-weight-bold' style='background: #FAFAFA'>"
	code += "<select class='m-0 p-0 questionKindSelect'style='border: none; background: #FAFAFA'>"
	code += "<option value='answer'>주관식</option>"
	code += "<option value='choice' selected>객관식</option>"
	code += "<option value='multiple'>다중선택</option>"
	code += "</select>"
	code += "</span>"
	code += "<span class='btn btn-warning ml-3 p-1 text-center' style='border-radius: 1px;' onclick='deleteQuestion(this)'>"
	code += "<i class='fas fa-times m-0' style='font-size: 20px;'></i>"
	code += "</span>"
	code += "</div>"
	code += "</div>"
	code += "<div class='card-body p-1'>"
	code += "<table class='table table-vcenter card-table table-striped'>"
	code += "<tbody class='sortableOptions'>"
	code += "<tr class='questionOptions'>"
	code += "<td>"
	code += "<div class='input-group'>"
	code += "<span class='input-group-text'>"
	code += "<input class='form-check-input' type='radio' checked>"
	code += "</span>"
	code += "<input type='text' class='form-control' autocomplete='off' placeholder='옵션 내용 입력..'>"
	code += "<span class='input-group-text btn-danger' onclick='deleteOptions(this)'>"
	code += "<i class='fas fa-trash-alt'></i>"
	code += "</span>"
	code += "<span class='input-group-text'>"
	code += "<i class='fas fa-sort'></i>"
	code += "</span>"
	code += "</div>"
	code += "</td>"
	code += "</tr>"
	code += "<tr class='questionOptions'>"
	code += "<td>"
	code += "<div class='input-group'>"
	code += "<span class='input-group-text'>"
	code += "<input class='form-check-input' type='radio' checked>"
	code += "</span>"
	code += "<input type='text' class='form-control' autocomplete='off' placeholder='옵션 내용 입력..'>"
	code += "<span class='input-group-text btn-danger' onclick='deleteOptions(this)'>"
	code += "<i class='fas fa-trash-alt'></i>"
	code += "</span>"
	code += "<span class='input-group-text'>"
	code += "<i class='fas fa-sort'></i>"
	code += "</span>"
	code += "</div>"
	code += "</td>"
	code += "</tr>"
	code += "</tbody>"
	code += "<tfoot class='othersOptionArea'>"
	code += "</tfoot>"
	code += "</table>"
	code += "</div>"
	code += "<div class='card-footer p-1 text-center'>"
	code += "<a class='optionAddBtn'>옵션추가 하기</a>"
	code += "<span class='othersBtnArea'> 또는 "
	code += "<a class='otherAddBtn'>기타 옵션..</a>"
	code += "</span>"
	code += "</div>"
	code += "<div class='text-center' style='background : #FAFAFA'><i class='fas fa-ellipsis-h'></i></div>"
	code += "</div>"
	var allCard = $(".questionCard")	// 모든 카드
	var showCard;	// 보이던카드 저장할 변수
	$.each(allCard, function(i, ob) {
		if($(ob).hasClass("show")){	 // 보여주던 카드확인
			showCard = ob;
			console.log(ob)
		}	
	})
		
	// 보여주던 카드 안보여주기
	$(showCard).removeClass("show")
	$(showCard).find(".card-body").addClass("d-none")
	$(showCard).find(".card-footer").addClass("d-none")
		
	
	
	$(".sortableQuestions").append(code)
	$(".questionTitle").last().focus();
	document.body.scrollIntoView(false)
	
	
	$(".sortableOptions").sortable({})
})


// 질문간 쏘터블 기능 추가
$( function() {
	$(".sortableQuestions").sortable({})
	$(".sortableOptions").sortable({})
})

// 질문옵션 추가하기 버튼 클릭
$(".sortableQuestions").on("click",".optionAddBtn", function() {
	// 질문종류 상태확인(객관식, 다중선택)
	var kind = $(this).closest(".questionCard").find(".questionKindSelect").val()
	
	if(kind == "choice"){	// 객관식일 경우
		kind = "radio";
	}else{	// 다중선택일 경우
		kind = "checkbox";	
	}
	
	// 질문옵션 생성
	var code = "<tr class='questionOptions'>"
	code += "<td>"
	code += "<div class='input-group'>"
	code += "<span class='input-group-text'>"
	code += "<input class='form-check-input' type='"+kind+"' checked>"
	code += "</span>" 
	code += "<input type='text' class='form-control' placeholder='옵션 내용 입력..'>"
	code += "<span class='input-group-text btn-danger' onclick='deleteOptions(this)'>"
	code += "<i class='fas fa-trash-alt'></i>"
	code += "</span>"
	code += "<span class='input-group-text'>"
	code += "<i class='fas fa-sort'></i>"
	code += "</span>"
	code += "</div>"
	code += "</td>"
	code += "</tr>"
	
	// 옵션 어펜드 할곳 찾아서 어펜드
	$(this).closest(".questionCard").find(".sortableOptions").append(code);
	
	// 추가된 곳으로 포커스
	$(this).closest(".questionCard").find(".sortableOptions").find(".form-control").last().focus()
})

// 기타옵션 추가하기 버튼 클릭
$(".sortableQuestions").on("click",".otherAddBtn", function() {
	// 질문종류 상태확인(객관식, 다중선택)
	var kind = $(this).closest(".questionCard").find(".questionKindSelect").val()
	
	if(kind == "choice"){	// 객관식일 경우
		kind = "radio";
	}else{	// 다중선택일 경우
		kind = "checkbox";	
	}
	
	// 질문옵션 생성
	var code = "<tr class='questionOptions othersOption'>"
	code += "<td>"
	code += "<div class='input-group'>"
	code += "<span class='input-group-text'>"
	code += "<input class='form-check-input' type='"+kind+"' checked>"
	code += "</span>" 
	code += "<input type='text' class='form-control' placeholder='기타..' readonly>"
	code += "<span class='input-group-text btn-danger' onclick='deleteOptions(this)'>"
	code += "<i class='fas fa-trash-alt'></i>"
	code += "</span>"
	code += "</div>"
	code += "</td>"
	code += "</tr>"
	
	// 옵션 어펜드 할곳 찾아서 어펜드
	$(this).closest(".questionCard").find(".othersOptionArea").append(code);
	
	// 추가된 곳으로 포커스
	$(this).closest(".questionCard").find(".othersOptionArea").find(".form-control").focus()
	
	// 기타옵션 추가버튼 삭제
	$(this).closest(".questionCard").find(".othersBtnArea").empty();
})


// 옵션삭제 아이콘 클릭함수
function deleteOptions(delBtn) {
	// 해당 삭제아이콘이 가르키는 질문
	var trTag = $(delBtn).closest("tr")
	
	// 남은 질문개수 확인
	var lengthchk = $(delBtn).closest("table").find(".questionOptions").length
	if(lengthchk < 3){
		alert('질문옵션은 최소2개 이상 필요합니다.')
		return false;
	}
	
	// 기타옵션인지 확인
	var chkOthers = trTag.hasClass("othersOption")
	if(chkOthers){	// 기타옵션을 삭제하는 경우
		code = " 또는 <a class='otherAddBtn'>기타 옵션..</a>"
		// 기타옵션 추가버튼 추가
		$(delBtn).closest(".questionCard").find(".othersBtnArea").append(code);
	}
	
	// 질문삭제
	trTag.remove()
}


// 질문종류 변경시 
$(".sortableQuestions").on("change",".questionKindSelect",function () {
	// 기타옵션 추가버튼 살리기
	otherCode = " 또는 <a class='otherAddBtn'>기타 옵션..</a>"
	$(this).closest(".questionCard").find(".othersBtnArea").empty();
	$(this).closest(".questionCard").find(".othersBtnArea").append(otherCode);
	
	
	// 종류정보 가져오기
	var kind = $(this).val(); 
	// 질문들 초기화
	$(this).closest(".questionCard").find("tbody").empty()
	$(this).closest(".questionCard").find("tfoot").empty()
	
	var raChk;
	
	if(kind == "choice"){	// 객관식 선택
		raChk = "radio";
	}
	if(kind == "multiple"){	// 다중선택
		raChk = "checkbox";
	}
	
	// 질문옵션 생성
	var code = "<tr class='questionOptions'>"
	code += "<td>"
	code += "<div class='input-group'>"
	code += "<span class='input-group-text'>"
	code += "<input class='form-check-input' type='"+raChk+"' checked>"
	code += "</span>" 
	code += "<input type='text' class='form-control' placeholder='옵션 내용 입력..'>"
	code += "<span class='input-group-text btn-danger' onclick='deleteOptions(this)'>"
	code += "<i class='fas fa-trash-alt'></i>"
	code += "</span>"
	code += "<span class='input-group-text'>"
	code += "<i class='fas fa-sort'></i>"
	code += "</span>"
	code += "</div>"
	code += "</td>"
	code += "</tr>"
	
	
	if(kind == "choice"){	// 객관식 선택
		$(this).closest(".questionCard").find(".sortableOptions").append(code)
		$(this).closest(".questionCard").find(".sortableOptions").append(code)
		$(this).closest(".questionCard").find(".card-footer").removeClass("d-none")
	}
	if(kind == "multiple"){	// 다중선택
		$(this).closest(".questionCard").find(".sortableOptions").append(code)
		$(this).closest(".questionCard").find(".sortableOptions").append(code)
		$(this).closest(".questionCard").find(".card-footer").removeClass("d-none")
	}
	if(kind == "answer"){	// 주관식 선택
		var codeAns = "<tr class='questionOptions'>"
		codeAns += "<td>"
		codeAns += "<input type='text' class='form-control' placeholder='텍스트 입력...' readonly>"
		codeAns += "</td>"
		codeAns += "</tr>"
		$(this).closest(".questionCard").find(".sortableOptions").append(codeAns)
		$(this).closest(".questionCard").find(".card-footer").addClass("d-none")
	}
})

// 다른질문카드 클릭시 제목말고 안보여주기
$(".sortableQuestions").on("click",".questionCard", function() {
	var showChk = $(this).hasClass("show");	// 보여주고있는 카드인지 확인
	
	if(!showChk){	// 안보이던카드 보이게 변경
		var allCard = $(".questionCard")	// 모든 카드
		var showCard;	// 보이던카드 저장할 변수
		$.each(allCard, function(i, ob) {
			if($(ob).hasClass("show")){	 // 보여주던 카드확인
				showCard = ob;
				console.log(ob)
			}	
		})
		
		// 보여주던 카드 안보여주기
		$(showCard).removeClass("show")
		$(showCard).find(".card-body").addClass("d-none")
		$(showCard).find(".card-footer").addClass("d-none")
		
		// 선택한카드 보여주기
		$(this).addClass("show")
		$(this).find(".card-body").removeClass("d-none")
		$(this).find(".card-footer").removeClass("d-none")
	}
})


// 질문삭제버튼 클릭시
function deleteQuestion(delBtn) {
	var chk = confirm("이 질문을 삭제하시겠습니까?")
	
	if(chk){
		
		var cnt = $(".questionCard").length
		if(cnt == 1){
			alert("질문은 한개이상 필요합니다.")
			return false
		}
		$(delBtn).closest(".questionCard").remove();
	}
}
</script>
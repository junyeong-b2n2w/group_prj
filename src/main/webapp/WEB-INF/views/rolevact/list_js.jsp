<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form name="aprvForm" method="post" action="<%=request.getContextPath()%>/role/vacation/modifyYn">
	<input type="hidden" name="vact_no">
	<input type="hidden" name="vact_delyn">
	<input type="hidden" name="vact_aprvyn">
</form> 
<script>

<c:if test="${msg ne null}">
	alert('<c:out value="${msg}"/>');
</c:if>
function vactDetail(vactNo){
	$.ajax({
		
		url : "<%=request.getContextPath()%>/role/vacation/detail",
		data :{"vact_no" : vactNo},
		
	});
}
function goVactMain(){
	location.href = "<%=request.getContextPath()%>/role/vacation/main";
}
$('.goVactAprv').on('click',function(){
	
// 	$('#aprvVact').modal('show');
	$('#vactNo').val($(this).data().vact_no);
	$('#vactId').val($(this).data().vact_id);
	$('#vactNm').val($(this).data().vact_nm);
	$('#vactDeptNm').val($(this).data().vact_deptnm);
	$('#vactSatDt').val($(this).data().vact_satymd);
	$('#vactEndDt').val($(this).data().vact_endymd);
	$('#vactReason').val($(this).data().vact_reason);
	$('#vactOccurCnt').val($(this).data().vact_occurcnt);
	$('#vactUseCnt').val($(this).data().vact_usecnt);
	$('#vactRemCnt').val($(this).data().vact_remcnt);
	$('#vactGb').val($(this).data().vact_gb);
	var aprv = $(this).data().vact_aprvyn
	var del = $(this).data().vact_delyn
	if(aprv == "Y"){	// 승인
		$("input[name='vactAprvyn']:input[value='1']").prop("checked", true)
	}else if(del == "Y"){	// 반려
		$("input[name='vactAprvyn']:input[value='3']").prop("checked", true)
	}else{	// 진행중
		$("input[name='vactAprvyn']:input[value='2']").prop("checked", true)
	}
	var startDate =  new Date($('#vactSatDt').val());
	var endDate =  new Date( $('#vactEndDt').val());
	
	var count = 0;
	while(true){
		var tmpDate = startDate;
		if(tmpDate.getTime() > endDate.getTime() ){
			break;
		}else{
			var tmpDay = startDate.getDay();
			if(tmpDay == 0 || tmpDay == 6){ console.log("주말")} //토,일요일일 겨우
			else{console.log("평일");count++;}
			tmpDate.setDate(startDate.getDate()+1);
		}
	}
	$('#vactDays').val(count);
	
	
// 	$("input[name=vactAprvyn]").change(function() {
// 		var chkVal = $(this).val();
// 		if(chkVal == 1){
// 			$('input[name="vact_aprvyn"]').val("Y")
// 			$('input[name="vact_delyn"]').val("N")
// 		}else if(chkVal == 2){
// 			$('input[name="vact_delyn"]').val("Y")
// 			$('input[name="vact_aprvyn"]').val("N")
// 		}
		
// 	});
})

function goChangeYn(){
	if($('input[name="vact_delyn"]').val() == "" || $('input[name="vact_aprvyn"]').val() == ""){
		alert("승인여부 선택은 필수입니다")
		$("input[name=vactAprvyn]:input[value=1]").focus();
		return false;
	}
	
	var ch = $('#vactNo').val();
	$('input[name="vact_no"]').val($('#vactNo').val());
	var form = $('form[name="aprvForm"]');
	
	form.submit();
}

$('.goVactDetail').on('click',function(){
	

	$('#vactNo').val($(this).data().vact_no);
	$('#detailVactId').val($(this).data().vact_id);
	$('#detailVactNm').val($(this).data().vact_nm);
	$('#detailVactDeptNm').val($(this).data().vact_deptnm);
	$('#detailVactSatDt').val($(this).data().vact_satymd);
	$('#detailVactEndDt').val($(this).data().vact_endymd);
	$('#detailVactReason').val($(this).data().vact_reason);
	$('#detailVactOccurCnt').val($(this).data().vact_occurcnt);
	$('#detailVactUseCnt').val($(this).data().vact_usecnt);
	$('#detailVactRemCnt').val($(this).data().vact_remcnt);
	$('#detailVactGb').val($(this).data().vact_gb);
	$('label[id="empInfo"]').text($(this).data().vact_nm + " 님의 휴가 사용 내역");
	
	
	//eqMap으로 아이디별 회원 휴가 리스트 가져오기
	var ajaxVactID = $('#detailVactId').val(); 
// 	$('input[name="vact_id"]').val(ajaxVactID);
	
	
	var startDate =  new Date($('#detailVactSatDt').val());
	var endDate =  new Date( $('#detailVactEndDt').val());
	
	var count = 0;
	while(true){
		var tmpDate = startDate;
		if(tmpDate.getTime() > endDate.getTime() ){
			break;
		}else{
			var tmpDay = startDate.getDay();
			if(tmpDay == 0 || tmpDay == 6){ console.log("주말")} //토,일요일일 겨우
			else{console.log("평일");count++;}
			tmpDate.setDate(startDate.getDate()+1);
		}
	}
	$('#detailVactDays').val(count);
	
	
	var setting = {
			table : "vacation",			// DB테이블명(필수)
			primarykey : "vact_no",		// DB기본키명(필수)
			searchno:ajaxVactID,
			defaultorderby : "vact_regdt",		// DB정렬기준 컬럼(필수)
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				
				var changRes = "";
				if(res != null){
					code = "";
					$.each(res, function(i, obj) {
						code += "<tr>";
						code += " <td>"+res[i].vact_criy+"</td>";
				      	code += " <td class='text-muted'>"+res[i].vact_gb+"</td>";
				        code += " <td class='text-muted'>"+res[i].vact_days+"</td>";
						if(res[i].vact_regdt == null){
				        code += " <td class='text-muted'>"+changRes+"</td>";
						}else{
				        code += " <td class='text-muted'>"+res[i].vact_regdt+"</td>";
						}
						if(res[i].vact_aprvyn == 'Y' && res[i].vact_delyn == 'N'){
				        code += " <td class='text-muted'><span class='badge bg-blue-lt'>승인</span></td>";
						}else if( res[i].vact_delyn == 'Y'){
				        code += " <td class='text-muted'><span class='badge bg-red-lt'>반려</span></td>";
						}else{
				        code += " <td class='text-muted'><span class='badge bg-yellow-lt'>승인대기</span></td>";
						}
						code += "</tr>";
				
					})
				}else{
					code = "<tr>";
					code += " <td colspan='5'>휴가 승인 내역이 존재하지 않습니다</td>";
					code += "</tr>";
				}
				$("#empVactList").empty();
				$("#empVactList").append(code)
			},
			searchBtn : "searchBtn",// 검새버튼 아이디 추가
			refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
			equalMap : "vact_id",// =조건 검색추가시 추가 컬럼명(TAGNAME)
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 5		// 한페이지당 보여줄 리스트 개수
		}
		var test = new Pagination(setting);	// pagination 객체생성
		test.setPagenation("paginationDiv2","detailVactList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
	
});
</script>
   
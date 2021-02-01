<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>

function detailMyVact(vno){
	$('#detailVact').modal("show");
	
	$.each(data,function(index,obj){
	if(vno == obj.vact_no){
		$('#detailVactId').val(obj.vact_id);
		$('#detailVactNo').val(obj.vact_no);
		$('#detailVactNm').val(obj.vact_nm);
		$('#detailVactDeptNm').val(obj.vact_deptnm);
		$('#detailVactSatDt').val(obj.vact_satymd);
		$('#detailVactEndDt').val(obj.vact_endymd);
		$('#detailVactReason').val(obj.vact_reason);
		$('#detailVactOccurCnt').val(obj.vact_occurcnt);
		$('#detailVactUseCnt').val(obj.vact_usecnt);
		$('#detailVactRemCnt').val(obj.vact_remcnt);
		$('#detailVactGb').val(obj.vact_gb);
		if(obj.vact_aprvyn == 'Y'){
			$('#detailAprvConfirm > h3').html("승인");
			$('.modifyBtn').remove();
		}
		if(obj.vact_aprvyn == 'N' &&obj.vact_delyn == 'N' ){
			$('#detailAprvConfirm > h3').html("승인대기");
// 			var code = '<a href="javascript:void(0);" class="btn btn-white modifyBtn" onclick="modifyMyVact('+obj.vact_no+');">';
// 			code += '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"></path><path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3"></path><line x1="16" y1="5" x2="19" y2="8"></line></svg>';
// 			code += '수정하기</a>';
// 			$('.modifyBtn').remove();
// 			$('#appendLabel').append(code);
			
		}
		if(obj.vact_aprvyn == 'N' &&obj.vact_delyn == 'Y'){
			$('#detailAprvConfirm > h3').html("반려")
			$('.modifyBtn').remove();
		}
		
		var startDate =  new Date($('#detailVactSatDt').val());
		var endDate =  new Date( $('#detailVactEndDt').val());
		
		var count = 0;
		while(true){
			var tmpDate = startDate;
			if(tmpDate.getTime() > endDate.getTime() ){
				break;
			}else{
				var tmpDay = startDate.getDay();
				if(tmpDay == 0 || tmpDay == 6){ } //토,일요일일 겨우
				else{count++;}
				tmpDate.setDate(startDate.getDate()+1);
			}
		}
		$('#detailVactDays').val(count);
		
	}
		
	})
}
$(document).ready(function(){
	
	$('#vactGB').on('change',function(){
		if($('#vactGB option:selected').val() =="2"){
				$('input[id="regEndYmd"]').attr("readonly",true);
		}else{ //연차일 경우
			$('input[id="regEndYmd"]').attr("readonly",false);

		}
		
	})
})

function registVact(){
	
	var form = $('form[name="vactRegisttForm"]');
	
	if($('#vactGB  option:selected').val() =="2"){
		$('#regEndYmd').val($('#regSatYmd').val());
	}
	if($('input[id="regSatYmd"]').val() == "" || $('input[id="regSatYmd"]').val() == "undefined"
		|| $('input[id="regEndYmd"]').val() == "" || $('input[id="regEndYmd"]').val() == "undefined" ){ //날짜 미입력 체크
	
	alert("날짜입력은 필수 입니다");
	$('input[id="regSatYmd"]').focus();
	return false;
}

 	var startDate =  new Date($('input[id="regSatYmd"]').val());
	var endDate =  new Date( $('input[id="regEndYmd"]').val());
// // 	// 현재 날짜 이후 체크

// console.log("startDate" +startDate)
	
	var now = new Date();
	var now =new Date( now.toISOString().substring(0, 10));
	
	if(now > startDate){ //현재날짜 이전 날짜인지 체크
		alert("현재날짜 이후의 날짜만 선택 가능합니다");
		$('input[id="regSatYmd"]').focus();
		return;
	}else if(startDate > endDate){
		alert("시작일 이후의 날짜만 선택 가능합니다");
		$('input[id="regEndYmd"]').focus();
		return;
	}
	
// // // 	//평일 제외한 days카운트
	
	var count = 0;
	while(true){
		var tmpDate = startDate;
		if(tmpDate.getTime() > endDate.getTime() ){
			break;
		}else{
			var tmpDay = startDate.getDay();
			if(tmpDay == 0 || tmpDay == 6){ } //토,일요일일 겨우
			else{count++;}
			tmpDate.setDate(startDate.getDate()+1);
		}
	}
	
//  	//구분 설정해주기
	var selectVal = $('#vactGB option:selected').val();
 	console.log("selectVal" + selectVal)
	 switch (selectVal){
     case "1" :
    	 $('input[id="vact_gb"]').val("연차");
         break;
     case "2" :
    	 $('input[id="vact_gb"]').val("반차");
    	 count = "0.5";
         break;
     case "3" :
    	 $('input[id="vact_gb"]').val("공가");
         break;
     case "4" :
    	 $('input[id="vact_gb"]').val("예비군");
           break;
     case "5" :
    	 $('input[id="vact_gb"]').val("병가");
         break;
     default :
        alert("휴가 구분 선택은 필수 입니다");
     	return;
   }
	$('input[id="vact_days"]').val(count);
	
	
// 	console.log(form.serialize());
			
		form.submit();
	
}

</script>


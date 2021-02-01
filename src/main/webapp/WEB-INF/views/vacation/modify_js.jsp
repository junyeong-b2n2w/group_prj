<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>

var tempVno = 0;
function modifyMyVact(vno){
	
	tempVno = vno;
	$('#detailVact').modal("hide");
	$('#ModifyVact').modal('show');
	
	$.each(data,function(i,obj){
		
	if(vno == obj.vact_no){
		$('#modVactId').val(obj.vact_id);
		$('#modVactNm').val(obj.vact_nm);
		$('#modVactDeptNm').val(obj.vact_deptnm);
		$('#modVactSatDt').val(obj.vact_satymd);
		
		$('#modVactEndDt').val(obj.vact_endymd);
		$('#modVactReason').val(obj.vact_reason);
// 		$('#modVactGb').val(obj.vact_gb);
		if(obj.vact_gb == "연차"){
			$('select[id="modVactGb"]').val("1").attr("selected", true)}
		else if(obj.vact_gb == "반차"){$('select[id="modVactGb"]').val("2").attr("selected", true)}
		else if(obj.vact_gb == "공가"){$('select[id="modVactGb"]').val("3").attr("selected", true);}
		else if(obj.vact_gb == "예비군"){$('select[id="modVactGb"]').val("4").attr("selected", true);}
		else if(obj.vact_gb == "병가"){$('select[id="modVactGb"]').val("5").attr("selected", true);}
		$('#modVactDays').val(obj.vact_days);
		$('#modVactNo').val(vno)
		console.log($('#modVactNo').val());
	}
	})
// 		$('modifyVactForm input[name="vact_no"]').val(vno)
// 		console.log(vno)
// 		console.log("** " + $('modifyVactForm input[name="vact_no"]').val())
	
}

$('#modVactSatDt').on('change',function(){

	var now = new Date();
	var today =now.toISOString().substring(0, 10);
	
	var stdtt = $(this).val();
	if(today > stdtt){ //현재날짜 이전 날짜인지 체크
		alert("현재날짜 이후의 날짜만 선택 가능합니다");
		$('#modVactSatDt').focus();
		return;
	}
	
	if(('#modVactEndDt').attr("readonly",true)){
	alert("Ddd")	
	
	}
})
$('#modVactEndDt').on('change',function(){

	
	var stdtt = $('#modVactSatDt').val();
	var enddt = $(this).val();
	if(stdtt > enddt){ 
		alert("시작일 이후의 날짜만 선택 가능합니다");
		$('#modVactEndDt').focus();
		return;
	}
})

function modifyVactBtn(){
	
	
	var form = $('form[name="modifyVactForm"]')
	
	
	var sd =  new Date($('#modVactSatDt').val());
	var ed=  new Date( $('#modVactEndDt').val());
		
	
	var count = 0;
	while(true){
		var tmpDate = sd;
		if(tmpDate.getTime() > ed.getTime() ){
			break;
		}else{
			var tmpDay = sd.getDay();
			if(tmpDay == 0 || tmpDay == 6){ } //토,일요일일 겨우
			else{count++;}
			tmpDate.setDate(sd.getDate()+1);
		}
	}
	
	 $('#modVactDays').val(count)
	
	
	$('#modVno').val($('#modVactNo').val());
	$('#modSymd').val($('#modVactSatDt').val());
	$('#modEymd').val($('#modVactEndDt').val());
	//구분 설정해주기
	var selectVal =$('#modVactGb').val();
	 switch (selectVal){
     case "1" :
    	 $('#modGb').val("연차");
         break;
     case "2" :
    	 $('#modGb').val("반차");
    	 $('#modEymd').val($('#modSymd').val());
    	 $('#modVactDays').val("0.5")
    	
         break;
     case "3" :
    	 $('#modGb').val("공가");
         break;
     case "4" :
    	 $('#modGb').val("예비군");
           break;
     case "5" :
    	 $('#modGb').val("병가");
         break;
     default :
        alert("휴가 구분 선택은 필수 입니다");
     	return;
   }
	
	
	
	$('#modReson').val($('#modVactReason').val());
	$('#modDays').val( $('#modVactDays').val());
	
	
	if($('#modDays').val()==0 ){
		alert("주말에는 쉬세요");
		return false;
		}
	
	console.log(form.serialize())
	
	form.submit();


}


</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	// 재기안시 데이터 불러오기
	 $(document).ready(function() {
		var edoc = ${edoc}	// 전자문서 정보
		if(edoc){	// 재기안 하는경우
			$("input[name='ed_no']").val(edoc.ed_no)
			$("input[name='ed_attckey']").val(edoc.ed_attckey)
			// 전자문서 정보 불러오기
			$("#aprvTitle").val(edoc.ed_aprvtitle)	// 제목
			$(".note-editable").html(edoc.ed_aprv);	// 내용
			
			var consList = edoc.consList;		// 합의리스트
			var aprvList = edoc.aprvList;		// 결재리스트
			var recList = edoc.reciveList;		// 수신리스트
			var refList = edoc.referList;		// 참조리스트
			var list = edoc.allAprvLnList;		// 결재,합의 리스트
			
			console.log(list)
			// 수신 불러오기
			if(recList.length > 0){
				recRefAppend(recList, "rec")
			}
			// 참조 불러오기
			if(refList.length > 0){
				recRefAppend(refList, "cham")
			}
			if(consList.length > 0){
				if(consList[0].cons_agrestt.substr(3,1) == "1"){
					$("input[value='suncha']").prop("checked",true)
				}else{
					$("input[value='byeong']").prop("checked",true)
				}
			}
			
			// 결재선 모달에 추가			
			if(list.length > 0){
				code = "";
				$.each(list, function(i, ob) {
					code += "<tr>";
					code +="<td><input type='checkbox' name='empChecks'></td>";
					code +="<td>";
					if(i == list.length-1){
						code +="<select class='form-select m-0 p-0' name='aprvSelect' disabled>";
					}else{
						code +="<select class='form-select m-0 p-0' name='aprvSelect'>";
					}
					if(ob.aprv_as.substring(3,4) == "0"){
						code +="<option value='aprvOp' selected>결재</option>";
						code +="<option value='consOp'>합의</option>";
						code +="<option value='aprvPreOp'>전결</option>"
					}else if(ob.aprv_as.substring(3,4) == "1" || ob.aprv_as.substring(3,4) == "2"){
						code +="<option value='aprvOp'>결재</option>";
						code +="<option value='consOp' selected>합의</option>";
						code +="<option value='aprvPreOp'>전결</option>"
					}else{
						code +="<option value='aprvOp'>결재</option>";
						code +="<option value='consOp'>합의</option>";
						code +="<option value='aprvPreOp' selected>전결</option>"
					}
					code +="</select></td>";
					code +="<td name='emps' value='"+ob.aprv_empid+"' data-name='"+ob.dept_nm+"/"+ob.rank_nm+"/"+ob.emp_nm+"'>"+ob.rank_nm +" "+ob.emp_nm+"("+ob.dept_nm+")</td>";
					if(i == list.length-1){
						code +="<td name='icons'>최종</td>";
					}else{
						code +="<td name='icons'><svg xmlns='http://www.w3.org/2000/svg' class='icon' width='24' height='24' viewBox='0 0 24 24' stroke-width='2' stroke='currentColor' fill='none' stroke-linecap='round' stroke-linejoin='round'><path stroke='none' d='M0 0h24v24H0z' fill='none'/><line x1='4' y1='12' x2='20' y2='12' /><polyline points='8 8 12 4 16 8' /><polyline points='16 16 12 20 8 16' /></svg></td>";
					}
					code +="</tr>";
				})
				$("#aprvLn").append(code);
				
				// 결재선 전자문서에 추가
				var seq = 1
				$.each(list, function(i,ob) {
					var aprvOp = ob.aprv_as			// 결재옵션(결재, 합의, 전결)
					if(aprvOp.substring(3,4) == "0"){
						aprvOp = "aprvOp"
					}else if(aprvOp.substring(3,4) == "1" || aprvOp.substring(3,4) == "2"){
						aprvOp = "consOp"
					}else{
						aprvOp = "aprvPreOp"
					}
					var empId = ob.aprv_empid	// 직원ID
					var dept_nm = ob.dept_nm	// 부서이름 
					var rank_nm = ob.rank_nm	// 직급이름 
					var emp_nm = ob.emp_nm	// 직원이름 
					
					var rankCode = ""
					var nameCode = ""
					
					rankCode += "<th>"+rank_nm+"</th>";
					
					nameCode += "<td height='60' name='aprvLnEmps'"
					nameCode += " data-seq='"+seq+"'"
					nameCode += " data-id='"+empId+"'"
					nameCode += " data-gb='"+aprvOp+"'"
					if(aprvOp == "aprvPreOp"){
						nameCode += ">"+emp_nm+"<br>(전결)</td>"
					}else{
						if(list.length-1 == i){
							nameCode += ">"+emp_nm+"<br>(최종)</td>"
						}else{
							nameCode += ">"+emp_nm+"</td>"
						}
					}
					nameCode += "</td>"
					if(aprvOp == "aprvOp"){		//결재
						$("#aprvLnTrRank").append(rankCode);
						$("#aprvLnTrName").append(nameCode);
						seq += 1;
					}else if(aprvOp == "consOp"){	// 합의
						$("#consLnTable").removeClass("d-none");	// 합의선 테이블 디스플레이쇼
						$("#consLnTrRank").append(rankCode);
						$("#consLnTrName").append(nameCode);
						seq += 1
					}else{	// 전결
						$("#aprvLnTrRank").append(rankCode);
						$("#aprvLnTrName").append(nameCode);
						seq += 1
					}
				})
			}
		}
	})
	function recRefAppend(list, gb) {
		var code = "";
		var inputValues = "";
		if(gb == "cham"){
			$.each(list, function(i, ob) {
				name = ob.rank_nm + " " + ob.emp_nm
				inputValue = ob.dept_nm +"/" + name +"/" + ob.ar_empid
				inputValues += inputValue + "&&"
				code += name+","
			})
			$("#aprvReference").val(code)
			$("#aprvReference").attr("role", inputValues)
		}else{
			$.each(list, function(i, ob) {
				name = ob.rank_nm + " " + ob.emp_nm
				inputValue = ob.dept_nm +"/" + name +"/" + ob.rec_empid
				inputValues += inputValue + "&&"
				code += name+","
			})
			$("#aprvReciveTarget").val(code)
			$("#aprvReciveTarget").attr("role", inputValues)
		}
	}
</script>
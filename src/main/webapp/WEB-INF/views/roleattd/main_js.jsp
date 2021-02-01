<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	<c:if test="${msg ne null}">
		alert('<c:out value="${msg}"/>');
	</c:if>
	 $(document).ready(function() {
		 
		 
		
		 
		 var setting = {
					primarykey : "attd_no",		// DB기본키명(필수)
					orderby : "roleattendorderby",		// DB정렬기준 컬럼(필수)
					defaultorderby : "attd_no",
					onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
						if(res != null && res.length != 0){
							code = "";
							$.each(res, function(i, obj) {
								code += "<tr>"
								code += "<td class='text-center'>"+obj.attd_no+"</td>"
								code += "<td>"+obj.dept_nm+"</td>"
								code += "<td>"+obj.attd_empid+"/"+obj.emp_nm+"</td>"
								code += "<td>"+obj.attd_gtwtime+"</td>"
								if(obj.attd_offwtime == null){
									code += "<td>미등록</td>";
								}else{
								code += "<td>"+obj.attd_offwtime+"</td>"
									
								}
								if(obj.attd_workshape == "GAT01"){code += "<td><span class='badge bg-indigo-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT02"){code += "<td><span class='badge bg-indigo-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT03"){code += "<td><span class='badge bg-lime-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT04"){code += "<td><span class='badge bg-orange-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT05"){code += "<td><span class='badge bg-cyan-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT06"){code += "<td><span class='badge bg-teal-lt'>"+obj.attd_wsnm+"</span></td>"}
								else if(obj.attd_workshape == "GAT07"){code += "<td><span class='badge bg-red-lt'>"+obj.attd_wsnm+"</span></td>"}
								else{code += "<td></td>"}
								code += "<td><a href='javascript:void(0);' onclick='detailAttend(\""+obj.attd_no+"\");' class='badge bg-cyan-lt'>"
								code += "<i class='fas fa-search-plus'></i>"
								code += "&nbsp;상세보기</a>"
								if(obj.attd_workshape != "GAT07"){
									
								code+= "&nbsp;<a href='javascript:void(0);' onclick='deleteAttend(\""+obj.attd_no+"\");' class='badge bg-red-lt'><i class='far fa-minus-square'></i>&nbsp;비활성</a></td>"
								}
								
								code += "</tr>"
							})
							
							
						}else{
							code = "<tr><td colspan='7' class='text-center'><h4>조회 결과가 없습니다.</h4></td></tr>"
						}
						$("#attdListAppend").empty();
						$("#attdListAppend").append(code);
					},
					searchBtn : "searchBtn",// 검새버튼 아이디 추가
					refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
					likeMap : "dept_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
					likeMap2 : "emp_nm",	// LIKE조건 검색추가시 추가 컬럼명(TAGNAME)
					selDateGtMap : {selName : "dateSel", input : "startdate"},
					selDateLtMap : {selName : "dateSel", input : "enddate"},
					selectBox : "attd_workshape",
					displaypage : 10,	// 한화면에 보여줄 페이지 버튼 개수
					perPageNum : 10		// 한페이지당 보여줄 리스트 개수
				}
				var test = new Pagination(setting);	// pagination 객체생성
				test.setPagenation("paginationDiv","attdList", 1) // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수
	
	 });
var modObj = new Object();				
function detailAttend(attd_no){
	
	
	$.ajax({
		url : "<%=request.getContextPath()%>/role/attend/detail",
		data :{"attd_no" : attd_no},
		type :"post",
		success : function(res){
			
			modObj = res;
			$('#detailAttdId').val(res.ATTD_EMPID);
			$('#detailAttdNm').val(res.EMP_NM);
			$('#detailAttdDeptNm').val(res.DEPT_NM);
			$('#detailAttdGTWDt').val(res.ATTD_GTWTIME);
			$('#detailAttdOFFDt').val(res.ATTD_OFFWTIME);
			$('input:checkbox[name="chkWs"]').each(function() {

			     if(this.value == res.ATTD_WORKSHAPE){ //값 비교
			    	 
			    		 
			    	   this.disabled = false; //checked 처리
			            this.checked = true; //checked 처리
			    
			      }
			     else{
			            this.checked = false; //checked 처리
			     }

			 });
			if(res.ATTD_WORKSHAPE == "GAT06"){
				$('#modbtnArea').empty();
				var gyear = res.ATTD_GTWTIME.substring(0, 4);
				var gmonth = res.ATTD_GTWTIME.substring(5, 7);
				var gday = res.ATTD_GTWTIME.substring(8, 10);
				var ghour = res.ATTD_GTWTIME.substring(11, 13);
				var gminute = res.ATTD_GTWTIME.substring(14, 16);
				var gsecond = res.ATTD_GTWTIME.substring(17, 19);
				
				var oyear = res.ATTD_OFFWTIME.substring(0, 4);
				var omonth = res.ATTD_OFFWTIME.substring(5, 7);
				var oday = res.ATTD_OFFWTIME.substring(8, 10);
				var ohour = res.ATTD_OFFWTIME.substring(11, 13);
				var ominute = res.ATTD_OFFWTIME.substring(14, 16);
				var osecond = res.ATTD_OFFWTIME.substring(17, 19);

				const offset = new Date().getTimezoneOffset() * 60000;

				
				var AttdGTWDt = new Date(new Date(gyear, gmonth-1, gday, ghour, gminute, gsecond)-offset).toISOString().slice(0,16);
				var AttdOFFDt = new Date(new Date(oyear, omonth-1, oday, ohour, ominute, osecond)-offset).toISOString().slice(0,16);

				$('#detailAttdGTWDt').prop("type","datetime-local");
				$('#detailAttdGTWDt').val(AttdGTWDt);
				$('#detailAttdGTWDt').prop("readonly", false);
				$('#detailAttdOFFDt').prop("type","datetime-local");
				$('#detailAttdOFFDt').val(AttdOFFDt);
				$('#detailAttdOFFDt').prop("readonly", false);
				var code2 = '<button type="button" onclick="modifyAttend(\''+res.ATTD_NO+'\');" class="btn btn-primary">저장</button>';
				$('#modbtnArea').append(code2);
				
				
				
			}else{
				$('#modbtnArea').empty();
				
		
				$('#detailAttdGTWDt').prop("type","text");
				$('#detailAttdOFFDt').prop("type","text");
				$('#detailAttdGTWDt').prop("readonly", true);
				$('#detailAttdOFFDt').prop("readonly", true);
				$('#detailAttdGTWDt').val(res.ATTD_GTWTIME);
				$('#detailAttdOFFDt').val(res.ATTD_OFFWTIME);
			}
		},
		beforeSend : function(){
			$('#detailAttend').modal({backdrop:'static',keyboard:false});
			$('#detailAttend').modal('show');
		} 
		
	})
}

function modifyAttend(attd_no){
	
	var checkGTWDt = $('input[id="detailAttdGTWDt"]').val();
	var checkOffDt = $('input[id="detailAttdOFFDt"]').val();

	var replGTWDt = checkGTWDt.replace( " " , "T" ) ;
		var changeGTWDt = new Date(replGTWDt)
		var replOffDt = checkOffDt.replace( " " , "T" ) ;
		var changeOffDt  = new Date(replOffDt)
	
		
		var parseGwtDtt = 
			pad( changeGTWDt.getFullYear() , 4 )  + "-" + 
			pad( (changeGTWDt.getMonth()+1)  , 2 )   + '-' + 
			pad( changeGTWDt.getDate() , 2 ) + ' ' + 
			pad(  changeGTWDt.getHours() , 2 )  + ':' +
			pad(  changeGTWDt.getMinutes() , 2 ) + ':' +
			pad(  changeGTWDt.getSeconds(), 2 )
			; 
		var parseOffDtt = 
			pad( changeOffDt.getFullYear() , 4 )  + "-" + 
			pad( (changeOffDt.getMonth()+1)  , 2 )   + '-' + 
			pad( changeOffDt.getDate() , 2 ) + ' ' + 
			pad(  changeOffDt.getHours() , 2 )  + ':' +
			pad(  changeOffDt.getMinutes() , 2 ) + ':' +
			pad(  changeOffDt.getSeconds(), 2 )
			; 
		
		
		

	$('input[name="attd_gtwtime"]').val(parseGwtDtt);
	$('input[name="attd_offwtime"]').val(parseOffDtt);
	$('input[name="attd_no"]').val(attd_no);
	var form = $('form[name="modAttendForm"]');
	console.log(form.serialize())
	form.submit();
	
}




function pad(number, length) {

   var str = '' + number;

   while (str.length < length) {

       str = '0' + str;

   }

   return str;

}    
function deleteAttend(attd_no){
	if(confirm("비활성화 하시겠습니까?")){
		
		$.ajax({
		url : "<%=request.getContextPath()%>/role/attend/disabledAttend",
		data :{"attd_no" : attd_no},
		type :"post",
		success : function(res){
			if(res == "성공"){
			alert("비활성 처리되었습니다");
			location.reload();
			}
		}
		
	});
	}
}
function goTodayGTWList(){
	$("select[name='attd_workshape']").val("GAT03").prop("selected", true); //값이 GAT03인 option 선택
	$('select[name="dateSel"]').val("attd_gtwtime").prop("selected", true); 
	$('input[name="startdate"]').val(new Date().toISOString().substring(0, 10));
	$('input[name="enddate"]').val(new Date().toISOString().substring(0, 10));
	$('#searchBtn').trigger('click');

}
function goTodayOffList(){
	$("select[name='attd_workshape']").val("GAT01").prop("selected", true); //값이 GAT03인 option 선택
	$('select[name="dateSel"]').val("attd_gtwtime").prop("selected", true); 
	$('input[name="startdate"]').val(new Date().toISOString().substring(0, 10));
	$('input[name="enddate"]').val(new Date().toISOString().substring(0, 10));
	$('#searchBtn').trigger('click');

}
function goTodayReqList(){
	$("select[name='attd_workshape']").val("GAT06").prop("selected", true); //
	$('#searchBtn').trigger('click');

}
function goTodayLateList(){
	$("select[name='attd_workshape']").val("GAT02").prop("selected", true); //지각인 사람 조회
	$('select[name="dateSel"]').val("attd_gtwtime").prop("selected", true); 
	$('input[name="startdate"]').val(new Date().toISOString().substring(0, 10));
	$('input[name="enddate"]').val(new Date().toISOString().substring(0, 10));
	$('#searchBtn').trigger('click');

}

	</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
 
<div class="content">
	<div class="container-xl">
		<!-- Page title -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">
				<div class="col">
					<div class="page-pretitle">근태관리</div>
					<h2 class="page-title">출/ 퇴근 기록 조회</h2>
				</div>
			</div>
		</div>
		<!-- pageHeader -->
		<div class="row">
			<div class="col-lg-4">
			<div class="col-12 mb-3">
				<div class="card">
					<div class="card-body p-4 py-5 text-center">
						<span class="avatar avatar-xl mb-4 avatar-rounded">W</span>
						<h3 class="mb-0">${loginUser.dept_nm}&nbsp;${loginUser.emp_nm }&nbsp;${loginUser.rank_nm }</h3>
						 <c:set var="now" value="<%=new java.util.Date()%>" />
						<h4 class="text-muted"> toDay : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/></h4>
						<div class="row">
						<div class="col-6">
						<a href="javascript:void(0);" class="btn btn-primary w-100" data-backdrop="static" data-keyboard="false" id="attendBtn" onclick="attendChenck('${loginUser.emp_id}');">출근</a>
						</div>
						<div class="col-6"><c:if test="${attend.attd_no != null}"><c:set value="${attend.attd_no }" var="attd_no"></c:set></c:if>
						<a href="javascript:void(0);" class="btn btn-outline-primary w-100 disabled" id="offBtn" onclick="offworkBtn();" >퇴근</a>
						</div>
						</div>
					</div>
					<div class="progress card-progress">
						<div class="progress-bar" style="width: 38%" role="progressbar"
							aria-valuenow="38" aria-valuemin="0" aria-valuemax="100">
							<span class="visually-hidden">56% Complete</span>
						</div>
					</div>
				</div>
			</div><!-- col-12 1 -->
<!-- 			<div class="col-12"> -->
<!-- 			<div class="card"> -->
<!--                             <div class="card-status-start bg-primary"></div> -->
<!--                             <div class="card-body"> -->
<!--                               <h3 class="card-title">출장/ 외근 인증하기</h3> -->
<!--                              <a href="javascript:void(0)" class="btn btn-white w-25 text-center"> -->
<!--                                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"></path><path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3"></path><line x1="16" y1="5" x2="19" y2="8"></line></svg> -->
<!--                                   Edit -->
<!--                                 </a></div> -->
<!--                           </div> -->
			
			
<!-- 			</div>col-12 2 -->
			</div><!-- col-4 -->
			<div class="col-lg-8">
				<div class="card p-3">
					<div class="card-header">
						<div class="card-title"><h3>개인별 출근 현황</h3></div>
					</div>
					<div class="position-relative mt-2">

						<div id="chart-development-activity" style="min-height: 192px;">
							<div id="chart"
								class="apexcharts-canvas apexchartsbk869fil apexcharts-theme-light"
								style="">
								
							</div>
						</div>
					</div>
					<div class="card-table table-responsive">
						<table class="table table-vcenter">
							<thead>
								<tr>
									<th>NO.</th>
									<th>출근일자</th>
									<th>출근시간</th>
									<th>퇴근일자</th>
									<th>퇴근시간</th>
									<th>근무형태</th>
									<th class="text-center">수정요청</th>
								</tr>
							</thead>
							<tbody id="myAttendArea">
								
							</tbody>
						</table>
					</div>
					<div class="card-footer d-flex align-items-center" style="justify-content: center;"id="paginationDiv">
                </div>
				</div>
			</div>
			<!-- col-8 -->

		</div>
		<!-- row -->
	</div>
	<!-- conten-xl -->
</div>
<!-- content -->
    <div class="modal modal-blur fade" id="modal-success" tabindex="-1"  aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          <div class="modal-status bg-success"></div>
          <div class="modal-body text-center py-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-green icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="12" cy="12" r="9"></circle><path d="M9 12l2 2l4 -4"></path></svg>
            <h3>출근 인증을 하시겠습니까?</h3>
            <div class="text-muted" ><span id="dpTime"></span></div>
          </div>
          <div class="modal-footer">
            <div class="w-100">
              <div class="row">
                <div class="col"><a href="#" class="btn btn-white w-100" data-dismiss="modal">
                    	취소
                  </a></div>
                <div class="col"><a href="javascript:void(0)" class="btn btn-success w-100" onclick="registAttend('${loginUser.emp_id}');">
                   	인증
                  </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
    <div class="modal modal-blur fade" id="modal-dayoff" tabindex="-1"  aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content">
          <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
          <div class="modal-status bg-success"></div>
          <div class="modal-body text-center py-4">
            <svg xmlns="http://www.w3.org/2000/svg" class="icon mb-2 text-green icon-lg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="12" cy="12" r="9"></circle><path d="M9 12l2 2l4 -4"></path></svg>
            <h3>퇴근 인증을 하시겠습니까?</h3>
          </div>
          <div class="modal-footer">
            <div class="w-100">
              <div class="row">
                <div class="col"><a href="#" class="btn btn-white w-100" data-dismiss="modal">
                    	취소
                  </a></div>
                <div class="col"><a href="javascript:void(0)" class="btn btn-success w-100" onclick="updateDayOff('${attd_no}');">
                   	인증
                  </a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<%@ include file="../common/pagination2.jsp" %>
<script>


var attdNum;
window.addEventListener('load',function(){
	
	
	
	$.ajax({})
	
	var attendVo = ${attend};
		
	if(attendVo !="empty"){
		if(attendVo.attd_workshape == "GAT03" ||attendVo.attd_workshape == "GAT02" ){
			$('#offBtn').removeClass("disabled");
			$('#attendBtn').removeClass("btn-primary");
			$('#offBtn').removeClass("btn-outline-primary");
			$('#attendBtn').addClass("btn-outline-primary");
			$('#attendBtn').addClass("disabled");
			$('#offBtn').addClass("btn-primary");
		}else if(attendVo.attd_workshape == "GAT01"){
			$('#attendBtn').addClass("disabled");
			$('#attendBtn').addClass("disabled");
		}
		
	};
	
	
	var setting = {
			table : "attendance",	// DB테이블명(필수)
			searchno : "${loginUser.emp_id}",
			primarykey : "attd_no",		// DB기본키명(필수)
			defaultorderby : "attd_gtwtime",		// DB정렬기준 컬럼(필수)
			onPageClick : function (res) {	// 페이지네이션 후 받을데이터 처리
				var changRes = "";
				if(res != null){
					code = "";
					$.each(res, function(i, obj) {
						if(obj.attd_offwymd =="undefined"){
							obj.attd_offwymd  == "";
							obj.attd_offhms  == "";
						};
						code += '<tr>';
						code += '<td class="w-1">'+(i+1)+'</span>';
						code += '</td>';
						code += '<td class="text-nowrap text-muted">'+obj.attd_gtwymd+'</td>';
						code += '<td class="text-nowrap text-muted">'+obj.attd_gtwhms+'</td>';
						code += '<td class="text-nowrap text-muted">'+obj.attd_offwymd+'</td>';
						code += '<td class="text-nowrap text-muted">'+obj.attd_offhms+'</td>';
						code += '<td class="text-nowrap text-muted">';
						if(obj.attd_workshape =="GAT01"){code += '<span class="badge bg-blue-lt">정상처리</span>';}
						if(obj.attd_workshape =="GAT02"){code += '<span class="badge bg-red-lt">근무이상</span>';}
						if(obj.attd_workshape =="GAT03"){code += '<span class="badge bg-lime-lt">출근인증</span>';}
						if(obj.attd_workshape =="GAT04"){code += '<span class="badge bg-yellow-lt">외근/출장</span>';}
						if(obj.attd_workshape =="GAT05"){code += '<span class="badge bg-blue-lt">bg-azure-lt</span>';}
						code += '</td>';
						code += '<td class="text-nowrap text-center" id="mod">';
						if(obj.attd_workshape =="GAT06"){
							code +='<a href="#" class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12l5 5l10 -10"></path></svg>';
	                          code += '수정요청</a>';
						}else{                      
						code += '<a href="javascript:void(0)" class="btn btn-white" onclick="sendModify(\''+obj.attd_no+'\')">';
						code += '<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M9 7h-3a2 2 0 0 0 -2 2v9a2 2 0 0 0 2 2h9a2 2 0 0 0 2 -2v-3"></path><path d="M9 15h3l8.5 -8.5a1.5 1.5 0 0 0 -3 -3l-8.5 8.5v3"></path><line x1="16" y1="5" x2="19" y2="8"></line></svg>';
						code += '<small>수정요청</small></a></td>';
							
						}
						code += '</tr>';
					});
				}else{
					code = "<tr>";
					code += " <td colspan='7'>등록된 출근 인증 내역이 존재하지 않습니다</td>";
					code += "</tr>";
				};
				$("#myAttendArea").empty();
				$("#myAttendArea").append(code);
			},
			searchBtn : "searchBtn",// 검새버튼 아이디 추가
			refreshBtn : "refreshBtn", // 전체목록조회 돌아가기버튼 ID 
			displaypage : 5,	// 한화면에 보여줄 페이지 버튼 개수
			perPageNum : 5		// 한페이지당 보여줄 리스트 개수
		};
		var test = new Pagination(setting);	// pagination 객체생성
		test.setPagenation("paginationDiv","myList", 1); // (페이지네이션 어펜드할곳, 컨트롤러URL, 1(필수))
	
		
		
		var temp = new Object();
		var outArray =[];
		
		var dataArray2 = []; 
		var nameArray =[];
		const temp2 = new Object();
		
}); //load
      
$(document).ready(function() {
	var dataArray = []; 
	var categoryArray = [];
	$.ajax({
		type: 'GET',
		url: "<%=request.getContextPath()%>/attend/dailyList",
		dataType: 'json',
		success: function(res) {
			
				$.each(res,function(index){
					categoryArray.push(res[index].ATTD_GTWYMD +"(" + res[index].DAYNM.substring(0,1) +")");
					if(res[index].TOTALMIN == null){
						res[index].TOTALMIN = 0
					}
					dataArray.push(res[index].TOTALMIN)
				});
				var options = {
			        series: [{
			        name: 'Inflation',
			        data: dataArray
			      }],
			        chart: {
			        height: 350,
			        type: 'bar',
			      },
			      plotOptions: {
			        bar: {
			          dataLabels: {
			            position: 'top', // top, center, bottom
			          },
			        }
			      },
			      dataLabels: {
			        enabled: true,
			        formatter: function (val) {
			        	  var hours = (val / 60);
			        	  var rhours = Math.floor(hours);
			        	  var minutes = (hours - rhours) * 60;
			        	  var rminutes = Math.round(minutes);
			        	  return  rhours + " 시간 " + rminutes + " 분";
			        },
			        offsetY: -20,
			        style: {
			          fontSize: '12px',
			          colors: ["#304758"]
			        }
			      },
			      
			      xaxis: {
			        categories: categoryArray,
			        position: 'top',
			        axisBorder: {
			          show: false
			        },
			        axisTicks: {
			          show: false
			        },
			        crosshairs: {
			          fill: {
			            type: 'gradient',
			            gradient: {
			              colorFrom: '#D8E3F0',
			              colorTo: '#BED1E6',
			              stops: [0, 100],
			              opacityFrom: 0.4,
			              opacityTo: 0.5,
			            }
			          }
			        },
			        tooltip: {
			          enabled: true,
			        }
			      },
			      yaxis: {
			        axisBorder: {
			          show: false
			        },
			        axisTicks: {
			          show: false,
			        },
			        labels: {
			          show: false,
			          formatter: function (val) {
			        	  var hours = (val / 60);
			        	  var rhours = Math.floor(hours);
			        	  var minutes = (hours - rhours) * 60;
			        	  var rminutes = Math.round(minutes);
			        	  return  rhours + " 시간 " + rminutes + " 분";
			          }
			        
			        
			        }
			      
			      },
			      title: {
			        text: '일별 총 근로 시간',
			        floating: true,
			        offsetY: 330,
			        align: 'center',
			        style: {
			          color: '#444'
			        }
			      }
			      };

			      var chart = new ApexCharts(document.querySelector("#chart"), options);
			      chart.render();
		}
		
  });	
	
	

});
      setInterval("dpTime()",1000);
      
      function dpTime(){
    	  var now = new Date();
    	  hours = now.getHours(); 
    	  minutes = now.getMinutes(); 
    	  seconds = now.getSeconds();
    	  if (hours > 12){ hours -= 12; ampm = "오후 "; }
    	  else{ ampm = "오전 "; }
    	  if (hours < 10){ hours = "0" + hours; } 
    	  if (minutes < 10){ minutes = "0" + minutes; } 
    	  if (seconds < 10){ seconds = "0" + seconds; } 
    		$("#dpTime").html("현재시간 : " + ampm + hours + ":" + minutes + ":" + seconds);
      }
      

    //출석 했는지 체크
    function attendChenck(id){
    	
    	$.ajax({
    		
    		url : "<%=request.getContextPath()%>/attend/checkAttend",
    		data : {"attd_id" : id},
    		dataType : "text",
    		type:"POST",
    		success:function(data){
    			if(data != ""){
    				alert("이미 출근이 인증되었습니다");
    				return false;
    			}else{
    				$('#modal-success').modal('show');
    			}
    		},
    		error : function(error){
    			alert("서버 오류 입니다. 관리자에게 문의하세요")
    		}
    	});
    };

    //출퇴근 체크
    function registAttend(id){
    	
    	
    	$.ajax({
    	
    		url : "<%=request.getContextPath()%>/attend/registAttend",
    		data : {"attd_id" : id},
    		dataType : "text",
    		type:"GET",
    		success:function(data){
    			
    			if(data == "성공"){
    				alert("출근인증이 완료되었습니다");  
    				$('#offBtn').removeClass("disabled");
    				$('#attendBtn').removeClass("btn-primary");
    				$('#offBtn').removeClass("btn-outline-primary");
    				$('#attendBtn').addClass("btn-outline-primary");
    				$('#attendBtn').addClass("disabled");
    				$('#offBtn').addClass("btn-primary");
    				
    				
    			}	
    		},
    		error : function(error){
    			alert("서버 오류 입니다. 관리자에게 문의하세요");
    		},
    		beforeSend:function(){
    			$('#modal-success').modal('hide');
    		},
    		complete : function() {
    		
    			location.reload();
    	    }
    		
    	});
    };

      
      
    //퇴근하기 
      function offworkBtn(){
    	$('#modal-dayoff').modal('show');
      	
      }
    function updateDayOff(attdNo){
    	
    	$.ajax({
          	
      		url : "<%=request.getContextPath()%>/attend/updateOffWork",
      		data : {"attd_no" : attdNo},
      		dataType : "text",
      		type:"GET",
      		success:function(data){
      			if(data == "성공"){
      				
      				$('#attendBtn').addClass("disabled");
      				$('#offBtn').addClass("disabled");
      				
      			}	
      		},
      		error : function(error){
      			alert("서버 오류 입니다. 관리자에게 문의하세요");
      		},
      		beforeSend:function(){
      			$('#modal-dayoff').modal('hide');
      		},
      		complete : function() {
      			alert("퇴근인증이 완료되었습니다");  
      	    }
      		
      	});
    }
function sendModify(num){
	
	if(confirm("수정을 요청 하시겠습니까?")){
    	$.ajax({
          	
      		url : "<%=request.getContextPath()%>/attend/sendModReq",
      		data : {"attd_no" : num},
      		dataType : "text",
      		type:"GET",
      		success:function(data){
      			if(data == "성공"){
      				alert("수정요청이 등록되었습니다. 관리자에게 문의하세요");
      				$('#mod').empty();
      				var code ='<a href="#" class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><path d="M5 12l5 5l10 -10"></path></svg>수정요청</a>';
      				$('#mod').html(code)
      			}	
      		},
      		error : function(error){
      			alert("서버 오류 입니다. 관리자에게 문의하세요");
      		}
      	});
	}
}
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
 
<div class="content">
<div class="container-xl">
	<!-- Page title -->
          <div class="page-header d-print-none">
            <div class="row align-items-center">
                <div class="col">
			      <div class="page-pretitle">
			        	휴가관리
			      </div>
			      <h2 class="page-title">
			      	휴가 현황 조회
			      </h2>
			    </div>
			    <div class="col-auto ms-auto d-print-none">
                <div class="btn-list">
                  <a href="javascript:goVactList();" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
					 <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
							height="24" viewBox="0 0 24 24" stroke-width="2"
							stroke="currentColor" fill="none" stroke-linecap="round"
							stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none" />
							<line x1="9" y1="6" x2="20" y2="6" />
							<line x1="9" y1="12" x2="20" y2="12" />
							<line x1="9" y1="18" x2="20" y2="18" />
							<line x1="5" y1="6" x2="5" y2="6.01" />
							<line x1="5" y1="12" x2="5" y2="12.01" />
							<line x1="5" y1="18" x2="5" y2="18.01" /></svg>
                   		목록 조회
                  </a>
                </div>
              </div>
              </div>
           </div><!-- pageHeader -->
            <div class="row row-cards">

			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">승인대기자</h3>
	                      <div class="h1 m-0">${dataMap.waitCnt }</div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-yellow-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><line x1="19" y1="7" x2="19" y2="10" /><line x1="19" y1="14" x2="19" y2="14.01" /></svg>  </div>
	                  </div>
			</div>
			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">휴가자</h3>
	                      <div class="h1 m-0">${dataMap.aprvCnt }</div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-blue-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M16 11l2 2l4 -4" /></svg>  </div>
	                  </div>
			</div>
			<div class="col-md-4 col-lg-4">
					<div class="card">
	                    <div class="card-body p-2 text-center">
							<h3 class="card-title">휴가 반려자</h3>
	                      <div class="h1 m-0">${dataMap.nAprvCnt }</div>
	                      <div class="text-muted mb-3">Daily Check</div>
	                    </div>
	                    <div class="ribbon ribbon-top ribbon-start bg-red-lt">
	                   <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="9" cy="7" r="4" /><path d="M3 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /><path d="M17 9l4 4m0 -4l-4 4" /></svg>  </div>
	                  </div>
			</div>
			
           <div class="col-12 mt-4">
              <div class="card p-3">
                <ul class="nav nav-tabs nav-tabs-alt" data-toggle="tabs">
                  <li class="nav-item">
                    <a href="#tabs-home-10" class="nav-link active" data-toggle="tab" onclick="getChartFromDay();">일자별</a>
                  </li>
                  <li class="nav-item">
                    <a href="#tabs-profile-10" class="nav-link" data-toggle="tab" onclick="getChart2FromDept();" >부서별</a>
                  </li>
                  <li class="nav-item">
                    <a href="#tabs-activity-17" class="nav-link" data-toggle="tab" onclick="getChartFromRank();">직급별</a>
                  </li>
                </ul>
                <div class="card-body">
                  <div class="tab-content">
                    <div class="tab-pane active show" id="tabs-home-10">
                      <div id="chart" style=" max-width: 1200px;margin: 35px auto;"></div>
                    </div>
                    <div class="tab-pane" id="tabs-profile-10">
                      <div  class="">
                      <div id="chart2" style=" max-width: 650px;margin: 35px auto;"></div>
                      
                      </div>
                    </div>
                    <div class="tab-pane" id="tabs-activity-17">
                    <div class="row">
                      <div class="col-4">
                      <div id="chart3" style=" max-width: 800px;margin: 35px auto;"></div>
                      </div>
                      <div class="col-6"style=" max-width: 1000px; margin: 35px auto;opacity: 0.9;">
                      <div id="timeline-chart" style=""></div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
		</div>
		 </div>
		</div><!-- containew-xl -->
	</div>
	
	
	
	<script>
	function goVactList(){
		location.href = "<%=request.getContextPath()%>/role/vacation/list";
	}
	  
	 $(document).ready(function() {
	
	   
		 getChartFromDay();
	       
	 });
	 
	 function getChartFromDay(){
		 var jsonArray = '${jsonList}';
			var tempArray = JSON.parse(jsonArray);
			var empcntArray = [];
			var totaldtArray = [];
			for(var i =0 ;i <tempArray.length;i++){
					empcntArray.push( tempArray[i].EMPCNT);
					totaldtArray.push( tempArray[i].TOTALDT.substring(4,6) +"월"+tempArray[i].TOTALDT.substring(6,8) +"일");
					
				}
			
			
			var options = {
			        chart: {
			            height: 350,
			            type: 'line',
			            zoom: {
			                enabled: false
			            }
			        },
			        colors: ["#206bc4"],
			        series: [{
			            name: "Desktops",
			            data: empcntArray
			        }],
			        dataLabels: {
			            enabled: false
			        },
			        stroke: {
			            curve: 'straight'
			        },
			        title: {
			            text: '이번달 휴가 사용자',
			            align: 'left'
			        },
			        grid: {
			            row: {
			                colors: ['#f3f3f3', 'transparent'], // takes an array which will be repeated on columns
			                opacity: 0.5
			            },
			        },
			        tooltip: {
			            shared: false,
			            intersect: true
			        },
			        markers: {
			            size: 6,
			            onClick: function(e) {
			                var seriesIndex = e.target.getAttribute('index')
			                var dataPointIndex = e.target.getAttribute('j')
			                console.log(new Date(chart.w.globals.seriesX[seriesIndex][dataPointIndex]))
			            },
			            onDblClick: function(e) {
			                console.log(e)
			            }
			        },
			        
			        xaxis: {
			        	 categories: totaldtArray,
			        }
			    }

			    var chart = new ApexCharts( document.querySelector("#chart"),  options );

			    chart.render();
			    
		 
		 
		 
	 }
	 
	 function getChart2FromDept(){
		 	var chart2DNameArray =[];
		    var chart2CountArray =[];

	        $.ajax({
	    		type: 'GET',
	    		url: "<%=request.getContextPath()%>/role/vacation/chart2",
	    		dataType: 'json',
	    		success: function(data) {
	    				$.each(data,function(index){
	    					chart2DNameArray.push(data[index].DEPT_NO);
	    					chart2CountArray.push(data[index].APRVCNT);
	    				})
	    		}
	    		
	        });
	        
		    var options = {
		            series: chart2CountArray,
		            chart: {
		            type: 'donut',
		          },
		          title: {
			            text: '부서별 휴가 신청현황',
			            align: 'left'
			        },
		          responsive: [{
		            breakpoint: 480,
		            options: {
		              chart: {
		                width: 200
		              },
		              legend: {
		                position: 'bottom'
		              }
		            }
		          }],
			        labels: chart2DNameArray,
		          };

		          var chart2 = new ApexCharts(document.querySelector("#chart2"), options);
		          chart2.render();
		          
	 }
	 
	 function getChartFromRank(){
		 
		 var chart3RNameArray =[];
	  	    var chart3CountArray =[];

	          $.ajax({
	      		type: 'GET',
	      		url: "<%=request.getContextPath()%>/role/vacation/chart3",
	      		dataType: 'json',
	      		success: function(data) {
	      				$.each(data,function(index){
	      					chart3RNameArray.push(data[index].RANK_NM);
	      					chart3CountArray.push(data[index].APRVCNT);
	      				})
	      		
	      		}
	      		
	          });
	    var options = {
	            series: chart3CountArray,
	            chart: {
	            type: 'donut',
	          },
	          title: {
		            text: '직급/직책별 휴가 신청 현황',
		            align: 'left'
		        },
	          responsive: [{
	            breakpoint: 480,
	            options: {
	              chart: {
	            	  width: 200
	              },
	              legend: {
	                position: 'bottom'
	              }
	            }
	          }],
	          labels: chart3RNameArray,
	          };

	          var chart3 = new ApexCharts(document.querySelector("#chart3"), options);
	          chart3.render();
	
	        var chart4DNameArray =[];
	  	    var chart4RankArray =[];
			var chart4DNameTempArray = [];
			var chart4RankTempArray = [];
			var chart4ALlTempArray = [];
	          $.ajax({
	      		type: 'GET',
	      		url: "<%=request.getContextPath()%>/role/vacation/chart4",
	      		dataType: 'json',
	      		async :false,
	      		success: function(data) {
	      				$.each(data,function(index){
	      					
	      					chart4DNameArray.push(data[index].VACT_DEPTNM);
	      					chart4RankArray.push(data[index].VACT_RANKNM);
	      					chart4ALlTempArray  =data
	      				})
	      			
	      		}
	      		
	          });
	          chart4DNameTempArray = Array.from(new Set(chart4DNameArray));
	          chart4RankTempArray = Array.from(new Set(chart4RankArray));
	          
	          console.log(chart4RankTempArray)
	          var seriesArray = new Array();
	          
	          for(var i =0; i<chart4RankTempArray.length;i++){ //길이만큼인 data의 배열을 추가해준다
	        	  
	        	 	var obj = new Object();
	          
	        	 	obj.name = chart4RankTempArray[i];
	        	 	
		        	  var arr = new Array();
		        	  
		          for(var j =0; j <chart4DNameTempArray.length; j++){
		        	  
					 			arr[j] = 0;
			          for(var a=0; a<chart4ALlTempArray.length;a++){
			 				if((chart4ALlTempArray[a].VACT_DEPTNM == chart4DNameTempArray[j]) 
			 						&& (chart4ALlTempArray[a].VACT_RANKNM == chart4RankTempArray[i])){
			 						arr[j] = chart4ALlTempArray[a].AVGUSECNT;
			 				}
			 				
			 				
			 			}
		          }
	          console.log("for " + arr)
		          obj.data = arr
	        	 seriesArray.push(obj);
	          }
	          
	          console.log("for x " +arr)
	          console.log(seriesArray)
	          var options = {
	        		  
	                  chart: {
	                      height: 350, type: "bar", stacked: !0
	                  },
	                  plotOptions: {
	                      bar: {
	                          horizontal: !1, columnWidth: "20%"
	                      }
	                  },
	                  dataLabels: {
	                      enabled: !1
	                  },
	                  stroke: {
	                      show: !0, width: 2, colors: ["transparent"]
	                  },
	                  series:seriesArray, 
	                  legend: {
	                      show: 1
	                  },
	                  xaxis: {
	                      categories:chart4DNameTempArray
	                  ,
	                      axisBorder: {
	                          show: !1
	                      }
	                  },
	                  yaxis: {
	                      labels: {
	                          formatter:function(e) {
	                              return e + "명."
	                          }
	                          ,
	                          offsetX:-15
	                      }
	                  },
	                  fill: {
	                      opacity: 1
	                  },
	        title:{
	          text:"부서  & 직급 /직책 별 휴가 사용률 평균"
	        },
	                  tooltip: {
	                      y: {
	                          formatter:function(e) {
	                              return e + "Hrs."
	                          }
	                      }
	                  }
	              
	          };

	          var chart4 = new ApexCharts(document.querySelector("#timeline-chart"), options);

	          chart4.render();
		 
	 }
	</script>
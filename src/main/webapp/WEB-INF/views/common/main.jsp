<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">
<link rel="shortcut icon" href="#">
<style>
.hr,hr{
margin: 0px;
}

/* bootstrap-switch - v3.3.2*/
.bootstrap-switch {
  display: inline-block;
  direction: ltr;
  cursor: pointer;
  border-radius: 4px;
  border: 1px solid #ccc;
  position: relative;
  text-align: left;
  overflow: hidden;
  line-height: 8px;
  z-index: 0;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  vertical-align: middle;
  -webkit-transition: border-color ease-in-out 0.15s,
    box-shadow ease-in-out 0.15s;
  -o-transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}
.bootstrap-switch .bootstrap-switch-container {
  display: inline-block;
  top: 0;
  border-radius: 4px;
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
}
.bootstrap-switch .bootstrap-switch-handle-off,
.bootstrap-switch .bootstrap-switch-handle-on,
.bootstrap-switch .bootstrap-switch-label {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  cursor: pointer;
  display: inline-block !important;
  height: 100%;
  padding: 6px 12px;
  font-size: 14px;
  line-height: 20px;
}
.bootstrap-switch .bootstrap-switch-handle-off,
.bootstrap-switch .bootstrap-switch-handle-on {
  text-align: center;
  z-index: 1;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-primary,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-primary {
  color: #fff;
  background: #337ab7;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-info,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-info {
  color: #fff;
  ground: #5bc0de;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-success,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-success {
  color: #fff;
  background: #5cb85c;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-warning,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-warning {
  background: #f0ad4e;
  color: #fff;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-danger,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-danger {
  color: #fff;
  background: #d9534f;
}
.bootstrap-switch .bootstrap-switch-handle-off.bootstrap-switch-default,
.bootstrap-switch .bootstrap-switch-handle-on.bootstrap-switch-default {
  color: #000;
  background: #eee;
}
.bootstrap-switch .bootstrap-switch-label {
  text-align: center;
  margin-top: -1px;
  margin-bottom: -1px;
  z-index: 100;
  color: #333;
  background: #fff;
}
.bootstrap-switch .bootstrap-switch-handle-on {
  border-bottom-left-radius: 3px;
  border-top-left-radius: 3px;
}
.bootstrap-switch .bootstrap-switch-handle-off {
  border-bottom-right-radius: 3px;
  border-top-right-radius: 3px;
}
.bootstrap-switch input[type="radio"],
.bootstrap-switch input[type="checkbox"] {
  position: absolute !important;
  top: 0;
  left: 0;
  margin: 0;
  z-index: -1;
  opacity: 0;
  filter: alpha(opacity=0);
}
.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-mini .bootstrap-switch-label {
  padding: 1px 5px;
  font-size: 12px;
  line-height: 1.5;
}
.bootstrap-switch.bootstrap-switch-small .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-small .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-small .bootstrap-switch-label {
  padding: 5px 10px;
  font-size: 12px;
  line-height: 1.5;
}
.bootstrap-switch.bootstrap-switch-large .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-large .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-large .bootstrap-switch-label {
  padding: 6px 16px;
  font-size: 18px;
  line-height: 1.3333333;
}
.bootstrap-switch.bootstrap-switch-disabled,
.bootstrap-switch.bootstrap-switch-indeterminate,
.bootstrap-switch.bootstrap-switch-readonly {
  cursor: default !important;
}
.bootstrap-switch.bootstrap-switch-disabled .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-disabled .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-disabled .bootstrap-switch-label,
.bootstrap-switch.bootstrap-switch-indeterminate .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-indeterminate .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-indeterminate .bootstrap-switch-label,
.bootstrap-switch.bootstrap-switch-readonly .bootstrap-switch-handle-off,
.bootstrap-switch.bootstrap-switch-readonly .bootstrap-switch-handle-on,
.bootstrap-switch.bootstrap-switch-readonly .bootstrap-switch-label {
  opacity: 0.5;
  filter: alpha(opacity=50);
  cursor: default !important;
}
.bootstrap-switch.bootstrap-switch-animate .bootstrap-switch-container {
  -webkit-transition: margin-left 0.5s;
  -o-transition: margin-left 0.5s;
  transition: margin-left 0.5s;
}
.bootstrap-switch.bootstrap-switch-inverse .bootstrap-switch-handle-on {
  border-radius: 0 3px 3px 0;
}
.bootstrap-switch.bootstrap-switch-inverse .bootstrap-switch-handle-off {
  border-radius: 3px 0 0 3px;
}
.bootstrap-switch.bootstrap-switch-focused {
  border-color: #66afe9;
  outline: 0;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075),
    0 0 8px rgba(102, 175, 233, 0.6);
}
.bootstrap-switch.bootstrap-switch-inverse.bootstrap-switch-off
  .bootstrap-switch-label,
.bootstrap-switch.bootstrap-switch-on .bootstrap-switch-label {
  border-bottom-right-radius: 3px;
  border-top-right-radius: 3px;
}
.bootstrap-switch.bootstrap-switch-inverse.bootstrap-switch-on
  .bootstrap-switch-label,
.bootstrap-switch.bootstrap-switch-off .bootstrap-switch-label {
  border-bottom-left-radius: 3px;
  border-top-left-radius: 3px;
}

//Custom CSS

.container {
  max-width: 900px;
  max-width: none !important;
  width: 900px;
}

h1 {
  font-size: 62px;
  line-height: 62px;
  vertical-align: middle;
  font-weight: 200;
  margin-top: 100px;
  margin-bottom: 20px;
  text-transform: capitalize;
  color: white;
}

h1 .title {
  font-size: 60px;
  line-height: 80px;
  vertical-align: middle;
  color: #2c3e50;
  font-family: "Roboto", sans-serif;
  font-weight: 500;
}

hr {
  margin-top: 3px;
  border-width: 1px 0;
  //border-color: #EEEEEE -moz-use-text-color #FFFFFF;
  //border-color: #888485;
  border-color: black;
}

hr#hr-bottom {
  margin-top: 0px;
  margin-bottom: 5px;
}

.panel {
  -webkit-box-shadow: -1px 2px 8px 0px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: -1px 2px 8px 0px rgba(0, 0, 0, 0.3);
  box-shadow: -1px 2px 8px 0px rgba(0, 0, 0, 0.3);
  //background-color: #00a6a7;
  background-color: white;
}

.panel-body {
  position: relative;
  margin-right: 20px;
  margin-left: 20px;
  padding-top: 5px;
}

.vcenter {
  display: block;
  vertical-align: middle;
  float: none;
  margin-top: 10px;
}

#weather-icon-display {
  height: 110px;
  line-height: 20px;
}

#weather-icon {
  font-size: 180px;
  vertical-align: middle;
  display: inline-block;
  margin-top: -100px;
}

#temperature h4 {
  text-align: left;
  font-size: 26px;
  font-weight: 400;
}

#temperature p {
  text-align: left;
  font-size: 30px;
}

#temperature p {
     margin-left: -1px;
    margin-bottom: 0;
    text-align: left;
    font-weight: 500;
    line-height: 40px;
}

#temperature p sup {
  vertical-align: baseline;
  position: relative;
  top: -14px;
  line-height: 0;
  font-size: 21px;
  font-weight: 400;
}

#temperature h5 {
  text-align: left;
  font-size: 16px;
  margin-bottom: 10px;
  margin-top: 0;
  font-weight: 300;
}

#weather-condition h6 {
  font-size: 36px;
  margin-bottom: -20px;
}

#weather-condition p {
  margin-bottom: 3px;
  font-size: 14px;
  font-weight: 400;
}

#condition {
  text-transform: capitalize;
}

.temp-switch input {
  font-size: 100px;
}

#city,
h6 {
  color: black;
}

#footer {
  font-size: 10px;
  text-transform: capitalize;
  color: rgba(255, 255, 255, 0.4);
}

</style>

<script
	src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


<div class="container-fluid">
	<div class="d-flex" style="justify-content: flex-end; margin: 15px;">
		<i class="fas fa-cog fa-2x" style="color: #595961; cursor: pointer"
			onclick="openModalYN()"></i>
	</div>
	<div class="row row-eq-height " id="sortable">
		<input type="hidden" class="wo_wgno" value="">
		<c:forEach items="${List }" var="list">
			<div class="col-4 widget" onclick="sort(${list.wo_wgno})">
				<div class="card p-3 h-100">
					<div class="card-header d-flex justify-content-between" style="background: #f1f1f1;">
						<div class="">
							${list.wg_icon } <span class="span_sortable">${list.wg_nm }</span>
						</div>
						<div class="">
							<c:if test="${list.wg_nm eq '계산기' && list.wg_nm eq '영어 단어' }">
							<i class="fas fa-plus" style="margin-right: 20px;opacity: 0.6; display: none;"></i>
							</c:if>
							<c:if test="${list.wg_nm ne '계산기' && list.wg_nm ne '영어 단어'}">
							
							
							<c:choose>
							    <c:when test="${list.wg_nm eq '수신 업무 요청'}">
							<i class="fas fa-plus" style="margin-right: 20px;opacity: 0.6; " onclick="location.href='<%=request.getContextPath()%>/task/receivelist.do'"></i>
							    </c:when>
							 
							    <c:when test="${list.wg_nm  eq '공지 최신 글'}">
							<i class="fas fa-plus" style="margin-right: 20px;opacity: 0.6; " onclick="location.href='<%=request.getContextPath()%>/notice/list.do'"></i>
							    </c:when>
							    
							    <c:when test="${list.wg_nm eq '최신 게시판 글 '}">
							<i class="fas fa-plus" style="margin-right: 20px;opacity: 0.6; " onclick="location.href='<%=request.getContextPath()%>/post/list.do?post_brdno=38&NowPage=1&value=2'"></i>
							    </c:when>
							    
							    <c:when test="${list.wg_nm eq '날씨'}">
							<i class="fas fa-plus" style="margin-right: 20px;opacity: 0.6; " onclick="Weather();"></i>
							    </c:when>
							 
							</c:choose>

							</c:if>
							 <i
								class="fas fa-times"
								onclick="widget('${list.wo_empid}',${list.wo_wgno },this,'N')"
								style="opacity: 0.6;"></i>
						</div>
					</div>

					<c:if test="${list.wg_nm eq '계산기' }">
						<div class="card-body d-flex justify-content-center openC"
							onclick="OpenWindow('<%=request.getContextPath()%>/common/cal.do','calculator','400','700')"
							style="align-items: center; font-size: 20px;">Open
							Calculator</div>
					</c:if>

					<c:if test="${list.wg_nm eq '영어 단어' }">
						<div class="card-body d-flex justify-content-center">
							<div style="align-self: center;">
								<div
									style="text-align: center; font-size: 20px; margin-bottom: 5px;">${envo.english }</div>
								<div style="text-align: center;">${envo.en_mean }</div>
							</div>
						</div>
						<div class="card-footer">
							<div class="row">
								<div class="col-sm-2">
									<img
										src="<%=request.getContextPath()%>/resources/img/english.png"
										alt="John Doe" class="mr-3 mt-3 rounded-circle"
										style="width: 100%;">
								</div>
								<div class="col-sm-10" style="align-self: center;">
									<p style="font-size: 15px;">${envo.application }</p>
									${envo.app_mean }
								</div>
							</div>
							<div></div>
						</div>
					</c:if>

					<c:if test="${list.wg_nm eq '수신 업무 요청'}">
						<div class="table-responsive mt-3">
							<table
								class="table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr style="background: #ffffff;">
										<th>제목</th>
										<th>발신자</th>
										<th>마감일</th>
										<th>상태</th>
									</tr>
									<c:forEach items="${taskList }" var="list">

										<tr style="cursor: pointer"
											onmouseover="this.style.backgroundColor='#f5f9ff'"
											onmouseout="this.style.backgroundColor=''"
											onclick="ReceiverGo(${list.tasc_no},0)">
											<td>${list.task_title }</td>
											<td>
												<div class="row">
													<div class="col-sm-3">${list.rank_nm }</div>
													<div class="col-sm-9">${list.emp_nm }</div>
												</div>
											</td>
											<td><fmt:formatDate value='${list.task_ddlndt }'
													pattern='yyyy-MM-dd' /></td>
											<td>${list.perf_stt }</td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</c:if>
					<c:if test="${list.wg_nm eq '최신 게시판 글 '}">
						<div class="table-responsive mt-3">
							<table
								class="table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr style="background: #ffffff;">
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
									<c:forEach items="${postList }" var="list">

										<tr style="cursor: pointer"
											onmouseover="this.style.backgroundColor='#f5f9ff'"
											onmouseout="this.style.backgroundColor=''"
											onclick="PostGo(${list.post_no},${list.post_brdno })" >
											<td>${list.post_title }</td>
											<td>${list.post_pbls }</td>
											<td><fmt:formatDate value='${list.post_regdt }'
													pattern='yyyy-MM-dd' /></td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</c:if>
					<c:if test="${list.wg_nm eq '공지 최신 글'}">
						<div class="table-responsive mt-3">
							<table
								class="table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr style="background: #ffffff;">
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
									</tr>
									<c:forEach items="${noticeList }" var="list">

										<tr style="cursor: pointer"
											onmouseover="this.style.backgroundColor='#f5f9ff'"
											onmouseout="this.style.backgroundColor=''"
											onclick="NtcGo(${list.ntc_no})" >
											<td>${list.ntc_title }</td>
											<td>${list.ntc_writerid }</td>
											<td><fmt:formatDate value='${list.ntc_regdt }'
													pattern='yyyy-MM-dd' /></td>
										</tr>
									</c:forEach>
							</table>
						</div>
					</c:if>
					
					<c:if test="${list.wg_nm eq '날씨' }">
						
  <div class="container text-center vcenter">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-md-6 text-left">
            <div id="city"><i class="fa fa-map-marker"></i>&nbsp;&nbsp;<span>대전 날씨 </span><br><div id="time_now" style="margin-left: 20px;"></div></div>
          </div>
          
        </div>
        <hr>
        <div id="display">
          <div class="row">
            <div class="col-md-6" id="weather-icon-display">
            	
            </div>
            
            <div class="col-md-6" id="temperature" style="align-self: center;">
              <h4 id="Today_now"></h4>

              <p><span class="temp"></span><sup>&deg;<span id="metric">C</span></sup></p>
              <h5>최고 기온: <span id="temp-max"></span><br>  최저 기온: <span id="temp-min"></span></h5>
            </div>
            
          </div>
        </div>
        <hr id="hr-bottom">
        <div class="row" id="weather-condition">
          <div class="col-md-3">
            <h6><img alt="습도" src="<%=request.getContextPath()%>/resources/img/raindrop.svg" style="height: 50px; margin-top: -40px;"></h6>
            <p id="humidity"></p>
          </div>
          <div class="col-md-3">
            <h6><img alt="바람" src="<%=request.getContextPath()%>/resources/img/wi-strong-wind.svg" style="height: 50px; margin-top: -40px;"></h6>
            <p id="wind"></p>
          </div>
          <div class="col-md-3">
            <h6><img alt="압력" src="<%=request.getContextPath()%>/resources/img/psi.svg" style="height: 50px; margin-top: -40px;"></h6>
            <p id="hpa"></p>
          </div>
          <div class="col-md-3">
            <h6><img alt="눈" src="<%=request.getContextPath()%>/resources/img/rain-mix.svg" style="height: 50px; margin-top: -40px;"></h6>
            <p id="prec">2%</p>
          </div>
        </div>
        <hr>
      </div>
      <!--/.panel-body-->

    </div>
   
  </div> <!-- /container -->
					
					</c:if>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<div class="modal modal-blur fade" id="modal-WidgetYN" tabindex="-1"
	style="display: none;" aria-hidden="true">
	<div class="modal-dialog modal-lg modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">
					<i class="fas fa-sliders-h" style="margin-right: 9px;"></i>위젯 설정
				</h5>
				<button type="button" class="btn-close" data-dismiss="modal"
					aria-label="Close" onclick="window.location.reload()"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">

					<div style="margin-bottom: 20px; margin-left: 18px;">
						<i class="fas fa-bullseye"></i>보임/숨김 설정
					</div>
					<div class="container-fluid">
						<div class="row row-eq-height ">
							<c:forEach items="${WidgetYN }" var="list">
								<div class="col-4 widget">
									<div class="card p-3 h-100">
										<div class="card-header d-flex"
											style="background: #f1f1f1; justify-content: end;">
											<label class="row" style="margin-right: 1px;"> <span
												class="col-auto"> <label
													class="form-check form-check-single form-switch"
													style="padding-left: 0;"> <c:if
															test="${list.wo_actvyn eq 'Y'}">
															<input class="form-check-input" name="checked"
																type="checkbox" checked
																onclick="widgetYN('${list.wo_empid}',${list.wo_wgno },this)">
														</c:if> <c:if test="${list.wo_actvyn ne 'Y'}">
															<input class="form-check-input" name="checked"
																type="checkbox"
																onclick="widgetYN('${list.wo_empid}',${list.wo_wgno },this)">
														</c:if>
												</label>
											</span>
											</label> ${list.wg_nm }
										</div>
									</div>
								</div>
							</c:forEach>
							<div class="d-flex" style="justify-content: flex-end;">
								<a href="#" onclick="window.location.reload()"
									class="btn  w-200" data-dismiss="modal"> 닫기 </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>




$( document ).ready(function() {
	setInterval(function(){
	    document.getElementById("time_now").innerHTML = formatTime();
	},1000);

	function formatTime() {
	var d = new Date(),
	    minutes = d.getMinutes().toString().length == 1 ? '0'+d.getMinutes() : d.getMinutes(),
	    hours = d.getHours().toString().length == 1 ? '0'+d.getHours() : d.getHours(),
	    ampm = d.getHours() >= 12 ? 'pm' : 'am',
	    months = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    days = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];
	    
	return '<h2">'+hours+'<span>:'+minutes+'</span>'+ampm+'&nbsp;'+days[d.getDay()]+'</h2>' 
	}
	
	
	$.getJSON("http://api.openweathermap.org/data/2.5/forecast?id=1835224&appid=68e36c603f5e38a040bcbed41ccdeffc&units=metric",function(data){
	    var Comparetemp = data.list[0].dt_txt
	    var Comparevalue = Comparetemp.substring(8,10)
	    var Comparetemp2 = ""
	    var Comparevalue2 =""
		
	    var temp = ""
	    var value = ""
		var tempMax = ""
		var tempMin = ""
		var humidity = ""
		var wind = ""
		var hpa = ""
		var icon = ""
		
	    for(var i=0; i<data.list.length; i++){
	    	Comparetemp2 = data.list[i].dt_txt
	    	Comparevalue2 = Comparetemp2.substring(8,10)
	    	
	    if(Comparevalue2 == Comparevalue ){
		    var code=""
	    	temp = data.list[i].dt_txt
	    	value = temp.substring(10);
			
	    	icon = data.list[i].weather[i].icon;
	    	
	    	code += '<div class="row">'
	    	code += '<div class="sm-days columns">'
	    	code += ' <div class="day">'+value+'</div>'
<%-- 	    	code += '<div class="day-weather-icon"><img src='+'"<%=request.getContextPath()%>/resources/img/'+icon+'.svg>" '</div>' --%>
	    	code += ' <div class="day-weather-info"></div></div></div>'
	   	 	}
	    }
		$('.current-city-day').append(code)					

	    
<%-- 		$('.icons').append('<img style="height:12em;" src="<%=request.getContextPath()%>/resources/img/'+icon+'.svg"/>'); --%>
	})
	
	
	//실시간 날씨
	$.getJSON("https://api.openweathermap.org/data/2.5/weather?q=daejeon&appid=68e36c603f5e38a040bcbed41ccdeffc&units=metric",function(data){
	    
		var temp = data.main.temp;
		var tempMax = data.main.temp_max;
		var tempMin = data.main.temp_min;
		var humidity = data.main.humidity;
		var wind = data.wind.speed;
		var hpa = data.main.pressure;
		var icon = data.weather[0].icon;
		$('.temp').append(temp);
		$('#temp-max').append(tempMax);
		$('#temp-min').append(tempMin);
		$('#humidity').append(humidity+"%");
		$('#wind').append(wind);
		$('#hpa').append(hpa);
		$('#weather-icon-display').append('<img style="height:7em;" src="<%=request.getContextPath()%>/resources/img/'+icon+'.svg"/>');
		$('.current-city-day').append('<img style="height:9em;" src="<%=request.getContextPath()%>/resources/img/'+icon+'.svg"/>');
		
		
	})
	
});





	function NtcGo(ntcno){
		location.href="<%=request.getContextPath()%>/notice/detail.do?ntc_no="+ntcno;
	}

	function PostGo(postNo,brdno){
		var NowPage = 1
		var value = 2
		
		
		location.href="<%=request.getContextPath() %>/post/detail.do?post_no="+postNo+"&NowPage="+NowPage+"&value="+value;
		
		<!-- 혹시 다른 번호 게시판이 안나올 수 있음 brdno 쓴이유-->
<%-- 		location.href ="<%=request.getContextPath()%>/post/detail.do?post_no="+postNo+"&post_brdno="+brdno; --%>
		
	}
	function ReceiverGo(tascNo,form){
		location.href="<%=request.getContextPath()%>/task/receivedetail.do?tasc_no="+tascNo+"&from="+form;
	}	
	
	function widget(id,no,check,N){
		var empid = id
		var wgno = no
		
		$.ajax({
			url : '<%=request.getContextPath()%>/widgetord/remove.do',
			type : 'post',
			data : {
						wo_empid : empid,
						wo_actvyn : N,
						wo_wgno : wgno
						
					},
			success:function(){
				$(check).parents('.col-4.widget').remove();
			}
			
		})
	}
	function widgetYN(id,no,check){
		var Yn = $(check).prop('checked')
		
		if(Yn == true){
			Yn = 'Y'
		}else{
			Yn = 'N'
		}
		
		var empid = id
		var wgno = no
		
		$.ajax({
			url : '<%=request.getContextPath()%>/widgetord/remove.do',
			type : 'post',
			data : {
						wo_empid : empid,
						wo_actvyn : Yn,
						wo_wgno : wgno
						
					},
			success:function(){
			}
			
		})
	}
	function openModalYN(){
			$('#modal-WidgetYN').modal({backdrop:'static',keyboard:false},'show')
	}
	function Weather(){
		$('#modal-Weather').modal('show');
	}
</script>


<%@ include file="mainWidgetModal.jsp"%>
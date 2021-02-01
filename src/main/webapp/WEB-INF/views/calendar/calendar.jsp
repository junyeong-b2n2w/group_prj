<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<title>일정관리</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.css">
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/main.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.0/locales-all.min.js"></script>
	<script>
		var result; 
		var clickDate;
		document.addEventListener('DOMContentLoaded', function() {
			createCalendar();
 		});
		
		var calendar;
		
 		function createCalendar(){
			var calendarEl = document.getElementById('calendar');
			var data = eventData("");
			calendar = new FullCalendar.Calendar(calendarEl, {
				headerToolbar: {
					left: 'prevYear,prev,next,nextYear today',  	// 각각 전후 이동 (Year붙은거는 1년단위 ) (안건드려도 될듯 (위에 버튼표시))
					center: 'title', 								// 현재 날짜  
					right: 'dayGridMonth,dayGridWeek,dayGridDay' 	// 안건드려도 될듯 (보는 방식 표시)
				},
				
				navLinks: true,				// 년/월/일 버튼 이벤트
				editable: false, 			// 등록된 스케줄 옮기기
				selectable : false, 		// 달력에서 드래그
				dayMaxEvents: true, 		// 달력상의 셀 크기보다 많은 이벤트가 등록되어 있을 경우 more로 표시
				locale: 'ko', 				// 한국어로 설정 위에 로컬 js 가져와야함
				dateClick:  function (info) {
					inputRemove();
					clickDate = info.dateStr;
					
					$('#modal-team').modal('show');
					
					$('input[name="startDate"]').val(clickDate);
					$('input[name="endDate"]').val(clickDate);
				}, // 날짜 클릭시 옵션 , 이부분에 등록할 이벤트 폼짜서 ajax날려서 성공하면 캘린더에 이벤트 등록해주는 식으로 하면 될듯?
				datesSet: function (){
					ymFormat();
				},
				events: data,
				eventClick: function(info) {
// 					console.log(calendar.getEventById(info.event.id).toPlainObject().extendedProps.content);

					var start = calendar.getEventById(info.event.id).start;
					var end = calendar.getEventById(info.event.id).end;
					var user = calendar.getEventById(info.event.id).toPlainObject().extendedProps.user;
					
					$('#view-modal').modal('show');
					
					$('#modal-team input[name="calId"]').val(info.event.id);
					$('input[name="deleteNo"]').val(info.event.id);
					$('input[name="register"]').val(user);
					$('#calTitle').text(calendar.getEventById(info.event.id).title);
					
// 					date
					if(!end){
						start = ymdFormat(start);
						$('#calDt').text(start);
					} else{
						start = ymdNTimeFormat(start);
						end = ymdNTimeFormat(end);
						
						if(start.substr(11, 15) == "00:00:00" && end.substr(11, 15) == "23:59:00"){
							start = ymdFormat(start);
							end = ymdFormat(end);
							
							$('#calDt').text(start + " ~ " + end);
						} else{
							$('#calDt').text(start + " ~ " + end);
						}
					}
					
// 					place
					if(calendar.getEventById(info.event.id).toPlainObject().extendedProps.place == null	){
						$('#calPlace').text(" - ");
					}else{
						$('#calPlace').text(calendar.getEventById(info.event.id).toPlainObject().extendedProps.place);
					}
					
// 					content
					if(calendar.getEventById(info.event.id).toPlainObject().extendedProps.content == null	){
						$('#calContent').text(" - ");
					}else{
						$('#calContent').text(calendar.getEventById(info.event.id).toPlainObject().extendedProps.content);
					}
					
// 					url
					if(calendar.getEventById(info.event.id).toPlainObject().extendedProps.contUrl == null){
						$('#calUrl').val(" - ");
					}else{
						$('#calUrl').val(calendar.getEventById(info.event.id).toPlainObject().extendedProps.contUrl);
					}
					
					if($('input[name="register"]').val() != "${loginUser.emp_id}"){
						$('#modifyBtn').addClass("d-none");
						$('#udtCancel').addClass("d-none");
					}else{
						$('#modifyBtn').removeClass("d-none");
						$('#udtCancel').removeClass("d-none");
					}
				}
			});
		
// 			typeCheck
			$('input[name="type"]').on('click', function() {
				ymFormat();
			});
			
			calendar.render();
 		}
// 		function

 		function eventData(data) {
 			var result = data;
			return result;
		}
		
		function ymFormat() {
			var date = calendar.getDate();
			
			var year = date.getFullYear();
			var month = new String(date.getMonth()+1);
			
			if(month.length == 1){ 
				month = "0" + month; 
			}
			
			var yearMonth = year + "-" + month;
			
			sendDate(yearMonth, typeList());
		}
 		
 		function ymdFormat(date) {
 			var year = date.getFullYear();
			var month = new String(date.getMonth()+1);
			var day = new String(date.getDate()); 
			
			if(month.length == 1){ 
				month = "0" + month; 
			}
			if(day.length == 1){ 
				  day = "0" + day; 
			} 
			
			return date = year + "-"  + month + "-" + day;
		}
 		
 		function ymdNTimeFormat(date) {
 			var year = date.getFullYear();
			var month = new String(date.getMonth()+1);
			var day = new String(date.getDate()); 
			var hour = new String(date.getHours());
			var min = new String(date.getMinutes());
			
			if(month.length == 1){ 
				month = "0" + month; 
			}
			if(day.length == 1){ 
				  day = "0" + day; 
			} 
		    if(hour.length == 1) {
		    	hour = '0' + hour;
		    }
		    if(min.length == 1){
		    	min = '0' + min;
		    }
			
			return date = year + "-" + month + "-" + day + " " + hour + ":" + min;
		}

// 		타입 리스트
		function typeList() {
			var list = [];
 			
 			$('input[name="type"]:checked').each(function () {
 				list.push($(this).val());
			});
 			return list;
		}
		
// 		날짜 보내기
		function sendDate(date, list) {
			eArr = calendar.getEvents();
			
			for(var i=0; i < eArr.length; i++){
				eArr[i].remove();
			}
			
			$.ajax({
 				url : 'getCalendarList',
 				type : 'post',
				data : {
						"date" : date,
						"typeList" : list
						},
				success : function(list) {
					$(list).each(function (i ,cal) {
						calendar.addEvent(success(cal.cal_no, cal.cal_id, cal.cal_title, cal.cal_cont, cal.cal_color, cal.cal_satdt, cal.cal_enddt, cal.cal_rel, cal.cal_url, cal.cal_place, cal.cal_ntfcyn));
					});
				}
			});
		}
		
		function success(cal_no, cal_id, cal_title, cal_content, cal_color, cal_start, cal_end, cal_rel, cal_url, cal_place, cal_ntfcyn) {
			var result; 
			
			if(cal_rel == "person"){
				cal_title = "[개인] " + cal_title;
			} else if(cal_rel == "dept"){
				cal_title = "[부서] " + cal_title;
			} else{
				cal_title = "[전체] " + cal_title;
			}
			                                     
			if(cal_start.substr(0, 10) == cal_end.substr(0, 10) && ((cal_start.substr(11, 15) == "00:00:00" && cal_end.substr(11, 15) == "23:59:00") || (cal_start.substr(11, 15) == "00:00" && cal_end.substr(11, 15) == "23:59"))){
				result = {
					id : cal_no,
					user : cal_id,
					title : cal_title,
					content : cal_content,
					start : cal_start.substr(0, 10),
					color : cal_color,
					place : cal_place,
					contUrl : cal_url,
					yn : cal_ntfcyn
				}	
			} else{
				result = {
					id : cal_no,
					user : cal_id,
					title : cal_title,
					content : cal_content,
					start : cal_start,
					end : cal_end,
					color : cal_color,
					place : cal_place,
					contUrl : cal_url,
					yn : cal_ntfcyn
				}
			}
			return result;
		}
		
// 		일정 추가
		function addCalendar(startDate, endDate) {
			var title = $('input[name="title"]').val();
			var content = $('#content').val();
			var place = $('input[name="place"]').val();
			var color = $('input[name="color"]:checked').val();
			var release = $('select[name="release"]').val();
			var notification = $('input[name="notification"]').prop('checked');
			var url = $('input[name="url"]').val();
			
			if(notification == true){
				notification = 'y';
			}else{
				notification = 'n';
			}
			
			$.ajax({
 				url : 'registCalendar',
 				type : 'post',
				data : {
						"cal_title" : title,
						"cal_cont" : content,
						"cal_color" : color,
						"cal_satdt" : startDate,
						"cal_enddt" : endDate,
						"cal_rel" : release,
						"cal_ntfcyn" : notification,
						"cal_place" : place,
						"cal_url" : url
						},
				success : function(cal) {
					alert("일정이 추가되었습니다.");
					
					if(cal.cal_rel == "person"){
						$('input[value="person"]').prop("checked", true);
					}else if(cal.cal_rel == "dept"){
						$('input[value="dept"]').prop("checked", true);
					}else{
						$('input[value="all"]').prop("checked", true);
					}
					ymFormat();
				},
				error : function (data) {
					alert("일정 등록에 실패했습니다.");
				}
			});
		}
		
// 		일정 수정
		function udtCalendar(startDate, endDate) {
			var no = $('#modal-team input[name="calId"]').val();
			var title = $('input[name="title"]').val();
			var content = $('#content').val();
			var place = $('input[name="place"]').val();
			var color = $('input[name="color"]:checked').val();
			var release = $('select[name="release"]').val();
			var notification = $('input[name="notification"]').prop('checked');
			var url = $('input[name="url"]').val();
			
			if(notification == true){
				notification = 'y';
			}else{
				notification = 'n';
			}
			
			$.ajax({
 				url : 'updateCalendar',
 				type : 'post',
				data : {
						"cal_no" : no,
						"cal_title" : title,
						"cal_cont" : content,
						"cal_color" : color,
						"cal_satdt" : startDate,
						"cal_enddt" : endDate,
						"cal_rel" : release,
						"cal_ntfcyn" : notification,
						"cal_place" : place,
						"cal_url" : url
						},
				success : function(cal) {
					alert("일정이 수정되었습니다.");
					ymFormat();
				},
				error : function (data) {
					alert("일정 수정에 실패했습니다.");
				}
			});
		}
		
// 		모달 초기화
		function inputRemove() {
			$('#udtCalendar').text("일정 추가");		
	
			$('input[name="title"]').val("");
			$('#content').val("");
			$('input[name="place"]').val("");
			$('input[value="#206BC4"]').prop("checked", true);
			$('select[name="release"]').val("person").attr("selected", true);
			$('input[name="notification"]').prop('checked', false);
			$('input[name="url"]').val("");
			
			$('.modal-title').text('일정 추가');
			$('#udtCalendar').attr("id", "addCalendar");
		}			
		
// 		onload
		window.onload=function() {

// 			상단 일정 추가 버튼 > 모달에 오늘 날짜 띄우기
			$('#addButton').on('click', function() {
				var date = new Date(); 
				var year = date.getFullYear(); 
				var month = new String(date.getMonth()+1); 
				var day = new String(date.getDate()); 

				if(month.length == 1){ 
				  month = "0" + month; 
				} 
				if(day.length == 1){ 
				  day = "0" + day; 
				} 
				
				today = year + "-" + month + "-" + day;

				$('#modal-team').modal('show');
				
				$('input[name="startDate"]').val(today);
				$('input[name="endDate"]').val(today);
			})
			
			var dtType = $('input[name="dtType"]');
			$(dtType).on('change', function() {
				
				if($(this).val() == "calDate"){
					$('.toggle').addClass("d-none");
					$('input[name="startTime"]').val("00:00");
					$('input[name="endTime"]').val("23:59");
				} else{
					$('.toggle').removeClass("d-none");
					$('input[name="startTime"]').val("");
					$('input[name="endTime"]').val("")
				}
			});
			
// 			일정 추가 버튼 클릭 > 빈 칸 검사
			$('#addCalendar, #udtCalendar').on('click', function() {
				var startDate = $('input[name="startDate"]').val();
				var endDate = $('input[name="endDate"]').val();
				var startTime = $('input[name="startTime"]').val();
				var endTime = $('input[name="endTime"]').val();
				
				if(startTime == ""){
					alert("시작 시간을 입력해주세요.");
					return;
				}
				
				if(endTime == ""){
					alert("종료 시간을 입력해주세요.");
					return;
				}
				
				if(startDate > endDate){
					alert("시작 날짜는 종료 날짜보다 이후일 수 없습니다.");
					return;
				}
				
				if(startDate == endDate && startTime > endTime){
					alert("시작 시간은 종료 시간보다 이후일 수 없습니다.");
					return;
				}
				
				if($(this)[0].id == "addCalendar"){
					addCalendar((startDate +" "+ startTime), (endDate +" "+ endTime));
				} else{
					udtCalendar((startDate +" "+ startTime), (endDate +" "+ endTime));
				}
				
				inputRemove();
				$('#modal-team').modal('hide');
			});
			
			$('#calUdt').on('click', function() {
// 				console.log(calendar.getEventById(info.event.id).toPlainObject().extendedProps.content);
				$('#view-modal').modal('hide');
				$('#modal-team').modal('show');
				
				$('.modal-title').text('일정 수정');
				
				var id = $('#modal-team input[name="calId"]').val();
				var event = calendar.getEventById(id);
				var rel = event.title.substr(1, 2);
				
				var start = event.start;
				var end = event.end;
				
// 				시간 
				if(!end){
					start = ymdNTimeFormat(start);
					end = start.substr(0, 11) + "23:59";
					
					$('input[name="startDate"]').val(start.substr(0, 10));
					$('input[name="startTime"]').val(start.substr(11, 15));
					$('input[name="endDate"]').val(end.substr(0, 10));
					$('input[name="endTime"]').val(end.substr(11, 15));
					
					$('input[value="calDate"]').prop("checked", true);
					$('.toggle').addClass("d-none");
					
				} else{
					start = ymdNTimeFormat(start);
					end = ymdNTimeFormat(end);
				}
				
				$('input[name="startDate"]').val(start.substr(0, 10));
				$('input[name="startTime"]').val(start.substr(11, 15));
				$('input[name="endDate"]').val(end.substr(0, 10));
				$('input[name="endTime"]').val(end.substr(11, 15));
				
				$('input[name="title"]').val(event.title.substr(5));
// 				------------
				
// 				내용
				$('#content').val(event.toPlainObject().extendedProps.content);
				
// 				색깔
				$('input[value="' +event._def.ui.backgroundColor+ '"]').prop("checked", true);

// 				장소
				$('input[name="place"]').val(event.toPlainObject().extendedProps.place);
				
// 				url
				$('input[name="url"]').val(event.toPlainObject().extendedProps.url);
				
				if(rel == "개인"){
					$('select[name="release"]').val("person").attr("selected", true);
				}else if(rel == "부서"){
					$('select[name="release"]').val("dept").attr("selected", true);
				}else{
					$('select[name="release"]').val("all").attr("selected", true);
				}
				
// 				알림
				if(event.toPlainObject().extendedProps.yn = "y"){
					$('input[name="notification"]').prop("checked", true);
				}
				
// 				버튼
				$('#addCalendar').attr("id", "udtCalendar");
				$('#udtCalendar').text("일정 수정");
				$('#clean').attr("id", "udtCancel");
				$('#udtCancel').text("취소");
			})	//일정 수정 모달
			
			$('#modal-team').on('click', '#udtCancel',function () {
				$('#modal-team').modal('hide');
			});
			
			$('#clean').on('click', function() {
				inputRemove();
				
				$('input[name="startDate"]').val(clickDate);
				$('input[name="endDate"]').val(clickDate);
			});
			
			$('#delete').on('click', function() {
				var yn = confirm("일정을 삭제하시겠습니까?");
				var no = $('input[name="deleteNo"]').val();
				
				if(yn){
					$.ajax({
		 				url : 'deleteCalendar',
		 				type : 'post',
						data : {
								"cal_no" : no
								},
						success : function(data) {
							alert("일정이 삭제되었습니다.");
							calendar.getEventById(no).remove();
						},
						error : function (data) {
							alert("일정 삭제에 실패했습니다.");
						}
					});
					$('#view-modal').modal('hide');
				}
			})
			
// 			모달 닫기
			$('.btn-close').on('click', function() {
				inputRemove();
				$('#modal-team').modal('hide');
				$('#view-modal').modal('hide');
			});
		}
	</script>
	
	</head>
		<div class="content">
			<div class="container">
				<div class="page-header d-print-none">
					<div class="row align-items-center">
						<div class="col  d-flex justify-content-between">
							<div class="">
								<h3 class="page-title">일정</h3>
							</div>
							<div class="">
		                        <label class="form-check form-check-inline">
			                        <input class="form-check-input" type="checkbox" name="type" value="person" checked="" >
			                        <span class="form-check-label">개인 일정</span>
		                        </label>
		                        <label class="form-check form-check-inline">
			                        <input class="form-check-input" type="checkbox" name="type" value="dept">
			                        <span class="form-check-label">부서 일정</span>
		                        </label>
		                        <label class="form-check form-check-inline">
			                        <input class="form-check-input" type="checkbox" name="type" value="all">
			                        <span class="form-check-label">회사 일정</span>
		                        </label>
	                        </div>
							<div class="">
								<button class="btn btn-primary w-full"  id="addButton">일정 추가</button>
							</div>
						</div>
					</div>
				</div>
				<div class="">
					<div id='calendar'></div>
				</div>
			</div>
		</div>
		
	<!-- modal -->
<!-- 	 data-backdrop="static" data-keyboard="false" -->
		<div class="modal modal-blur fade" id="modal-team" tabindex="-1" role="dialog" aria-modal="true" style="display: none; overflow-y: scroll;" data-backdrop="static" >
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">일정 추가</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="row mb-3 align-items-end">
							<div class="col">
								<input type="hidden" name="calId">
								<label class="form-label">제목</label> 
								<input type="text" class="form-control" name="title" >
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">장소</label> 
								<input type="text" class="form-control" name="place">
							</div>
						</div>
						<div class="mb-3">
							<label class="form-label">색상</label>
							<div class="row g-2">
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#206BC4" class="form-colorinput-input" checked>
										<span class="form-colorinput-color bg-blue"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput">
										<input name="color" type="radio" value="#4299E1" class="form-colorinput-input">
										<span class="form-colorinput-color bg-azure"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#6574CD" class="form-colorinput-input">
										<span class="form-colorinput-color bg-indigo"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#9F7AEA" class="form-colorinput-input">
										<span class="form-colorinput-color bg-purple"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#ED64A6" class="form-colorinput-input">
										<span class="form-colorinput-color bg-pink"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#E53E3E" class="form-colorinput-input">
										<span class="form-colorinput-color bg-red"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#ED8936" class="form-colorinput-input">
										<span class="form-colorinput-color bg-orange"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#FAB005" class="form-colorinput-input">
										<span class="form-colorinput-color bg-yellow"></span>
									</label>
								</div>
								<div class="col-auto">
									<label class="form-colorinput"> 
										<input name="color" type="radio" value="#82C91E" class="form-colorinput-input">
										<span class="form-colorinput-color bg-lime"></span>
									</label>
								</div>
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<label class="form-label">날짜</label>
							<div class="row mb-3" id="dateSetting">
								<div class="col-2">시작</div>
								<div class="col-5">
									<input id="calendar-time" type="date" class="form-control" placeholder="Select a date" name="startDate" required>
								</div>
								<div class="col-5">
									<input id="calendar-time" type="time" class="form-control toggle" placeholder="Select a date" name="startTime" required>
								</div>
							</div>
							
							<div class="row" id="dateSetting">
								<div class="col-2">종료</div>
								<div class="col-5">
									<input id="calendar-time" type="date" class="form-control" placeholder="Select a date" name="endDate">
								</div>
								<div class="col-5">
									<input id="calendar-time" type="time" class="form-control toggle" placeholder="Select a date" name="endTime">
								</div>
							</div>
						</div>
						
						<div class="mb-3 ml-7 d-flex justify-content-end">
							<label class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="dtType" id="calTime" value="calTime" checked="checked">
                              <span class="form-check-label">시간</span>
                            </label>
							<label class="form-check form-check-inline">
                              <input class="form-check-input" type="radio" name="dtType" id="calDate" value="calDate">
                              <span class="form-check-label">하루종일</span>
                            </label>
						</div>
		
						<div class="mb-3">
							<label class="form-label">내용</label>
							<textarea class="form-control" id="content"></textarea>
						</div>
						
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">URL</label> 
								<input type="url" class="form-control" name="url">
							</div>
						</div>
		
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">공개범위</label>
								<div class="input-icon mb-3">
									<select class="form-select" name="release">
										<option value="person" selected="selected">개인</option>
										<option value="dept">부서</option>
										<option value="all">전체</option>
									</select>
								</div>
							</div>
						</div>
		
						<div class="row mb-3 align-items-end">
							<div class="col row">
								<div class="col-12 d-flex justify-content-end">
									<label class="form-check form-switch"> 
										<input class="form-check-input" type="checkbox" name="notification">
										<span class="form-check-label">나에게 미리 알림</span>
									</label>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn me-auto" data-bs-dismiss="modal" id="clean">초기화</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="addCalendar">일정추가</button>
					</div>
				</div>
			</div>
		</div>
		
<!-- 	view modal -->
		<div class="modal modal-blur fade" id="view-modal" tabindex="-1" role="dialog" aria-modal="true" style="display: none;">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					<div class="modal-body">
						<div class="row mb-3 align-items-end">
							<div class="col row">
								<input type="hidden" name="deleteNo">
								<input type="hidden" name="register">
								<label class="form-label" style="display: inline-block; width: 100px;">제목</label>
								<span id="calTitle"></span>
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">장소</label>
								<span id="calPlace"></span> 
							</div>
						</div>
						<div class="row mb-3 align-items-end">
							<label class="form-label">일시</label>
							<span id="calDt"></span>
						</div>
						
						<div class="mb-3">
							<label class="form-label">내용</label>
							<span id="calContent"></span>
						</div>
						
						<div class="row mb-3 align-items-end">
							<div class="col">
								<label class="form-label">URL</label> 
								<input type="url" class="form-control" id="calUrl" readonly="readonly" style="border: none; background-color: #FBFBFB;">
							</div>
						</div>
					</div>
					<div class="modal-footer" id="modifyBtn">
						<button type="button" class="btn me-auto" data-bs-dismiss="modal" id="delete">삭제</button>
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal" id="calUdt">일정 수정</button>
					</div>
				</div>
			</div>
		</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Medic</title>
<c:import url="common/idxHeader.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Medic</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/index.do"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li class="active">Main</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-1"></div>

					<section class="col-md-3">
						<!-- Profile Image -->
						<div class="box box-primary" id="attitude">
							<div class="box-body box-profile">
								<h3 class="profile-username text-center">${m.empName }</h3>

								<p class="text-muted text-center">${m.deptTitle}-
									${m.jobTitle }</p>

								<ul class="list-group list-group-unbordered">
									<li class="list-group-item"><b>최근출근시간</b> <a
										class="pull-right"> ${m.todayAttend }</a></li>
									<li class="list-group-item"><b>최근퇴근시간</b> <a
										class="pull-right">${m.todayLeave }</a></li>

								</ul>
									
								<a
									href="#"
									class="btn btn-primary attend"><b>출근</b></a> <a
									href="#"
									class="btn btn-primary leave"><b>퇴근</b></a> <a
									href="${pageContext.request.contextPath}/attendance/attendListOne.do?empNo=${m.empNo}"
									class="btn btn-primary"><b>나의 근태조회</b></a>
						
							</div>
						</div>
		
						
						
						<div class="box box-solid" id="dragEvent" style="display: none;">
							<div class="box-header with-border">
								<h4 class="box-title">일정 목록</h4>
							</div>
							<div class="box-body">
								<!-- the events -->
								<div id="external-events">
									<div class="external-event bg-green">회의</div>
									<div class="external-event bg-yellow">업무1</div>
									<div class="external-event bg-aqua">업무2</div>
									<div class="external-event bg-light-blue">업무3</div>
									<div class="external-event bg-red">휴식</div>
									<div class="checkbox">
										<label for="drop-remove"> <input type="checkbox"
											id="drop-remove"> 이동 후 삭제
										</label>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->
						<div class="box box-solid" id="createEvent" style="display: none;">
							<div class="box-header with-border">
								<h3 class="box-title">일정 생성</h3>
							</div>
							<div class="box-body">
								<div class="btn-group" style="width: 100%; margin-bottom: 10px;">
									<!--<button type="button" id="color-chooser-btn" class="btn btn-info btn-block dropdown-toggle" data-toggle="dropdown">Color <span class="caret"></span></button>-->
									<ul class="fc-color-picker" id="color-chooser">
										<li><a class="text-aqua" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-light-blue" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-teal" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-yellow" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-orange" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-green" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-lime" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-red" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-purple" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-fuchsia" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-muted" href="#"><i
												class="fa fa-square"></i></a></li>
										<li><a class="text-navy" href="#"><i
												class="fa fa-square"></i></a></li>
									</ul>
								</div>
								<!-- /btn-group -->
								<div class="input-group">
									<input id="new-event" type="text" class="form-control"
										placeholder="Event Title">
									<div class="input-group-btn">
										<button id="add-new-event" type="button"
											class="btn btn-primary btn-flat">Add</button>
									</div>
									<!-- /btn-group -->
								</div>
								<!-- /input-group -->
							</div>
						</div>

						<!-- TO DO List -->
						<div class="box box-primary" id="todoList">
							<div class="box-header">
								<i class="ion ion-clipboard"></i>

								<h3 class="box-title">해야할 일</h3>
								<button type="button" class="btn btn-default pull-right" id="addItem">
									<i class="fa fa-plus"></i> 추가
								</button>
								<button type="button" class="btn btn-default pull-right" id="confItem" style="display: none;">
									완료
								</button>
								
							</div>
							<div align="center" id="insertTodo" style="display: none;">
								<input type="text" name="todo" placeholder="할일" required id="todoVal"/>&nbsp;
								<button class="btn btn-outline-success" id="todoSave">저장</button>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
								<ul class="todo-list" id="todo-list">
									<li>
										<span class="text">Design a nice theme</span> <!-- Emphasis label -->
										<div class="tools">
											<i class="fa fa-trash-o"></i>
										</div>
									</li>
								</ul>
							</div>
							<!-- /.box-body -->
							
						</div>
						<!-- /.box -->
						
							<!-- Notice List -->
						<div class="box box-primary" id="noticeList">
							<div class="box-header">
								<i class="ion ion-clipboard"></i>

								<h3 class="box-title">공지사항</h3>
								<button type="button" class="btn btn-default pull-right" id="goNoticeList">
									<i class="fa fa-plus">More</a></i> 
								</button>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
								<ul class="todo-list" id="notice-list">
								</ul>
							</div>
							<!-- /.box-body -->
							
						</div>
						<!-- /.box -->
						
						
					</section>
					<!-- /.Left col -->

					<!-- right col (We are only adding the ID to make the widgets sortable)-->
					<section class="col-md-8">

						<div class="box box-primary">
							<div class="box-body no-padding">
								<div id="calendarTrash" class="calendar-trash" style="display: none;">
									<img src="${pageContext.request.contextPath}/resources/images/trash.png" />
								</div>
								<!-- THE CALENDAR -->
								<div id="calendar">
									<button id="add-new-schedule" type="button"
										class="btn btn-primary btn-flat" style="float: right;">일정
										수정</button>
									<button id="confirm-schedule" type="button"
										class="btn btn-primary btn-flat"
										style="float: right; display: none;">수정 완료</button>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /. box -->

					</section>
					<!-- right col -->

				</div>
				<!-- /.row (main row) -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<c:import url="common/footer.jsp" />
		<c:import url="common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="common/idxScripts.jsp" />
	<script>
		var selector = 0;

		var list = JSON.parse('${schList}'); // schList 결과 (자바스크립트 객체)를 문자열로 변환하여 list에 담음
		var myDataList = [];
		console.log(list);
		
		// 날짜 변환 함수
		function myDateConverter(data){ // return된 날짜 잘라서 Date형식으로 집어넣으려고 만듬
			var month = data.split("월")[0];
			var day = data.split(" ")[1].split(",")[0];
			var year = data.split(", ")[1];
			
			// console.log(month + ", " + day + ", " +  year); 
			
			return new Date(year, month-1, day); // month 배열형식으로들어가서 -1 해줘야 +1월안됨
		}
		
		// rgb값 16비트로 변환하는 함수 // 필요없음 16비트로 안바꿔도 rgb값 가져와서 인식하네요
		function rgbToHex(rgbType){ 
	        // 컬러값과 쉼표만 남기고 삭제. 
	        var rgb = rgbType.replace( /[^%,.\d]/g, "" ); 
	        // 쉼표(,)를 기준으로 분리해서, 배열에 담기. 
	        rgb = rgb.split( "," ); 
	        // 컬러값이 "%"일 경우, 변환하기. 
	        for ( var x = 0; x < 3; x++ ) { 
	                if ( rgb[ x ].indexOf( "%" ) > -1 ) rgb[ x ] = Math.round( parseFloat( rgb[ x ] ) * 2.55 ); 
	        } 
	        // 16진수 문자로 변환. 
	        var toHex = function( string ){ 
	                string = parseInt( string, 10 ).toString( 16 ); 
	                string = ( string.length === 1 ) ? "0" + string : string; 

	                return string; 
	        }; 
	        var r = toHex( rgb[ 0 ] ); 
	        var g = toHex( rgb[ 1 ] ); 
	        var b = toHex( rgb[ 2 ] ); 

	        var hexType = "#" + r + g + b; 

	        return hexType; 
		} 

		
		
		for(var i in list){
			
			var obj = {};
			obj._id = list[i].scno;
			obj.title = list[i].sccontent;
			obj.start = myDateConverter(list[i].scstart);
			if(list[i].scend != null){
				obj.end = myDateConverter(list[i].scend);
				console.log(obj.end);
			}
			//obj.empno = list[i].empno;
			obj.allDay = true;
			obj.backgroundColor = list[i].backcolor;
			obj.borderColor = list[i].bordercolor
			
			myDataList.push(obj);
		}
		
		
		$('#add-new-schedule').on('click', function() {
			$('#createEvent').css('display', 'block');
			$('#dragEvent').css('display', 'block');
			$('#add-new-schedule').css('display', 'none');
			$('#confirm-schedule').css('display', 'block');
			$('#attitude').css('display','none');
			$('#todoList').css('display','none');
			$('#noticeList').css('display','none');
			$('#calendarTrash').css('display','block');
			$('#calendar').fullCalendar('option', 'editable', true);
		});

		$('#confirm-schedule').on('click', function() {
			$('#confirm-schedule').css('display', 'none');
			$('#createEvent').css('display', 'none');
			$('#dragEvent').css('display', 'none');
			$('#add-new-schedule').css('display', 'block');
			$('#attitude').css('display','block');
			$('#todoList').css('display','block');
			$('#noticeList').css('display','block');
			$('#calendarTrash').css('display','none');
			$('#calendar').fullCalendar('option', 'editable', false);
		});
		
		$('#goNoticeList').on('click', function(){
			location.href = "${pageContext.request.contextPath}/notice/noticeList.do";
		});
		
		$('#addItem').on('click', function(){
			$('#insertTodo').css('display','block');
			$('#addItem').css('display','none');
			$('#confItem').css('display','block');
		});
		
		$('#confItem').on('click', function(){
			$('#insertTodo').css('display','none');
			$('#addItem').css('display','block');
			$('#confItem').css('display','none');
		});
		
		$('#todoSave').on('click', function(){
			
			$.ajax({
				url : "${pageContext.request.contextPath}/todo/insertTodo.do",
				data : {
					todo : $('#todoVal').val()
				},
				success : function(data) {
					console.log("성공");
					console.log(data);
				},
				error : function(data) {
					console.log(data);
				}
			});
			
		});
		
		

		$(function() {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/todo/todo.do",
				type : "get",
				success : function(data){
					console.log(data);
					var $ul = $('#todo-list');
					for(var i in data){
						// 내용을 담을 li 태그 생성
						var $li = $('<li>');
						// 내용을 각각 표현할 span 태그 생성
						var $spanTodoNo = $('<span class="text" style="display:none">').text(data[i].todoNo);
						var $spanTodo = $('<span class="text">').text(data[i].todo);
						var $divtools = $('<div class="tools">');
						var $trash = $('<i class="fa fa-trash-o">');
						
						$divtools.append($trash);
						$li.append($spanTodoNo).append($spanTodo).append($divtools);
						$ul.append($li);
					}
					
					// 삭제버튼누르는걸로 변경
					$('#todo-list li div i').on('click', function(){
						var todoNo = $(this).parents('#todo-list li').children().html();
						console.log(todoNo);
						$.ajax({
							url : "${pageContext.request.contextPath}/todo/deleteTodo.do",
							type : "get",
							data : {
								todoNo : todoNo
							},
							success : function(data){
								console.log("삭제 성공!");
								console.log(data);
							}, error : function(data){
								console.log("삭제 실패!");
								console.log(data);
							}
						})
						
					});
					
				}, error : function(data) {
					console.log("조회 실패!");
					console.log(data);
				}
			});
			
			
			
				$.ajax({
					url : "${pageContext.request.contextPath}/notice/noticeTop5.do",
					type : "get",
// 					async : false,
					success : function(data){
						console.log(data);
						var $ul = $('#notice-list');
						for(var i in data){
							// 내용을 담을 li 태그 생성
							var $li = $('<li style="cursor:pointer">');
							// 내용을 각각 표현할 span 태그 생성
							var $spanNNo = $('<span class="text" style="display:none">').text(data[i].nno);
							var $spanNTitle = $('<span class="text">').text(data[i].ntitle);
							
							$li.append($spanNNo).append($spanNTitle);
							$ul.append($li);
						}
						
						$('#notice-list li').on('click', function(){
							var nno = $(this).children().html();
							console.log(nno);
				 			location.href="${pageContext.request.contextPath}/notice/noticeView.do?nno="+nno;
						});
						
					}, error : function(data) {
						console.log("데이터 전달 실패!");
						console.log(data);
					}
				});
		
			

			/* initialize the external events
			 -----------------------------------------------------------------*/
			function init_events(ele) {
				ele.each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 1070,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});
			}
			;

			init_events($('#external-events div.external-event'));

			/* initialize the calendar
			 -----------------------------------------------------------------*/
			//Date for the calendar events (dummy data)
			var date = new Date();
			var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();

			$('#calendar')
					.fullCalendar(
							{
								locale : 'ko', // 한국어설정
								eventLimit : true, // 달력에 표시될 일정 개수 제한
								selectable : true, // 마우스로 클릭한 위치확인용(추가용으로는 쓰지않음)
								header : {
									left : 'prev,next today', // 전 후 오늘 버튼
									center : 'title', // 센터에 제목
									right : 'month' // agendaweek 와 agendaday 와 list 삭제 추가하면 나오기는하는데 시간까지 찍는 달력은아님
								},
								//Random default events // 임시 데이터
								events : myDataList/*[ {
									title : 'asdf',
									start : new Date(y, m, d),
									allDay : true,
									backgroundColor : '#f56954', //red
									borderColor : '#f39c12' //yellow
								}, {
									title : '종일',
									start : new Date(y, m, 1),
									allDay : true,
									backgroundColor : '#f56954', //red
									borderColor : '##0073b7' //red
								}, {
									title : 'long',
									start : new Date(y, m, d - 5),
									end : new Date(y, m, d - 2),
									backgroundColor : '#f39c12', //yellow
									borderColor : '##0073b7' //yellow
								}, {
									title : '회의',
									start : new Date(y, m, d),
									allDay : true,
									backgroundColor : '#0073b7', //Blue
									borderColor : '#0073b7' //Blue
								}, {
									title : '점심',
									start : new Date(y, m, d),
									end : new Date(y, m, d),
									allDay : true,
									backgroundColor : '#00c0ef', //Info (aqua)
									borderColor : '#00c0ef' //Info (aqua)
								}, {
									title : '생일 Party',
									start : new Date(y, m, d + 1),
									end : new Date(y, m, d + 1),
									allDay : true,
									backgroundColor : '#00a65a', //Success (green)
									borderColor : '#00c0ef' //Success (green)
								}, {
									title : '구글로',
									start : new Date(y, m, 28),
									end : new Date(y, m, 29),
									url : 'http://google.com/',
									backgroundColor : '#3c8dbc', //Primary (light-blue)
									borderColor : '#3c8dbc' //Primary (light-blue)
								} ]*/,
								droppable : true, // this allows things to be dropped onto the calendar !!! 
								// 이렇게하면 달력에 일정을 떨어 뜨릴 수 있습니다!
								drop : function(date, allDay) { // this function is called when something is dropped 
									// 이 함수는 무언가가 떨어지면 호출됩니다.
									console.log("drop 실행!");

									// retrieve the dropped element's stored Event Object
									// 삭제 된 요소의 저장된 Event 객체를 가져옵니다.
									var originalEventObject = $(this).data(
											'eventObject');

									// we need to copy it, so that multiple events don't have a reference to the same object
									// 여러 이벤트가 동일한 객체에 대한 참조를 갖지 않도록 복사해야합니다.
									var copiedEventObject = $.extend({},
											originalEventObject);

									// assign it the date that was reported
									copiedEventObject.start = date;
									copiedEventObject.allDay = allDay;
									copiedEventObject.backgroundColor = $(this)
											.css('background-color');
									copiedEventObject.borderColor = $(this)
											.css('border-color');

									// render the event on the calendar // 이벤트 렌더링
									// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
									$('#calendar').fullCalendar('renderEvent',
											copiedEventObject, true);

									console.log(originalEventObject);
									console.log(copiedEventObject);
									console.log(date);

									console.log(copiedEventObject.title);
									console.log(copiedEventObject.start._d);
									console.log(copiedEventObject.end);
									console.log(copiedEventObject.allDay);
									console.log(rgbToHex(copiedEventObject.backgroundColor));
									console.log(rgbToHex(copiedEventObject.borderColor));
									// insert 실행
										$.ajax({
												url : "${pageContext.request.contextPath}/common/schedule/insertSchedule.do",
        										data : {
													//         		title : event.title, // 내용
													//         		start : event.start, // 시작
													//         		end : event.end      // 종료
													// 				allDay: allDay
													empNo : '${m.empNo}',
													scstart : copiedEventObject.start._d.getTime(),
													sccontent : copiedEventObject.title,
													backcolor : copiedEventObject.backgroundColor,
													bordercolor : copiedEventObject.borderColor
												},
												success : function(data) {
													console.log("성공");
													console.log(data);
													copiedEventObject.scno = data;
													console.log(copiedEventObject);
												},
												error : function(data) {
													console.log(data);
												}
											});

									// is the "remove after drop" checkbox checked?
									if ($('#drop-remove').is(':checked')) {
										// if so, remove the element from the "Draggable Events" list
										$(this).remove();
									}
								},

								// 일정 사이즈 리사이즈(종일(all time)만가능)
								eventResize : function(event, delta, revertFunc, jsEvent, ui, view) {

									alert(event.title + " : "+ event.start.format() + " ~ "+ event.end.format());

									console.log(event._id);
									console.log(event.title);
									console.log(event.start._d);
									console.log(event.end._d);
									console.log(event.start._d.getTime());
									console.log(event.end._d.getTime());
									console.log(event);

									if (!confirm("수정하시겠습니까?")) {
										
										revertFunc();
										
									} else {
										$.ajax({
											url : "${pageContext.request.contextPath}/common/schedule/updateSchedule.do",
											data : {
												
												scno : event._id,
												scstart : event.start._d.getTime(),
												scend : event.end._d.getTime()
												
											},success : function(data){
												
												console.log("수정 성공!");
												
											}, error : function(data){
												console.log(data);
											}
										});
										
									}
									
								},
								eventDrop: function(event, delta, revertFunc) {

								    alert(event.title + " 수정됨 " + event.start.format());

								    if (!confirm("수정하시겠습니까?")) {
								      revertFunc();
								    } else {
								    	$.ajax({
											url : "${pageContext.request.contextPath}/common/schedule/updateSchedule.do",
											data : {
												
												scno : event._id,
												scstart : event.start._d.getTime(),
												scend : (event.end != null) ? event.end._d.getTime() : event.start._d.getTime()
												
											},success : function(data){
												
												console.log("수정 성공!");
												
											}, error : function(data){
												console.log(data);
											}
										});
								    }

								},
								
								eventDragStop: function(event,jsEvent) {

								    var trashEl = jQuery('#calendarTrash');
								    var ofs = trashEl.offset();

								    var x1 = ofs.left;
								    var x2 = ofs.left + trashEl.outerWidth(true);
								    var y1 = ofs.top;
								    var y2 = ofs.top + trashEl.outerHeight(true);
								    
								    console.log(event._id);

								    if (jsEvent.pageX >= x1 && jsEvent.pageX<= x2 &&
								        jsEvent.pageY >= y1 && jsEvent.pageY <= y2) {
								    	
								    	if (!confirm("삭제하시겠습니까?")) {
								    		
										      
										    } else {
										    	 console.log('삭제 실행');
											        $('#calendar').fullCalendar('removeEvents', event._id);
											        $.ajax({
														url : "${pageContext.request.contextPath}/common/schedule/deleteSchedule.do",
														data : {
															
															scno : event._id,
															
														},success : function(data){
															
															console.log("삭제 성공!");
															
														}, error : function(data){
															console.log(data);
														}
													});
										    }
								    }
								}
							});

			/* ADDING EVENTS */
			var currColor = '#3c8dbc'; //Red by default
			//Color chooser button
			var colorChooser = $('#color-chooser-btn');
			$('#color-chooser > li > a').click(function(e) {
				e.preventDefault();
				//Save color
				currColor = $(this).css('color');
				//Add color effect to button
				$('#add-new-event').css({
					'background-color' : currColor,
					'border-color' : currColor
				});
			});

			$('#add-new-event').click(function(e) {
				e.preventDefault();
				//Get value and make sure it is not null
				var val = $('#new-event').val()
				if (val.length == 0) {
					return;
				}

				//Create events
				var event = $('<div />');
				event.css({
					'background-color' : currColor,
					'border-color' : currColor,
					'color' : '#fff'
				}).addClass('external-event');
				event.html(val);
				$('#external-events').prepend(event);

				//Add draggable funtionality
				init_events(event);

				//Remove event from text input
				$('#new-event').val('');
			});
		});
			$('.attend').click(function(){
				var result = confirm('출근하시겠습니까?');
				
				if(result){
					location.href = "${pageContext.request.contextPath}/attendance/attendAdd.do?empNo=${m.empNo}";	
				}else{
					location.href = "${pageContext.request.contextPath}/index.do";
				}
			});
			$('.leave').click(function(){
				var result = confirm('퇴근하시겠습니까?');
				
				if(result){
					location.href = "${pageContext.request.contextPath}/attendance/leaveAdd.do?empNo=${m.empNo}";	
				}else{
					location.href = "${pageContext.request.contextPath}/index.do";
				}
			});
			
		
				
		
		
	</script>
</body>
</html>

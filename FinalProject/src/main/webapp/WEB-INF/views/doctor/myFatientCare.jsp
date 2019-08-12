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
<c:import url="../common/header.jsp" />
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>담당 환자 관리</h1>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">
					<div class="box box-info" style="width:80%; margin:0 auto; margin-top:50px;">
						<!-- /.box-header -->
						<!-- form start -->
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">일반 환자 리스트</h3>
								<div class="box-tools">
									<div class="input-group input-group-sm hidden-xs" style="width: 150px;">
										<input type="text" name="table_search" class="form-control pull-right" placeholder="Search">
										<div class="input-group-btn">
											<button type="submit" class="btn btn-default">
												<i class="fa fa-search"></i>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body table-responsive no-padding">
								<table class="table table-bordered">
									<tbody>
										<tr>
											<th style="width:10%; text-align:center; vertical-align:middle;">진료 코드</th>
											<th style="width:10%; text-align:center; vertical-align:middle;">환자 명</th>
											<th style="width:10%; text-align:center; vertical-align:middle;">진료 일</th>
											<th style="width:10%; text-align:center; vertical-align:middle;">검사 항목</th>
											<th style="width:30%; text-align:center; vertical-align:middle;">진료 내역</th>
											<th style="width:30%; text-align:center; vertical-align:middle;">처방 약품</th>
										</tr>
										<c:forEach var="m" items="${mList}">
											<tr>
												<td style="text-align:center; vertical-align:middle;">${m.mCode}</td>
												<td style="text-align:center; vertical-align:middle;">${m.pName}</td>
												<td style="text-align:center; vertical-align:middle;">${m.mDate}</td>
												
												<c:if test="${!empty m.mExamination}">
													<td style="text-align:center; vertical-align:middle;">${m.mExamination}</td>
												</c:if>
												<c:if test="${empty m.mExamination}">
													<td style="text-align:center; vertical-align:middle;">-</td>
												</c:if>
												
												<td style="text-align:center; vertical-align:middle;">${m.mHistory}</td>
												
												<td style="text-align:center; vertical-align:middle;">
													<c:set var="mMedList" value="${fn:replace(m.mMedList, '<br>', '~~')}"/>
													<c:set var="medList" value="${fn:split(mMedList, '~~')}"/>
													<c:forEach var="med" items="${medList}">
														<c:set var="medNameList" value="${fn:split(med, '/')}" />
														<c:forEach var="medName" items="${medNameList}" varStatus="status">
															<c:if test="${status.index eq 0}">
																약품 코드&nbsp;:&nbsp;${medName}&emsp;
															</c:if>
															<c:if test="${status.index eq 1}">
																약품 명&nbsp;:&nbsp;${medName}<br>
															</c:if>
														</c:forEach>
													</c:forEach>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<div style="text-align: center;">
							<c:out value="${pageBar}" escapeXml="false" />
						</div>
						<!-- /.box -->
					</div>
				</div>
				<!-- /.row (main row) -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<c:import url="../common/footer.jsp" />
		<c:import url="../common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />

	<script>
		$(function() {
	
		    /* initialize the external events
		     -----------------------------------------------------------------*/
		    function init_events(ele) {
				ele.each(function () {
		
			        // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			        // it doesn't need to have a start or end
			        var eventObject = {
						title: $.trim($(this).text()) // use the element's text as the event title
			        }
			
			        // store the Event Object in the DOM element so we can get to it later
			        $(this).data('eventObject', eventObject)
			
			        // make the event draggable using jQuery UI
			        $(this).draggable({
						zIndex        : 1070,
						revert        : true, // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
			        })
				})
		    }
		
		    init_events($('#external-events div.external-event'))
		
		    /* initialize the calendar
		     -----------------------------------------------------------------*/
		    //Date for the calendar events (dummy data)
		    var date = new Date()
		    var d    = date.getDate(),
		        m    = date.getMonth(),
		        y    = date.getFullYear()
		    $('#calendar').fullCalendar({
				header    : {
					left  : 'prev,next today',
					center: 'title',
					right : 'month,agendaWeek,agendaDay'
				},
				buttonText: {
					today: 'today',
					month: 'month',
					week : 'week',
					day  : 'day'
				},
				//Random default events
				events    : [
			        {
						title          : 'All Day Event',
						start          : new Date(y, m, 1),
						backgroundColor: '#f56954', //red
						borderColor    : '#f56954' //red
			        },
			        {
						title          : 'Long Event',
						start          : new Date(y, m, d - 5),
						end            : new Date(y, m, d - 2),
						backgroundColor: '#f39c12', //yellow
						borderColor    : '#f39c12' //yellow
			        },
			        {
						title          : 'Meeting',
						start          : new Date(y, m, d, 10, 30),
						allDay         : false,
						backgroundColor: '#0073b7', //Blue
						borderColor    : '#0073b7' //Blue
			        },
					{
						title          : 'Lunch',
						start          : new Date(y, m, d, 12, 0),
						end            : new Date(y, m, d, 14, 0),
						allDay         : false,
						backgroundColor: '#00c0ef', //Info (aqua)
						borderColor    : '#00c0ef' //Info (aqua)
					},
					{
						title          : 'Birthday Party',
						start          : new Date(y, m, d + 1, 19, 0),
						end            : new Date(y, m, d + 1, 22, 30),
						allDay         : false,
						backgroundColor: '#00a65a', //Success (green)
						borderColor    : '#00a65a' //Success (green)
					},
					{
						title          : 'Click for Google',
						start          : new Date(y, m, 28),
						end            : new Date(y, m, 29),
						url            : 'http://google.com/',
						backgroundColor: '#3c8dbc', //Primary (light-blue)
						borderColor    : '#3c8dbc' //Primary (light-blue)
					}
				],
				editable  : true,
				droppable : true, // this allows things to be dropped onto the calendar !!!
				drop      : function (date, allDay) { // this function is called when something is dropped
		
					// retrieve the dropped element's stored Event Object
					var originalEventObject = $(this).data('eventObject')
					
					// we need to copy it, so that multiple events don't have a reference to the same object
					var copiedEventObject = $.extend({}, originalEventObject)
					
					// assign it the date that was reported
					copiedEventObject.start           = date
					copiedEventObject.allDay          = allDay
					copiedEventObject.backgroundColor = $(this).css('background-color')
					copiedEventObject.borderColor     = $(this).css('border-color')
					
					// render the event on the calendar
					// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
					$('#calendar').fullCalendar('renderEvent', copiedEventObject, true)
					
					// is the "remove after drop" checkbox checked?
					if ($('#drop-remove').is(':checked')) {
						// if so, remove the element from the "Draggable Events" list
						$(this).remove()
					}
					
				}
			})
					
			/* ADDING EVENTS */
			var currColor = '#3c8dbc' //Red by default
			//Color chooser button
			var colorChooser = $('#color-chooser-btn')
			$('#color-chooser > li > a').click(function (e) {
				e.preventDefault()
				//Save color
				currColor = $(this).css('color')
				//Add color effect to button
				$('#add-new-event').css({ 'background-color': currColor, 'border-color': currColor })
			})
		    $('#add-new-event').click(function (e) {
				e.preventDefault()
				//Get value and make sure it is not null
				var val = $('#new-event').val()
				if (val.length == 0) {
					return
				}
		
				//Create events
				var event = $('<div />')
				event.css({
					'background-color': currColor,
					'border-color'    : currColor,
					'color'           : '#fff'
				}).addClass('external-event')
				
				event.html(val)
				
				$('#external-events').prepend(event)
				
				//Add draggable funtionality
				init_events(event)
				
				//Remove event from text input
				$('#new-event').val('')
			})
		});
	</script>
</body>
</html>

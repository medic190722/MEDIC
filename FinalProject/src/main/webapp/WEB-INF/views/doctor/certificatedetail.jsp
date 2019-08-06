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
				<h1>진단서 작성</h1>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">
					<div class="box box-info" style="width:80%; margin:0 auto;">
						<div class="box-body">
							<div id="print_page" class="row" style="margin-top:20px; text-align:center;">
								<table class="table table-bordered" style="width:97%; margin:0 auto;">
									<tr>
										<th colspan="6">
											<div class="box-header with-border" style="text-align:center;">
												<h3 class="box-title">진단서</h3>
											</div>
										</th>
									</tr>
									<tr>
										<td style="vertical-align:middle; width:15%;">성명</td>
										<td><input style="text-align:center;" type="text" class="form-control" value="${ p.p_name }" disabled/></td>
										<td style="vertical-align:middle; width:10%;">성별</td>
										<td>
											<c:choose>
												<c:when test="${ p.p_gender eq 'M' }">
													<input style="text-align:center;" type="text" class="form-control" value="남성" disabled/>
												</c:when>
												<c:when test="${ p.p_gender eq 'F' }">
													<input style="text-align:center;" type="text" class="form-control" value="여성" disabled/>
												</c:when>
											</c:choose> 
										</td>
										<td style="vertical-align:middle; width:20%;">주민등록번호</td>
										<td><input style="text-align:center;" type="text" class="form-control" value="${ p.p_rrn }" disabled/></td>
									</tr>
									<tr>
										<td style="vertical-align:middle;">주소</td>
										<td colspan="5"><input style="text-align:center;" type="text" class="form-control" value="${ p.p_address }" disabled/></td>
									</tr>
									<tr>
										<td style="vertical-align:middle;">병명<br><br>및<br><br>임상소견</td>
										<td colspan="5"><textarea class="form-control" rows="12"></textarea></td>
									</tr>
									<tr>
										<td style="vertical-align:middle;">진료일</td>
										<td style="vertical-align:middle;" colspan="5">
											<div>
												<input style="text-align:center;" type="date" class="form-control"/>
											</div>
										</td>
									</tr>
									<tr>
										<td style="vertical-align:middle;">향후<br><br>치료 의견</td>
										<td colspan="5"><textarea class="form-control" rows="12"></textarea></td>
									</tr>
									<tr>
										<td colspan="6">
											<div class="pull-right" style="margin-right:2%;">
												<div style="text-align:left;">
													<div style="margin-top:10px;">발 행 일&emsp;:&emsp;201&emsp; 년&emsp; 월&emsp; 일</div>
													<div style="margin-top:10px;">의료기관명&emsp;:&emsp;MEDIC병원</div>
													<div style="margin-top:10px; margin-bottom:10px;">담당의사&emsp;:&emsp;${ m.empName }&emsp; (인)</div>
												</div>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="box-footer">
								<button type="button" onclick="location.href='${pageContext.request.contextPath}/doctor/prescription.do" class="btn btn-info pull-right">메인 화면</button>
								<button type="button" onclick="pageprint()" class="btn btn-info pull-right" style="margin-right:20px;">Print</button>
							</div>
						</div>
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
		
		var initBody;
		function beforePrint() {
			initBody = document.body.innerHTML; 
			document.body.innerHTML = print_page.innerHTML;
		}
		
		function afterPrint() {
			document.body.innerHTML = initBody; 
		} 
		
		function pageprint() {
			window.onbeforeprint = beforePrint; 
			window.onafterprint = afterPrint; 
			window.print();
		} 
		
	    //Date picker
	    $('#datepicker').datepicker({
	    	autoclose: true
	    })
		
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

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
				<h1>처방전 작성</h1>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">
					<div class="box box-danger" style="width:1000px; margin:0 auto;">
						<div class="box-header with-border">
							<h3 class="box-title">처방전</h3>
						</div>
						<form action="${pageContext.request.contextPath}/doctor/prescriptionSave.do">
							<div class="box-body">
								<div class="row" style="margin-top:20px;">
									<div class="col-xs-3" style="width:50%;">
										<label for="mCode">진료 코드</label>
										<input type="text" class="form-control" id="mCode" name="mCode" value="${ M_Code }">
									</div>
									<div class="col-xs-3" style="width:50%;">
										<label for="mDate">진료일</label>
										<input type="date" class="form-control" name="mDate">
									</div>
								</div>
								<div class="row" style="margin-top:20px;">
									<div class="col-xs-3" style="width:50%;">
										<label for="pNo">환자 번호</label>
										<input type="number" class="form-control" id="pNo" name="pNo" value="${ pNo }">
									</div>
									<div class="col-xs-4" style="width:50%;">
										<label for="pName">환자 이름</label>
										<input type="text" class="form-control" id="pName" name="pName" value="${ pName }">
									</div>
								</div>
								<div class="row" style="margin-top:20px;">
									<div class="col-xs-4" style="width:50%;">
										<label for="empName">담당 의사</label>
										<input type="hidden" name=empNo value="${ member.empNo }" />
										<input type="text" class="form-control" id="empName" name="empName" value="${ member.empName }">
									</div>
									<div class="col-xs-4" style="width:50%;">
										<label for="admission">입원 여부</label>
										<select class="form-control" id="admission" name="admission">
											<option>-----</option>
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</div>
								</div>
								<div class="box-body table-responsive no-padding" style="height:400px;margin-top:20px;">
									<table class="table table-bordered" id="mHistory">
										<tbody>
											<tr>
												<th style="text-align:center;">약품 코드</th>
												<th style="text-align:center;">약품 명</th>
												<th style="text-align:center;">1회 투약량</th>
												<th style="text-align:center;">1일 투여횟수</th>
												<th style="text-align:center;">총 투약 일수</th>
												<th style="text-align:center;">용법</th>
											</tr>
											<tr class="item1">
												<td style="width:120px;">
													<select class="form-control medCode">
														<option>-</option>
														<c:forEach var="med" items="${ medList }">
															<option value="${ med.medName }">${ med.medCode }</option>
														</c:forEach>
														<input type="hidden" class="selectCode" name="medCode" />
													</select>
												</td>
												<td style="width:120px;">
													<input style="text-align:center;" type="text" class="form-control medName" name="medName" style="border:none;">
												</td>
												<td style="width:100px;">
													<select class="form-control" name="oneDose">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
													</select>
												</td>
												<td style="width:100px;">
													<select class="form-control" name="oneDayDose">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
													</select>
												</td>
												<td style="width:100px;">
													<select class="form-control" name="totalDose">
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
														<option value="6">6</option>
														<option value="7">7</option>
														<option value="8">8</option>
														<option value="9">9</option>
													</select>
												</td>
												<td>
													<textarea class="form-control" rows="1" name="etc"></textarea>
												</td>
											</tr>
										</tbody>
									</table>
									<div style="text-align:right; margin-top:10px;">
										<button type="button" class="btn btn-default" id="addRow">+</button>
									</div>
								</div>
								<div class="box-footer" style="text-align:right;">
									<button style="margin-right:20px;" type="submit" class="btn btn-default">취소</button>
									<button type="submit" class="btn btn-info">완료</button>
								</div>
							</div>
						</form>
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
		$('.medCode').each(function(){
			$(this).on('change',function(e){
				var obj = $(this);
			// select < td < tr ~~~~~ > input:medName
				obj.parent().parent().find('.medName').val(obj.val());
			 	
				obj.parent().parent().find('.selectCode').val(obj.children('option:selected').text());
			});
		});
		
		$(function() {
			$('#addRow').click(function() {
				var lastItemNo = $("#mHistory tr:last").attr("class").replace("item", "");
				 
	            var newitem = $("#mHistory tr:eq(1)").clone(true);
	            newitem.removeClass();
	            newitem.find("td:eq(0)").attr("rowspan", "1");
	            newitem.addClass("item"+(parseInt(lastItemNo)+1));

	            $("#mHistory").append(newitem);
			});
		});
		
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

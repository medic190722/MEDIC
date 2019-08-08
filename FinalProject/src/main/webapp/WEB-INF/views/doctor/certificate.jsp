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
					<div class="box box-info" style="width:800px; margin:0 auto; margin-top:50px;">
						<div class="box-header with-border" style="text-align:center;">
							<h3 class="box-title">환자 정보 조회</h3>
						</div>
						<!-- /.box-header -->
						<!-- form start -->
						<div class="box-body">
							<div class="input-group pull-right" style="width:30%;">
								<input type="text" id="pName" name="pName" onkeyup="enterkey();" class="form-control"/>
								<span class="input-group-addon" style="padding:0; border:none;">
									<button type="button" id="patientSearch" class="btn btn-default">검색</button>
								</span>
							</div>
						</div>
						<!-- /.box-body -->
						<div class="box-footer">
							<table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											style="text-align:center;"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column descending"
											aria-sort="ascending">환자 이름</th>
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											style="text-align:center;"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column descending"
											aria-sort="ascending">전화 번호</th>
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											style="text-align:center;"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column descending"
											aria-sort="ascending">주민등록번호</th>
										<th class="sorting_asc" tabindex="0" aria-controls="example1"
											style="text-align:center;"
											rowspan="1" colspan="1"
											aria-label="Rendering engine: activate to sort column descending"
											aria-sort="ascending">진단서 작성</th>
									</tr>
								</thead>
							</table>
						</div>
						<!-- /.box-footer -->
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
		function enterkey(){
			
			if(window.event.keyCode == 13){
				search();
			}
			
		}
		
		function search() {
			$.ajax({
				url : "${ pageContext.request.contextPath }/doctor/patientSearch.do",
				data : {pName : $("#pName").val()},
				success : function(pList) {
					$('#example1 > tbody').empty();
					
					var str = "<tbody>";
					var pNo = "";
					
					for(var i in pList) {
						str += "<tr><td style='text-align:center;'>" + pList[i].p_name + "</td>";
						str += "<td style='text-align:center;'>" + pList[i].p_phone[0] + "</td>";
						str += "<td style='text-align:center;'>" + pList[i].p_rrn + "</td>";
						pNo = pList[i].p_no;
						str += "<td style='text-align:center;'><button type='button' class='btn btn-info btn-flat' onclick='certificate(" + pNo + ");'>작성</button></td></tr>"
					}
					
					str += "</tbody>";
					
					$('#example1').append(str);
				}	
			});
		}
		
		$('#patientSearch').on("click", function() {
			
			search();
			
		});
		
		function certificate(pNo) {
			location.href="${ pageContext.request.contextPath }/doctor/certificateDetail.do?pNo=" + pNo;
		}
		
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

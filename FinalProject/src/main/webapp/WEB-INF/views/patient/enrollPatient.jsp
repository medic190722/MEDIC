<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Medic</title>
  <c:import url="../common/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        	Medic
      </h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Main</li>
        <li class="active">환자관리</li>
        <li class="active">접수</li>
         <li class="active">환자등록</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
      	<!-- <input type="button" class="" value="초진" id="firstReceipt" style="margin-left: 150px; margin-top:100px; width:200px; height:200px;">
      	<input type="button" class="" value="재진" id="firstReceipt" style="margin-left: 100px; margin-top:100px; width:200px; height:200px;"> -->
       	<div class="register-box-body outReceipt" style="width:500px; margin: 0 auto; margin-top:50px;">
    <p class="login-box-msg"><b style="font-size:20px;">환자 등록</b></p>

    <form action="${pageContext.request.contextPath}/patient/enrollPatient.do" method="post">
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">이름 </label></div>     
      	<div style="display:inline-block"><input type="text" id="p_name" name="p_name"required></div>
      </div>
        <div class="form-group has-feedback">
        	<div style="display:inline-block; width:100px; text-align:center"><label for="">나이 </label></div>
        	<div style="display:inline-block"><input type="number" id="p_age" name="p_age" min=0 required></div>
      </div>
    <div class="form-group has-feedback">
    	<div style="display:inline-block; width:100px; text-align:center"><label for="">성별</label></div>
    	<div style="display:inline-block">
			<input type="radio" class="form-check-input" name="p_gender" id="gender0" value="M">
			<label for="gender0">남</label>
			<input type="radio" class="form-check-input" name="p_gender" id="gender1" value="F">
			<label for="gender1">여</label>	  
		</div>
	  </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">주민등록 번호</label></div>
      	<div style="display:inline-block">
      	    <input type="text" id="p_rrn" name="p_rrn" class="form-check-input"/>
        </div>
      </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">주소</label></div>
      	<div style="display:inline-block">
        	<input type="text" name="p_address" id="p_address" style="width:300px;">
        </div>
      </div>
      <div class="form-group has-feedback">
      <div style="display:inline-block; width:100px; text-align:center"><label for="">전화번호</label></div>
      <div style="display:inline-block">
       	<div style="display:inline-block">
        <select name="p_phone" id="phone1" class="" style="width:70px; height:26px; display:inline">
        	<option value="010">010</option>
        	<option value="02">02</option>
        	<option value="031">031</option>
        	<option value="032">032</option>
        	<option value="033">033</option>
        	<option value="041">041</option>
        	<option value="042">042</option>
        	<option value="043">043</option>
        	<option value="044">044</option>
        	<option value="051">051</option>
        	<option value="052">052</option>
        	<option value="053">053</option>
        	<option value="054">054</option>
        	<option value="055">055</option>
        	<option value="061">061</option>
        	<option value="062">062</option>
        	<option value="063">063</option>
        	<option value="064">064</option>
        </select>
        <label for="">-</label>
        <input type="text" id="p_phone2" name="p_phone" class="" placeholder="" style="width:100px; text-align:center;">
        <label for="">-</label>
        <input type="text" id="p_phone2" name="p_phone" class="" placeholder="" style="width:100px;text-align:center;">
      </div>
      </div>
      </div>
    
     
      <div class="row">
        <div class="col-xs-12"  style="line-height: 60px; margin: 0 auto; text-align:center;">
          <button type="submit" class="btn btn-primary " style="margin: 0 auto; width:200px;">등록</button>
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
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<!-- ./wrapper -->
<c:import url="../common/scripts.jsp"/>

<script>
$(function () {

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
    
    $('#firstReceipt').click(function(){
    	$('.outReceipt').css('display', 'block')
    	$('#firstReceipt').css('display', 'none');
    });
    
    
    function autoHypenResidentRegistrationNumber(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 6){
            return str;
        }else if(str.length < 6){
            tmp += str.substr(0, 6);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 6);
            tmp += '-';
            tmp += str.substr(6, 7);
            return tmp;
        }
        return str;
    }

	var residentRegistrationNumber = document.getElementById('p_rrn');
	residentRegistrationNumber.onkeyup = function(event){
    		event = event || window.event;
    		var _val = this.value.trim();
    		this.value = autoHypenResidentRegistrationNumber(_val) ;
	}
    
  });
</script>
</body>
</html>

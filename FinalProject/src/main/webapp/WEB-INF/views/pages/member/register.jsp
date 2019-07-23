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
  <title>회원가입</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/Ionicons/css/ionicons.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap datepicker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/iCheck/all.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/bootstrap-colorpicker/dist/css/bootstrap-colorpicker.min.css">
  <!-- Bootstrap time Picker -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/plugins/timepicker/bootstrap-timepicker.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/bower_components/select2/dist/css/select2.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/dist/css/skins/_all-skins.min.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
		<style type="text/css">
	body{
		background: url(/medic/resources/images/hospital.png) !important;
		background-size:cover !important;
	}
	</style>

</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <b style="color:#fff;">MEDIC</b>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Register a new membership</p>

    <form action="../../index.html" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="이름">
        <span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>
        <div class="form-group has-feedback">
        <input type="password" id="userPwd1" class="form-control" placeholder="비밀번호">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" id="userPwd2" class="form-control" placeholder="비밀번호 확인">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
        <label id="pwdResult"></label>
      </div>
      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="이메일">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
    
       <!-- select -->
         <div class="form-group">
           <label>부서</label>
           <select class="form-control dept">
             <option value="총무과">총무과</option>
             <option value="원무과">원무과</option>
             <option value="의사">의사</option>
             <option value="간호사">간호사</option>
           </select>
         </div>
    	  <div class="form-group job1" id="job1" style="display:block;">
           <label>직급</label>
           <select class="form-control">
             <option value="부장">부장</option>
             <option value="차장">차장</option>
             <option value="과장">과장</option>
             <option value="대리">대리</option>
             <option value="사원">사원</option>
           </select>
         </div>
          <div class="form-group job2" id="job2" style="display:none;">
           <label>직급</label>
           <select class="form-control">
             <option value="부장">부장</option>
             <option value="차장">차장</option>
             <option value="과장">과장</option>
             <option value="대리">대리</option>
             <option value="사원">사원</option>
           </select>
         </div>
         
         <div class="form-group job3" id="job3" style="display:none;">
           <label>직급</label>
           <select class="form-control">
             <option value="교수">교수</option>
             <option value="부교수">부교수</option>
             <option value="조교수">조교수</option>	
             <option value="전임의">전임의</option>
             <option value="레지던트">레지던트</option>
             <option value="인턴">인턴</option>
           </select>
         </div>
         <div class="form-group job4" id="job4" style="display:none;">
           <label>직급</label>
           <select class="form-control">
             <option value="최고 책임자">최고 책임자</option>
             <option value="간호과장">간호과장</option>
             <option value="수간호사">수간호사</option>
             <option value="책임간호사">책임간호사</option>
             <option value="주임간호사">주임간호사</option>
             <option value="평간호사">평간호사</option>
           </select>
         </div>
      <!-- <div class="form-group has-feedback">
     	 <label>급여</label>
        <input type="number" class="form-control" placeholder="급여">	
        <span class="form-control-feedback">만원</span>
      </div> -->
      <!-- Date -->
      <div class="form-group">
        <label>입사일:</label>
        <div class="input-group date">
          <div class="input-group-addon">
            <i class="fa fa-calendar"></i>
          </div>
          <input type="text" class="form-control pull-right" id="datepicker">
        </div>
        </div>
      <div class="row">
        <div class="col-xs-12"  style="line-height: 60px;">
          <button type="submit" class="btn btn-primary btn-block btn-flat">회원가입</button>
          <a href="${pageContext.request.contextPath}" class="text-center">이미 아이디를 가지고 있습니다.</a>
        </div>
        
        <!-- /.col -->
       
        <!-- /.col -->
      </div>
    </form>

   


  </div>
  <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath }/resources/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="${pageContext.request.contextPath }/resources/bower_components/select2/dist/js/select2.full.min.js"></script>
<!-- InputMask -->
<script src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath }/resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<!-- date-range-picker -->
<script src="${pageContext.request.contextPath }/resources/bower_components/moment/min/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- bootstrap datepicker -->
<script src="${pageContext.request.contextPath }/resources/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- bootstrap color picker -->
<script src="${pageContext.request.contextPath }/resources/bower_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- bootstrap time picker -->
<script src="${pageContext.request.contextPath }/resources/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath }/resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- iCheck 1.0.1 -->
<script src="${pageContext.request.contextPath }/resources/plugins/iCheck/icheck.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/resources/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath }/resources/dist/js/demo.js"></script>
<style>
.datepicker{
	top:430px !important;
}
</style>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>


<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy ', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({ timePicker: true, timePickerIncrement: 30, locale: { format: 'MM/DD/YYYY hh:mm A' }})
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })
    

    $('.dept').click(function(){
		var display = $('.dept option:selected').val();	
		if(display == "총무과"){
			$('#job1').css('display','block');
		}else{
			$('#job1').css('display','none');
		}
    })
    $('.dept').click(function(){
		var display = $('.dept option:selected').val();	
		if(display == "원무과"){
			$('#job2').css('display','block');
		}else{
			$('#job2').css('display','none');
		}
    })
    $('.dept').click(function(){
		var display = $('.dept option:selected').val();	
		if(display == "의사"){
			$('#job3').css('display','block');
		}else{
			$('#job3').css('display','none');
		}
    })
    $('.dept').click(function(){
		var display = $('.dept option:selected').val();	
		if(display == "간호사"){
			$('#job4').css('display','block');
		}else{
			$('#job4').css('display','none');
		}
    })

    
    
    $('#userPwd2').change(function(){
        if($('#userPwd1').val() == $(this).val()){
            $('#pwdResult').html('비밀번호가 일치 합니다.')
            .css('color','green');
        }else{
            $('#pwdResult').html('비밀번호가 일치하지 않습니다.')
            .css('color','red');
            $('#userPwd2').val('');
            $(this).select();
        }
    });
    
  })
</script>
</body>
</html>

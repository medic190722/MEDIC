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
  <title>진료접수</title>
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
   
   /* div .form-group{
   		margin: 0 auto;
   } */
   </style>

</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <b style="color:#fff;">MEDIC</b>
  </div>

  <div class="register-box-body" style="width:500px;">
    <p class="login-box-msg">Receipt a new patient</p>

    <form action="${pageContext.request.contextPath}/patient/firstOutPatientReceipt.do" method="post">
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">환자 이름 </label></div>     
      	<div style="display:inline-block"><input type="text" id="p_name" name="p_name"required></div>
      </div>
        <div class="form-group has-feedback">
        	<div style="display:inline-block; width:100px; text-align:center"><label for="">환자 나이 </label></div>
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
        <div class="col-xs-12"  style="line-height: 60px;">
          <button type="submit" class="btn btn-primary btn-block btn-flat">접수</button>
        </div>
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
	
  })
</script>
</body>
</html>
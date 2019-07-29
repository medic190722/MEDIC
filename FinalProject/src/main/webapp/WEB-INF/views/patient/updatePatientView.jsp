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
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
       	<div class="register-box-body outReceipt" style="width:500px; margin: 0 auto; margin-top:50px;">
    <p class="login-box-msg"><b style="font-size:20px;">환자 정보 수정</b></p>

    <form action="${pageContext.request.contextPath}/patient/updatePatient.do" method="post">
    	<input type="hidden" name="p_no" value="${patient.p_no}">
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">이름 </label></div>     
      	<div style="display:inline-block"><input type="text" id="p_name" name="p_name" value="${patient.p_name}"required></div>
      </div>
        <div class="form-group has-feedback">
        	<div style="display:inline-block; width:100px; text-align:center"><label for="">나이 </label></div>
        	<div style="display:inline-block"><input type="number" id="p_age" name="p_age" min=0 value="${patient.p_age}"required></div>
      </div>
    <div class="form-group has-feedback">
    	<div style="display:inline-block; width:100px; text-align:center"><label for="">성별</label></div>
    		<input type="radio" class="form-check-input" name="p_gender" id="gender0" value="M" ${patient.p_gender=='M'?'checked':''}>
			<label for="gender0">남</label>
			<input type="radio" class="form-check-input" name="p_gender" id="gender1" value="F" ${patient.p_gender=='F'?'checked':''}>
			<label for="gender1">여</label>	
	  </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">주민등록 번호</label></div>
      	<div style="display:inline-block">
      	    <input type="text" id="p_rrn" name="p_rrn" class="form-check-input" value="${patient.p_rrn}"/>
        </div>
      </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">주소</label></div>
      	<div style="display:inline-block">
        	<input type="text" name="p_address" id="p_address" style="width:300px;" value="${patient.p_address}">
        </div>
      </div>
      <div class="form-group has-feedback">
      <div style="display:inline-block; width:100px; text-align:center"><label for="">전화번호</label></div>
      <div style="display:inline-block">
       	<div style="display:inline-block">
        <select name="p_phone" id="phone1" class="" style="width:70px; height:26px; display:inline">
        	<option value="010" selected="${patient.p_phone[0].substring(0,2)=='010'?'selected':''}">010</option>
        	<option value="02" selected="${patient.p_phone[0].substring(0,1)=='02'?'selected':''}">02</option>
        	<option value="031" selected="${patient.p_phone[0].substring(0,2)=='031'?'selected':''}">031</option>
        	<option value="032" selected="${patient.p_phone[0].substring(0,2)=='032'?'selected':''}">032</option>
        	<option value="033" selected="${patient.p_phone[0].substring(0,2)=='033'?'selected':''}">033</option>
        	<option value="041" selected="${patient.p_phone[0].substring(0,2)=='041'?'selected':''}">041</option>
        	<option value="042" selected="${patient.p_phone[0].substring(0,2)=='042'?'selected':''}">042</option>
        	<option value="043" selected="${patient.p_phone[0].substring(0,2)=='043'?'selected':''}">043</option>
        	<option value="044" selected="${patient.p_phone[0].substring(0,2)=='044'?'selected':''}">044</option>
        	<option value="051" selected="${patient.p_phone[0].substring(0,2)=='051'?'selected':''}">051</option>
        	<option value="052" selected="${patient.p_phone[0].substring(0,2)=='052'?'selected':''}">052</option>
        	<option value="053" selected="${patient.p_phone[0].substring(0,2)=='053'?'selected':''}">053</option>
        	<option value="054" selected="${patient.p_phone[0].substring(0,2)=='054'?'selected':''}">054</option>
        	<option value="055" selected="${patient.p_phone[0].substring(0,2)=='055'?'selected':''}">055</option>
        	<option value="061" selected="${patient.p_phone[0].substring(0,2)=='061'?'selected':''}">061</option>
        	<option value="062" selected="${patient.p_phone[0].substring(0,2)=='062'?'selected':''}">062</option>
        	<option value="063" selected="${patient.p_phone[0].substring(0,2)=='063'?'selected':''}">063</option>
        	<option value="064" selected="${patient.p_phone[0].substring(0,2)=='064'?'selected':''}">064</option>
        </select>
        <label for="">-</label>
        	<input type="text" id="p_phone2" name="p_phone" class="" placeholder="" style="width:100px; text-align:center;" maxlength="4"
        	 value="${patient.p_phone[0].substring(0,2)=='02'?patient.p_phone[0].substring(3,7) :patient.p_phone[0].substring(4,8)}"> 
        <label for="">-</label>
       		<input type="text" id="p_phone3" name="p_phone" class="" placeholder="" style="width:100px;text-align:center;" maxlength="4"
       		value="${patient.p_phone[0].substring(0,2)=='02'? patient.p_phone[0].substring(8,12) :patient.p_phone[0].substring(9,13)}" > 
      </div>
      </div>
      </div>
      
    
     
      <div class="row">
        <div class="col-xs-12"  style="line-height: 60px; margin: 0 auto; text-align:center;">
          <button type="submit" class="btn btn-primary " style="margin: 0 auto; width:200px;">정보수정</button>
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


</script>
</body>
</html>

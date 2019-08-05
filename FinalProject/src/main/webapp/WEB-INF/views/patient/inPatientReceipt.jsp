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
    <p class="login-box-msg"><b style="font-size:20px;">입원 환자 등록</b></p>

    <form action="${pageContext.request.contextPath}/patient/inPatientReceipt.do" method="post">
      <div class="form-group has-feedback">
      	<input type="hidden" name="p_no" value="${patient.p_no}" />
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">이름 </label></div>     
      	<div style="display:inline-block"><input type="text" id="p_name" name="p_name" value="${patient.p_name}"readonly></div>
      </div>
    <div class="form-group has-feedback">
    	<div style="display:inline-block; width:100px; text-align:center"><label for="">성별</label></div>
    	<div style="display:inline-block">
    		<input type="text" id="p_gender" name="p_gender" value="${patient.p_gender=='M' ? '남' : '여'}" readonly>
			<!-- <input type="radio" class="form-check-input" name="p_gender" id="gender0" value="M">
			<label for="gender0">남</label>
			<input type="radio" class="form-check-input" name="p_gender" id="gender1" value="F">
			<label for="gender1">여</label>	 -->  
		</div>
	  </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">입원실</label></div>
      	<div style="display:inline-block">
      	    <select name="ward_code" id="ward_code" > 
      	    	<option value=""> -------------------------- </option>   	  
      	    	<optgroup label="---------    6  인  실       --------">
      	    	<optgroup label="입원실   &nbsp;| &nbsp;수용가능인원">
      	    		<c:forEach items="${wardList}" var="w">
      	    			<c:if test="${w.capacity eq 6}">
      	    				<option id="#capacity+${w.capacity}"  name="ward_code" value="${w.ward_code}">${w.ward_code}호&nbsp;| &nbsp;${w.available_capacity}명</option>
      	    			</c:if>
      	    		</c:forEach>
      	    	</optgroup>
      	    	</optgroup>  	
      	    	<optgroup label="---------    4  인  실       --------">
      	    	<optgroup label="입원실   &nbsp;| &nbsp;수용가능인원">
      	    		<c:forEach items="${wardList}" var="w">
      	    			<c:if test="${w.capacity eq 4}">
      	    				<option id="#capacity+${w.capacity}"  name="ward_code" value="${w.ward_code}">${w.ward_code}호&nbsp;| &nbsp;${w.available_capacity}명</option>
      	    			</c:if>
      	    		</c:forEach>
      	    	</optgroup>
      	    	</optgroup>
      	    	<optgroup label="---------    2 인  실       --------">
      	    	<optgroup label="입원실   &nbsp;| &nbsp;수용가능인원">
      	    		<c:forEach items="${wardList}" var="w">
      	    			<c:if test="${w.capacity eq 2}">
      	    				<option id="#capacity+${w.capacity}"  name="ward_code" value="${w.ward_code}">${w.ward_code}호&nbsp;| &nbsp;${w.available_capacity}명</option>
      	    			</c:if>
      	    		</c:forEach>
      	    	</optgroup>
      	    	</optgroup>
      	    </select>
        </div>
      </div>
      <div class="form-group has-feedback">
      	<div style="display:inline-block; width:100px; text-align:center"><label for="">입원일자</label></div>
      	<div style="display:inline-block">
        	<!-- <input type="date" name="p_admission_date" id="p_admission_date" style="width:300px;"> -->
        	<input type="date" id="admission_date" name="admission_date" style="width:200px;">
        </div>
      </div>
     
      <div class="row">
        <div class="col-xs-12"  style="line-height: 60px; margin: 0 auto; text-align:center;">
          <button type="submit" class="btn btn-primary " style="margin: 0 auto; width:200px;">접수</button>
        </div>
      </div>
    </form>

  </div>
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  
   <script>
     document.getElementById('admission_date').value= new Date().toISOString().slice(0, 10);
   </script>
  <!-- /.content-wrapper -->
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<!-- ./wrapper -->
<c:import url="../common/scripts.jsp"/>

<script>

</script>
</body>
</html>

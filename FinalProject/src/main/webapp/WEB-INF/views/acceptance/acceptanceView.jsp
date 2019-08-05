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
       
       <div class="register-box-body outReceipt"
						style="width: 500px; margin: 0 auto; margin-top: 50px;">
						<p class="login-box-msg">
							<b style="font-size: 20px;">납부</b>
						</p>

						<form
							action="${pageContext.request.contextPath}/acceptance/acceptanceView.do"
							method="post">
							
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">차트번호 </label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="m_code" name="m_code"
										value="${patient.m_code}" readonly>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">환자번호 </label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_no" name="p_no" min=0
										value="${patient.p_no}" readonly>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">환자이름</label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_no" name="p_no" min=0
										value="${patient.p_name}" readonly>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">진료내역</label>
								</div>
								<div style="display: inline-block">
									<input type="text" name="m_date" id="m_date"
										style="width: 300px;" value="${patient.m_history}">
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">수납금액</label>
								</div>
								<div style="display: inline-block">
									<input type="text" name="m_date" id="m_date"
										style="width: 300px;" value="">
								</div>
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

</body>
</html>

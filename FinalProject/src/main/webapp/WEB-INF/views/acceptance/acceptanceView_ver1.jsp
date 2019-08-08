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
<style>
thead tr {
	height: 40px;
}
.form-group{
	margin-bottom:5px !important;
}
</style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<c:import url="../common/menubar.jsp" />
		<div class="content-wrapper">
			<section class="content-header">
				<h1>Medic</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Main</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">

					<div class=" outReceipt"
						style="width: 1000px; margin: 0 auto; margin-top: 50px; background: #fff; padding: 20px 0;">
						<!-- <p class="login-box-msg">
							<b style="font-size: 20px;">납부</b>
						</p> -->

						<form
							action="${pageContext.request.contextPath}/acceptance/acceptanceView.do"
							method="post">
							<div style="border-bottom: 1px solid #000;">
								<div class="form-group has-feedback"
									style="display: inline-block">
									<div
										style="display: inline-block; width: 80px; text-align: right">
										<label for="">차트번호 </label>
									</div>
									<div style="display: inline-block">
										<input type="text" id="m_code" name="m_code"
											value="${patient.m_code}"
											style="width: 100px; text-align: center;" readonly>
									</div>
								</div>
								<div class="form-group has-feedback"
									style="display: inline-block">
									<div
										style="display: inline-block; width: 80px; text-align: right">
										<label for="">환자번호 </label>
									</div>
									<div style="display: inline-block">
										<input type="text" id="p_no" name="p_no" min=0
											value="${patient.p_no}"
											style="width: 100px; text-align: center;" readonly>
									</div>
								</div>
								<div class="form-group has-feedback"
									style="display: inline-block;">
									<div
										style="display: inline-block; width: 80px; text-align: right">
										<label for="">환자이름</label>
									</div>
									<div style="display: inline-block">
										<input type="text" id="p_name" name="p_name"
											value="${patient.p_name}"
											style="width: 100px; text-align: center;" readonly>
									</div>
								</div>
								<div class="form-group has-feedback"
									style="display: inline-block">
									<div
										style="display: inline-block; width: 80px; text-align: right">
										<label for="">초/재진</label>
									</div>
									<div style="display: inline-block">
										<c:if test="${patient.p_firstdate eq patient.p_lastdate}">
										<input type="text" name="m_treatment" id="m_treatment"
											style="width: 100px; text-align: center;" value="초진">
										</c:if>
										<c:if test="${patient.p_firstdate ne patient.p_lastdate}">
										<input type="text" name="m_treatment" id="m_treatment"
											style="width: 100px; text-align: center;" value="재진">
										</c:if>
									</div>
								</div>

								<div class="form-group has-feedback"
									style="display: inline-block">
									<div
										style="display: inline-block; width: 80px; text-align: right">
										<label for="">진료일</label>
									</div>
									<div style="display: inline-block">
										<input type="text" name="m_date" id="m_date"
											style="width: 150px; text-align:center" value="${patient.m_date}">
									</div>
								</div>

							</div>
							<div
								style="padding-left:110px; border-bottom: 1px solid #000; border-right: 1px solid #000; width: 700px; display: inline-block;">
								<div class="form-group has-feedback"
									style="display: inline-block; margin-top:20px;">
									<div>
									<div class="form-group has-feedback" style="display:inline-block;">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px; ">
											<label style="font-weight:normal;">1. 진찰료 </label>
										</div>
										<div style="display: inline-block">
											<input type="text" id="Consultation fee"
												name="Consultation fee" value="0"
												style="width: 100px; text-align: right; height:20px;" readonly>
										</div>
									</div>
									<div class="form-group has-feedback" style="display:inline-block;">
										<div
											style="display: inline-block; width: 102px; text-align: right; margin-left:50px; font-size:12px;">
											<label style="font-weight:normal;">7. 입원료 </label>
										</div>
										<div style="display: inline-block">
											<input type="text" id="Admission fee"
												name="Admission fee" value="0"
												style="width: 100px; text-align: right; height:20px;" readonly>
										</div>
									</div>
									</div>
									<div>
									<div class="form-group has-feedback" style="display:inline-block">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px;">
											<label style="font-weight:normal;">2. 주사료 </label>
										</div>
										<div style="display: inline-block">
											<input type="text" id="Injection fee" name="Injection fee"
												value="0" style="width: 100px; text-align: right; height:20px;" readonly>
										</div>
									</div>
									<div class="form-group has-feedback" style="display:inline-block;">
										<div
											style="display: inline-block; width: 102px; text-align: right; margin-left:50px; font-size:12px;">
											<label style="font-weight:normal">8. 식대 </label>
										</div>
										<div style="display: inline-block">
											<input type="text" id="Meals fee" name="Meals fee"
												value="0" style="width: 100px; text-align: right; height:20px;" readonly>
										</div>
									</div>
									</div>
									<div class="form-group has-feedback">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px; ">
											<label style="font-weight:normal;">3. 마취료</label>
										</div>
										<div style="display: inline-block">
											<input type="text" id="Anesthesia fee" name="Anesthesia fee"
												value="0" style="width: 100px; text-align: right; height:20px;" readonly>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px;">
											<label style="font-weight:normal">4. 검사료</label>
										</div>
										<div style="display: inline-block">
											<input type="text" name="Inspection fee" id="Inspection fee"
												style="width: 100px; text-align: right; height:20px;" value="0" readonly>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px;">
											<label style="font-weight:normal">5.처치 및 수술료</label>
										</div>
										<div style="display: inline-block">
											<input type="text" name="Treatment fee" id="Treatment fee"
												style="width: 100px; text-align: right; height:20px;" value="0" readonly>
										</div>
									</div>
									<div class="form-group has-feedback">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:12px;">
											<label style="font-weight:normal; margin-bottom:20px !important;">6.영상진단</label>
										</div>
										<div style="display: inline-block">
											<input type="text" name="Diagnosis" id="Diagnosis"
												style="width: 100px; text-align: right; height:20px;" value="0" readonly>
										</div>
									</div>

								</div>
							</div>
							<div style="display:inline-block; vertical-align: 110px;">
								<div class="form-group has-feedback" style="display:inline-block;">
										<div
											style="display: inline-block; width: 102px; text-align: right; font-size:20px;">
											<label>납부 총액</label>
										</div>
										<div style="display: inline-block">
											<input type="text" name="TotalAcceptance" id="TotalAcceptance"
												style="width: 100px; text-align: right; height:20px;" value="0" readonly>
										</div>
									</div>
							</div>
					</div>
					<!-- /.row (main row) -->
			</section>
			<!-- /.content -->
		</div>
		<script>
			
		</script>
		
		<!-- /.content-wrapper -->
		<c:import url="../common/footer.jsp" />
		<c:import url="../common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />

</body>
</html>

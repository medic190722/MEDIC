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
	border: 1px solid;
	text-align:center;
}
thead th{
	border:1px solid;
	text-align:center;
}
table{
	text-align:center;
}
tbody td{
	border: 1px solid;
}
.form-group{
	margin-bottom:5px !important;
}
table input[type=text]{
	border:none;
	text-align:right;
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
								<div style="text-align: center; width:90%; margin:10px auto;">
								<table style="border: 1px solid; width:100%; align:center;">
									<thead>
										<tr>
											<th>항목</th>
											<th>요양급여</th>
											<th>비급여</th>
											<th>항목</th>
											<th>금액산정내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>진 찰 료</td>
											<td><input type="text" id="Consultation" name="Consultation" value="5000" /></td>
											<td><input type="text" id="Consultation_1" name="Consultation_1" value="0" /></td>
											<td rowspan="2">진료비총액</td>
											<td rowspan="2"><input type="text" id="TotalConsultation fee" name="TotalConsultation fee" value="5000" /></td>
										</tr>
										<tr>
											<td>입 원 료</td>
											<td><input type="text" id="Admission" name="Admission" value="0" /></td>
											<td><input type="text" id="Admission_1" name="Admission_1" value="0" /></td>
										</tr>
										<tr>
											<td>식   대</td>
											<td><input type="text" id="Meals" name="Meals" value="0" /></td>
											<td><input type="text" id="Meals_1" name="Meals_1" value="0" /></td>
											<td rowspan="2">환자부담총액</td>
											<td rowspan="2"><input type="text" id="TotalPatient" name="TotalPatient" value="5000" /></td>
										</tr>
										<tr>
											<td>투약 및 조제료</td>
											<td><input type="text" id="DosingAndFormulation" name="DosingAndFormulation" value="0" /></td>
											<td><input type="text" id="DosingAndFormulation_1" name="DosingAndFormulation_1" value="0" /></td>
										</tr>
										<tr>
											<td>주 사 료</td>
											<td><input type="text" id="Injection" name="Injection" value="0" /></td>
											<td><input type="text" id="Injection_1" name="Injection_1" value="0" /></td>
											<td>이미납부한금액</td>
											<td><input type="text" id="AlreadyPaid" name="AlreadyPaid" value="0" /></td>
										</tr>
										<tr>
											<td>마 취 료</td>
											<td><input type="text" id="Anesthesia" name="Anesthesia" value="0" /></td>
											<td><input type="text" id="Anesthesia_1" name="Anesthesia_1" value="0" /></td>
											<td>수납금액</td>
											<td><input type="text" id="acc_amount" name="acc_amount" value="0" /></td>
										</tr>
										<tr>
											<td>처치 및 수술료</td>
											<td><input type="text" id="TreatmentAndSurgery" name="TreatmentAndSurgery" value="0" /></td>
											<td><input type="text" id="TreatmentAndSurgery" name="TreatmentAndSurgery" value="0" /></td>
											<td colspan="2">수납내역</td>											
										</tr>
										<tr>
											<td>검 사 료</td>
											<td><input type="text" id="Inspection" name="Inspection" value="0" /></td>
											<td><input type="text" id="Inspection_1" name="Inspection_1" value="0" /></td>
											<td>총진료비</td>
											<td><input type="text" id="TotalAmount" name="TotalAmount" value="0" /></td>
										</tr>
										<tr>
											<td rowspan="2">영상진단 및 방사선진단료</td>
											<td rowspan="2"><input type="text" id="ImageAndRadiation" name="ImageAndRadiation" value="0" /></td>
											<td rowspan="2"><input type="text" id="ImageAndRadiation_1" name="ImageAndRadiation_1" value="0" /></td>
											<td>청구액</td>
											<td><input type="text" id="Charge" name="Charge" value="0" /></td>
										</tr>
										<tr>
											<td>본인부담금</td>
											<td><input type="text" id="Copay" name="Copay" value="0" /></td>
										</tr>
										<tr>
											<td>치료재료대</td>
											<td><input type="text" id="Treatment" name="Treatment" value="0" /></td>
											<td><input type="text" id="Treatment_1" name="Treatment_1" value="0" /></td>
											<td>장애인의료비</td>
											<td><input type="text" id="DisabledExpense" name="DisabledExpense" value="0" /></td>
										</tr>
										<tr>
											<td>전액본인부담</td>
											<td><input type="text" id="FullPayment" name="FullPayment" value="0" /></td>
											<td><input type="text" id="FullPayment_1" name="FullPayment_1"value="0" /></td>
											<td>할인액</td>
											<td><input type="text" id="Discount" name="Discount" value="0" /></td>
										</tr>
										<tr>
											<td> 계 </td>
											<td><input type="text" id="TotalPrice" name="TotalPrice" value="0"/></td>
											<td><input type="text" id="TotalPrice_1" name="TotalPrice_1" value="0"/></td>
											<td colspan="2">받은금액</td>
										</tr>
										<tr>
											<td rowspan="3" colspan="3"></td>
											<td>현   금</td>
											<td><input type="text" id="Cash" name="Cash" value="0"/></td>
										</tr>
										<tr>
											<td>카   드</td>
											<td><input type="text" id="Card" name="Card" value="0"/></td>
										</tr>
										<tr>
											<td>합   계</td>
											<td><input type="text" id="Total" name="Total" value="0"/></td>
										</tr>
									</tbody>
								</table>								
							</div>
							<div style="text-align:center">
								<button type="button" class="btn btn-primary btn-lg" style="display:inline-block; width: 100px; font-size:15px;">수납</button>
								<button type="button" class="btn btn-primary btn-lg" style="display:inline-block; width: 100px; font-size:15px;">처방전</button>
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

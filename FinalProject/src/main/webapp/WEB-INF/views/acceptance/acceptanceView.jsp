<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import= "java.util.Date, java.text.SimpleDateFormat" %>
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

						<form action="${pageContext.request.contextPath}/acceptance/acceptanceView.do"
							method="post">
							<div id="print_page">
							<input type="hidden" id="p_admission_yn" name="p_admission_yn" value="${patient.p_admission_yn}" />
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
											style="width: 100px; text-align: center;" value="초진" readonly>
										</c:if>
										<c:if test="${patient.p_firstdate ne patient.p_lastdate}">
										<input type="text" name="m_treatment" id="m_treatment"
											style="width: 100px; text-align: center;" value="재진" readonly>
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
										<c:if test="${patient.p_admission_yn eq 'N'}">
										<input type="text" name="m_date" id="m_date"
											style="width: 150px; text-align:center" value="${patient.m_date}" readonly>
										</c:if>
										<c:if test="${patient.p_admission_yn eq 'Y' }">
										<%
											Date now = new Date();
							 				SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd"/* 일 E요일 a hh:mm:ss */);
 
											 String today = sf.format(now);
										%>
										<input type="text" name="m_date" id="m_date"
											style="width: 150px; text-align:center" value="${patient.m_date} ~ <%=today %>" readonly>
										</c:if>
										
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
											<td><input type="text" id="Consultation" name="Consultation" value="5000" readonly/></td>
											<td><input type="text" id="Consultation_1" name="Consultation_1" value="0" readonly/></td>
											<td rowspan="2">진료비총액</td>
											<td rowspan="2"><input type="text" id="TotalConsultation" name="TotalConsultation" value="0" readonly/></td>
										</tr>
										<tr>
											<td>입 원 료</td>
											<td><input type="text" id="Admission" name="Admission" value="0" readonly/></td>
											<td><input type="text" id="Admission_1" name="Admission_1" value="0" readonly/></td>
										</tr>
										<tr>
											<td>식   대</td>
											<td><input type="text" id="Meals" name="Meals" value="0" /></td>
											<td><input type="text" id="Meals_1" name="Meals_1" value="0" /></td>
											<td rowspan="2">환자부담총액</td>
											<td rowspan="2"><input type="text" id="TotalPatient" name="TotalPatient" value="0" readonly/></td>
										</tr>
										<tr>
											<td>투약 및 조제료</td>
											<td><input type="text" id="DosingAndFormulation" name="DosingAndFormulation" value="0" readonly/></td>
											<td><input type="text" id="DosingAndFormulation_1" name="DosingAndFormulation_1" value="0" readonly/></td>
										</tr>
										<tr>
											<td>주 사 료</td>
											<td><input type="text" id="Injection" name="Injection" value="0" readonly/></td>
											<td><input type="text" id="Injection_1" name="Injection_1" value="0" readonly/></td>
											<td>이미납부한금액</td>
											<td><input type="text" id="AlreadyPaid" name="AlreadyPaid" value="0" readonly/></td>
										</tr>
										<tr>
											<td>마 취 료</td>
											<td><input type="text" id="Anesthesia" name="Anesthesia" value="0" readonly/></td>												
											<td><input type="text" id="Anesthesia_1" name="Anesthesia_1" value="0" readonly/></td>
											<td>수납금액</td>
											<td><input type="text" id="Storage" name="Storage" value="0" readonly/></td>
										</tr>
										<tr>
											<td>처치 및 수술료</td>
											<td><input type="text" id="TreatmentAndSurgery" name="TreatmentAndSurgery" value="0" readonly/></td>
											<td><input type="text" id="TreatmentAndSurgery" name="TreatmentAndSurgery" value="0" readonly/></td>
											<td colspan="2">수납내역</td>											
										</tr>
										<tr>
											<td>검 사 료</td>
											<td><input type="text" id="Inspection" name="Inspection" value="0" readonly/></td>
											<td><input type="text" id="Inspection_1" name="Inspection_1" value="0" readonly/></td>
											<td>총진료비</td>
											<td><input type="text" id="TotalAmount" name="TotalAmount" value="0" readonly/></td>
										</tr>
										<tr>
											<td rowspan="2">영상진단 및 방사선진단료</td>
											<td rowspan="2"><input type="text" id="ImageAndRadiation" name="ImageAndRadiation" value="0" readonly/></td>
											<td rowspan="2"><input type="text" id="ImageAndRadiation_1" name="ImageAndRadiation_1" value="0" readonly/></td>
											<td>청구액</td>
											<td><input type="text" id="Charge" name="Charge" value="0" readonly/></td>
										</tr>
										<tr>
											<td>본인부담금</td>
											<td><input type="text" id="Copay" name="Copay" value="0" readonly/></td>
										</tr>
										<tr>
											<td>치료재료대</td>
											<td><input type="text" id="Treatment" name="Treatment" value="0" readonly /></td>
											<td><input type="text" id="Treatment_1" name="Treatment_1" value="0" readonly/></td>
											<td>장애인의료비</td>
											<td><input type="text" id="DisabledExpense" name="DisabledExpense" value="0" readonly/></td>
										</tr>
										<tr>
											<td>전액본인부담</td>
											<td><input type="text" id="FullPayment" name="FullPayment" value="0" readonly/></td>
											<td><input type="text" id="FullPayment_1" name="FullPayment_1"value="0" readonly/></td>
											<td>할인액</td>
											<td><input type="text" id="Discount" name="Discount" value="0" readonly/></td>
										</tr>
										<tr>
											<td> 계 </td>
											<td><input type="text" id="TotalPrice" name="TotalPrice" value="0" readonly/></td>
											<td><input type="text" id="TotalPrice_1" name="TotalPrice_1" value="0" readonly/></td>
											<td>받을금액</td>
											<td><input type="text" id="acc_total_amount" name="acc_total_amount" value="0"/></td>
										</tr>
										<tr>
											<td rowspan="4" colspan="3"></td>
											<td colspan="2">받은금액</td>
										</tr>
										<tr>
											<td>현   금</td>
											<td>	
											<c:if test="${ Cash eq 0 }">							
												<input type="text" id="Cash" name="Cash" value="0" onkeyup="calCash(this.value)"/>
											</c:if>
											<c:if test="${ Cash ne 0 }">
												<input type="text" id="Cash" name="Cash" value="${Cash}" readonly/>
											</c:if>
											</td>
										</tr>
										<tr>
											<td>카   드</td>
											<td>
											<c:if test="${ Card eq 0 }">							
												<input type="text" id="Card" name="Card" value="0" onkeyup="calCard(this.value)"/>
											</c:if>
											<c:if test="${ Card ne 0 }">
												<input type="text" id="Card" name="Card" value="${Card}" readonly/>
											</c:if>
											</td>
										</tr>
										<tr>
											<td>합   계</td>
											<td>
											<c:if test="${ acc_amount eq 0 }">							
												<input type="text" id="acc_amount" name="acc_amount" value="0"/>
											</c:if>
											<c:if test="${ acc_amount ne 0 }">
												<input type="text" id="acc_amount" name="acc_amount" value="${acc_amount}" readonly/>
											</c:if>
											</td>
										</tr>
									</tbody>
								</table>								
							</div>
							</div>
							<div style="text-align:center">
								<c:if test="${ Cash eq 0 and Card eq 0 and acc_amount eq 0 }">
									<button type="submit" class="btn btn-primary btn-lg" style="display:inline-block; width: 100px; font-size:15px;">수납</button>
								</c:if>
								<c:if test="${Cash ne 0 or Card ne 0 or acc_amount ne 0 }">
									<button type="button" class="btn btn-primary btn-lg" onclick="pageprint()" style="display:inline-block; width: 100px; font-size:15px;">영수증</button>
								</c:if>
								<button type="button" class="btn btn-primary btn-lg" style="display:inline-block; width: 100px; font-size:15px;">처방전</button>
							</div>
						</form>
					</div>
					</div>
					<!-- /.row (main row) -->
			</section>
			<!-- /.content -->
		</div>
		<script>
			var Storage = Number($('#Consultation').val()) + Number($('#TotalPatient').val()) - Number($('#AlreadyPaid').val());
			var TotalConsultation = Number($('#Consultation').val()) + Number($('#TotalConsultation').val());
			var TotalPatient = Number($('#Consultation').val()) + Number($('#TotalPatient').val());
			var TotalPrice = Number($('#Consultation').val()) + Number($('#TotalPrice').val());

		</script>
		<%-- <c:if test="${ !empty examination }"> --%>
		<c:if test="${empty examination }">
			<script>
				$(document).ready(function() {
					
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				});
			</script>
		</c:if>
		
		<c:if test="${patient.p_admission_yn eq 'N' }">
		<c:forEach items="${examination}" var="e">
			<c:if test="${ e eq '주사' }">
				<script>
				/* console.log(Number($('#Consultation').val()));
				console.log(Number($('#TotalPatient').val()));
				console.log(Number($('#AlreadyPaid').val()));
				console.log(Storage);
				console.log(TotalPatient);
				console.log(TotalPrice); */
					$('#Injection').val('5000');
					Storage += Number($('#Injection').val());
					TotalConsultation += Number($('#Injection').val());
					TotalPatient += Number($('#Injection').val()); 
					TotalPrice += Number($('#Injection').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
				</script>
			</c:if>
			<c:if test="${ e eq '마취 '}">
				<script>
					$('#Anesthesia').val('10000');
					Storage += Number($('#Anesthsia').val());
					TotalConsultation += Number($('#Anesthsia').val());
					TotalPatient += Number($('#Anesthsia').val());
					TotalPrice += Number($('#Anesthsia').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
			<c:if test="${ e eq '처치'}">
				<script>
					$('#TreatmentAndSurgery').val('6000');
					Storage += Number($('#TreatmentAndSurgery').val());
					TotalConsultation += Number($('#TreatmentAndSurgery').val());
					TotalPatient += Number($('#TreatmentAndSurgery').val()); 
					TotalPrice += Number($('#TreatmentAndSurgery').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>				
			</c:if>
			<c:if test="${ e eq '수술' }">
				<script>
					$('#TreatmentAndSurgery').val('20000');
					Storage += Number($('#TreatmentAndSurgery').val());
					TotalConsultation += Number($('#TreatmentAndSurgery').val());
					TotalPatient += Number($('#TreatmentAndSurgery').val()); 
					TotalPrice += Number($('#TreatmentAndSurgery').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
			<c:if test="${ e eq '혈액 검사' }">
				<script>
					$('#Inspection').val('7000');
					Storage += Number($('#Inspection').val());
					TotalConsultation += Number($('#Inspection').val());
					TotalPatient += Number($('#Inspection').val()); 
					TotalPrice += Number($('#Inspection').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
			<c:if test="${ e eq '영상 진단' }">
				<script>
					$('#ImageAndRadiation').val('15000');		
					Storage += Number($('#ImageAndRadiation').val());
					TotalConsultation += Number($('#ImageAndRadiation').val());
					TotalPatient += Number($('#ImageAndRadiation').val()); 
					TotalPrice += Number($('#ImageAndRadiation').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
			<c:if test="${ e eq '방사선진단' }">
				<script>
					$('#ImageAndRadiation').val('20000');
					Storage += Number($('#ImageAndRadiation').val());
					TotalConsultation += Number($('#ImageAndRadiation').val());
					TotalPatient += Number($('#ImageAndRadiation').val()); 
					TotalPrice += Number($('#ImageAndRadiation').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
			<c:if test="${ e eq '물리 치료' }">
				<script>
					$('#Treatment').val('10000');
					Storage += Number($('#Treatment').val());
					TotalConsultation += Number($('#Treatment').val());
					TotalPatient += Number($('#Treatment').val()); 
					TotalPrice += Number($('#Treatment').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
				</script>
			</c:if>
		</c:forEach>
		</c:if>
		<c:if test="${patient.p_admission_yn eq 'Y'}">
		
			<c:if test = "${ !empty injection_count}">
				<input type="hidden" id="injection_count" name="injection_count" value="${injection_count}">
			<script>
			var injection = 5000;
			var injection_count = Number($('#injection_count').val());
			var injection_amount = injection * injection_count
				$('#Injection').val(injection_amount);
					Storage += Number($('#Injection').val());
					TotalConsultation += Number($('#Injection').val());
					TotalPatient += Number($('#Injection').val()); 
					TotalPrice += Number($('#Injection').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
			
			<c:if test = "${ !empty anesthesia_count}">
				<input type="hidden" id="anesthesia_count" name="anesthesia_count" value="${anesthesia_count}">
			<script>
			var anesthesia = 10000;
			var anesthesia_count = Number($('#anesthesia_count').val());
			var anesthesia_amount = anesthesia * anesthesia_count
				$('#Anesthesia').val(anesthesia_amount);
					Storage += Number($('#Anesthesia').val());
					TotalConsultation += Number($('#Anesthesia').val());
					TotalPatient += Number($('#Anesthesia').val()); 
					TotalPrice += Number($('#Anesthesia').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
			
			<c:if test = "${ !empty treatmentAndSurgery_count}">
				<input type="hidden" id="treatmentAndSurgery_count" name="treatmentAndSurgery_count" value="${treatmentAndSurgery_count}">
			<script>
			var treatmentAndSurgery = 20000;
			var treatmentAndSurgery_count = Number($('#treatmentAndSurgery_count').val());
			var treatmentAndSurgery_amount = treatmentAndSurgery * treatmentAndSurgery_count
				$('#TreatmentAndSurgery').val(treatmentAndSurgery_amount);
					Storage += Number($('#TreatmentAndSurgery').val());
					TotalConsultation += Number($('#TreatmentAndSurgery').val());
					TotalPatient += Number($('#TreatmentAndSurgery').val()); 
					TotalPrice += Number($('#TreatmentAndSurgery').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
		
			<c:if test = "${ !empty inspection_count}">
				<input type="hidden" id="inspection_count" name="inspection_count" value="${inspection_count}">
			<script>
			var inspection = 7000;
			var inspection_count = Number($('#inspection_count').val());
			var inspection_amount = inspection * inspection_count
				$('#Inspection').val(inspection_amount);
					Storage += Number($('#Inspection').val());
					TotalConsultation += Number($('#Inspection').val());
					TotalPatient += Number($('#Inspection').val()); 
					TotalPrice += Number($('#Inspection').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
			
			<c:if test = "${ !empty image_count}">
				<input type="hidden" id="image_count" name="image_count" value="${image_count}">
			<script>
			var image = 15000;
			var image_count = Number($('#image_count').val());
			var image_amount = image * image_count
				$('#ImageAndRadiation').val(image_amount);
					Storage += Number($('#ImageAndRadiation').val());
					TotalConsultation += Number($('#ImageAndRadiation').val());
					TotalPatient += Number($('#ImageAndRadiation').val()); 
					TotalPrice += Number($('#ImageAndRadiation').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>			
			
			<c:if test = "${ !empty radiation_count}">
				<input type="hidden" id="radiation_count" name="radiation_count" value="${radiation_count}">
			<script>
			var radiation = 20000;
			var radiation_count = Number($('#radiation_count').val());
			var radiation_amount = radiation * radiation_count
				$('#ImageAndRadiation').val(radiation_amount);
					Storage += Number($('#ImageAndRadiation').val());
					TotalConsultation += Number($('#ImageAndRadiation').val());
					TotalPatient += Number($('#ImageAndRadiation').val()); 
					TotalPrice += Number($('#ImageAndRadiation').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
			
			<c:if test = "${ !empty treatment_count}">
				<input type="hidden" id="treatment_count" name="treatment_count" value="${treatment_count}">
			<script>
			var treatment = 20000;
			var treatment_count = Number($('#treatment_count').val());
			var treatment_amount = treatment * treatment_count;
				$('#Treatment').val(treatment_amount);
					Storage += Number($('#Treatment').val());
					TotalConsultation += Number($('#Treatment').val());
					TotalPatient += Number($('#Treatment').val()); 
					TotalPrice += Number($('#Treatment').val());
					$('#Storage').val(Storage);		
					$('#TotalConsultation').val(TotalConsultation);
					$('#TotalPatient').val(TotalPatient);
					$('#TotalAmount').val(TotalConsultation);
					$('#Copay').val(TotalPatient);
					$('#Charge').val(TotalConsultation);
					$('#TotalPrice').val(TotalPrice);
					$('#acc_total_amount').val(TotalConsultation);
					console.log(TotalConsultation)
					console.log($('#acc_total_amount'));
			</script>
			</c:if>
			
		</c:if>
		<%-- </c:if> --%>
		
		<script>
			function calCash(val){
    			var origin = parseInt(val);
			    var cash = origin;
			    var card = Number($('#Card').val());
			    
			    if(val == ""){
			    	$('#acc_amount').val("0");
			    }else{
			    	$('#acc_amount').val(cash+card);
			    }			    
			}
			
			function calCard(val){
				var originCard = parseInt(val);
				var card = originCard;
				var cash = Number($('#Cash').val());
			
				if(val == ""){
					$('#acc_amount').val("0");
				} else{
					$('#acc_amount').val(card+cash);
				}
			}
			
		</script>
		<script>
		
		var initBody;
		function beforePrint() {
			initBody = document.body.innerHTML; 
			document.body.innerHTML = print_page.innerHTML;
		}
		
		function afterPrint() {
			document.body.innerHTML = initBody; 
		} 
		
		function pageprint() {
			window.onbeforeprint = beforePrint; 
			window.onafterprint = afterPrint; 
			window.print();
		} 
		
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
		
		
		<!-- /.content-wrapper -->
		<c:import url="../common/footer.jsp" />
		<c:import url="../common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />

</body>
</html>

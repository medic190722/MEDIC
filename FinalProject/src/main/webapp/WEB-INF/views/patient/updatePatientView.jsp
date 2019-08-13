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
				<h1>환자 정보 수정</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Main</li>
					<li class="active">환자관리</li>
					<li class="active">환자 정보 수정</li>
				</ol>
			</section>
			<!-- Main content -->
			<section class="content">
				<!-- Main row -->
				<div class="row">
					<div class="outReceipt"
						style="width: 500px; margin: 0 auto; margin-top: 50px;">
						<p class="login-box-msg">
							환자 정보를 수정해주세요.
						</p>

						<form
							action="${pageContext.request.contextPath}/patient/updatePatient.do"
							method="post">
							<input type="hidden" name="p_no" value="${patient.p_no}">
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">이름 </label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_name" name="p_name"
										value="${patient.p_name}" style="width : 300px; text-align:center" required>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">나이 </label>
								</div>
								<div style="display: inline-block">
									<input type="number" id="p_age" name="p_age" min=0
										value="${patient.p_age}" style="width : 300px; text-align:center" required>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">성별</label>
								</div>
								<div style="display:inline-block; width:300px; text-align: center;">
								<input type="radio" class="form-check-input" name="p_gender"
									id="gender0" value="M" ${patient.p_gender=='M'?'checked':''}>
								<label for="gender0">남</label> <input type="radio"
									class="form-check-input" name="p_gender" id="gender1" value="F"
									${patient.p_gender=='F'?'checked':''}> <label
									for="gender1">여</label>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">주민등록 번호</label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_rrn" name="p_rrn"
										class="form-check-input" value="${patient.p_rrn}" style="width : 300px; text-align:center" readonly />
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">주소</label>
								</div>
								<div style="display: inline-block">
									<input type="text" name="p_address" id="p_address"
										style="width : 300px; text-align:center" value="${patient.p_address}" >
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">전화번호</label>
								</div>
								<div style="display: inline-block">
									<div style="display: inline-block">
										<select name="p_phone" id="phone1" class=""
											style="width: 70px; height: 26px; display: inline">
											<option value="010"
												${patient.p_phone[0].substring(0,3)=='010'?'selected':''}>010</option>
											<option value="02"
												${patient.p_phone[0].substring(0,2)=='02'?'selected':''}>02</option>
											<option value="031"
												${patient.p_phone[0].substring(0,3)=='031'?'selected':''}>031</option>
											<option value="032"
												${patient.p_phone[0].substring(0,3)=='032'?'selected':''}>032</option>
											<option value="033"
												${patient.p_phone[0].substring(0,3)=='033'?'selected':''}>033</option>
											<option value="041"
												${patient.p_phone[0].substring(0,3)=='041'?'selected':''}>041</option>
											<option value="042"
												${patient.p_phone[0].substring(0,3)=='042'?'selected':''}>042</option>
											<option value="043"
												${patient.p_phone[0].substring(0,3)=='043'?'selected':''}>043</option>
											<option value="044"
												${patient.p_phone[0].substring(0,3)=='044'?'selected':''}>044</option>
											<option value="051"
												${patient.p_phone[0].substring(0,3)=='051'?'selected':''}>051</option>
											<option value="052"
												${patient.p_phone[0].substring(0,3)=='052'?'selected':''}>052</option>
											<option value="053"
												${patient.p_phone[0].substring(0,3)=='053'?'selected':''}>053</option>
											<option value="054"
												${patient.p_phone[0].substring(0,3)=='054'?'selected':''}>054</option>
											<option value="055"
												${patient.p_phone[0].substring(0,3)=='055'?'selected':''}>055</option>
											<option value="061"
												${patient.p_phone[0].substring(0,3)=='061'?'selected':''}>061</option>
											<option value="062"
												${patient.p_phone[0].substring(0,3)=='062'?'selected':''}>062</option>
											<option value="063"
												${patient.p_phone[0].substring(0,3)=='063'?'selected':''}>063</option>
											<option value="064"
												${patient.p_phone[0].substring(0,3)=='064'?'selected':''}>064</option>
										</select> <label for="">-</label> <input type="text" id="p_phone2"
											name="p_phone" class="" placeholder=""
											style="width: 100px; text-align: center;" maxlength="4"
											value="${patient.p_phone[0].substring(0,2)=='02'?patient.p_phone[0].substring(3,7) :patient.p_phone[0].substring(4,8)}">
										<label for="">-</label> <input type="text" id="p_phone3"
											name="p_phone" class="" placeholder=""
											style="width: 100px; text-align: center;" maxlength="4"
											value="${patient.p_phone[0].substring(0,2)=='02'? patient.p_phone[0].substring(8,12) :patient.p_phone[0].substring(9,13)}">
									</div>
								</div>
							</div>



							<div class="row">
								<div class="col-xs-12"
									style="line-height: 60px; margin: 0 auto; text-align: center;">
									<button type="submit" class="btn btn-primary "
										style="margin: 0 auto; width: 200px;">정보수정</button>
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
		<c:import url="../common/footer.jsp" />
		<c:import url="../common/sidebar.jsp" />
	</div>
	<!-- ./wrapper -->
	<c:import url="../common/scripts.jsp" />
	<script>
		function autoHypenResidentRegistrationNumber(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 6) {
				return str;
			} else if (str.length < 6) {
				tmp += str.substr(0, 6);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 6);
				tmp += '-';
				tmp += str.substr(6, 7);
				return tmp;
			}
			return str;
		}

		var residentRegistrationNumber = document.getElementById('p_rrn');
		residentRegistrationNumber.onkeyup = function(event) {
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenResidentRegistrationNumber(_val);
		}
	</script>
</body>
</html>

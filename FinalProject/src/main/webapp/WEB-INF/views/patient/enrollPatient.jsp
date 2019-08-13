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
				<h1>환자등록</h1>
				<ol class="breadcrumb">
					<li><a href="/medic/common/main.do"><i
							class="fa fa-dashboard"></i> Home</a></li>
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
					<div class=" outReceipt"
						style="width: 500px; margin: 0 auto; margin-top: 50px;">
						<p class="login-box-msg">
							환자를 등록해주세요.
						</p>

						<form onsubmit="return validate();"
							action="${pageContext.request.contextPath}/patient/enrollPatient.do"
							method="post">
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">이름 </label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_name" name="p_name" style="width:300px;  text-align: center;" required >
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">나이 </label>
								</div>
								<div style="display: inline-block">
									<input type="number" id="p_age" name="p_age" min=0 style="width:300px; text-align: center;" required>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">성별</label>
								</div>
								<div style="display: inline-block">
									<input type="radio" class="form-check-input" name="p_gender"
										id="gender0" value="M"> <label for="gender0">남</label>
									<input type="radio" class="form-check-input" name="p_gender"
										id="gender1" value="F"> <label for="gender1">여</label>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">주민등록 번호</label>
								</div>
								<div style="display: inline-block">
									<input type="text" id="p_rrn" name="p_rrn"
										class="form-check-input" style="width:300px;  text-align: center;"/>
									
								</div>
								<div style="text-align: center;">
								<div id="rrnResult" style="display: inline-block;"></div>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div
									style="display: inline-block; width: 100px; text-align: center">
									<label for="">주소</label>
								</div>
								<div style="display: inline-block">
									<input type="text" name="p_address" id="p_address"
										style="width: 300px;  text-align: center;">
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
										</select> <label for="">-</label> <input type="text" id="p_phone2"
											name="p_phone" class="" placeholder=""
											style="width: 100px; text-align: center;" maxlength="4">
										<label for="">-</label> <input type="text" id="p_phone3"
											name="p_phone" class="" placeholder=""
											style="width: 100px; text-align: center;" maxlength="4">
									</div>
								</div>
							</div>


							<div class="row">
								<div class="col-xs-12"
									style="line-height: 60px; margin: 0 auto; text-align: center;">
									<button type="submit" class="btn btn-primary "
										style="margin: 0 auto; width: 200px;">등록</button>
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

		$('#p_rrn').change(function() {
			var num1 = $("#p_rrn").val().substr(0, 6);
			var num2 = $("#p_rrn").val().substr(7, 13);

			var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
			var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

			// -------------- 주민번호 -------------
			// 주민번호 앞자리를 배열에 순서대로 담는다.
			console.log($('#p_rrn').val().substr(0, 6));
			for (var i = 0; i < num1.length; i++) {
				arrNum1[i] = num1.charAt(i);
				console.log(arrNum1[i]);
			}
			console.log(num2.length);
			console.log(num2.charAt(0));
			// 주민번호 뒷자리를 배열에 순서대로 담는다.
			for (var i = 0; i < num2.length; i++) {
				arrNum2[i] = num2.charAt(i);
				console.log(arrNum2[i]);
			}
			console.log(num2.length);
			console.log(arrNum2);

			var tempSum = 0;

			// 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
			for (var i = 0; i < num1.length; i++) {
				tempSum += arrNum1[i] * (2 + i);
			}

			// 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
			for (var i = 0; i < num2.length - 1; i++) {
				if (i >= 2) {
					tempSum += arrNum2[i] * i;
				} else {
					tempSum += arrNum2[i] * (8 + i);
				}
			}
			console.log(tempSum);
			console.log((11 - (tempSum % 11)));
			console.log(arrNum2);
			console.log(Number(arrNum2[6]));
			if ((11 - (tempSum % 11)) % 10 != arrNum2[6]) {
				$('#rrnResult').html('올바른 주민번호가 아닙니다.').css('color', 'red');

				$(this).select();

			} else {
				$('#rrnResult').html('올바른 주민번호 입니다').css('color', 'green');

			}
		});
	</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<script>
	function check() {
		var form = document.authenform;
		var authNum = ${authNum};

		console.log("이게멀까" + form);

		if (!form.authnum.value) {
			alert("인증번호를 입력하세요");
			return false;
		}
		if (form.authnum.value != authNum) {
			alert("틀린 인증 번호입니다. 인증번호를 다시 입력해주세요");
			form.authnum.value = "";
			return false;
		}
		if (form.authnum.value == authNum) {
			alert("인증완료");
			//location.href = "${pageContext.request.contextPath}/mailMit/mailMitList.do";
			return true;

		}

	}
</script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Medic</title>
<c:import url="../common/header.jsp" />
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

					<!-- ---------------------------------------------------------------------------------------- -->

					<br><br><br><br><br><br><br>
					<center>
						<div
							style="width: 400px; height: 300px; background-color: #D5D5E0; text-align: center;">
							<br> <br> <br> 

							<h4>인증 번호 7자리를 입력하세요</h4>
							<Br><Br>

							<div>
								<form method="post" action="../mailMit/mailMitList.do"
									name="authenform" onSubmit="return check();">
									<input type="text" name="authnum" style="width:200px"><br> <br> 
									<input type="submit" class="btn btn-info" value="Submit">
								</form>
							</div>
						</div>
					</center>




					<!-- ---------------------------------------------------------------------------------------- -->

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


</body>
</html>

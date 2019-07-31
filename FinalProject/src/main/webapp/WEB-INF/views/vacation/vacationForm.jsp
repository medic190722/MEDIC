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
<script>
	function yes(vCode) {
		console.log(vCode);
		location.href = "${pageContext.request.contextPath}/vacation/vacationYes.do?vCode="
				+ vCode;
	}

	function no(vCode) {
		location.href = "${pageContext.request.contextPath}/vacation/vacationNo.do?vCode="
				+ vCode;
	}

	function deleteVacation(vCode) {
		location.href = "${pageContext.request.contextPath}/vacation/deleteVacation.do?vCode="
				+ vCode;
	}

	function closeVacation() {
		location.href = "${pageContext.request.contextPath}/vacation/vacationList.do"
	}
</script>

<style>
.kiho {
	width: 700px;
	align-content: center; margin : 0 auto; margin-top : 20px;
	align-content : center;
	margin: 0 auto;
	margin: 0 auto;
	margin-top: 20px;
	align-content: center;
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

					<!--  ================================================================================================= -->

					<br> <br> <br> <br>



					<div class="kiho">
						<div>
							<div style="display: inline-block !important;">
								<input type="text" class="form-control" id="name"
									placeholder="${vacation.vCode}" readonly>
							</div>
							<div style="display: inline-block !important;">
								<input type="text" class="form-control" id="name"
									placeholder="${vacation.empName}" readonly>
							</div>
						</div>
						<div style="display: inline-block !important;">
							<input type="email" class="form-control" id="email"
								placeholder="${vacation.vDate}" readonly>
						</div>
						~
						<div style="display: inline-block !important;">
							<input type="email" class="form-control" id="email"
								placeholder="${vacation.vDateEnd}" readonly>
						</div>
						<div>
							<textarea class="form-control mb-10" rows="3" name="message"
								placeholder="${vacation.vContent}" readonly></textarea>
						</div>
					</div>

				</div>

				<div style="text-align: center;">

					<br> <Br>



					<button class="btn btn-primary" id="yes" type="button"
						onclick="yes('${vacation.vCode}');"
						style="background: #697282; border-color: #333;">승인</button>
					<button class="btn btn-primary" id="no" type="button"
						onclick="no('${vacation.vCode}');"
						style="background: #697282; border-color: #333;">승인 거절</button>
					<button class="btn btn-primary" id="deleteVacation" type="button"
						onclick="deleteVacation('${vacation.vCode}');"
						style="background: #697282; border-color: #333;">삭제</button>
					<button class="btn btn-primary" id="closeVacation" type="button"
						onclick="closeVacation();"
						style="background: #697282; border-color: #333;">뒤로가기</button>

				</div>








				<!--  ================================================================================================= -->
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

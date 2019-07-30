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
<script>
	function backGo() {
		location.href="${pageContext.request.contextPath}/equipment/equipmentList.do";
	}
</script>
<style>
tr {
	height: 60px;
}

th {
	text-align: right;
	width: 100px;
}

td {
	width: 300px;
}

td input {
	margin: 0 20px;
}

td select {
	margin: 0 20px;
}

.date {
	margin-left: 20px;
}
</style>
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

					<!-- ======================================================================================================================== -->
					<div id="container">

						<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px;">
							<form name="MedicineFrm"
								action="${pageContext.request.contextPath}/equipment/equipmentFormEnd.do"
								method="post">

								<section>
									<div style="text-align: center;">
										<table
											style="board: 1px solid #000 !important; text-align: center !important; margin: 0 auto;">
											<thead>
												<tr>
													<th>장비 코드</th>
													<td><input type="text" class="form-control"
														name="eqCode" placeholder="장비코드"></td>
												</tr>
												<tr>
													<th>장비명</th>
													<td><input type="text" class="form-control"
														name="eqName" placeholder="장비명"></td>
												</tr>
												<tr>

													<th>수량</th>
													<td><input type="number" class="form-control"
														name="eqCount" placeholder="수량"></td>

												</tr>
												<tr>

													<th>구입날짜</th>
													<td><input type="date" class="form-control"
														name="eqDate" placeholder="구입날짜"></td>

												</tr>


											</thead>
										</table>

									</div>
								</section>

								<br> <br>

								<div style="text-align: center;">

									<input type="submit" class="btn btn-primary" style="background: #697282; border-color: #333;" value="추가">
									<input type="button" class="btn btn-primary" style="background: #697282; border-color: #333;" value="취소" onclick="backGo()">
								</div>
							</form>
						</div>

						<!-- ======================================================================================================================== -->

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

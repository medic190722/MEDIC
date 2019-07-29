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

					<!-- ================================================================================== -->
					<div class="">

						<p class="login-box-msg">Register a new membership</p>


						<form
							action="${pageContext.request.contextPath}/member/memberEnrollEnd.do"
							method="post">
							<section>
								<div style="text-align: center;">
									<table
										style="board: 1px solid #000 !important; text-align: center !important; margin: 0 auto;">
										<thead>
											<tr>
												<th>사번</th>
												<td><input type="text" class="form-control"
													name="empName" placeholder="사번"></td>
											</tr>
											<tr>
												<th>이름</th>
												<td><input type="text" class="form-control"
													name="empName" placeholder="이름"></td>
											</tr>
											<tr>

												<th>급여</th>
												<td><input type="text" class="form-control"
													name="empName" placeholder="이름"></td>

											</tr>
											<tr>

												<th>부서명</th>
												<td><input type="text" class="form-control"
													name="empName" placeholder="이름"></td>

											</tr>
											<tr>

												<th>직급명</th>
												<td><input type="text" class="form-control"
													name="empName" placeholder="이름"></td>
											</tr>

										</thead>
									</table>

									<button type="submit" class="btn btn-primary"
										style="margin-top: 10px; width: 100px;">금여 수정</button>
									<button type="reset" class="btn btn-primary"
										style="margin-top: 10px; width: 100px;">취소</button>

								</div>
							</section>
						</form>
						<!-- /.col -->

						<!-- /.col -->
					</div>



				</div>





				<!-- ================================================================================== -->
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

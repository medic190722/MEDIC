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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
	$(function() {

		$("#listArea td").mouseenter(function() {
			$(this).parent().css({
				"background" : "darkgray",
				"cursor" : "pointer"
			});
		}).mouseout(function() {
			$(this).parent().css({
				"background" : "white"
			});
		}).click(
				function() {
					var mailSender = $(this).parent().children().eq(5).text();
					var mailTitle = $(this).parent().children().eq(1).text();
					var keyNum = $(this).parent().children().eq(2).text();
					var mailContent = $(this).parent().children().eq(3).text();
					var mailDate = $(this).parent().children().eq(4).text();

					console.log(mailSender);
					console.log(mailTitle);
					console.log(keyNum);
					console.log(mailContent);
					console.log(mailDate);

					location.href = "${pageContext.request.contextPath}"
							+ "/mail/mailOne.do?keyNum=" + keyNum

				});
	});
</script>
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

					<!-- ------------------------------------------------------------------------- -->



					<div class="col-md-2">
						<br> <br> <br> <br> <br> <br> <br>
						<br> <Br>
						<div class="box box-solid" style="height: 350px">
							<Br> <Br>
							<div class="box-header with-border">
								<h3 class="box-title">Folders</h3>

								<div class="box-tools">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
								</div>
							</div>
							<div class="box-body no-padding">
								<ul class="nav nav-pills nav-stacked">
									<li><a
										href="${pageContext.request.contextPath}/mailMit/mailMitList.do"><i
											class="fa fa-envelope-o"></i> 메일 보내기</a></li>
									<li class="active"><a
										href="${pageContext.request.contextPath}/mail/mail.do""><i
											class="fa fa-inbox"></i> 받은 메일 <span
											class="label label-primary pull-right">12</span></a></li>

									<li><a href="#"><i class="fa fa-file-text-o"></i> 보낸
											메일</a></li>

									<li><a href="#"><i class="fa fa-trash-o"></i> 휴지통</a></li>
								</ul>
							</div>
						</div>
					</div>






					<div class="col-md-9">
						<br> <br> <br> <br> <br> <br>
						<div class="box box-primary" style="text-align: center;">
							<div class="box-header with-border">
								<h3 class="box-title">받은 메일</h3>
							</div>

							<div class="box-body no-padding">

								<div class="searchPatient"
									style="margin: 0 auto; margin-top: 20px;">

									<table class="table table-striped table-hover" id="listArea"
										style="width: 1200px; text-align: center; margin: 0 auto;">
										<thead>
											<tr style="background: #4BA0BE;">

												<th style="text-align: center">보낸이</th>
												<th style="text-align: center">메일 제목</th>



											</tr>
											<c:forEach items="${list}" var="v">
												<tr id="${v.mailSender}" style="background: #fff;">

													<td><span><</span>${v.mailSender}></td>
													<td>${v.mailTitle}</td>
													<td style="display: none;">${v.keyNum}</td>
													<td style="display: none;">${v.mailContent}</td>
													<td style="display: none;">${v.mailDate}</td>
													<td style="display: none;">${v.mailSender}</td>
												</tr>
											</c:forEach>
									</table>
								</div>
							</div>
						</div>
					</div>






					<!-- ------------------------------------------------------------------------- -->




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

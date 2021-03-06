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
								<h3 class="box-title">상세 메일</h3>
							</div>

							<div class="box-body no-padding">
								<div>
									<table style="margin: 30px;">
										<tr>
											<td><dt class="to_dt" style="display: block;">보낸 사람
													:</dt></td>
											<td><dd class="to_dd" style="display: block;">
													<a href="#">&nbsp;&nbsp;&nbsp;&nbsp;${mail.mailSender}</a></td>
										</tr>
										<tr>
											<td><dt class="to_dt" style="display: block;">제 목 :
												</dt></td>
											<td>
												<dd class="to_dd" style="display: block;">
													<a href="#">${mail.mailTitle}</a>
											</td>

										</tr>
										<tr>
											<td><dt class="to_dt" style="display: block;">날 짜 :
												</dt></td>
											<td>
												<dd class="to_dd" style="display: block;">
													<a href="#">${mail.mailDate}</a>
											</td>
										</tr>


									</table>
									<%-- <input type="text" class="form-control" style="width:80%" value="${mail.keyNum}" readonly> --%>
								</div>

								<hr>
								<dt style="text-align: left; margin: 30px;" class="to_dt" style="display: block;">내    용 :</dt>
								
								${mail.mailContent}
								<br><br><br><br><br><br><br><br><br>




							</div>
						</div>
					</div>
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

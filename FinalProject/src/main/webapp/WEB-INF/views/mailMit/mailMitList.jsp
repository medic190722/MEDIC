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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script>
	function insert() {
		location.href = "${pageContext.request.contextPath}/vacation/vacationInset.do";
	}

	$(function() {

		$("#listArea td")
				.mouseenter(function() {
					$(this).parent().css({
						"background" : "darkgray",
						"cursor" : "pointer"
					});
				})
				.mouseout(function() {
					$(this).parent().css({
						"background" : "white"
					});
				})
				.click(
						function() {
							var empNo = $(this).parent().children().eq(0)
									.text();

							console.log(empNo);

							location.href = "${pageContext.request.contextPath}/mailMit/mailMitOne.do?empNo="
									+ empNo
						});
	});

	function enterkey() {
		if (window.event.keyCode == 13) {
			search();
		}
	}

	function search() {
		var empName = $(empNameId).val();
		console.log(empName);
		location.href = "${pageContext.request.contextPath}/mailMit/searchMailMit.do?empName="
				+ empName
	}

	function clickOn() {
		var empName = $(empNameId).val();
		console.log(empName);
		location.href = "${pageContext.request.contextPath}/mailMit/searchMailMit.do?empName="
				+ empName
	}
</script>




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
									<li class="active"><a
										href="${pageContext.request.contextPath}/mailMit/mailMitList.do"><i
											class="fa fa-envelope-o"></i> 메일 보내기</a></li>
									<li ><a
										href="${pageContext.request.contextPath}/mail/mail.do"><i
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
								<h3 class="box-title">직원 리스트</h3>
							</div>

							<div class="box-body no-padding">

								<div class="has-feedback"
									style="width: 400px; display: inline-block">
									<input type="search" class="form-control input-sm"
										id="empNameId" name="empNameId" onkeyup="enterkey();" value=""
										placeholder="성 명" />
								</div>
								<button id="firstOutReceipt" type="button"
									class="btn btn-primary" onclick="clickOn();"
									style="background: #697282; border-color: #333;">검색</button>

							</div>


							<div class="searchPatient"
								style="margin: 0 auto; margin-top: 20px;">

								<table class="table table-striped table-hover" id="listArea"
									style="width: 1200px; text-align: center; margin: 0 auto;">
									<thead>
										<tr style="background: #4BA0BE;">
											<th style="text-align: center">사번</th>
											<th style="text-align: center">이름</th>
											<th style="text-align: center">이메일</th>
											<th style="text-align: center">부서명</th>
											<th style="text-align: center">직급명</th>

										</tr>
										<c:forEach items="${list}" var="e">
											<tr id="${e.empNo}" style="background: #fff;">
												<td>${e.empNo}</td>
												<td>${e.empName}</td>
												<td>${e.empEmail}</td>
												<td>${e.deptTitle}</td>
												<td>${e.jobTitle}</td>
												<td style="display: none;">${m.empEmail}</td>


											</tr>
										</c:forEach>
								</table>
								<div style="text-align: center;">
									<c:out value="${pageBar}" escapeXml="false" />
								</div>
							</div>
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

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

					<!-- <div style="text-align: center;">	      
	      	<div class="has-feedback" style="width:400px; display:inline-block">
	       	<input type="search" class="form-control input-sm" id="p_name" name="p_name" onkeyup="enterkey();"/>
	       	<span class="glyphicon glyphicon-search form-control-feedback" ></span> </div>          	
	       	<button id="firstOutReceipt"type="submit" class="btn btn-primary" onclick="Enroll();" style="background:#697282; border-color:#333;">환자등록</button>    	
	     </div> -->



					<ul class="nav nav-tabs"
						style="margin: 0 auto; text-align: center;">
						<li class="nav-item active"><a class="nav-link"
							data-toggle="tab" href="#All_Ward">전체 병동</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#3_Ward">3 병동</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#5_Ward">5 병동</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#6_Ward">6 병동</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="All_Ward">
							<div class="searchPatient"
								style="margin: 0 auto; margin-top: 20px;">
								<table class="table table-striped table-hover"
									style="width: 800px; text-align: center; margin: 0 auto;">
									<tr>
										<th style="text-align: center">병실</th>
										<th style="text-align: center">전체 침대 수</th>
										<th style="text-align: center">현재 사용 침대 수</th>
										<th style="width: 240px; text-align: center">정보보기</th>
										<!-- <th style="width:131px; text-align:center">정보수정</th> -->
									</tr>
									<c:forEach items="${wardList}" var="w">
										<tr id="${w.ward_code}" style="background: #fff;">
											<td id="${w.ward_code}">${w.ward_code}</td>
											<td id="${w.capacity}">${w.capacity}</td>
											<td id="${w.cur_capacity}">${w.cur_capacity}</td>
											<td><input type="submit" class="btn btn-primary btn-sm"
												id="outEnrollPatient" value="병동정보"
												onclick="location.href='${pageContext.request.contextPath}/patient/wardView.do?ward_code=${w.ward_code}'" />
											</td>
										</tr>
									</c:forEach>
								</table>

							</div>
						</div>
						<div class="tab-pane fade" id="3_Ward">
							<div class="searchPatient"
								style="margin: 0 auto; margin-top: 20px;">
								<table class="table table-striped table-hover"
									style="width: 800px; text-align: center; margin: 0 auto;">
									<tr>
										<th style="text-align: center">병실</th>
										<th style="text-align: center">전체 침대 수</th>
										<th style="text-align: center">현재 사용 침대 수</th>
										<th style="width: 240px; text-align: center">정보보기</th>
										<!-- <th style="width:131px; text-align:center">정보수정</th> -->
									</tr>
									<c:forEach items="${wardList}" var="w">
										<c:if test="${w.ward_code gt 300 and w.ward_code lt 400}">
											<tr id="${w.ward_code}" style="background: #fff;">
												<td id="${w.ward_code}">${w.ward_code}</td>
												<td id="${w.capacity}">${w.capacity}</td>
												<td id="${w.cur_capacity}">${w.cur_capacity}</td>
												<td><input type="submit" class="btn btn-primary btn-sm"
													id="outEnrollPatient" value="병동정보"
													onclick="location.href='${pageContext.request.contextPath}/patient/wardView.do?ward_code=${w.ward_code}'" />
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>

							</div>
						</div>
						<div class="tab-pane fade" id="5_Ward">
							<div class="searchPatient" style="margin: 0 auto; margin-top: 20px;">
								<table class="table table-striped table-hover"
									style="width: 800px; text-align: center; margin: 0 auto;">
									<tr>
										<th style="text-align: center">병실</th>
										<th style="text-align: center">전체 침대 수</th>
										<th style="text-align: center">현재 사용 침대 수</th>
										<th style="width: 240px; text-align: center">정보보기</th>
										<!-- <th style="width:131px; text-align:center">정보수정</th> -->
									</tr>
									<c:forEach items="${wardList}" var="w">
										<c:if test="${w.ward_code gt 500 and w.ward_code lt 600}">
											<tr id="${w.ward_code}" style="background: #fff;">
												<td id="${w.ward_code}">${w.ward_code}</td>
												<td id="${w.capacity}">${w.capacity}</td>
												<td id="${w.cur_capacity}">${w.cur_capacity}</td>
												<td><input type="submit" class="btn btn-primary btn-sm"
													id="outEnrollPatient" value="병동정보"
													onclick="location.href='${pageContext.request.contextPath}/patient/wardView.do?ward_code=${w.ward_code}'" />
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>

							</div>
						</div>
						<div class="tab-pane fade" id="6_Ward">
							<div class="searchPatient" style="margin: 0 auto; margin-top: 20px;">
								<table class="table table-striped table-hover"
									style="width: 800px; text-align: center; margin: 0 auto;">
									<tr>
										<th style="text-align: center">병실</th>
										<th style="text-align: center">전체 침대 수</th>
										<th style="text-align: center">현재 사용 침대 수</th>
										<th style="width: 240px; text-align: center">정보보기</th>
										<!-- <th style="width:131px; text-align:center">정보수정</th> -->
									</tr>
									<c:forEach items="${wardList}" var="w">
										<c:if test="${w.ward_code gt 600 and w.ward_code lt 700}">
											<tr id="${w.ward_code}" style="background: #fff;">
												<td id="${w.ward_code}">${w.ward_code}</td>
												<td id="${w.capacity}">${w.capacity}</td>
												<td id="${w.cur_capacity}">${w.cur_capacity}</td>
												<td><input type="submit" class="btn btn-primary btn-sm"
													id="outEnrollPatient" value="병동정보"
													onclick="location.href='${pageContext.request.contextPath}/patient/wardView.do?ward_code=${w.ward_code}'" />
												</td>
											</tr>
										</c:if>
									</c:forEach>
								</table>

							</div>
						</div>
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
		
	</script>
</body>
</html>

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

				<div class="searchPatient" style="margin:0 auto; margin-top:20px;">
	      	<table class="table table-striped table-hover" style="width:800px; text-align:center; margin : 0 auto; ">
	      		<tr>
	      			<th style="text-align:center">환자이름</th>
	      			<th style="text-align:center">환자나이</th>
	      			<th style="text-align:center">성별</th>
	      			<th style="text-align:center">입원일</th>
	      			<!-- <th style="width:131px; text-align:center">정보수정</th> -->
	      		</tr>
	      		<c:forEach items="${patientList}" var="p">	      			
	      			<tr id="${p.p_no}" style="background: #fff;">
	      				<td id="${p.p_name}">${p.p_name}</td>
	      				<td id="${p.p_age}">${p.p_age}</td>
	      				<td id="${p.p_gender}">${p.p_gender=='M'?'남':'여'}</td>
	      				<td id="${p.admission_date}">${p.admission_date}</td>
	      			</tr>
	      		</c:forEach>
	      	</table>
	      	
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

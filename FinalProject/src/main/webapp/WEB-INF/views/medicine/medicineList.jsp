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

<style>
/*글쓰기버튼*/
input#btn-add {
	float: right;
	margin: 0 0 15px;
	background-color: skyblue;
}
</style>
<script>
	function insert() {
		location.href = "${pageContext.request.contextPath}/medicine/medicineForm.do";
	}

	function deleteMedicine(medCode) {
		console.log(medCode);
		location.href = "${pageContext.request.contextPath}"
				+ "/medicine/deleteMedicine.do?medCode=" + medCode;
	};

	function updateMedicine(medCode) {
		$('tr').click(
				function() {

					var medCount = $(this).children('td').children(
							"[name=medCount]").val();

					console.log(medCount);
					location.href = "${pageContext.request.contextPath}"
							+ "/medicine/updateMedicine.do?medCode=" + medCode
							+ "&medCount=" + medCount;
				});
	};
	
	
	function enterkey() {
		if (window.event.keyCode == 13) {
			search();
		}
	}

	function search() {
		var medName = $(medNameId).val();
		console.log(medName);
		location.href="${pageContext.request.contextPath}/medicine/searchMedicine.do?medName="+medName
	}
	
	function clickOn() {
		var medName = $(medNameId).val();
		console.log(medName);
		location.href="${pageContext.request.contextPath}/medicine/searchMedicine.do?medName="+medName
	}
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

					<!--  ================================================================================================= -->

					<div class="container">

						<div style="text-align: center;">
							<div class="has-feedback"
								style="width: 400px; display: inline-block">
								<input type="search" class="form-control input-sm" id="medNameId"
									name="medNameId" onkeyup="enterkey();" value=""
									placeholder="약품명" />
							</div>
							<button id="firstOutReceipt" type="submit"
								class="btn btn-primary" onclick="clickOn();"
								style="background: #697282; border-color: #333;">검 색</button>
								
							<button id="firstOutReceipt" type="submit"
								class="btn btn-primary" onclick="insert();"
								style="background: #697282; border-color: #333;">약품 등록</button>
						</div>

						<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px;">

							<table class="table table-striped table-hover"
								style="width: 1200px; text-align: center; margin: 0 auto;">
								<thead>
									<tr style="background: #4BA0BE;">
										<th style="text-align: center">약품 코드</th>
										<th style="text-align: center">약품 명</th>
										<th style="text-align: center">재고 수량</th>
										<th style="text-align: center">수정 / 삭제</th>

									</tr>
									<c:forEach items="${list}" var="m">
										<tr id="${m.medCode}" style="background: #fff;">
											<td>${m.medCode}</td>
											<td>${m.medName}</td>
											<td><input type="number" name="medCount"
												value="${m.medCount}"></td>
											<td>
												<button type="button"
													onclick="updateMedicine('${m.medCode}');"
													class="btn btn-outline-info">수정</button>
												<button type="button"
													onclick="deleteMedicine('${m.medCode}');"
													class="btn btn-outline-info">삭제</button>
											</td>



										</tr>
									</c:forEach>
							</table>
							<div style="text-align: center;">
								<c:out value="${pageBar}" escapeXml="false" />
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

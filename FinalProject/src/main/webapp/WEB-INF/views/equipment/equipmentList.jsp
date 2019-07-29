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
		location.href = "${pageContext.request.contextPath}/equipment/equipmentForm.do";
	}

	function deleteEquipment(eqCode) {
		console.log(eqCode);
		location.href = "${pageContext.request.contextPath}"
				+ "/equipment/deleteEquipment.do?eqCode=" + eqCode;
	};

	function updateEquipment(eqCode) {
		$('tr').click(
				function() {

					var eqCount = $(this).children('td').children("[name=eqCount]").val();
					var eqBrokenYn=$(this).children('td').children("[name=eqBrokenYn]").val();

					console.log(eqCount);
					location.href = "${pageContext.request.contextPath}"
							+ "/equipment/updateEquipment.do?eqCode=" + eqCode
							+ "&eqCount=" + eqCount + "&eqBrokenYn="+eqBrokenYn;
				});
	};
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

						<div style="text-align: right;">
							<button id="firstOutReceipt" type="submit"
								class="btn btn-primary" onclick="insert();"
								style="background: #697282; border-color: #333;">약품 등록</button>
						</div>

						<div class="searchPatient"
							style="margin: 0 auto; margin-top: 20px;">

							<table class="table table-striped table-hover"
								style="width: 1200px; text-align: center; margin: 0 auto;">
								<thead>
									<tr style="background: #fdf;">
										<th style="text-align: center">장비 코드</th>
										<th style="text-align: center">장비명</th>
										<th style="text-align: center">수량</th>
										<th style="text-align: center">구입 날짜</th>
										<th style="text-align: center">고장 여부</th>
										<th style="text-align: center">수정 / 삭제</th>

									</tr>
									<c:forEach items="${list}" var="e">
										<tr id="${e.eqCode}" style="background: #fff;">
											<td>${e.eqCode}</td>
											<td>${e.eqName}</td>
											<td><input type="number" name="eqCount"
												value="${e.eqCount}"></td>
											<td>${e.eqDate}</td>
											<td><input type="text" name="eqBrokenYn" value="${e.eqBrokenYn}"></td>
											<td>
												<button type="button"
													onclick="updateEquipment('${e.eqCode}');"
													class="btn btn-outline-info">수정</button>
												<button type="button"
													onclick="deleteEquipment('${e.eqCode}');"
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

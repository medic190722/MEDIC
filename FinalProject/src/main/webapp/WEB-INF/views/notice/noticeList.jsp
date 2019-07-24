<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Medic</title>
  <!-- 위치 바꾸면 import url 주소 변경해줘야함 -->
  <c:import url="views/common/header.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="views/common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>페이지 이름</h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">페이지명</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
      	<!-- left Section -->
        <section class="col-lg-7 connectedSortable">
						--- 여기에 작성1 left section --- 섹션 2개로 나뉘어져있는데 col 크기 조절 or 섹션 하나
						삭제하여 만들어도 될거같음
						<!-- Default box -->
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Title</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse" data-toggle="tooltip" title="Collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove" data-toggle="tooltip" title="Remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<div class="box-body">Start creating your amazing
								application!</div>
							<!-- /.box-body -->
							<div class="box-footer">Footer</div>
							<!-- /.box-footer-->
						</div>
						<!-- /.box -->


					</section>
        <!-- right Section -->
        <section class="col-lg-5 connectedSortable">
		--- 여기에 작성2 right section ---


        </section>
      </div>
    </section>
  </div>
 <c:import url="views/common/footer.jsp"/>
 <c:import url="views/common/sidebar.jsp"/>
</div>
<c:import url="views/common/scripts.jsp"/>
</body>
</html>

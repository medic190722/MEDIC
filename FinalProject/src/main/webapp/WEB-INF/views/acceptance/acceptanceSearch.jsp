<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.kh.medic.patient.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Medic</title>
  <c:import url="../common/header.jsp"/>
  <script>
  $(function() {

		$("#listArea td")
				.mouseenter(function() {
					$(this).parent().css({
						"background" : "#bcb8b8",
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
							var p_no = $(this).parent().children().eq(1).text();

							console.log(p_no);

							location.href = "${pageContext.request.contextPath}/acceptance/patientAcceptanceInsert.do?p_no="+ p_no;
						});
	});
  </script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        	Medic
      </h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Main</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <!-- Main row -->
      <div class="row">
	      
			<div style="text-align: center;">	      
	      	<div class="has-feedback" style="width:400px; display:inline-block">
	       	<input type="search" class="form-control input-sm" id="p_name" name="p_name" onkeyup="enterkey();"/>
	       	<span class="glyphicon glyphicon-search form-control-feedback" ></span> </div>          	    	
	     </div>
	      
	      <div class="searchPatient" style="margin:0 auto; margin-top:20px;">
	      	<table class="table table-striped table-hover" id="listArea" style="width:800px; text-align:center; margin : 0 auto; ">
	      		<tr>
	      			<th style="text-align:center">차트번호</th>
	      			<th style="text-align:center">환자번호</th>
	      			<th style="text-align:center">환자이름</th>
	      			<th style="text-align:center">전화번호</th>
	      		</tr>
	      		<c:forEach items="${patientList}" var="p">	      			
	      			<tr id="${p.p_no}" style="background: #fff;">
	      				<td id="${p.m_code}">${p.m_code}</td>
	      				<td id="${p.p_no}">${p.p_no}</td>
	      				<td id="${p.p_name}">${p.p_name}</td>
	      				<td id="${p.p_phone[0]}">${p.p_phone[0]}</td>
	      				<%-- <td> 
	      					<input type="submit" class="btn btn-primary btn-sm" id="acceptance" value="납부" 
	      						style="width: 100px;" onclick="location.href='${pageContext.request.contextPath}/acceptance/acceptance.do?p_no=${p.p_no}'"/>
	      				</td> --%>
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
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<!-- ./wrapper -->
<c:import url="../common/scripts.jsp"/>

<script>
	function search(){
		location.href="${pageContext.request.contextPath}/acceptance/patientSearch.do?p_name="+$(p_name).val();
	}

	function enterkey(){
	   if(window.event.keyCode == 13){
	    	search();
	    }
	}
	
 </script>
</body>
</html>

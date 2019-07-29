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
  <c:import url="../common/header.jsp"/>
  	<style>
		/*글쓰기버튼*/
		input#btn-add{float:right; margin: 0 0 15px;}
	</style>
	<script>
		function fn_goNoticeForm() {
			location.href = "${pageContext.request.contextPath}/notice/noticeForm.do";
		};
	
		$(function() {
			$("tr[id]").on("click",function() {
				var nno = $(this).attr("id");
				console.log("nno=" + nno);
				location.href = "${pageContext.request.contextPath}/notice/noticeView.do?nno="+nno;
			});
		});
	</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <c:import url="../common/menubar.jsp"/>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>공지사항</h1>
      <ol class="breadcrumb">
        <li><a href="/medic/common/main.do"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">공지사항</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <section class="col-lg-12">
				<p>총 ${totalContents}건의 게시물이 있습니다.</p>
				<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success" onclick="fn_goNoticeForm();"/>
				<table id="tbl-board" class="table table-striped table-hover">
					<tr>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list}" var="n"> 
					<tr id="${n.nno}" style="cursor: pointer;">
						<td>${n.ntitle}</td>
						<td>${n.nwriter}</td>
						<td>${n.ndate}</td>
					</tr>
					</c:forEach>
				</table>
				<c:out value="${pageBar}" escapeXml="false"/>
		</section>
      </div>

		</section>
  </div>
 <c:import url="../common/footer.jsp"/>
 <c:import url="../common/sidebar.jsp"/>
</div>
<c:import url="../common/scripts.jsp"/>
</body>
</html>

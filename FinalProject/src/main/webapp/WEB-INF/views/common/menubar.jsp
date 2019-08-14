<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.util.*, com.kh.medic.member.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<header class="main-header">
    <!-- Logo -->
    <a href='${pageContext.request.contextPath}/index.do' class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>M</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>M</b>edic</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">${m.empName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                   ${m.empName} - ${m.jobTitle}
                  <small>Member since ${m.hireDate }</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="${pageContext.request.contextPath}/member/privacyView.do?empNo=${m.empNo}" class="btn btn-default btn-flat">개인정보</a>
                </div>
                <div class="pull-right">
                  <a href="${pageContext.request.contextPath}/member/memberLogout.do" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li style="display: none;">
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${m.empName}</p>
          <i class="fa fa-circle text-success"></i> Online
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <c:if test="${m.deptCode == 'a1'|| m.empName eq '관리자'}">
       <ul class="sidebar-menu" data-widget="tree">
        <li class="header">총무과</li>
        
        <!-- 총무과 -->
        <li class="treeview">
          <a href="#">
             <i class="fa fa-user"></i>
            <span>회원관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           <li><a href="${pageContext.request.contextPath}/member/memberList.do"><i class="fa fa-circle-o"></i> 회원정보조회</a></li>
           <c:if test="${m.empName eq '관리자'}">
           	<li><a href="${pageContext.request.contextPath}/member/leaveMemberList.do"><i class="fa fa-circle-o"></i> 회원탈퇴</a></li>
           </c:if>
          </ul>
        </li>
         <li class="treeview">
          <a href="#">
             <i class="fa fa-credit-card"></i>
            <span>급여관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/empsal/empsalList.do"><i class="fa fa-circle-o"></i> 월급 인상 및 삭감</a></li>
       
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
             <i class="fa fa-cubes"></i>
            <span>재고관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
           <li><a href="${pageContext.request.contextPath }/medicine/medicineList.do"><i class="fa fa-circle-o"></i> 의약품 관리</a></li>
           <li><a href="${pageContext.request.contextPath }/equipment/equipmentList.do"><i class="fa fa-circle-o"></i> 의학 장비 관리</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
             <i class="fa fa-calendar"></i>
            <span>근태 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath }/vacation/vacationList.do"><i class="fa fa-circle-o"></i> 휴가 및 병가 승인 여부</a></li>
            <li><a href="${pageContext.request.contextPath }/attendance/attendListView.do"><i class="fa fa-circle-o"></i> 출근관리</a></li>
          </ul>
        </li>
        
        
        
        
         <li class="treeview">
          <a href="#">
             <i class="fa fa-envelope"></i>
            <span>메일 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath }/mailCheck/mailCheck.do"><i class="fa fa-circle-o"></i> 이메일 접속</a></li>
            
          </ul>
        </li>
        
      </ul>
      
      </c:if>
       <c:if test="${m.deptCode == 'a2'|| m.empName eq '관리자'}">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">원무과</li>
        
        <!-- 원무과 -->
        <li class="treeview">
          <a href="#">
             <i class="fa fa-stethoscope"></i>
            <span>환자관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/patient/patientReceipt.do"><i class="fa fa-circle-o"></i> 접수</a>
            	<%-- <ul class="treeview-menu">
            		<li style="color:#fff;"><a href="${pageContext.request.contextPath}/patient/inPatientReceipt.do"><i class="fa fa-circle-o"> 입원접수</i></a></li>
            		<li style="color:#fff;"><a href="${pageContext.request.contextPath}/patient/outPatientReceipt.do"><i class="fa fa-circle-o"> 외래접수</i></a></li>
            	</ul> --%>
            </li>
            <li><a href="${pageContext.request.contextPath}/acceptance/acceptanceSearch.do"><i class="fa fa-circle-o"></i> 수납</a>
            	<!-- <ul class="treeview-menu">
            		<li style="color:#fff;"><a href="#"><i class="fa fa-circle-o"> 입원수납</i></a></li>
            		<li style="color:#fff;"><a href="#"><i class="fa fa-circle-o"> 외래수납</i></a></li>
            	</ul> -->
            </li>
          </ul>
        </li>
         <li class="treeview">
          <a href="#">
             <i class="fa fa-wheelchair"></i>
            <span>병동관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="${pageContext.request.contextPath}/patient/wardList.do"><i class="fa fa-circle-o"></i> 입원실 관리</a>
            	<!-- <ul class="treeview-menu">
            		<li style="color:#fff;"><a href="#"><i class="fa fa-circle-o"> 입원실 정보</i></a></li>
            		<li style="color:#fff;"><a href="#"><i class="fa fa-circle-o"> 입원실 사용 일정</i></a></li>
            	</ul> -->
            </li>
          </ul>
        </li>
       
      </ul>
       </c:if>
       <c:if test="${m.deptCode == 'a3'|| m.empName eq '관리자'}">
       <ul class="sidebar-menu" data-widget="tree">
        <li class="header">의사</li>
       
        <!-- 의사 -->
          <li>
          <a href="${pageContext.request.contextPath}/doctor/prescription.do">
             <i class="fa fa-medkit"></i>
            <span>진료</span>
          </a>
          </li>
          <li>
          <a href="${pageContext.request.contextPath}/doctor/certificate.do">
             <i class="fa fa-pencil"></i>
            <span>진단서 작성</span>
          </a>
          </li>
          <li class="treeview">
          <a href="#">
             <i class="fa fa-user"></i>
            <span>담당 환자 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
			<li><a href="${pageContext.request.contextPath}/doctor/myPatientCare.do?empNo=${m.empNo}"><i class="fa fa-circle-o"></i>일반 환자 관리</a></li>
			<li><a href="${pageContext.request.contextPath}/doctor/myAdmissionCare.do?empNo=${m.empNo}"><i class="fa fa-circle-o"></i>입원 환자 관리</a></li>
          </ul>
       </li>
  
      </ul>
      </c:if>
      <c:if test="${m.deptCode == 'a4'|| m.empName eq '관리자'}">
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">간호사</li>
        
        <!-- 간호사 -->
          <li>
          <a href="${pageContext.request.contextPath}/nurse/orderList.do">
             <i class="fa fa-wheelchair"></i>
            <span>입원환자 업무</span>
          </a>
          </li>
  
      </ul>
      </c:if>
      <ul class="sidebar-menu" data-widget="tree">
        <!-- 공통 -->

        <li>
          <a href="${pageContext.request.contextPath}/vacation/vacationInset.do">
             <i class="fa fa-calendar"></i>
            <span>휴가 신청</span>
          </a>
         </li>
         
       

          <li>
          <a href="${pageContext.request.contextPath}/notice/noticeList.do">
             <i class="fa fa-desktop"></i>
            <span>공지사항</span>
          </a>
          </li>

      </ul>
      
    </section>
    <!-- /.sidebar -->
  </aside>
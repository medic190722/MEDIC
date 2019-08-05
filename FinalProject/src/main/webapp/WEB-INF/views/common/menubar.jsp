<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<header class="main-header">
    <!-- Logo -->
    <a href='${pageContext.request.contextPath}/common/main.do' class="logo">
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
              <span class="hidden-xs">${member.empName}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${pageContext.request.contextPath }/resources/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                <p>
                   ${member.empName} - ${member.jobTitle}
                  <small>Member since 입사일</small>
                </p>
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">개인정보</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">로그아웃</a>
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
          <p>${member.empName}</p>
          <i class="fa fa-circle text-success"></i> Online
        </div>
      </div>
      <!-- sidebar menu: : style can be found in sidebar.less -->
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
            <li><a href="${pageContext.request.contextPath}/member/register.do"><i class="fa fa-circle-o"></i> 회원가입</a></li>
           <li><a href="${pageContext.request.contextPath}/member/memberList.do"><i class="fa fa-circle-o"></i> 회원정보수정</a></li>
           <li><a href="#"><i class="fa fa-circle-o"></i> 회원탈퇴</a></li>
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
           <li><a href="#"><i class="fa fa-circle-o"></i> 통계</a></li>
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
           <li><a href="#"><i class="fa fa-circle-o"></i> 병원 소모품 관리</a></li>
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
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
             <i class="fa fa-bar-chart"></i>
            <span>통계</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i> 병원 총 수입 및 지출 관련 통계</a></li>
          </ul>
        </li>
       
      </ul>
      
      
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
      
       <ul class="sidebar-menu" data-widget="tree">
        <li class="header">의사</li>
        
        <!-- 의사 -->
          <li>
          <a href="${pageContext.request.contextPath}/doctor/prescription.do">
             <i class="fa fa-medkit"></i>
            <span>처방전 작성</span>
          </a>
          </li>
          <li>
          <a href="#">
             <i class="fa fa-pencil"></i>
            <span>진단서 작성</span>
          </a>
          </li>
          <li>
           <a href="#">
             <i class="fa fa-wheelchair"></i>
            <span>담당 환자 관리</span>
          </a>
          </li>
  
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">간호사</li>
        
        <!-- 간호사 -->
          <li>
          <a href="#">
             <i class="fa fa-wheelchair"></i>
            <span>재원 환자 관리</span>
          </a>
          </li>
          <li>
          <a href="#">
             <i class="fa fa-medkit"></i>
            <span>처방 관리</span>
          </a>
          </li>
          <li>
           <a href="#">
             <i class="fa fa-file-text-o"></i>
            <span>지원 업무 관리</span>
          </a>
          </li>
  
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <!-- 공통 -->
        <li>
          <a href="#">
             <i class="fa fa-table"></i>
            <span>일정 관리</span>
          </a>
         </li>
        <li>
          <a href="#">
             <i class="fa fa-calendar"></i>
            <span>근태관리</span>
          </a>
          </li>
          <li>
          <a href="${pageContext.request.contextPath}/notice/noticeList.do">
             <i class="fa fa-desktop"></i>
            <span>공지사항</span>
          </a>
          </li>
          <li>
          <a href="#">
             <i class="fa fa-search"></i>
            <span>재원 환자검색</span>
          </a>
          </li>
  
      </ul>
      
    </section>
    <!-- /.sidebar -->
  </aside>
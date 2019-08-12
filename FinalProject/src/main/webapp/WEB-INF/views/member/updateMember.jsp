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
<style>
   tr{
      height: 60px;
      
   }
   
   th{   
      text-align: right;
      width: 100px;
   
   }
   td{
      width:300px;
    }
   
   td input{
      margin: 0 20px;
   }
   td select{
      margin: 0 20px;
   }
   .date{
      margin-left: 20px;
   }
</style>
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
            <div class="">
               <div class="">

                  <div class="">
                     <p class="login-box-msg">Register a new membership</p>




                     <!-- <div class="form-group has-feedback">
         <label>급여</label>
        <input type="number" class="form-control" placeholder="급여">   
        <span class="form-control-feedback">만원</span>
      </div> -->
                     <!-- Date -->
                     <!--  <div class="form-group">
        <label>입사일:</label>
        <div class="input-group date">
          <div class="input-group-addon">
            <i class="fa fa-calendar"></i>
          </div>
          <input type="text" class="form-control pull-right" id="datepicker" name="hireDate">
        </div>
        </div> -->
                     <form
                        action="${pageContext.request.contextPath}/member/updateMember.do"
                        method="post">
                        <section>
                           <div style="text-align: center;">
                              <table
                                 style="board: 1px solid #000 !important; text-align: center !important; margin: 0 auto;">
                                 <input type="text" class="form-control" name="empNo"
                                              value="${member.empNo}" style="display:none;">
                                 <thead>
                                    <th>이름  </th>
                                    <td>
                                          <input type="text" class="form-control" name="empName"
                                             placeholder="이름" value="${member.empName}" readonly>
                                       </td>
                                    <th>부서  </th>
                                    <td>                           

                                          <select class="form-control dept" name="deptCode"
                                             id="deptCode">
                                             <option value="총무과" ${member.deptTitle == '총무과'?'selected':''}>총무과</option>
                                             <option value="원무과" ${member.deptTitle == '원무과'?'selected':''}>원무과</option>
                                             <option value="의사" ${member.deptTitle == '의사'?'selected':''}>의사</option>
                                             <option value="간호사" ${member.deptTitle == '간호사'?'selected':''}>간호사</option>
                                          </select>
                                       
                                    </td>
                                    
                                 </thead>
                                 <tbody>
                                    <input type="password" name="empPwd" value="null" style="display:none;"/>
                                    <tr>
                                       <th>이메일</th>
                                       <td><input type="email" name="empEmail"
                                          class="form-control" placeholder="이메일" value="${member.empEmail}" > <span
                                          class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                       </td>
                                       <th>직급</th>
                                       <td>
                                          <div class="" id="job1" style="display: block;">

                                             <select class="form-control job1 job">
                                                <option value="부장" ${member.jobTitle=='부장'?'selected':''}>부장</option>
                                                <option value="차장" ${member.jobTitle=='차장'?'selected':''}>차장</option>
                                                <option value="과장" ${member.jobTitle=='과장'?'selected':''}>과장</option>
                                                <option value="대리" ${member.jobTitle=='대리'?'selected':''}>대리</option>
                                                <option value="사원" ${member.jobTitle=='사원'?'selected':''}>사원</option>
                                                
                                             </select>
                                             <div name="sendData1" style="display:none;" id="dataSelect"><input type="hidden" name="jobCode" value="부장"></div>
                                          </div>
                                          <div class="" id="job2" style="display: none;">

                                             <select class="form-control job2 job">
                                                <option value="부장" ${member.jobTitle=='부장'?'selected':''}>부장</option>
                                                <option value="차장" ${member.jobTitle=='차장'?'selected':''}>차장</option>
                                                <option value="과장" ${member.jobTitle=='과장'?'selected':''}>과장</option>
                                                <option value="대리" ${member.jobTitle=='대리'?'selected':''}>대리</option>
                                                <option value="사원" ${member.jobTitle=='사원'?'selected':''}>사원</option>
                                             </select>
                                          </div>

                                          <div class="" id="job3" style="display: none;">

                                             <select class="form-control job3 job">
                                                <option value="교수" ${member.jobTitle=='교수'?'selected':''}>교수</option>
                                                <option value="부교수" ${member.jobTitle=='부교수'?'selected':''}>부교수</option>
                                                <option value="조교수" ${member.jobTitle=='조교수'?'selected':''}>조교수</option>
                                                <option value="전임의" ${member.jobTitle=='전임의'?'selected':''}>전임의</option>
                                                <option value="레지던트" ${member.jobTitle=='레지던트'?'selected':''}>레지던트</option>
                                                <option value="인턴" ${member.jobTitle=='인턴'?'selected':''}>인턴</option>
                                             </select>
                                          </div>
                                          <div class="" id="job4" style="display: none;">

                                             <select class="form-control job4 job">
                                                <option value="최고 책임자" ${member.jobTitle=='최고 책임자'?'selected':''}>최고 책임자</option>
                                                <option value="간호과장" ${member.jobTitle=='간호과장'?'selected':''}>간호과장</option>
                                                <option value="수간호사" ${member.jobTitle=='수간호사'?'selected':''}>수간호사</option>
                                                <option value="책임간호사" ${member.jobTitle=='책임간호사'?'selected':''}>책임간호사</option>
                                                <option value="주임간호사" ${member.jobTitle=='주임간호사'?'selected':''}>주임간호사</option>
                                                <option value="평간호사" ${member.jobTitle=='평간호사'?'selected':''}>평간호사</option>
                                             </select>
                                          </div>
                                       </td>
                                    </tr>
                                 

                                    <tr>
                                       <th>주민등록번호</th>

                                       <td>
                                          
                                             <input type="text" id="rrn" name="empRrn"
                                                class="form-control" placeholder="주민등록번호" value="${member.empRrn}" readonly>
                                          
                                       </td>
                                       <th>입사일</th>
                                       <td>
                                          <input type="date" class="form-control" id="currnetDate"
                                          name="hireDate" value="${member.hireDate}">
                                       </td>

                                    </tr>

                                    <tr class="entbox">
                                       <th>주소</th>
                                       <td><input type="text" class="form-control"
                                          name="empAddress" placeholder="주소" value="${member.empAddress}"></td>
                                          <th>퇴사여부</th>
                                       <td class="ent"><select class="form-control entYn" >
                                       <option value="N" ${member.entYn=='N'?'selected':''}>N</option>   
                                                <option value="Y" ${member.entYn=='Y'?'selected':''}>Y</option>
                                                                                       
                                       </select>
                                       <div name="sendData2" style="display:none;" ><input type="hidden" name="entYn" value="N"></div>
                                       </td>
                                       
                                    </tr>
                                    <tr class="entDate">
                                    <th>연락처</th>
                                       <td><input type="text" class="form-control"
                                          name="empPhone" placeholder="연락처" value="${member.empPhone}"></td>             
                                    </tr>
									
                                 </tbody>

                              </table>

                              <button type="submit" class="btn btn-primary"
                                 style="margin-top: 10px; width:100px;">회원수정</button>
                              <button type="reset" class="btn btn-primary"
                              style="margin-top: 10px; width:100px;" onclick="history.back(-1);">뒤로가기</button>

                           </div>
                        </section>
                     </form>
                     <!-- /.col -->

                     <!-- /.col -->
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

   <!-- ./wrapper -->
   <c:import url="../common/scripts.jsp" />
   
   <script>
     document.getElementById('currnetDate').value= new Date().toISOString().slice(0, 10);
   </script>
   
   
   
   <script>
$(function () {

    
    
    //Date picker
    $('#datepicker').datepicker({
      autoclose: true
    })
    

    $('.dept').click(function(){
    	 $('#dataSelect').remove();
      var display = $('.dept option:selected').val();   
      if(display == "총무과"){
         $('#job1').css('display','block');
         if($('.job1').find('[name=sendData]') != null ){
             $('.job').find('[name=sendData]').remove();
          } 
         var $td = $('.job1');  
         $td.append('<td name="sendData" style="display:none;" ><input type="hidden" name="jobCode" value="' + $('.job1 option:selected').val() + '"></div>');
      }else{
         $('#job1').css('display','none');
      }
    })
    $('.dept').click(function(){
      var display = $('.dept option:selected').val();   
      if(display == "원무과"){
         $('#job2').css('display','block');
         if($('.job2').find('[name=sendData]') != null ){
             $('.job').find('[name=sendData]').remove();
          } 
         var $td = $('.job2');  
         $td.append('<td name="sendData" style="display:none;" ><input type="hidden" name="jobCode" value="' + $('.job2 option:selected').val() + '"></div>');
      }else{
         $('#job2').css('display','none');
      }
    })
    $('.dept').click(function(){
      var display = $('.dept option:selected').val();   
      if(display == "의사"){
         $('#job3').css('display','block');
         if($('.job3').find('[name=sendData]') != null ){
             $('.job').find('[name=sendData]').remove();
          } 
         var $td = $('.job3');  
         $td.append('<td name="sendData" style="display:none;" ><input type="hidden" name="jobCode" value="' + $('.job3 option:selected').val() + '"></div>');
      }else{
         $('#job3').css('display','none');
      }
    })
    $('.dept').click(function(){
      var display = $('.dept option:selected').val(); 
      
      
      if(display == "간호사"){
    	  console.log($('.job4 option:selected').val());
         $('#job4').css('display','block');
         if($('.job4').find('[name=sendData]') != null ){
             $('.job').find('[name=sendData]').remove();
          } 
         var $td = $('.job4');  
         $td.append('<td name="sendData" style="display:none;" ><input type="hidden" name="jobCode" value="' + $('.job4 option:selected').val() + '"></div>');
      }else{
         $('#job4').css('display','none');
      }
    })

    
    
    $('#userPwd2').change(function(){
        if($('#userPwd1').val() == $(this).val()){
            $('#pwdResult').html('비밀번호가 일치 합니다.')
            .css('color','green');
        }else{
            $('#pwdResult').html('비밀번호가 일치하지 않습니다.')
            .css('color','red');
            $('#userPwd2').val('');
            $(this).select();
        }
    });
    

    function autoHypenPhone(str){
               str = str.replace(/[^0-9]/g, '');
               var tmp = '';
               if( str.length < 6){
                   return str;
               }else if(str.length < 6){
                   tmp += str.substr(0, 6);
                   tmp += '-';
                   tmp += str.substr(6);
                   return tmp;
               }else{              
                   tmp += str.substr(0, 6);
                   tmp += '-';
                   tmp += str.substr(6, 7);
                   return tmp;
               }
               return str;
           }

   var residentRegistrationNumber = document.getElementById('rrn');
   residentRegistrationNumber.onkeyup = function(event){
           event = event || window.event;
           var _val = this.value.trim();
           this.value = autoHypenPhone(_val) ;
   }
   

   $('.job1').click(function(){
	      console.log($(this).val());
	      
	      $('#dataSelect').remove();
	      
	     if($('.job1').find('[name=sendData]') != null ){
	        $('.job1').find('[name=sendData]').remove();
	     } 
	      
	     var $td = $('<td name="sendData" style="display:none;" >');
	     
	     $td.append('<input type="hidden" name="jobCode" value="' + $(this).val() + '">');
	     
	     $(this).append($td);
	   });
	    
	   $('.job2').click(function(){
	      console.log($(this).val());
	      $('#dataSelect').remove();
	     if($('.job2').find('[name=sendData]') != null ){
	        $('.job2').find('[name=sendData]').remove();
	     } 
	      
	     var $td = $('<td name="sendData" style="display:none;" >');
	     
	     $td.append('<input type="hidden" name="jobCode" value="' + $(this).val() + '">');
	     
	     $(this).append($td);
	   });
	   $('.job3').click(function(){
	      console.log($(this).val());
	      $('#dataSelect').remove();
	     if($('.job3').find('[name=sendData]') != null ){
	        $('.job3').find('[name=sendData]').remove();
	     } 
	      
	     var $td = $('<td name="sendData" style="display:none;" >');
	     
	     $td.append('<input type="hidden" name="jobCode" value="' + $(this).val() + '">');
	     
	     $(this).append($td);
	   });
	   $('.job4').click(function(){
	      console.log($(this).val());
	      $('#dataSelect').remove();
	     if($('.job4').find('[name=sendData]') != null ){
	        $('.job4').find('[name=sendData]').remove();
	     } 
	      
	     var $td = $('<td name="sendData" style="display:none;" >');
	     
	     $td.append('<input type="hidden" name="jobCode" value="' + $(this).val() + '">');
	     
	     $(this).append($td);
	   });
   
	   $('.entYn').click(function(){
		      console.log($(this).val());
		      
		     if($('.ent').find('[name=sendData2]') != null ){
		        $('.ent').find('[name=sendData2]').remove();
		     } 
		      
		     var $td = $('<div name="sendData2" style="display:none;" id="dataSelect">');
		     
		     $td.append('<input type="hidden" name="entYn" value="'+$(this).val()+'">' );
		     
		     $(this).append($td);
		   });
   
   $(".entbox").click(function(){
      
      console.log($('.entbox option:selected').val());
      
      if($('.entbox option:selected').val() == 'Y'){
     
        
        if($('.entDate').find('[name=entDate]') != null ){
	        $('.entDate').find('[name=entDate]').remove();
	        $('.entDate').find('#entTh').remove();
	        $('.entDate').find('#entTd').remove();
	     }
        $('.entDate').append('<th id="entTh">퇴사일자</th><td id="entTd"><input type="date" class="form-control" id="currnetDate" name="entDate" value="${member.entDate}" required></td>');
      }else{
    	  $('.entDate').find('[name=entDate]').remove();
	        $('.entDate').find('#entTh').remove();
	        $('.entDate').find('#entTd').remove();
      }
      })
    
  });
  
</script>
</body>
</html>
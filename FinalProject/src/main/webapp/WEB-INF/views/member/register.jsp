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
                     <p class="login-box-msg">사원을 등록해 주세요</p>


                     <form
                        action="${pageContext.request.contextPath}/member/memberEnrollEnd.do"
                        method="post">
                        <section>
                           <div style="text-align: center;">
                              <table
                                 style="board: 1px solid #000 !important; text-align: center !important; margin: 0 auto;">
                                 <thead>
                                    <th>이름  </th>
                                    <td>
                                          <input type="text" class="form-control" name="empName"
                                             placeholder="이름" required>
                                       </td>
                                    <th>부서  </th>
                                    <td>                           

                                          <select class="form-control dept" name="deptCode"
                                             id="deptCode">
                                             <option value="총무과">총무과</option>
                                             <option value="원무과">원무과</option>
                                             <option value="의사">의사</option>
                                             <option value="간호사">간호사</option>
                                          </select>
                                       
                                    </td>
                                    
                                 </thead>
                                 <tbody>
                                    <input type="password" name="empPwd" value="null" style="display:none;"/>
                                    <tr>
                                       <th>이메일</th>  
                                       <td><input type="email" name="empEmail"
                                          class="form-control" placeholder="이메일" required> <span
                                          class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                       </td>
                                       <th>직급</th>
                                       <td>
                                          <div class="" id="job1" style="display: block;">

                                             <select class="form-control job1 job">
                                                <option value="부장" selected>부장</option>
                                                <option value="차장">차장</option>
                                                <option value="과장">과장</option>
                                                <option value="대리">대리</option>
                                                <option value="사원">사원</option>
                                                
                                             </select>
                                             <div style="display:none;" id="dataSelect"><input type="hidden" name="jobCode" value="부장"></div>
                                          </div>
                                          <div class="" id="job2" style="display: none;">

                                             <select class="form-control job2 job">
                                                <option value="부장">부장</option>
                                                <option value="차장">차장</option>
                                                <option value="과장">과장</option>
                                                <option value="대리">대리</option>
                                                <option value="사원">사원</option>
                                             </select>
                                             
                                          </div>

                                          <div class="" id="job3" style="display: none;">

                                             <select class="form-control job3 job">
                                                <option value="교수">교수</option>
                                                <option value="부교수">부교수</option>
                                                <option value="조교수">조교수</option>
                                                <option value="전임의">전임의</option>
                                                <option value="레지던트">레지던트</option>
                                                <option value="인턴">인턴</option>
                                             </select>
                                            
                                          </div>
                                          <div class="" id="job4" style="display: none;">

                                             <select class="form-control job4 job">
                                                <option value="최고 책임자">최고 책임자</option>
                                                <option value="간호과장">간호과장</option>
                                                <option value="수간호사">수간호사</option>
                                                <option value="책임간호사">책임간호사</option>
                                                <option value="주임간호사">주임간호사</option>
                                                <option value="평간호사">평간호사</option>
                                             </select>
                                            
                                          </div>
                                       </td>
                                    </tr>
                                 

                                    <tr>
                                       <th>주민등록번호</th>

                                       <td>
                                          
                                             <input type="text" id="rrn" name="empRrn"
                                                class="form-control" placeholder="주민등록번호" maxlength="14" required>
                                                	<div id="rrnResult"></div>
                                          
                                       </td>
                                     
                                       <th>입사일</th>
                                       <td>
                                          <input type="date" class="form-control" id="currnetDate"
                                          name="hireDate">
                                       </td>

                                    </tr>

                                    <tr>
                                       <th>주소</th>
                                       <td><input type="text" class="form-control"
                                          name="empAddress" placeholder="주소" required></td>
                                       
                                    </tr>
                                    <tr>
                                       <th>연락처</th>
                                       <td><input type="text" class="form-control"
                                          name="empPhone" placeholder="연락처( - 제외)" maxlength="11" required></td>
                                       
                                    </tr>

                                 </tbody>

                              </table>

                              <button type="submit" class="btn btn-primary"
                                 style="margin-top: 10px; width:100px;">회원등록</button>

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
   
   
   
    
     $('#rrn').change(function(){
    	 var num1 = $("#rrn").val().substr(0,6);
    	   var num2 =$("#rrn").val().substr(7,13);
    	   
    	   var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
    	   var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

    	     // -------------- 주민번호 -------------
    	     // 주민번호 앞자리를 배열에 순서대로 담는다.
    	 
    	     for (var i=0; i < num1.length; i++) {
    	         arrNum1[i] = num1.charAt(i);
    	    
    	     } 
    	     
    	     // 주민번호 뒷자리를 배열에 순서대로 담는다.
    	     for (var i=0; i< num2.length; i++) {
    	         arrNum2[i] = num2.charAt(i);
    	       
    	     } 
    
    	     
    	     var tempSum=0;

    	     // 주민번호 검사방법을 적용하여 앞 번호를 모두 계산하여 더함
    	     for (var i=0; i< num1.length; i++) {
    	         tempSum += arrNum1[i] * (2+i);
    	     } 
    	     
    	     // 같은방식으로 앞 번호 계산한것의 합에 뒷번호 계산한것을 모두 더함
    	     for (var i=0; i< num2.length-1; i++) {
    	         if(i>=2) {
    	             tempSum += arrNum2[i] * i;
    	         }
    	         else {
    	             tempSum += arrNum2[i] * (8+i);
    	         }
    	     } 
    	
         if((11-(tempSum%11))%10 != arrNum2[6]){
             $('#rrnResult').html('올바른 주민번호가 아닙니다.')
             .css('color','red');

             $(this).select();
         
         }else{
             $('#rrnResult').html('올바른 주민번호 입니다')
             .css('color','green');
             
         }
     });
    
  });
  
	
  
</script>


</body>
</html>
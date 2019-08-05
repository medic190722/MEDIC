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
      width: 150px;
   
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
                        action="${pageContext.request.contextPath}/member/updatePrivacy.do"
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
									<th>비밀번호변경  </th>
                                    <td>
                                          <input type="password" class="form-control" name="empPwd"
                                             placeholder="비밀번호" value="" id="userPwd1">
                                    </td>
                                 </thead>
                                 <tbody>
                                  
                                    <tr>
                                       <th>이메일</th>
                                       <td><input type="email" name="empEmail"
                                          class="form-control" placeholder="이메일" value="${member.empEmail}" > <span
                                          class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                       </td>
                                       <th>비밀번호확인  </th>
                                    <td>
                                          <input type="password" class="form-control" name=""
                                             placeholder="비밀번호 확인" value="" id="userPwd2">
                                             <div id="pwdResult"></div>
                                    </td>

                                    <tr>
                                       <th>주민등록번호</th>

                                       <td>
                                          
                                             <input type="text" id="rrn" name="empRrn"
                                                class="form-control" placeholder="주민등록번호" value="${member.empRrn}" readonly>
                                          
                                       </td>
                                     

                                    </tr>

                                    <tr class="entbox">
                                       <th>주소</th>
                                       <td><input type="text" class="form-control"
                                          name="empAddress" placeholder="주소" value="${member.empAddress}"></td>
                                       
                                       
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
   

   

    
  });
  
</script>
</body>
</html>
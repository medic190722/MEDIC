package com.kh.medic.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medic.member.model.service.MemberService;
import com.kh.medic.member.model.vo.Member;
import com.kh.medic.member.model.exception.MemberException;

@SessionAttributes(value= {"member"})
@Controller
public class MemberController {
   
   @Autowired
   MemberService memberService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @RequestMapping("/member/register.do")
   public String memberEnroll() {
      
      return "/member/register";
   }

   
   @RequestMapping("/member/memberEnrollEnd.do")
   public String memberEnrollEnd(Member member, Model model) {
      
      // 암호화 로직 - spring security
      // - sha 방식 (5버전 때 부터는 보안 문제로 삭제되었음)
      // - bcrypt 방식
      
      System.out.println("member 확인 : " + member);

      
      member.setEmpPwd(member.getEmpRrn().substring(0,6));
      System.out.println("비밀번호 변경 확인 : " + member.getEmpPwd());
      
      String rawPassword = member.getEmpPwd();
      System.out.println("암호화 전 :" + rawPassword);
      member.setEmpPwd(bcryptPasswordEncoder.encode(rawPassword));
      System.out.println("암호화 후 :" + member.getEmpPwd());
      // 1. 비즈니스 로직 실행
      int result = memberService.insertMember(member);
      
      
      // 2. 실행 결과에 따른 화면 처리
      String loc = "/member/register.do";
      String msg = "";
      
      if(result > 0 ) { msg = "회원가입 성공!";
         
         
         /*
          * if(result1>0) { System.out.println("수정된 비밀번호 : " + member.getEmpPwd()); }
          */
         
         
         
      }else msg = "회원가입 실패!";
      
      model.addAttribute("loc", loc);
      model.addAttribute("msg", msg);
      
      return "common/msg";
   }

   
   
   @RequestMapping(value="/member/memberLogin.do", method=RequestMethod.POST)
   public ModelAndView memberLogin(
         @RequestParam int empNo,
         @RequestParam String empPwd)  {
      
      // ModelAndView 객체 등록
      // model + url 주소를 반환하는  view
      ModelAndView mv = new ModelAndView();
      
      try {
         // 1. 업무 로직 구현
         Member m = memberService.selectMember(empNo);
         System.out.println("로그인 확인 : " + m);
         
         // 2. 반환할 화면 url 처리
         String loc = "/index.do";
         String msg = "";
         
         if(m == null) {
            msg = "존재하지 않는 회원입니다.";
         } else {
            // 3. 로그인에 사용한 비밀번호와 원래 저장되어 있던 비밀번호 확인
            
            if(bcryptPasswordEncoder.matches(empPwd, m.getEmpPwd())) {
               msg = "로그인 성공!";
               mv.addObject("member", m);
               mv.addObject("loc", loc);
            }else {
               msg = "비밀번호가 일치하지 않습니다.";
            }
         }
         
         // 기존에 request 객체에 저장했던 것들을 mv에 key / value로 저장한다.
      
         mv.addObject("msg", msg);
         
         // 화면전달을 위한 viewName 등록하기
         mv.setViewName("common/msg");
         
         }catch(Exception e) {
            throw new MemberException("로그인 에러 :" + e.getMessage());
            
            // 그냥 실행하면 기본 에러페이지로 이동할 수 있기 때문에
            // 우리가 만든 error 페이지를 web.xml에 등록하여 에러발생시 해당 에러페이지로  이동하도록
            // 공용 에러 페이지 등록 처리를 한다.
         }
         return mv;
   
   }
   
   @RequestMapping("/index.do")
   public String mainGo() {
      
      return "index";
   }
   
   @RequestMapping("/member/updateMember.do")
   public String updateMember() {
      
      return "/member/updateMember";
   }
   
   
   
}
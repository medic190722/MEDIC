package com.kh.medic.member.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.medic.member.model.service.MemberService;
import com.kh.medic.member.model.vo.Member;
import com.google.gson.Gson;
import com.kh.medic.common.schedule.model.service.ScheduleService;
import com.kh.medic.common.schedule.model.service.ScheduleServiceImpl;
import com.kh.medic.common.schedule.model.vo.Schedule;
import com.kh.medic.common.util.Utils;
import com.kh.medic.member.model.exception.MemberException;

@SessionAttributes(value= {"m"})
@Controller
public class MemberController {
   
	@Autowired
	MemberService memberService;
	
	@Autowired
	ScheduleService scService;
	   
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   @RequestMapping("/member/register.do")
   public String memberEnroll() {
      
      return "/member/register";
   }

   
   @RequestMapping("/member/memberEnrollEnd.do")
   public String memberEnrollEnd(Member m, Model model) {
      
      // 암호화 로직 - spring security
      // - sha 방식 (5버전 때 부터는 보안 문제로 삭제되었음)
      // - bcrypt 방식
      
      System.out.println("member 확인 : " + m);

      
      m.setEmpPwd(m.getEmpRrn().substring(0,6));
      System.out.println("비밀번호 변경 확인 : " + m.getEmpPwd());
      
      String rawPassword = m.getEmpPwd();
      System.out.println("암호화 전 :" + rawPassword);
      m.setEmpPwd(bcryptPasswordEncoder.encode(rawPassword));
      System.out.println("암호화 후 :" + m.getEmpPwd());
      // 1. 비즈니스 로직 실행
      int result = memberService.insertMember(m);
      
      
      // 2. 실행 결과에 따른 화면 처리
      String loc = "/member/memberList.do";
      String msg = "";
      
      if(result > 0 ) { msg = "회원가입 성공!";
         
         loc="/member/memberList.do";
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
               mv.addObject("m", m);
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
   public String mainGo(Model model, @SessionAttribute Member m) {
      
	   List<Schedule> schList = scService.scheduleList(m.getEmpNo());
	   
	   model.addAttribute("schList", new Gson().toJson(schList));
	   
      return "index";
   }
   

   
   @RequestMapping("/member/updateMember.do")
	public ModelAndView  updateMember( Member member, Model model) {

	   ModelAndView mv = new ModelAndView();
	   
	   System.out.println("업데이트 멤버 값 확인 : " + member);
		
		// 1. 비즈니스 로직 실행
		int result = memberService.updateMember(member);
		
		// 2. 처리 결과에 따른 화면 설정
		String loc = "/member/memberList.do";
		String msg = "";
		
		if(result > 0) {
			msg ="회원 정보 수정 성공";
			mv.addObject("member", member);
			}else {
				msg = "회원정보 수정 실패";
			}
		
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		
		return mv;
		
	
	}
   
   @RequestMapping("/member/memberView.do")
	public ModelAndView memberView(@RequestParam int empNo) {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberService.selectMember(empNo));
		
		mv.setViewName("member/updateMember");
		
		return mv;
	}
	
   @RequestMapping("/member/privacyView.do")
	public ModelAndView privacyView(@RequestParam int empNo) {
	   ModelAndView mv = new ModelAndView();
		mv.addObject("member", memberService.selectMember(empNo));
		
		mv.setViewName("member/privacy");
		
		return mv;
	   
   }
	
   @RequestMapping("/member/updatePrivacy.do")
   public ModelAndView  updatePrivacy( Member member, Model model) {

	   ModelAndView mv = new ModelAndView();
	   
	   System.out.println("업데이트 멤버 전 확인 : " + member);
	   String rawPassword = member.getEmpPwd();
	      System.out.println("암호화 전 :" + rawPassword);
	      member.setEmpPwd(bcryptPasswordEncoder.encode(rawPassword));
	      System.out.println("암호화 후 :" + member.getEmpPwd());
		// 1. 비즈니스 로직 실행
		int result = memberService.updatePrivacy(member);
		System.out.println("업데이트 멤버 후 확인 : " + member);
		// 2. 처리 결과에 따른 화면 설정
		String loc = "/index.do";
		String msg = "";
		
		if(result > 0) {
			msg ="회원 정보 수정 성공";
			mv.addObject("member", member);
			}else {
				msg = "회원정보 수정 실패";
			}
		
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		mv.setViewName("common/msg");
		
		return mv; 
	}
   @RequestMapping("/member/memberList.do")
	public String selectMemberList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(memberService.selectMemberList(cPage, limit));
		
		int totalContents= memberService.selectMemberTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "memberList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);
		
		return "member/memberList";
		
		
	}
   
   @RequestMapping("/member/leaveMemberList.do")
	public String leaveMemberList(@RequestParam(value="cPage",required=false, defaultValue="1") int cPage,
			Model model) {
		
		int limit=10;
		
		ArrayList<Map<String,String>> list=new ArrayList<>(memberService.leaveMemverList(cPage, limit));
		
		int totalContents= memberService.leaveMemberTotalContents();
		
		String pageBar= Utils.getPageBar(totalContents, cPage, limit, "leaveMemberList.do");
		
		model.addAttribute("list", list).addAttribute("totalContents", totalContents).addAttribute("numPerPage", limit)
		.addAttribute("pageBar", pageBar);
		
		return "member/leaveMemberList";
		
		
	}
  
	@RequestMapping("/member/searchMember.do")
	public String searchMember(@RequestParam String e_name, SessionStatus sessionStatus, Model model) {
		
		System.out.println(e_name);
		
		List<Member> memberList = new ArrayList<>();
		
		memberList = memberService.selectSearchMember(e_name);
		
		for(Member p : memberList) {
			int i = 0;
			System.out.println(i + "번째 " + p);
			i++;
		}
		
		model.addAttribute("list", memberList);
		
		return "member/memberList";
		
	}
	
	
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		// sesstionStatus : 현재 연결되어 있는 세션의 상태를 관리하는 객체
		System.out.println("session 상태 확인:" + sessionStatus.isComplete());
		
		if(!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(@RequestParam int empNo, Model model) {
		
		System.out.println("empNo확인" + empNo);
		
		int result = memberService.deleteMember(empNo);
	
		// 2. 처리 결과에 따른 페이지 설정
		String loc = "/member/leaveMemberList.do";
		String msg = "";
		
		if(result > 0 ) msg = "회원 탈퇴 성공!";
		else msg = "회원 탈퇴 실패!";
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
}
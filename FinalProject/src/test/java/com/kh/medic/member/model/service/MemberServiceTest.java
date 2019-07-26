package com.kh.medic.member.model.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.medic.member.model.vo.Member;

@WebAppConfiguration // 서버 기본 설정을 가져오는 어노테이션(web.xml)
@RunWith(SpringJUnit4ClassRunner.class) // 실행할 애플리케이션
@ContextConfiguration(locations= {
      "file:src/main/resources/root-context.xml",
      "file:src/main/resources/security-context.xml",
      "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
})
public class MemberServiceTest {

   @Autowired
   private MemberService memberService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   // 전달할 회원 정보
   Member m;
   String password;
   
   // DB로부터 받아올 회원 확인 정보
   Member m_chk;
   
   @Before
   public void init() {
      
      m = new Member();
      m.setEmpNo(1037);
      password = "777777";
      
      System.out.println("비밀번호 암호화 전 : " + password);
      
      // 비밀번호 암호화
      m.setEmpPwd(bcryptPasswordEncoder.encode(password));
      
      System.out.println("비밀번호 암호화 후 :" + m.getEmpPwd());
      
      m_chk = memberService.selectMember(m.getEmpNo());
      System.out.println("m_chk.getPassword() : "+m_chk.getEmpPwd());
      
   }
   
   @Test
   public void memberEncodePassword() {
      
      if(m_chk != null) {
         
         // 현재 암호화된 결과와 DB의 결과가 같은 지 확인
         assertEquals(m.getEmpPwd(), m_chk.getEmpPwd());
         
      }
         
   }
   
   @Test
   public void memberPasswordMatch() {
      
      if(m_chk != null) {
         
         // 원래 비밀번호와 암호화된 DB의 비밀번호가 일치하는지 테스트
         assertTrue(bcryptPasswordEncoder.matches(password, m_chk.getEmpPwd()));
         
      }
      
   }
   
   @After
   public void end() {
      System.out.println("MemberService 테스트 종료!");
   }
   
}
package com.kh.medic.notice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.medic.common.util.Utils;
import com.kh.medic.notice.model.service.NoticeService;
import com.kh.medic.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService nService;
	
	@RequestMapping("/notice/noticeTop5.do")
	@ResponseBody
	public List<Notice> selectTop5(Model model) {
	
		   List<Notice> nList = nService.noticeTop5();
		   
		   model.addAttribute("nList", new Gson().toJson(nList));
	      
		   return nList;
	}

	@RequestMapping("/notice/noticeList.do")
	public String selectNoticeList(	
			@RequestParam(value="cPage", required = false, defaultValue = "1")
	     	int cPage, Model model) {
			
		int limit = 10; // 한 페이지 당 게시글 수
	
		// 1. 현재 페이지 게시글 목록 가져오기
		ArrayList<Map<String, String>> list
		 = new ArrayList<>
			(nService.selectNoticeList(cPage, limit));
		
		// 2. 전체 페이지 게시글 수 가져오기
		int totalContents = nService.selectNoticeTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, limit, "noticeList.do");
		
		model.addAttribute("list", list)
			 .addAttribute("totalContents", totalContents)
			 .addAttribute("numPerPage", limit)
			 .addAttribute("pageBar", pageBar);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("/notice/noticeForm.do")
	public String noticeForm() {
		// view 이름이 정해지지 않았을 경우
		// viewNameTranslator 객체가 url 경로를
		// 유추하여 결정한다. (.do --> .jsp)
		// 직접 명시하지 않았기 때문에 명확한 전달을
		// 표현하지 못해 권장하는 방식은 아니다.
		return "notice/noticeForm";
	}

 	@RequestMapping("/notice/noticeFormEnd.do")
	public String insertNotice(Notice notice, Model model, 
				HttpSession session) {

 		System.out.println(notice);
 		
 		int result;

 		result = nService.insertNotice(notice);

 		String loc = "/notice/noticeList.do";
		String msg = "";

 		if(result > 0) {
			msg = "공지사항 등록 성공!";
		} else {
			msg = "공지사항 작성 실패!";
		}

 		model.addAttribute("loc", loc).addAttribute("msg", msg);

 		return "common/msg";
	}

 	@RequestMapping("/notice/noticeView.do")
	public String selectOneNotice(
			@RequestParam int nno, Model model
			) {
 			model.addAttribute("notice", nService.selectOneNotice(nno));

 		return "notice/noticeView";
	}

 	@RequestMapping("/notice/noticeUpdateView.do")
	public void noticeUpdateView(@RequestParam int nno, Model model) {

 		model.addAttribute("notice", nService.selectOneNotice(nno));

 	}

 	@RequestMapping("/notice/noticeUpdate.do")
	public String updateNotice(Notice notice, HttpSession session, Model model) {

 		int nno = notice.getNno();

 		// 원본 게시글 조회하여 특정 부분 수정하기
		Notice originNotice = nService.selectOneNotice(nno);
		originNotice.setNtitle(notice.getNtitle());
		originNotice.setNcontent(notice.getNcontent());

 		int result = nService.updateNotice(originNotice);

 		String loc = "/notice/noticeList.do";
		String msg = "";

 		if(result > 0) {
			msg = "공지사항 수정 성공!";
		} else {
			msg = "공지사항 수정 실패!";
		}

 		model.addAttribute("loc", loc).addAttribute("msg", msg);

 		return "common/msg";
	}

 	@RequestMapping("/notice/noticeDelete.do")
	public String noticeDelete(
			@RequestParam int nno,
			HttpSession session, Model model
			) {

 		int result = nService.deleteNotice(nno);

 		String loc = "/notice/noticeList.do";
		String msg = "";

 		if(result > 0) {
			msg = "공지 삭제 성공!";
		} else {
			msg = "공지 삭제 실패 ㅠㅠ";
		}

 		model.addAttribute("loc", loc).addAttribute("msg", msg);

 		return "common/msg";
	}

}

package kr.co.T2Market.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.PagingVO;
import kr.co.T2Market.board.service.NoticeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;
	
	@GetMapping("/noticelist")
	public void list(PagingVO vo ,Model model, 
			@RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		log.info("receipt lisst..");
		
		int total = service.countReciept();
		
		if(nowPage == null || nowPage=="") {
			nowPage="1";
		}
		if(cntPerPage == null || cntPerPage=="") {
			cntPerPage="10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectNotice(vo));
		
	}
	
	@GetMapping("/noticeregister")
	public void register() {
		
	}
	
	@PostMapping("/noticeregister")
	public String register(NoticeVO notice, RedirectAttributes rttr ) {
		//TODO : 나중에 삭제 -> 로그인 작업 완료되면
		notice.setAdmin_id("admin1");
		
		service.regiser(notice);
		
		rttr.addFlashAttribute("result", notice.getNotice_no());
		
		return "redirect:/board/noticelist";
	}
	
	@GetMapping({"/noticeget","noticemodify"})
	public void get(@RequestParam("notice_no") Long notice_no, Model model) {
		model.addAttribute("notice", service.get(notice_no));
	}
	
	@PostMapping("/noticemodify")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		
		if(service.modify(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/noticelist";
	}
}

package kr.co.T2Market.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.domain.ReplyVO;
import kr.co.T2Market.board.service.NoticeService;
import kr.co.T2Market.board.service.ReplyService;
import kr.co.T2Market.reciept.domain.PagingVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/replies")
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	@GetMapping("/replylist")
	public void list(PagingVO vo ,Model model, 
			@RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		log.info("reply list..");
		
		int total = service.countReciept();
		
		if(nowPage == null || nowPage=="") {
			nowPage="1";
		}
		if(cntPerPage == null || cntPerPage=="") {
			cntPerPage="10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectReply(vo));
		
	}
	
	@GetMapping("/replyregister")
	public void register() {
		
	}
	
	@PostMapping("/replyregister")
	public String register(ReplyVO reply, RedirectAttributes rttr ) {
		//TODO : 나중에 삭제 -> 로그인 작업 완료되면
		reply.setAdmin_id("admin1");
		
		service.regiser(reply);
		
		rttr.addFlashAttribute("result", reply.getAnswer_no());
		
		return "redirect:/replies/replylist";
	}
	
	@GetMapping({"/replyget","replymodify"})
	public void get(@RequestParam("answer_no") Long answer_no, Model model) {
		model.addAttribute("answer", service.get(answer_no));
	}
	
	@PostMapping("/noticemodify")
	public String modify(ReplyVO reply, RedirectAttributes rttr) {
		
		if(service.modify(reply)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/replies/replylist";
	}
}

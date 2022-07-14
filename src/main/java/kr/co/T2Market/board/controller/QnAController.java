package kr.co.T2Market.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.board.domain.NoticeVO;
import kr.co.T2Market.board.service.NoticeService;
import kr.co.T2Market.board.service.NoticeServiceImpl;
import kr.co.T2Market.board.service.QnAService;
import kr.co.T2Market.board.service.ReplyService;
import kr.co.T2Market.reciept.domain.PagingVO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
@AllArgsConstructor
public class QnAController {

	private QnAService service;
	
	@GetMapping("/qnalist")
	public void list(PagingVO vo ,Model model, 
			@RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		log.info("QnA list..");
		
		int total = service.countReciept();
		
		if(nowPage == null || nowPage=="") {
			nowPage="1";
		}
		if(cntPerPage == null || cntPerPage=="") {
			cntPerPage="10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectQnA(vo));
		
	}
	
	@GetMapping("/qnaget")
	public void get(@RequestParam("qna_no") Long qna_no, Model model) {
		model.addAttribute("qna", service.get(qna_no));
	}
}

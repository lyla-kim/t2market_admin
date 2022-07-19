package kr.co.T2Market.board.controller;

<<<<<<< HEAD
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
=======
>>>>>>> branch 'master' of https://github.com/lyla-kim/t2market_admin.git
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

<<<<<<< HEAD
import kr.co.T2Market.board.domain.ReplyVO;
=======
import kr.co.T2Market.board.domain.PagingVO;
>>>>>>> branch 'master' of https://github.com/lyla-kim/t2market_admin.git
import kr.co.T2Market.board.service.QnAService;
import kr.co.T2Market.board.service.ReplyService;
<<<<<<< HEAD
import kr.co.T2Market.reciept.domain.PagingVO;
=======
>>>>>>> branch 'master' of https://github.com/lyla-kim/t2market_admin.git
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
public class QnAController {

	@Setter(onMethod_ = @Autowired)
	private QnAService service;
<<<<<<< HEAD
	@Setter(onMethod_ = @Autowired)
=======
>>>>>>> branch 'master' of https://github.com/lyla-kim/t2market_admin.git
	private ReplyService replyService;
	
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
		
<<<<<<< HEAD
=======
	}
	
	@GetMapping("/qnaget")
	public void get(@RequestParam("qna_no") Long qna_no, Model model) {
		model.addAttribute("qna", service.get(qna_no));
		//��۸��
		model.addAttribute("reply", replyService.get(qna_no));
>>>>>>> branch 'master' of https://github.com/lyla-kim/t2market_admin.git
		
	}
	
	@GetMapping("/qnaget")
	public void get(@RequestParam("qna_no") String qna_no, Model model, @ModelAttribute("paging") PagingVO paging) {
		service.updateReplyCount(qna_no);
		
		model.addAttribute("qna", service.get(qna_no));
		
		List<ReplyVO> replyList = replyService.get(qna_no);
		model.addAttribute("reply", replyList);
		
		model.addAttribute("paging", paging);
	}
	
	@PostMapping("/replyWrite")
	public String replyWrite(ReplyVO vo, RedirectAttributes rttr, PagingVO paging) {
		replyService.register(vo);
		
		rttr.addAttribute("qna_no", vo.getQna_no());
		rttr.addAttribute("nowPage", paging.getNowPage());
		rttr.addAttribute("cntPerPage", paging.getCntPerPage());
		
		log.info("답글번호: "+vo.getAnswer_no());
		
		return "redirect:/board/qnaget";
	}
	
	@GetMapping("/replyRemove")
	public String replyRemove(ReplyVO vo, RedirectAttributes rttr, PagingVO paging) {
		replyService.remove(vo);
		
		rttr.addAttribute("qna_no", vo.getQna_no());
		rttr.addAttribute("nowPage", paging.getNowPage());
		rttr.addAttribute("cntPerPage", paging.getCntPerPage());
		
		return "redirect:/board/qnaget";
	}
	
	@PostMapping("/replyModify")
	public String replyModify(ReplyVO vo, RedirectAttributes rttr, PagingVO paging) {
		replyService.modify(vo);
		
		rttr.addAttribute("qna_no", vo.getQna_no());
		rttr.addAttribute("nowPage", paging.getNowPage());
		rttr.addAttribute("cntPerPage", paging.getCntPerPage());
		
		return "redirect:/board/qnaget";
	}
	
	@GetMapping("/replyModify")
	public void replyModifyView(ReplyVO vo, Model model, @ModelAttribute("paging") PagingVO paging) {
		ReplyVO reply = replyService.selectReply(vo.getAnswer_no());
		log.info("댓글번호: "+reply.getAnswer_no());
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getAnswer_no()));
		model.addAttribute("paging", paging);
	}
}







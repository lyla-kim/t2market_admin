package kr.co.T2Market.code.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.T2Market.code.domain.CodeVO;
import kr.co.T2Market.code.domain.PagingVO;
import kr.co.T2Market.code.service.CodeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/code/*")
@AllArgsConstructor
public class CodeController {
	
	private CodeService service;
	
	@GetMapping("/codelist")
	public void list(PagingVO vo, Model model, 
			@RequestParam(value="nowPage", required =false)	String nowPage, @RequestParam(value="cntPerPage", required =false) String cntPerPage) {
		
		log.info("codelist...");
		
		int total = service.countCode();
		
		if(nowPage == null || nowPage == " ") {
			nowPage = "1";
		}
		if(cntPerPage == null || cntPerPage == " ") {
			cntPerPage = "10";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.getListWithPaging(vo));
		
	}
	
	
	
	
	

}

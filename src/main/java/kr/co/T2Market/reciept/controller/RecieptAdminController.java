package kr.co.T2Market.reciept.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.T2Market.reciept.domain.PagingVO;
import kr.co.T2Market.reciept.domain.RecieptAdminVO;
import kr.co.T2Market.reciept.service.RecieptAdminService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/order/*")
public class RecieptAdminController {

	private RecieptAdminService service;
	
	@GetMapping("/list")
	public void recieptList(PagingVO vo ,Model model, 
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
		model.addAttribute("list", service.selectReciept(vo));
		
	}
	
	@GetMapping("/get")
	public void get() {
		
	}
	
}

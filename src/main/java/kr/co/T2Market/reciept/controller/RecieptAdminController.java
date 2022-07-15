package kr.co.T2Market.reciept.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void recieptList(PagingVO vo, Model model, 
			@RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam(value="searchType", required=false)String searchType, @RequestParam(value="keyword", required=false)String keyword) {
		
		log.info("receipt lisst..");
		
		int total = service.countReciept(vo);
		
		if(nowPage == null || nowPage=="") {
			nowPage="1";
		}
		if(cntPerPage == null || cntPerPage=="") {
			cntPerPage="10";
		}
		if(searchType == null || searchType=="") {
			searchType="r";
		}
		if(keyword == null || keyword=="") {
			keyword="";
		}
		
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage), searchType, keyword);
		
		model.addAttribute("paging", vo);
		model.addAttribute("list", service.selectReciept(vo));
		
	}
	
	@GetMapping("/read")
	public void recieptRead(@RequestParam("detail_no")String detail_no, PagingVO vo, Model model) {
		log.info("reciepte read..........");
		
		model.addAttribute("paging", vo);
		model.addAttribute("read", service.recieptRead(detail_no));
	}
	
	@PostMapping("/update")
	public String recieptUpdate(RecieptAdminVO vo, @ModelAttribute("paging") PagingVO paging, RedirectAttributes rttr) {
		log.info("reciept update........");
		
		service.recieptUpdate(vo);
		
		rttr.addFlashAttribute("result", "success");
		
		rttr.addAttribute("nowPage", paging.getNowPage());
		rttr.addAttribute("cntPerPage", paging.getCntPerPage());
		rttr.addAttribute("searchType", paging.getSearchType());
		rttr.addAttribute("keyword", paging.getKeyword());
		
		return "redirect:/order/list";
	}
}

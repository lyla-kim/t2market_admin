package kr.co.T2Market.product.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.product.domain.PagingVO;
import kr.co.T2Market.product.domain.ProductAttachVO;
import kr.co.T2Market.product.domain.ProductVO;
import kr.co.T2Market.product.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@RequestMapping("/product/*")
@Controller
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/list")
	public void productList(PagingVO vo, Model model, 
			@RequestParam(value="nowPage", required=false)String nowPage, @RequestParam(value="cntPerPage", required=false)String cntPerPage,
			@RequestParam(value="searchType", required=false)String searchType, @RequestParam(value="keyword", required=false)String keyword) {
		
		log.info("product list...");
		
		int total = service.countProduct(vo);
		
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
		model.addAttribute("list", service.selectProduct(vo));
		
	}
	
	@GetMapping("/read")
	public void productRead(@RequestParam("product_no") String product_no, PagingVO vo, Model model) {
		log.info("reciepte read..........");
		
		model.addAttribute("code", service.codeSelect());
		model.addAttribute("paging", vo);
		model.addAttribute("read", service.readProduct(product_no));
	}
	
	@PostMapping("/update")
	public String productUpdate(ProductVO vo, @ModelAttribute("paging") PagingVO paging, RedirectAttributes rttr) {
		log.info("product update........");
		
		if(vo.getAttachList() !=null) {
			List<ProductAttachVO> attachList = service.getAttachList(vo.getProduct_no());
			deleteFiles(attachList);
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		service.update(vo);
		
		rttr.addFlashAttribute("result", "success");
		
		rttr.addAttribute("nowPage", paging.getNowPage());
		rttr.addAttribute("cntPerPage", paging.getCntPerPage());
		rttr.addAttribute("searchType", paging.getSearchType());
		rttr.addAttribute("keyword", paging.getKeyword());
		
		return "redirect:/product/list";
	}
	
	@GetMapping("/register")
	public void register(Model model) {
		log.info("get register...");
		model.addAttribute("code", service.codeSelect());
	}
	
	@PostMapping("/register")
	public String register(ProductVO product, RedirectAttributes rttr) {
		log.info("register: "+product);
		
		if(product.getAttachList() != null) {
			product.getAttachList().forEach(attach -> log.info(attach));
			rttr.addFlashAttribute("result", "exit");
		}
		
		service.register(product);
		rttr.addFlashAttribute("result", product.getProduct_no());
		return "redirect:/product/list";
		
	}
	
	@GetMapping(value="/getAttachList", produces = org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ProductAttachVO>> getAttachList(String product_no){
		log.info("getAttachList:"+product_no);
		
		return new ResponseEntity<>(service.getAttachList(product_no), HttpStatus.OK);
	}
	
	private void deleteFiles(List<ProductAttachVO> attachList) {
		if(attachList==null || attachList.size()==0) {
			return;
		}
		attachList.forEach(attach ->{
			try {
				Path file = Paths.get("c:\\product_img\\"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(file);
				
				Path thumbNail = Paths.get("c:\\product_img\\"+"s_"+attach.getUuid()+"_"+attach.getFileName());
				Files.deleteIfExists(thumbNail);
			}catch(Exception e) {
				e.printStackTrace();
			}
		});
	}	
	
	
}

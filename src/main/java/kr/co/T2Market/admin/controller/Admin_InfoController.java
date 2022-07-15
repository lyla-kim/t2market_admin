package kr.co.T2Market.admin.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.admin.domain.Admin_InfoVO;
import kr.co.T2Market.admin.service.Admin_InfoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
@AllArgsConstructor
public class Admin_InfoController {

	private Admin_InfoService service;
	
	@GetMapping("/main")
	public void mainAdmin() {
		
	}
	
	@GetMapping("/registerAdmin")
	public void registerAdmin() {
		
	}
	
	@PostMapping("/registerAdmin")
	public String registerAdmin(Admin_InfoVO admin, RedirectAttributes rttr) {
		log.info("register: "+admin);
		
		service.registerAdmin(admin);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(String id) {
		int result = service.getId(id);
		return result;
	}
	
	@GetMapping("/unusedAdmin")
	public String unusedAdmin(@RequestParam("admin_id") String admin_id, RedirectAttributes rttr) {
		log.info("unusedAdmin: "+admin_id);
		
		service.unusedAdmin(admin_id);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/admin/main";
	}
}

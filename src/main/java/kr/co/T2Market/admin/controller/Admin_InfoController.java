package kr.co.T2Market.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.admin.domain.Admin_InfoVO;
import kr.co.T2Market.admin.service.Admin_InfoService;
import kr.co.T2Market.board.service.QnAService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/*")
@Log4j
public class Admin_InfoController {
	
	@Setter(onMethod_ = @Autowired)
	private Admin_InfoService service;
	
	//추가
	@Setter(onMethod_ = @Autowired)
	private BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("/registerAdmin")
	public void registerAdmin(Model model) {
		log.info("get register...");
		model.addAttribute("code", service.codeSelect());
	}
	
	@PostMapping("/registerAdmin")
	public String registerAdmin(Admin_InfoVO admin, RedirectAttributes rttr) {
		log.info("register: "+admin);
		
		//추가
		String PlaintextPassword = admin.getPass();
		String encryptionPassword = pwdEncoder.encode(PlaintextPassword);
		admin.setPass(encryptionPassword);
		
		
		service.registerAdmin(admin);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/login/login2";
	}
	
	@ResponseBody
	@PostMapping("/idCheck")
	public int idCheck(String id) {
		int result = service.getId(id);
		return result;
	}
	
	@GetMapping("/unusedAdmin")
	public String unusedAdmin(@RequestParam("admin_id") String admin_id, RedirectAttributes rttr, HttpSession session) {
		log.info("unusedAdmin: "+admin_id);
		
		service.unusedAdmin(admin_id);
		
		session.invalidate();
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/login/login2";
	}
}

package kr.co.T2Market.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.T2Market.login.domain.AdminVO;
import kr.co.T2Market.login.service.AdminService;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/login/*")
@Log4j
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private AdminService service;
	
	@GetMapping("/login2")
	public void loginGET() {
		
	}
	
	@PostMapping("/login2")
	public String loginPOST(AdminVO vo, HttpServletRequest req, RedirectAttributes rttr) {
		log.info("post login");
		
		HttpSession session = req.getSession();
		
		AdminVO login = service.login(vo);
		
		if(login == null || login.getActive() == 'N') {
			session.setAttribute("admin", null);
			rttr.addFlashAttribute("result", "loginFalse");
			
			return "redirect:/login/login2";
		}else {
			session.setAttribute("admin", login);
			String id = req.getParameter("admin_id"); //확인용
			rttr.addFlashAttribute("result", "loginOK");
			
			
			AdminVO admin = (AdminVO)session.getAttribute("admin");
			log.info("...: "+admin);
			
			return "redirect:/login/login2";
		}
		
	}
	
	@GetMapping("/logout2")
	public String logout2(HttpSession session) {
		log.info("logouttt");
		session.invalidate(); //세션을 무효화 o 세션 삭제 x
		return "redirect:/login/login2";
	}
}

package kr.co.T2Market.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@RequestMapping("/admin/*")
@Log4j
@Controller
public class SampleController {
	
	@GetMapping("/admin")
	public void doall() {
		log.info("do admins");
	}
	 
}

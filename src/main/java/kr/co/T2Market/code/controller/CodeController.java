package kr.co.T2Market.code.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.T2Market.code.service.CodeService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/admin/*")
@Controller
@AllArgsConstructor
public class CodeController {
	
	private CodeService service;

}

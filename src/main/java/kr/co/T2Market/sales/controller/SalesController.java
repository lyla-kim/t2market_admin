package kr.co.T2Market.sales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/sales")
@Log4j2
@AllArgsConstructor
public class SalesController {
	@GetMapping("/sales")
	public void sales() {
	}
}

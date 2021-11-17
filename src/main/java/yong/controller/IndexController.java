package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/kkk.do")
	public String kkk() {
		return "kkk";
	}
	
	@RequestMapping("/hotel.do")
	public String hotel() {
		return "hotel";
	}
	
	@RequestMapping("/keyword.do")
	public String keyword() {
		return "keyword";
	}
}

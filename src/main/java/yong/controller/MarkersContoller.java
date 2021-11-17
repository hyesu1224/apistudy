package yong.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarkersContoller {
	@RequestMapping("/markers.do")
	public String markers() {
		return "markers";
	}
}

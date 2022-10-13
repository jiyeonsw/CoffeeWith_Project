package com.bit.mini;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	
	@GetMapping("/help/map")
	public String help() {
		
		return "/bit/help/googlemap";
	}
}

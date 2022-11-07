package com.teamone.ownit;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "main";
	}
	@RequestMapping(value = "hello", method = RequestMethod.GET)
	public String main2() {
		//맵핑테스트
		return "hello";
	//박주닮
	//테스트1
	//커밋1
		//1107 | 1635 서성민test
	}
//	김소희 주석입니다.
	
	// 1107 정채연
	
	
	@PostMapping(value = "ksh") 
	public String ksh() {
		// 김소희 메서드 입니다.
		return "ksh";
	}
	
	@RequestMapping(value = "jcy", method = RequestMethod.GET)
	public String jcy() {
		return "jcy";
	}
}

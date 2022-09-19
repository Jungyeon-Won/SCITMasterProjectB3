package net.softsociety.testboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("member")
public class MemberController {

	// 로그인 화면
	@GetMapping("/sign_in")
	public String sign_in() {
		log.debug("called sign_in");
		return "examples/sign_in";
	}

	// 회원가입 화면
	@GetMapping("/sign_up")
	public String sign_up() {
		log.debug("called sign_up");
		return "examples/sign_up";
	}

	// 내정보
	@GetMapping("/profile")
	public String profile() {
		log.debug("called profile");
		return "profile";
	}

	/**
	 * sign in page
	 * @return
	 */
	@GetMapping("/login")
	public String login() {
		return "memberView/loginForm";
	}
	
	/**
	 * sine up page
	 * @return
	 */
	@GetMapping("/join")
	public String join() {
		return "memberView/joinForm";
	}
	
	/**
	 * sine up page
	 * @return
	 */
	@GetMapping("/findpassword")
	public String findpassword() {
		return "memberView/findPasswordForm";
	}
}

package com.human.myapp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class myController {

	@RequestMapping(value = "/nick", method = RequestMethod.GET)
	public String showNick(HttpServletRequest req, Model model) {
		String uid = req.getParameter("userid");
		String passcode = req.getParameter("password");
		String region = req.getParameter("city");
		model.addAttribute("user_id", uid);
		model.addAttribute("pwd", passcode);
		model.addAttribute("area", region);

		return "nick";
	}
//@PathVariable 사용
	@RequestMapping("/calc/{str1}/{str2}/{str3}")
	public String doCalc(@PathVariable String str1, @PathVariable String str2, @PathVariable String str3, Model model) {
//		String str1 = req.getParameter("op");
//		String str2 = req.getParameter("x");
//		String str3 = req.getParameter("y");
		if (str1 == null || str1.equals("") || str2 == null || str2.equals("") || str3 == null || str3.equals("")) {
			model.addAttribute("title", "오류상황");
			model.addAttribute("result", "유효한 값이 주어지지 않았습니다.");

		} else if (str1.equals("plus")) {
			model.addAttribute("title", "더하기");
			model.addAttribute("result", Integer.parseInt(str2) + Integer.parseInt(str3));
			return "plus";
		} else if (str1.equals("minus")) {
			model.addAttribute("title", "빼기");
			model.addAttribute("result", Integer.parseInt(str2) - Integer.parseInt(str3));
			return "minus";
		} else if (str1.equals("div")) {
			model.addAttribute("title", "나누기");
			model.addAttribute("result", Integer.parseInt(str2) / Integer.parseInt(str3));
		} else if (str1.equals("multi")) {
			model.addAttribute("title", "곱하기");
			model.addAttribute("result", Integer.parseInt(str2) * Integer.parseInt(str3));
		}
		return "result";

	}

	@RequestMapping(value = "/computer", method = RequestMethod.GET)
	public String dosolve(HttpServletRequest req, Model model) {
		String str1 = req.getParameter("x");
		String str2 = req.getParameter("y");
		int x = Integer.parseInt(str1);
		int y = Integer.parseInt(str2);
		if (x - y > 0) {
			model.addAttribute("x", x);
			model.addAttribute("y", y);
			model.addAttribute("result", x - y);
			return "on";
		} else {
			model.addAttribute("x", x);
			model.addAttribute("y", y);
			model.addAttribute("result", x - y);
			return "off";
		}
	}

	// 회원가입 로직
	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}

	@RequestMapping("/user_chek")
	public String doUserCheck(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		if (user_id.equals("human") && password.equals("human123")) {
			model.addAttribute("userid", user_id);
			model.addAttribute("pwd", password);
			return "userinfo";
		} else {
			model.addAttribute("userid", user_id);
			return "signin";
		}

	}

	@RequestMapping("/user_siginin")
	public String doSignin(HttpServletRequest req, Model model) {
		String uid = req.getParameter("userid");
		String pwd = req.getParameter("pwd");
		String pwd1 = req.getParameter("pwd1");
		return "redirect:/login";

	}
}

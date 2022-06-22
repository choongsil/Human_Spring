package com.human.myapp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

	@RequestMapping(value = "/calc", method = RequestMethod.GET)
	public String doCalc(HttpServletRequest req, Model model) {
		String str1 = req.getParameter("op");
		String str2 = req.getParameter("x");
		String str3 = req.getParameter("y");
		if (str1 == null || str1.equals("") || str2 == null || str2.equals("") || str3 == null || str3.equals("")) {
			model.addAttribute("title", "오류상황");
			model.addAttribute("result", "유효한 값이 주어지지 않았습니다.");

		} else if (str1.equals("plus")) {
			model.addAttribute("title", "더하기");
			model.addAttribute("result", Integer.parseInt(str2) + Integer.parseInt(str3));
		} else if (str1.equals("minus")) {
			model.addAttribute("title", "빼기");
			model.addAttribute("result", Integer.parseInt(str2) - Integer.parseInt(str3));
		}else if(str1.equals("divided")) {
			model.addAttribute("title", "나누기");
			model.addAttribute("result", Integer.parseInt(str2) / Integer.parseInt(str3));
		}else if(str1.equals("multyply")) {
			model.addAttribute("title", "곱하기");
			model.addAttribute("result", Integer.parseInt(str2) * Integer.parseInt(str3));
		}
		return "result";
	}
}

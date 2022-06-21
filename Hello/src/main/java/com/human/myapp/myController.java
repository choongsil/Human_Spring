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
}

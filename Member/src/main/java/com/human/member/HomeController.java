package com.human.member;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if (session.getAttribute("userid") == null) {
			model.addAttribute("statusLine", "<a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>");
			model.addAttribute("newbutton", "");
		} else {

			model.addAttribute("statusLine", session.getAttribute("realname") + "&nbsp;<a href='logout'>LogOut</a>");
			model.addAttribute("newbutton", "<input type=button value='새글쓰기'>");
		}
		return "home";
	}

	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/user_chek")
	public String doUserCheck(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		model.addAttribute("userid", user_id);
		model.addAttribute("pwd", password);
		HttpSession session = req.getSession();
		if (user_id.equals("human") && password.equals("human123")) {
			session.setAttribute("userid", user_id);
			session.setAttribute("realname", "서충실");
//			return "userinfo";
		} else {
//			return "signin";
		}
		return "redirect:/";

	}

	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}

	@RequestMapping("/user_signin")
	public String douserSignin(HttpServletRequest req, Model model) {
		System.out.println("check1");

		return "login";

	}

	@RequestMapping("/signin")
	public String doSignin(HttpServletRequest req, Model model) {
		System.out.println("check");
		return "signin";

	}

}

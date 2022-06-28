package com.human.member;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private SqlSession sqlSession;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		if (session.getAttribute("userid") == null) {
			model.addAttribute("userinfo", "");
//			model.addAttribute("statusLine", "<a href='login'>Login</a>&nbsp;<a href='signin'>Signin</a>");
//			model.addAttribute("newbutton", "");
		} else {
			model.addAttribute("userinfo", session.getAttribute("name"));
//			model.addAttribute("statusLine", session.getAttribute("newuser") + "&nbsp;<a href='logout'>LogOut</a>");
//			model.addAttribute("newbutton", "<input type=button value='새글쓰기'>");
		}
		iboard ibod = sqlSession.getMapper(iboard.class);
		ArrayList<boardDTO> blist = ibod.boardList();
		model.addAttribute("list", blist);
		return "home";
	}

	@RequestMapping("/logout")
	public String doLogout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/user_chek", method = RequestMethod.POST)
	public String doUserCheck(HttpServletRequest req, Model model) {
		String user_id = req.getParameter("userid");
		String password = req.getParameter("pwd");
		imember mem = sqlSession.getMapper(imember.class);
		memberDTO mdto = mem.findmember(user_id, password);
		memberDTO mdto1 = mem.selectmember(user_id, password);
		if (mdto.cnt == 0) {
			model.addAttribute("alert", "<script>alert('회원정보를 확인해주세요')</script>");
			return "login";
		} else {
			HttpSession session = req.getSession();
			session.setAttribute("userid", user_id);
			session.setAttribute("psw", password);
			session.setAttribute("name", mdto1.name);
			return "redirect:/";
		}

//		HttpSession session = req.getSession();
//		if (user_id.equals(session.getAttribute("newuser")) && password.equals(session.getAttribute("newpwd"))) {
//			session.setAttribute("newuser", session.getAttribute("newuser"));
//			return "redirect:/";
//		} else if(user_id.equals(session.getAttribute("newuser")) && !password.equals(session.getAttribute("newpwd"))) {
//			model.addAttribute("alert","<script>alert('회원정보를 확인해주세요')</script>");
//			return "login";
//		}else if(!user_id.equals(session.getAttribute("newuser")) && password.equals(session.getAttribute("newpwd"))) {
//			model.addAttribute("alert","<script>alert('회원정보를 확인해주세요')</script>");
//			return "login";
//		}else if(!user_id.equals(session.getAttribute("newuser")) && !password.equals(session.getAttribute("newpwd"))){
//			model.addAttribute("alert","<script>alert('회원가입 해주세요')</script>");
//			return "sigin";
//		}
//		return "redirect:/";

	}

	@RequestMapping("/login")
	public String doLogin() {
		return "login";
	}

	@RequestMapping(value = "/user_signin", method = RequestMethod.POST)
	public String douserSignin(HttpServletRequest req, Model model) {
		String userid = req.getParameter("userid");
		String passcode = req.getParameter("pwd");
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile");
		imember mem = sqlSession.getMapper(imember.class);
		memberDTO mdto = mem.userinfo(userid);
		if (mdto.cnt == 0) {
			mem.insert(userid, passcode, name, mobile);
			return "login";
		}else {
			model.addAttribute("alret","<script>alert('중복된 아이디 입니다.')</script>");
			return "signin";
		}

	}

	@RequestMapping("/signin")
	public String doSignin(HttpServletRequest req, Model model) {

		return "signin";

	}

	@RequestMapping("/newpost")
	public String doNwePost() {

		return "new";
	}
	@RequestMapping(value="/addboard", method = RequestMethod.POST)
	public String doaddcontent(HttpServletRequest req) {
		String title=req.getParameter("title");
		String content=req.getParameter("content");
		HttpSession session = req.getSession();
		String writer = (String) session.getAttribute("userid");
		iboard bod = sqlSession.getMapper(iboard.class);
		bod.addboard(title, content, writer);
		return "redirect:/";
	}
	@RequestMapping("/view/{seqbbs}")
	public String doview(@PathVariable int seqbbs) {
		iboard bod = sqlSession.getMapper(iboard.class);
		ArrayList<boardDTO> content = bod.contentslist();
		return "";
	}

}

package com.human.bord;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * home(Locale locale, Model model) {
	 * logger.info("Welcome home! The client locale is {}.", locale);
	 * 
	 * Date date = new Date(); DateFormat dateFormat =
	 * DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
	 * 
	 * String formattedDate = dateFormat.format(date);
	 * 
	 * model.addAttribute("serverTime", formattedDate );
	 * 
	 * return "home"; }
	 */
	@RequestMapping("/")
	public String dolist(Model model) {
		iTmember tm=sqlSession.getMapper(iTmember.class);
		ArrayList<tmemberDTO> tmlist=tm.listTmember();
		model.addAttribute("tlist",tmlist);
		return "home";
	}
	@RequestMapping(value="/addTmember", method=RequestMethod.POST)
	public String doaddlist(@RequestParam String uid, @RequestParam String pwd,
							@RequestParam String name, @RequestParam String mobile, Model model) {
		iTmember tm=sqlSession.getMapper(iTmember.class);
		tm.insert(uid, pwd, name, mobile);
		return "redirect:/";
	}
}

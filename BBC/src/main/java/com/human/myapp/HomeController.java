package com.human.myapp;

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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping("/list")
	public String doList(Model model) {
		iEmployee emp=sqlSession.getMapper(iEmployee.class);
		ArrayList<empDTO> emplist= emp.listEmployees();
		System.out.println("emplist size="+emplist.size());
		model.addAttribute("list", emplist);
		return "list";
	}
	@RequestMapping("find/{eid}")
	public String doFind(@PathVariable int eid, Model model) {
		iEmployee emp=sqlSession.getMapper(iEmployee.class);
		Member member=emp.getMember(eid);
		model.addAttribute("member", member);
		return "find";
	}
	@RequestMapping("/menulist")
	public String domenuList(Model model) {
		iMenu list=sqlSession.getMapper(iMenu.class);
		ArrayList<menuDTO> menulist= list.listmenu();
		model.addAttribute("list", menulist);
		return "menulist";
	}
	
}

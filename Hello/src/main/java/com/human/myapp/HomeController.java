package com.human.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}
//...../name?mobile=
	@RequestMapping(value = "/gugu", method = RequestMethod.GET)
	public String myName(HttpServletRequest request, Model model) {
		String str1= request.getParameter("dan");
		String y="";
		for(int i=1;i<10;i++) {
			y += str1+"X"+i+"="+(Integer.parseInt(str1)*i)+"<br>";
			
		}
		model.addAttribute("dan1",str1);
		model.addAttribute("dan", y);
		
		return "myName";
	}

}

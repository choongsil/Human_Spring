package com.human.ajax;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping("/list")
	public String doList() {
		return "menu";
	}

	@ResponseBody
	@RequestMapping(value = "/menulist", produces = "application/json;charset=utf-8")
	public String domenuList() {
		iMenu menu = sqlSession.getMapper(iMenu.class);
		ArrayList<menuDTO> arMenu = menu.getMenuList();
		JSONArray ja = new JSONArray();
		for (int i = 0; i < arMenu.size(); i++) {
			menuDTO mdto = arMenu.get(i);
			JSONObject jo = new JSONObject();
			jo.put("seqno", mdto.getSeqno());
			jo.put("name", mdto.getName());
			jo.put("price", mdto.getPrice());
			ja.add(jo);
		}
		System.out.println(ja.toJSONString());
		return ja.toJSONString();
	}

	@ResponseBody
	@RequestMapping(value = "/addnew", produces = "application/json;charset=utf-8")
	public String doAddNew(@RequestParam("name") String name, @RequestParam("price") int price) {
		iMenu menu = sqlSession.getMapper(iMenu.class);
		int reccount = menu.addMenu(name, price);
		return Integer.toString(reccount);
	}

	@ResponseBody
	@RequestMapping("/delete")
	public String doDelete(@RequestParam("seqno") int seqno) {
		iMenu menu = sqlSession.getMapper(iMenu.class);
		int reccount = menu.remove(seqno);
		return Integer.toString(reccount);
	}
	@ResponseBody
	@RequestMapping("/change")
	public String doUpdate(@RequestParam("name") String name,
						   @RequestParam("price") int price,
						   @RequestParam("seqno") int seqno) {
		iMenu menu = sqlSession.getMapper(iMenu.class);
		int reccount = menu.modify(name, price, seqno);
		return Integer.toString(reccount);
	}
}

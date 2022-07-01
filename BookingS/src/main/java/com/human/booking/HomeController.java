package com.human.booking;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	//객실목록 불러오기
	@ResponseBody
	@RequestMapping(value="/SelectRoom",produces = "application/json;charset=utf-8")
	public String doRoomlist() {
		iRoom room = sqlSession.getMapper(iRoom.class);
		ArrayList<RoomManagementDTO> roomlist= room.getRoomList();
		JSONArray ja = new JSONArray();
		for(int i=0;i<roomlist.size();i++) {
			RoomManagementDTO rdto = roomlist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("roomnumber", rdto.roomnumber);
			jo.put("roomname", rdto.roomname);
			jo.put("roomtype", rdto.roomtype);
			jo.put("min", rdto.min);
			jo.put("price", rdto.price);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	//객실 타입 불러오기
	@ResponseBody
	@RequestMapping("/typelist")
	public String doTypelist() {
		iType type=sqlSession.getMapper(iType.class);
		ArrayList<TypeDTO> typelist=type.getTypelist();
		JSONArray ja = new JSONArray();
		for(int i=0; i<typelist.size();i++) {
			TypeDTO tdto = typelist.get(i);
			JSONObject jo = new JSONObject();
			jo.put("type_id", tdto.type_id);
			jo.put("type_name", tdto.type_name);
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	//예약가능 객실 찾기
	@ResponseBody
	@RequestMapping(value="/noreserve",produces = "application/json;charset=utf-8")
	public String doNoreserve(HttpServletRequest req) {
		int roomtype=Integer.parseInt(req.getParameter("room_type"));
		int cnt = Integer.parseInt(req.getParameter("cnt"));
		String typename=req.getParameter("typename");
		String checkin=req.getParameter("checkin");
		String checkout=req.getParameter("checkout");
		JSONArray ja = new JSONArray();
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		ArrayList<reserveDTO> nore=reserve.noreservelist(roomtype, cnt, typename, checkin, checkout);
		for(int i=0;i<nore.size();i++) {
			reserveDTO dto= nore.get(i);
			JSONObject jo = new JSONObject();
			jo.put("roomnum", dto.getRoomnumber());
			jo.put("roomname", dto.getRoomname());
			jo.put("price", dto.getPrice());
			jo.put("min", dto.getMin());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	//예약완료된 객실 불러오기
	@ResponseBody
	@RequestMapping(value="/reserve",produces = "application/json;charset=utf-8")
	public String doResrvelist(HttpServletRequest req) {
		int roomtype=Integer.parseInt(req.getParameter("roomtype")); 
		int cnt=Integer.parseInt(req.getParameter("cnt"));
		String checkin=req.getParameter("checkin");
		String checkout=req.getParameter("checkout");
		JSONArray ja = new JSONArray();
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		ArrayList<reserveDTO> rdto=reserve.reservelist(roomtype, cnt, checkin, checkout);
		reserveDTO dto=new reserveDTO();
		for(int i=0;i<rdto.size();i++) {
			dto=rdto.get(i);
			JSONObject jo = new JSONObject();
			jo.put("roomname", dto.getRoomname());
			jo.put("roomnum", dto.getRoomnumber());
			jo.put("checkin", dto.getCheckin());
			jo.put("checkout", dto.getCheckout());
			jo.put("name", dto.getName());
			jo.put("renum", dto.getRenum());
			ja.add(jo);
		}
		return ja.toJSONString();
	}
	//예약하기
	@ResponseBody
	@RequestMapping(value="/reserveadd",produces = "application/json;charset=utf-8")
	public String doReserve(HttpServletRequest req) {
		int reroomnum=Integer.parseInt(req.getParameter("reroomnum"));
		int recnt=Integer.parseInt(req.getParameter("recnt"));
		int reprice=Integer.parseInt(req.getParameter("reprice"));
		String name= req.getParameter("name");
		String mobile=req.getParameter("mobile");
		String checkin=req.getParameter("checkin");
		String chekout=req.getParameter("checkout");
		int roomtype=Integer.parseInt(req.getParameter("roomtype"));
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		int reecount=reserve.insertReserve(reroomnum, recnt, reprice, name, mobile, checkin, checkin, roomtype);
		return Integer.toString(reecount);
	}
	//예약 수정하기
	@ResponseBody
	@RequestMapping(value="/uptodate",produces = "application/json;charset=utf-8")
	public String douptodate(HttpServletRequest req) {
		int renum=Integer.parseInt(req.getParameter("renum"));
		String name=req.getParameter("name");
		String mobile=req.getParameter("mobile");
		int min=Integer.parseInt("min");
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		int reecount=reserve.updateReserve(name, mobile, min, renum);
		return Integer.toString(reecount);
	}
	//예약 취소하기
	@ResponseBody
	@RequestMapping(value="/cancel",produces = "application/json;charset=utf-8")
	public String doDeletereserve(@RequestParam("renum") int renum) {
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		int reecount=reserve.deleteReserve(renum);
		return Integer.toString(reecount);
	}
	//예약 내역 클릭시
	@ResponseBody
	@RequestMapping(value="/update",produces = "application/json;charset=utf-8")
	public String doupdate(@RequestParam("renum") int renum) {
		iReserve reserve = sqlSession.getMapper(iReserve.class);
		JSONArray ja = new JSONArray();
		ArrayList<reserveDTO> rdto=reserve.updatelist(renum);
		reserveDTO dto=new reserveDTO();
		for(int i=0; i<rdto.size();i++) {
			dto=rdto.get(i);
			JSONObject jo = new JSONObject();
			jo.put("renum", dto.getRenum());
			jo.put("rerooname", dto.getRoomname());
			jo.put("typename", dto.getTypename());
			jo.put("recnt", dto.getRecnt());
			jo.put("checkin", dto.getCheckin());
			jo.put("checkout", dto.getCheckout());
			jo.put("name", dto.getName());
			jo.put("mobile", dto.getMobile());
			jo.put("price", dto.getReprice());
			ja.add(jo);
		}
		return ja.toJSONString();	
	}
	//객실 관리 삭제
	@ResponseBody
	@RequestMapping(value="/deleteroom",produces = "application/json;charset=utf-8")
	public String deleteroom(@RequestParam("room_id") int room_id) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		int recount=room.deleteroom(room_id);
		return Integer.toString(recount);
	}
	//객실관리 등록
	@ResponseBody
	@RequestMapping(value="/addRoom",produces = "application/json;charset=utf-8")
	public String addroom(@RequestParam("room_name") String room_name,
						  @RequestParam("room_type") int room_type,
						  @RequestParam("min") int min,
						  @RequestParam("price") int price) {
		iRoom room = sqlSession.getMapper(iRoom.class);
		int recount=room.insertroom(room_name, min, price, room_type);
		return Integer.toString(recount);
	}
	//객실 관리 수정
	@ResponseBody
	@RequestMapping(value="/updateRoom",produces = "application/json;charset=utf-8")
	public String updateroom(HttpServletRequest req) {
		int room_id=Integer.parseInt(req.getParameter("room_id"));
		String room_name= req.getParameter("room_name");
		String room_type=req.getParameter("room_type");
		int min=Integer.parseInt(req.getParameter("min"));
		int price=Integer.parseInt(req.getParameter("price"));
		iRoom room = sqlSession.getMapper(iRoom.class);
		int recount = room.updateroom(room_name, room_type, min, price, room_id);
		return Integer.toString(recount);
	}
}

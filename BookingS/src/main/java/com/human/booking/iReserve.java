package com.human.booking;

import java.util.ArrayList;

public interface iReserve {
	ArrayList<reserveDTO> noreservelist(int roomtype, int cnt, String typename, String checkin, String checkout);
	ArrayList<reserveDTO> reservelist(int roomtype, int cnt, String checkin, String checkout);
	int insertReserve(int reroomnum, int recnt, int reprice, String name, String mobile,
			String checkin,	String checkout, int roomtype);
	int updateReserve(String name, String mobile, int min, int renum);
	int deleteReserve(int renum);
	ArrayList<reserveDTO> updatelist(int renum);
}

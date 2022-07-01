package com.human.booking;

import java.util.ArrayList;


public interface iRoom {
	ArrayList<RoomManagementDTO> getRoomList();
	int deleteroom(int room_id);
	int insertroom(String room_name, int min, int price, int room_type);
	int updateroom(String room_name, String room_type, int min, int price,int room_id);
}

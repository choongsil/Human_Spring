package com.human.booking;

public class RoomManagementDTO {
	int roomnumber;
	String roomname;
	int min;
	int price;
	int roomtype;

	public RoomManagementDTO() {
	}

	public int getRoomnumber() {
		return roomnumber;
	}

	public void setRoomnumber(int roomnumber) {
		this.roomnumber = roomnumber;
	}

	public String getRoomname() {
		return roomname;
	}

	public void setRoomname(String roomname) {
		this.roomname = roomname;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRoomtype() {
		return roomtype;
	}

	public void setRoomtype(int roomtype) {
		this.roomtype = roomtype;
	}

}

package com.human.myapp;

import java.util.ArrayList;

public interface iEmployee {
	ArrayList<empDTO> listEmployees();
	Member getMember(int id);
	void addEmployee(String ename, int eid, int mid);
	void removeEmployee(int eid);
}

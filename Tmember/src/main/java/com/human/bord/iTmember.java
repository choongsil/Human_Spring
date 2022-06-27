package com.human.bord;

import java.util.ArrayList;

public interface iTmember {
	ArrayList<tmemberDTO> listTmember();
	void insert(String id, String pwd, String name, String mobile);
}

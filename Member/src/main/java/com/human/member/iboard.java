package com.human.member;

import java.util.ArrayList;

public interface iboard {
	ArrayList<boardDTO> boardList();
	ArrayList<boardDTO> contentslist();
	void addboard(String title, String content, String writer);

}

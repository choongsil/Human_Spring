package com.human.member;

import java.util.ArrayList;

public interface iboard {
	ArrayList<boardDTO> boardList();
	boardDTO contentslist(int seqbbs);
	void addboard(String title, String content, String writer);
	void deleteBoard(int seqbbs);
	void modyBoard(String title, String content, int seqbbs);

}

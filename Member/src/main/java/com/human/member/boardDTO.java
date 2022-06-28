package com.human.member;

public class boardDTO {
	int seqbbs;
	String title;
	String content;
	String writer;
	String created;

	public boardDTO() {
	}

	public int getSeqbbs() {
		return seqbbs;
	}

	public void setSeqbbs(int seqbbs) {
		this.seqbbs = seqbbs;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

}

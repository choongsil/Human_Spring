package com.human.member;

public interface imember {
	memberDTO findmember(String id, String pwd);
	memberDTO selectmember(String id, String pwd);
	memberDTO userinfo(String id);
	void insert(String id, String pwd, String name, String mobile);
}

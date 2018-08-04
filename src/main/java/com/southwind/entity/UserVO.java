package com.southwind.entity;

import java.util.Iterator;
import java.util.List;

public class UserVO {
	private int code;
	private String mess;
	private long count;
	private List<User> data;
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMess() {
		return mess;
	}
	public void setMess(String mess) {
		this.mess = mess;
	}
	public long getCount() {
		return count;
	}
	public void setCount(long count) {
		this.count = count;
	}
	public List<User> getData() {
		return data;
	}
	public void setData(List<User> data) {
		this.data = data;
	}
	
}

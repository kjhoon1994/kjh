package com.test082;

import java.io.Serializable;

public class Member implements Serializable {

	private static final long serialVersionUID = 6101327263329037777L;

	private String name, phone;

	public Member() {
	}

	public Member(String name, String phone) {
		this.name = name;
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", phone=" + phone + "]";
	}
	
}

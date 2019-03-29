package com.test052;

//자료형 클래스
//Object 클래스 자동 상속
public class Member {
	
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

	
	//Object 클래스의 멤버(toString, equals) 오버라이딩 구현
	
	//객체가 가진 멤버(name, phone)의 자료를 가지고 동일한지 비교
	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		Member otherMember = (Member)obj;
		if (this.name.equals(otherMember.getName())
				&& this.phone.equals(otherMember.getPhone())) {
			result = true;
		}
		return result;
	}
	
	//객체가 가진 멤버(name, phone)의 자료 출력
	@Override
	public String toString() {
		return String.format("%s / %s"
				, this.name, this.phone);
	}
	

}

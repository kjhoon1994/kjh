package com.test022;

//사용자 정의 자료형 클래스
public class Member {
	
	//프로퍼티 구성
	//회원번호(M01, ...), 이름, 전화번호, 이메일, ...
	//->유니크한 자료 저장을 할 수 있는 항목 구성 필요
	
	//멤버 변수는 자동 초기화 지원
	//참조형 변수인 경우 null로 초기화
	private String mid;
	private String name, phone, email;
	
	//getter, setter 구성
	//현재 프로퍼티의 상태값 반환
	public String getMid() {
		return this.mid;
	}
	//외부에서 자료를 전달받아서 프로퍼티 설정
	public void setMid(String mid) {
		this.mid = mid;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}

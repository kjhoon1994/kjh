package com.test009;

//개인정보 저장용 클래스 구성
public class Member {
	
	//구성항목 
	//이름,전화번호,이메일,나이
	
	//개인정보를 동적 저장하기 위해서 초기값 지정하지 않는다.
	private String name, phone, email;
	private int age;
	
	//getter
	public String getName() {
		//this 키워드는 내부 멤버 접근 전용 키워드
		//->생략 가능
		return this.name;
	}
	
	//외부에서 객체(instance)에 자료를 동적 저장할 수 있는 전용 메소드
	//setter
	public void setName(String name) {
		//this.name은 내부 멤버변수
		//name은 매개변수(지역변수)
		this.name = name;
	}
	
	
}

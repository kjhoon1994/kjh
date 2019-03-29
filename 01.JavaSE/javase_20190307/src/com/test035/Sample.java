package com.test035;

public class Sample {
	
	//private 생성자
	//객체(instance) 생성 불가
	//내부 멤버 중에서 instance 멤버가 전혀 없는 경우 사용
	//예를 들어, Math 클래스
	
	//객체 생성시 호출 -> 생성자
	//private 생성자 -> 객체 생성 불가 -> instance 멤버 접근 불가
	private Sample() {
		
	}
	
	//instance 멤버
	//객체 생성 후 호출 가능
	public void method1() {
		System.out.println("instance");
	}
	
	//static 멤버
	//메소드 구성시 static 키워드 사용
	//객체 생성 여부와 관계없이 호출 가능
	public static void method2() {
		System.out.println("static");
	}


}

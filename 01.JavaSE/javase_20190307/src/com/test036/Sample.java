package com.test036;

public class Sample {
	
	//instance vs static
	
	//instance 멤버는 객체(instance) 생성 후에 접근 가능한 멤버
	//static 멤버는 객체(instance) 생성과 관계없이 접근 가능한 멤버
	
	//메모리 적재 순서 -> static -> 객체 생성 -> instance -> 객체 소멸 -> static
	
	//instance 멤버끼리 접근 가능
	//static 멤버끼리 접근 가능
	//instance 멤버 -> static 멤버 접근 가능
	
	//static 멤버 -> instance 멤버 접근시 객체 생성 과정 필요
	//main() 메소드는 대표적인 static 멤버
	
	//instance 멤버
	//객체 생성 후 접근 가능
	//특정 객체 전용 메소드
	public void method1() {
		System.out.println("instance");
	}
	
	//static 멤버
	//객체 생성과 관계없이 접근 가능
	//객체들 간에 공유되는 메소드
	public static void method2() {
		System.out.println("static");
	}
	
}

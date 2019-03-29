package com.test009;

public class Main {

	public static void main(String[] args) {
		
		//Member 클래스에 대한 객체(instance) 생성
		Member m1 = new Member();
		
		//자료 저장을 위해서 setter 호출
		m1.setName("hong");
		
		//저장된 자료 확인을 위해서 getter 호출
		System.out.println(m1.getName()); //hong
		
		
		//객체(instance) 생성 추가
		Member m2 = new Member();
		m2.setName("park");
		System.out.println(m2.getName()); //park
		

	}

}

package com.test008;

public class Main {

	public static void main(String[] args) {
		
		//홍길동 정보가 저장된 클래스의 객체(instance) 생성
		Sample s = new Sample();
		
		//private 접근제한자 때문에 접근 제한
		//->getter를 이용한 접근 시도
		//System.out.println(s.name);
		System.out.println(s.getName()); //hong
		System.out.println(s.getPhone()); //010-1234-1234

	}

}

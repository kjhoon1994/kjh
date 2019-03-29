package com.test031;

public class Main {

	public static void main(String[] args) {

		//default 접근제한자 테스트
		
		//객체(instance) 생성 + 생성자 호출(객체 초기화)
		Sample s = new Sample();
		
		//같은 패키지내
		//외부에서 default 접근제한자 접근 테스트
		s.method2();
		
		//같은 패키지내
		//외부에서 public 접근제한자 접근 테스트
		s.method3();
		
	}

}

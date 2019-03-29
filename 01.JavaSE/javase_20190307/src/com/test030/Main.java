package com.test030;

public class Main {

	public static void main(String[] args) {

		//private 접근제한자 테스트
		
		//객체(instance) 생성 + 생성자 호출(객체 초기화)
		Sample s = new Sample();
		
		//외부에서 private 멤버 접근 시도
		//System.out.println(s.a);
		
		//외부에서 public 멤버 접근 시도
		s.method(); //10
		
	}

}

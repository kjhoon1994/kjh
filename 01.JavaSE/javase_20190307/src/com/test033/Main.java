package com.test033;

public class Main {

	public static void main(String[] args) {

		//public 접근제한자 테스트
		
		//객체(instance) 생성 + 생성자 호출(객체 초기화)
		Sample s = new Sample();

		//외부에서 public 접근제한자 접근 테스트
		s.method();
		
	}

}

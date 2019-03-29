package com.test032;

import com.test031.Sample;

public class Main {

	public static void main(String[] args) {

		//default 접근제한자 테스트
		
		//객체(instance) 생성 + 생성자 호출(객체 초기화)
		Sample s = new Sample();
		
		//다른 패키지
		//외부에서 default 접근제한자 접근 테스트
		//s.method2();
		
		//다른 패키지
		//외부에서 public 접근제한자 접근 테스트
		s.method3();
		
	}

}

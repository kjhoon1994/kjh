package com.test058;

public class Main {

	public static void main(String[] args) {
		
		//Sample3를 통한 Sample1의 메소드 호출
		
		//Sample1 객체 준비
		Sample1 s1 = new Sample1();
		Sample2 s2 = new Sample2();
		
		//Sample3 객체에 Sample1 객체 공급
		//Sample1 객체만 공급 가능
		//->강한 결합
		Sample3 s3 = new Sample3(s1);
		s3.method();
		
		//Sample4 객체에 Sample1 객체 공급
		//Sample1 객체 또는 Sample2 객체 공급 가능
		//->인터페이스를 이용한 약한 결합
		Sample4 s4 = new Sample4(s2);
		s4.method();
		
	}

}

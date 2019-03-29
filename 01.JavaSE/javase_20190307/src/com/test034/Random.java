package com.test034;

//import java.util.Random;

public class Random {
	
	//이름 충돌
	//동일한 이름을 가진 식별자가 두 번 나올 수 없다
	//클래스 이름이 동일한 클래스가 존재하는 경우 문제 발생
	//->패키지 구성
	
	//자바에 이미 존재하는 클래스명을 사용자가 클래스명으로 사용시 주의할 것
	public void method() {
		//자바에서 제공하는 java.util.Random 클래스 사용
		java.util.Random r = new java.util.Random();
		System.out.println(r.nextInt(45));
	}

}

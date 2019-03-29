package com.test041;

public class Main {

	public static void main(String[] args) {
		
		//상속 확인
		
		//객체 생성 + 생성자 호출
		//Sub와 Sample 클래스가 상속(IS-A) 관계라면
		//Sub의 생성자만 호출되는 것이 아니라
		//Sample의 생성자도 호출된다
		//결과적으로는 Object의 생성자도 호출된다
		Sub s = new Sub();
		
		
		//Sub 클래스는 private 멤버 a가 없지만
		//getter를 통해서 a를 접근할 수 있다
		System.out.println(s.getA());
		
	}

}

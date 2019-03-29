package com.test002;

public class Main {

	public static void main(String[] args) {
		
		//Printer 클래스에 대한 인스턴스 생성
		//-> new 연산자

		//클래스명 변수 = new 클래스명();
		//인스턴스는 힙 영역에 적재
		//변수는 스택 영역에 적재
		//변수에 힙 영역의 참조주소가 전달된다
		Printer p = new Printer();
		
		//인스턴스 확인
		//패키지명.클래스명@해쉬코드
		System.out.println(p);
		
		//인스턴스의 메소드 호출
		//->메소드 내의 액션 코드 실행
		//->매개변수가 있는 메소드는 적절한 자료 공급 필요
		for (int a = 0; a < 20; ++a) {
			p.print("Hello, World!"); //Hello, World!
		}
		
		//요청 횟수 초과
		p.print("TEST"); //잉크 부족!

	}

}

package com.test014;

public class Main {
	
	//main() 메소드가 있는 클래스에는 다른 메소드를 추가 배치하지 않는다.
	public static void main(String[] args) {
		
		//instance 메소드 호출 테스트
		//->객체(instance) 생성 과정 필요
		//->new 연산자 필요
		Sample s = new Sample();
		
		//매개 변수와 반환값이 모두 없는 경우
		//instance 메소드 호출
		//->.(dot) 연산자 필요
		s.method01(); //Hello, World!
		
		//매개 변수는 있고, 반환값이 없는 경우
		//메소드 호출시 매개 변수에 대응하는 값 전달 필요
		//매개 변수와 대응하는 값은 자료형, 순서, 갯수가 일치해야 한다
		s.method02("TEST"); //TEST
		
		
		//매개 변수는 없고, 반환값이 있는 경우
		//반환값이 존재하는 경우 반환값을 전달 받고, 후처리 필요
		String result1 = s.method3();
		System.out.println(result1); //Hello, World!
		

		//매개 변수와 반환값이 모두 있는 경우
		//메소드 호출시 매개 변수에 대응하는 값 전달 필요
		//매개 변수와 대응하는 값은 자료형, 순서, 갯수가 일치해야 한다
		String result2 = s.method04("TEST");
		System.out.println(result2);
		
	}

}

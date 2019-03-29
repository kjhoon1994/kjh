package com.test014;

public class Sample {
	
	//메소드
	//- 프로그램의 분할된 영역
	//- 액션 단위마다 메소드 구성
	//- 매개 변수는 외부에서 공급하는 자료를 받는 수단
	//- 반환값은 메소드 액션 수행 후 돌려 주는 값
	//- 매개 변수와 반환값이 모두 없는 경우
	//- 매개 변수는 있고, 반환값이 없는 경우
	//- 매개 변수는 없고, 반환값이 있는 경우
	//- 매개 변수와 반환값이 모두 있는 경우
	//- 형식)
	/*
	접근제한자 반환자료형 메소드명(매개변수 리스트) {
		//액션 코드
		return 반환값;
	}
	*/
	//- 메소드 선언 후 호출 과정을 통해서 실행한다
	//- instance, static 메소드
	
	//매개 변수와 반환값이 모두 없는 경우
	//메소드 선언시 () 안에 매개변수 리스트가 없는 상태
	//반환자료형 선언시 void 키워드 사용
	//명시적으로 return 구문 생략
	public void method01() {
		System.out.println("Hello, World!");
	}
	

	//매개 변수는 있고, 반환값이 없는 경우
	//메소드 선언시 () 안에 매개변수 리스트가 있는 상태
	//매개변수 리스트는 자료형 변수명, 자료형 변수명, ... 형태로 작성한다.
	//반환자료형 선언시 void 키워드 사용
	//명시적으로 return 구문 생략
	public void method02(String msg) {
		System.out.println(msg);
	}
	
	
	//매개 변수는 없고, 반환값이 있는 경우
	//메소드 선언시 () 안에 매개변수 리스트가 없는 상태
	//명시적인 반환자료형 선언 필요
	//반환값과 반환자료형은 일치해야 한다
	//명시적으로 return 구문 필요
	public String method3() {
		return "Hello, World!";
	}
	
	
	//매개 변수와 반환값이 모두 있는 경우
	//메소드 선언시 () 안에 매개변수 리스트가 있는 상태
	//명시적인 반환자료형 선언 필요
	//반환값과 반환자료형은 일치해야 한다
	//명시적으로 return 구문 필요
	public String method04(String msg) {
		return String.format("message:%s", msg);
	}
	
	//반환값 없는 return 구문 사용
	public void method05() {
		for (int a = 0; a <= 100; ++a) {
			System.out.println("Hello, World!");
			//메소드 실행 중단 및 반환
			if (a == 10) return;
		}
		//추가 액션 코드 존재
	}
	
	
}

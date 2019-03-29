package com.test021;

public class Sample {
	
	//값 변수, 참조 변수
	//by Value, by reference
	//- 외부에서 매개변수에 값 전달하는 방식 두 가지
	

	//by value
	//- 외부에서 매개변수에 값 전달시 값 자체(stack)를 전달
	//- 매개변수 자료형이 기본형(int, double, char, ...)
	//- 메소드 내부에서 진행된 액션의 결과를 외부에서 알 수 없다
	//- 액션의 결과를 외부에서 알 수 없기 때문에 결과 반환 과정이 필요하다
	public int method(int a, int b) {
		return a + b;
	}
	
	//by reference
	//- 외부에서 매개변수에 값(heap) 전달시 참조주소(stack)를 전달
	//- 매개변수 자료형이 참조형(배열, 클래스, ...)
	//- 메소드 내부에서 진행된 액션의 결과를 외부에서 알 수 있다
	//- 액션의 결과를 외부에서 알 수 있기 때문에 결과 반환 과정이 필요없다
	//- 예를 들어, java.util.Arrays.sort() 메소드 
	public void method(int[] a) {
		int len = a.length;
		int sum = 0;
		for (int b = 0; b < len; ++b) {
			sum += a[b];
		}
		a[len-1] = sum;
	}
}

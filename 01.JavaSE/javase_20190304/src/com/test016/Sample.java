package com.test016;

public class Sample {
	
	//매개 변수와 반환값이 모두 있는 경우
	
	//더하기 메소드
	//매개 변수가 정수형 2개, 반환값 정수형
	public int add(int x, int y) {
		return x + y;
	}
	
	//빼기 메소드
	//매개 변수가 정수형 2개, 반환값 정수형
	public int sub(int x, int y) {
		return x - y;
	}
	
	//곱하기 메소드
	//매개 변수가 정수형 2개, 반환값 정수형
	public int mul(int x, int y) {
		return x * y;
	}
	
	//나누기(실수 연산) 메소드
	//매개 변수가 정수형 2개, 반환값 실수형
	public double div(int x, int y) {
		return x / (double)y;
	}
	

}

package com.test016;

public class Main {

	public static void main(String[] args) {
		
		//문제) 정수 숫자 2개를 전달하고,
		//산술적 연산 수행 후, 결과 반환하는 메소드
		//더하기, 빼기, 곱하기, 나누기(실수 연산)
		Sample s = new Sample();
		
		System.out.println(s.add(20, 7));
		System.out.println(s.sub(20, 7));
		System.out.println(s.mul(20, 7));
		System.out.println(s.div(20, 7));

	}

}

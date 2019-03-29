package com.test018;

public class Main {

	public static void main(String[] args) {
		
		//문제) 십진수 숫자를 전달하면, 16진수 문자열을 반환하는 메소드
		//출력예)
		//1 -> 1
		//2 -> 2
		//3 -> 3
		//...
		//10 -> A
		
		Sample s = new Sample();
		System.out.println(s.hex(10)); //A
		System.out.println(s.hex(15)); //F
		System.out.println(s.hex(255)); //FF

	}

}

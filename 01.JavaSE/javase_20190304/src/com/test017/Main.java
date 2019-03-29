package com.test017;

public class Main {

	public static void main(String[] args) {
		
		//문제) 십진수 숫자를 전달하면, 2진수 문자열을 반환하는 메소드
		//출력예)
		//1 -> 1
		//2 -> 10
		//3 -> 11
		//...
		//10 -> 1010
		
		Sample s = new Sample();
		System.out.println(s.bin(10)); //1010
		System.out.println(s.bin(15)); //1111

	}

}

/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program023 {

	public static void main(String[] args) {
		
		//문제) 실수 연산
		//실수 연산시 정밀도 제한 때문에 소수 이하 결과가 올바르지 못할 수 있다.
		//->정수화 시켜서 연산 필요
		
		//입력 과정
		//변수 선언 및 초기값 할당
		double a = 0.1, b, c, d;
		
		//실수 연산 처리시 올바르지 못한 방법
		b = a * 1;
		c = a * 2;
		d = a * 3;
		
		//실수 연산 처리시 올바른 방법
		//b = (a * 10 * 1) / 10;
		//c = (a * 10 * 2) / 10;
		//d = (a * 10 * 3) / 10;
		
		//출력 과정
		System.out.println(a); //??
		System.out.println(b); //??
		System.out.println(c); //??
		System.out.println(d); //??
		
		
	}

}

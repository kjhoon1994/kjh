/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program017 {

	public static void main(String[] args) {
		
		//연산자
		//메모리에 저장된 자료에 대한 계산 과정에 필요한 기호
		//1. Arithmetic Operators
		//2. Relational Operators
		//3. Bitwise Operators
		//4. Logical Operators
		//5. Assignment Operators
		//6. Misc Operators
		
		//Arithmetic Operators
		//산술적 연산 수행에 필요한 연산자
		//+, -, *, /, %, ++, --
		
		//변수 선언
		int a, b, c, d, e;
		double f;
		int g, h, i;
		
		//10이라는 값을 변수 a에 할당
		a = 10;
		
		//산술 연산의 결과값을 변수 a에 할당(덮어쓰기)
		b = a + 5;
		c = a - 5;
		d = a * 5;
		e = a / 3;  //정수 나눗셈(몫)
		f = a / 3.0; //실수 나눗셈(일반적인 나누기 연산)
		g = a % 5; //나머지
		h = ++a;
		i = --a;
		
		//연산의 결과값을 예상해본다.
		System.out.println(b);
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);
		System.out.println(f);
		System.out.println(g);
		System.out.println(h);
		System.out.println(i);

	}

}

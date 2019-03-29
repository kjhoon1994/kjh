/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program019 {

	public static void main(String[] args) {

		// 연산자
		// 메모리에 저장된 자료에 대한 계산 과정에 필요한 기호
		// 1. Arithmetic Operators
		// 2. Relational Operators
		// 3. Bitwise Operators
		// 4. Logical Operators
		// 5. Assignment Operators
		// 6. Misc Operators

		// Logical Operators
		// 논리 연산 수행에 필요한 연산자
		// &&(논리곱), ||(논리합), !(논리부정)
		// 논리 연산의 결과값은 true 또는 false

		// 변수 선언
		boolean a, b;
		boolean c, d, e;

		// 변수 a에 true 할당, 변수 b에 false 할당
		a = true;
		b = false;

		c = a && b;
		d = a || b;
		e = !a;

		// 연산의 결과값을 예상해본다.
		System.out.println(c);
		System.out.println(d);
		System.out.println(e);

	}

}

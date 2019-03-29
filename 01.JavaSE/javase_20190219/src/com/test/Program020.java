/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program020 {

	public static void main(String[] args) {

		// 연산자
		// 메모리에 저장된 자료에 대한 계산 과정에 필요한 기호
		// 1. Arithmetic Operators
		// 2. Relational Operators
		// 3. Bitwise Operators
		// 4. Logical Operators
		// 5. Assignment Operators
		// 6. Misc Operators

		// Misc Operators(Conditional Operator)
		// (조건식)?결과1:결과2
		// 조건식의 결과가 true이면 결과1 반환
		// 조건식의 결과가 false이면 결과2 반환
		// 조건식은 비교, 논리 연산을 이용한 수식

		// 변수 선언
		int a, b, c;

		// 변수 a에 20 할당, 변수 b에 10 할당
		a = 10;
		b = 20;

		//변수 a, b에 들어있는 값 중에서 큰 값이 변수 c에 저장
		c = (a > b) ? a : b;

		// 연산의 결과값을 예상해본다.
		System.out.println(c);

	}

}

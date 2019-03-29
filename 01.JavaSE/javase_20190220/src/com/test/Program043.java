/* 
 * 프로그램명: 제어구조-for문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program043 {

	public static void main(String[] args) {
		
		//반복문 : 유사한 문장을 반복 실행할 때 사용
		/*
		for(initialization; Boolean_expression; update) {
		   // Statements
		}
		*/
		
		//문제) 구구단 중에서 5단 출력
		//출력예)
		/*
		구구단:5
		5 * 1 = 5
		5 * 2 = 10
		5 * 3 = 15
		5 * 4 = 20
		5 * 5 = 25
		5 * 6 = 30
		5 * 7 = 35
		5 * 8 = 40
		5 * 9 = 45
		*/

		int a = 5;
		
		System.out.printf("구구단:%d%n", a);
		
		//1, 2, 3, ... , 9
		for (int b = 1; b < 10; ++b) {
			System.out.printf("%d * %d = %d%n", a, b, (a * b));
		}
			
	}
}

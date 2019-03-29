/* 
 * 프로그램명: 제어구조-for문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program042 {

	public static void main(String[] args) {
		
		//반복문 : 유사한 문장을 반복 실행할 때 사용
		/*
		for(initialization; Boolean_expression; update) {
		   // Statements
		}
		*/
		
		//1부터 10까지의 수 출력
		for (int a = 1; a <= 10; ++a) {
			//1, 2, 3, ..., 10
			System.out.println(a);
		}
		
		//0부터 9까지의 수 출력
		for (int a = 0; a <= 9; ++a) {
			//0, 1, 2, 3, ..., 9
			System.out.println(a);
		}
		
		//0부터 9까지의 수 출력
		for (int a = 0; a < 10; ++a) {
			//0, 1, 2, 3, ..., 9
			System.out.println(a);
		}
		
		//n부터 m까지의 수 출력
		for (int a = 0; a < 10; ) {
			System.out.println(a);
			++a;
		}
		
		//n부터 m까지의 수 출력
		int a = 0;
		for ( ; a < 10; ) {
			System.out.println(a);
			++a;
		}
		
		
		//n부터 m까지의 수 출력
		//->0회
		int b = 0;
		for ( ; b > 10; ) {
			System.out.println(b);
			++b;
		}
		
		//n부터 m까지의 수 출력
		//->무한실행
		int c = 0;
		for ( ; ; ) {
			System.out.println(c);
			++c;
		}

				
	}
}

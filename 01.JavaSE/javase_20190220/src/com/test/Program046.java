/* 
 * 프로그램명: 제어구조-for문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program046 {

	public static void main(String[] args) {
		
		//반복문 : 유사한 문장을 반복 실행할 때 사용
		
		//문제) 1부터 100까지의 수 중에서 3의 배수만 출력하고, 배수들의 합을 같이 출력.
		//출력예)
		/*
		배수: 3
		3 + 6 + 9 + 12 + .... 99 = ????
		*/

		int a = 3;
		int sum = 0;
		
		for (int b = 1; b <= 100; ++b) {
			if (b % a == 0) {
				sum += b;
				System.out.printf("%d ", b);
				if (b <= 100 - a) {
					System.out.printf("+ ");
				}
			}
		}
		System.out.printf("= %d%n", sum);
			
	}
}

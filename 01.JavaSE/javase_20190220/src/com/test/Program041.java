/* 
 * 프로그램명: 제어구조-for문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program041 {

	public static void main(String[] args) {
		
		//반복문 : 유사한 문장을 반복 실행할 때 사용
		/*
		for(initialization; Boolean_expression; update) {
		   // Statements
		}
		*/
		//주의) 반복 횟수가 일정한 경우 사용
		
		//예를 들어, 1부터 100까지의 수를 순차적으로 연산, 출력
		for (int a = 1; a <= 100; ++a) {
			//100번 반복 예정
			//1, 2, 3, ..., 100
			System.out.println(a);
		}
		
	}
}

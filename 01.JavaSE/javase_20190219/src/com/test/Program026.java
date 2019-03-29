/*
 * 프로그램명: 출력 액션
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program026 {

	public static void main(String[] args) {
		
		//문자열 출력 액션 메소드
		//print() - 자료 한 개를 단순 출력. 줄바꿈 미포함.
		//println() - 자료 한 개를 단순 출력. 줄바꿈 포함.
		//printf() - 자료 여러개를 복합 출력. 출력 서식 지정.
		
		
		//printf() - 자료 여러개를 복합 출력. 출력 서식 지정.
		//출력 서식 예
		//%d - 정수 출력시 사용
		//%f - 실수 출력시 사용
		//%c - 문자 출력시 사용
		//%s - 문자열(기타 자료) 출력시 사용
		//%X - 16진수 출력시 사용
		//%n - 줄바꿈 문자 출력시 사용
		
		
		int a = 10, b = 20;
		
		System.out.printf("%d%n", a);	
		System.out.printf("%d%n", b);
		
		//두 개 이상의 자료 동시 출력 가능
		System.out.printf("%d, %d%n", a, b);
		

	}

}

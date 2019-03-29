/*
 * 프로그램명: 출력 액션
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program025 {

	public static void main(String[] args) {
		
		//문자열 출력 액션 메소드
		//print() - 자료 한 개를 단순 출력. 줄바꿈 미포함.
		//println() - 자료 한 개를 단순 출력. 줄바꿈 포함.
		//printf() - 자료 여러개를 복합 출력. 출력 서식 지정.
		
		
		//println() - 자료 한 개를 단순 출력. 줄바꿈 포함.
		
		int a = 10, b = 20;
		
		System.out.println(a);	
		System.out.println(b);
		
		//두 개 이상의 자료 동시 출력 불가
		//System.out.println(a, b);
		
		//두 개 이상의 자료를 하나의 자료로 통합하면 가능.
		System.out.println(a + b);  //30
		System.out.println(a + ", " + b);  //10, 20


	}

}

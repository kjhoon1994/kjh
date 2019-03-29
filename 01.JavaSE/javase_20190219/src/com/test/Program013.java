/*
 * 프로그램명: 자료형 - 변수
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program013 {
	
	public static void main(String[] args) {
		
		//변수
		//메모리에 자료를 저장할 수 있는 임시 공간에 대한 별칭
		//특정 자료형을 지정해서 변수 선언
		//1. Local variables
		//2. Instance variables -> 자동 초기화 지원
		//3. Class/Static variables -> 자동 초기화 지원
		

		//1. Local variables
		//특정 영역(변수가 선언된 블럭 내)에서만 활동할 수 있는 변수
		//특정 영역은 메소드 블럭, if 블럭, for 블럭 등으로 제한된다.
		//사용 전에 초기화 필요
		
		//메소드 내에서 선언된 경우
		int a = 10;
		
		//변수 a의 값을 화면에 출력한다.
		System.out.println(a);
		
		//초기값이 없는 변수 사용시 오류 발생
		//int b;
		//System.out.println(b);
		
				
	}

}
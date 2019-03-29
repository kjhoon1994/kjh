/* 
 * 프로그램명: 제어구조-switch문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program038 {

	public static void main(String[] args) {
		
		//expression의 값이 value와 일치하는 경우 특정 case 안에 있는 실행문 실행 가능
		//모든 case 구문의 value와 일치하지 않으면 default 구문 실행
		//case 구문 안에 적절한 break; 구문 필요
		/*
		switch(expression) {
		   case value :
		      // Statements
		      break; // optional
		   
		   case value :
		      // Statements
		      break; // optional
		   
		   // You can have any number of case statements.
		   default : // Optional
		      // Statements
		}
		*/
		//주의) case 구문은 코드 블럭({})이 없기 때문에 문장을 여러개 배치하지 않는다.
		
		// 입력 단계
		int num = 9;
		
		//참조(String) 자료형 변수의 기본 초기값 null
		String result = null;
		
		// 처리 단계
		switch (num % 3) {
		case 0:
			result = "3의 배수입니다";
			break;
		default:
			result = "3의 배수가 아닙니다";
		}
		
		// 출력 단계
		System.out.printf("숫자 : %d%n", num);
		System.out.printf("결과 : %s%n", result);		

		
	}

}

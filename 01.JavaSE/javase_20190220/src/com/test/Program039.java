/* 
 * 프로그램명: 제어구조-switch문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program039 {

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

		
		//예를 들어,
		//특정 조건1(점수가 90점 이상) 만족시 'A' 메시지 출력
		//특정 조건2(점수가 80점 이상) 만족시 'B' 메시지 출력
		//특정 조건3(점수가 70점 이상) 만족시 'C' 메시지 출력
		//특정 조건4(점수가 60점 이상) 만족시 'D' 메시지 출력
		//특정 조건5(점수가 60점 미만) 만족시 'F' 메시지 출력

		// 입력 단계
		int num = 95;
		
		//참조(String) 자료형 변수의 기본 초기값 null
		String result = null;
		
		// 처리 단계
		switch (num / 10) {
		case 10:
		case 9:
			result = "A등급";
			break;
		case 8:
			result = "B등급";
			break;
		case 7:
			result = "C등급";
			break;
		case 6:
			result = "D등급";
			break;
		default:
			result = "F등급";
		}
		
		
		// 출력 단계
		System.out.printf("점수 : %d%n", num);
		System.out.printf("결과 : %s%n", result);		

		
	}

}

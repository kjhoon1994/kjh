/* 
 * 프로그램명: 제어구조-if~else문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program034 {

	public static void main(String[] args) {
		
		//조건식의 결과가 true인 경우 if블럭({}) 안에 있는 실행문 실행 가능
		//조건식의 결과가 false인 경우 else블럭({}) 안에 있는 실행문 실행 가능
		//조건식 - 비교, 논리 연산자를 이용한 수식
		/*
		if(Boolean_expression) {
		   // Executes when the Boolean expression is true
		} else {
		   // Executes when the Boolean expression is false
		} 
		*/
		//주의) if~else 구문은 삼항연산자로 대체 가능
		
		//특정 숫자가 3의 배수인지, 아닌지를 판별해서 두 가지 메시지 출력
		//출력예)
		//숫자: 9
		//결과: 3의 배수입니다		
	
		// 입력 단계
		int num = 9;
		
		//참조(String) 자료형 변수의 기본 초기값 null
		String result = null;

		// 처리 단계
		if (num % 3 == 0) {
			result = "3의 배수입니다";
		} else {
			result = "3의 배수가 아닙니다";
		}

		// 출력 단계
		System.out.printf("숫자 : %d%n", num);
		System.out.printf("결과 : %s%n", result);		
		
	}

}

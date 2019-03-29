/* 
 * 프로그램명: 제어구조-if문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program033 {

	public static void main(String[] args) {
		
		//조건식의 결과가 true인 경우만 중괄호({}) 안에 있는 실행문 실행 가능
		//조건식 - 비교, 논리 연산자를 이용한 수식
		/*
		if(Boolean_expression) {
		   // Statements will execute if the Boolean expression is true
		} 
		*/
		
		
		//문제) 특정 숫자가 3의 배수인지, 아닌지를 판별해서 메시지 출력
		//출력예)
		//숫자: 9
		//결과: 3의 배수입니다		
	
		// 입력 단계
		int num = 9;
		String result = "3의 배수가 아닙니다";

		// 처리 단계
		if (num % 3 == 0) {
			result = "3의 배수입니다";
		}

		// 출력 단계
		System.out.printf("숫자 : %d%n", num);
		System.out.printf("결과 : %s%n", result);		
		
	}

}

/* 
 * 프로그램명: 제어구조-if문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program031 {

	public static void main(String[] args) {
		
		//조건식의 결과가 true인 경우만 중괄호({}) 안에 있는 실행문 실행 가능
		//조건식 - 비교, 논리 연산자를 이용한 수식
		/*
		if(Boolean_expression) {
		   // Statements will execute if the Boolean expression is true
		} 
		*/
		//예를 들어, 특정 조건(값이 20 미만) 만족시 메시지 출력
		
		int x = 20;
		//빈 문자열("")로 초기화
		String b = "";

		if (x < 20) {
			b = "This is if statement";
		}
		
		System.out.println(b);
		
	}

}

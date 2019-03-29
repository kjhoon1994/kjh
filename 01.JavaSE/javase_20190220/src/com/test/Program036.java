/* 
 * 프로그램명: 제어구조-if~else if~else문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program036 {

	public static void main(String[] args) {
		
		//첫 번째 조건식의 결과가 true인 경우 if블럭({}) 안에 있는 실행문 실행 가능
		//첫 번째 조건식의 결과가 false인 경우 else if블럭({})의 조건식 검사
		//else if 블럭의 조건식 결과가 true인지, false인지에 따라서 특정 실행문 실행 가능
		//조건식 - 비교, 논리 연산자를 이용한 수식
		/*
		if(Boolean_expression 1) {
		   // Executes when the Boolean expression 1 is true
		} else if(Boolean_expression 2) {
		   // Executes when the Boolean expression 2 is true
		} else if(Boolean_expression 3) {
		   // Executes when the Boolean expression 3 is true
		} else {
		   // Executes when the none of the above condition is true.
		} 
		*/
		//예를 들어, 
		//특정 조건1(점수가 90점 이상) 만족시 'A' 메시지 출력
		//특정 조건2(점수가 80점 이상) 만족시 'B' 메시지 출력
		//특정 조건3(점수가 70점 이상) 만족시 'C' 메시지 출력
		//특정 조건4(점수가 60점 이상) 만족시 'D' 메시지 출력
		//특정 조건5(점수가 60점 미만) 만족시 'F' 메시지 출력
		
		int a = 50;
		String b = null;
		
		if (a >= 90) {
			b = "A등급";
		} else if (a >= 80) {
			b = "B등급";
		} else if (a >= 70) {
			b = "C등급";
		} else if (a >= 60) {
			b = "D등급";
		} else {
			b = "F등급";
		}
		
		// 출력 단계
		System.out.printf("점수 : %d%n", a);
		System.out.printf("결과 : %s%n", b);		
		
	}

}

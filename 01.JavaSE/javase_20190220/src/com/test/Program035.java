/* 
 * 프로그램명: 제어구조-if~else문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program035 {

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
		
		//문제) 코드분석 및 예상 결과
		
		int x = 30;

		if (x < 20) {
			System.out.print("This is if statement");
		} else {
			System.out.print("This is else statement");
		}
		
	}

}

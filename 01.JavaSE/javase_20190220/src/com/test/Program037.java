/* 
 * 프로그램명: 제어구조-if~else if~else문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program037 {

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
		
		//문제) 생년월일의 가지고 년도를 가지고, 특정 년도 메시지 출력
		//1980년대생, 1990년대생, 2000년대생, 2010년대생
		//출력예)
		//생년월일(년도): 1992
		//메시지 : 1990년대생
		
		int a = 2017;
		String b = null;
		
		if (a >= 2010) {
			b = "2010년대생";
		} else if (a >= 2000) {
			b = "2000년대생";
		} else if (a >= 1990) {
			b = "1990년대생";
		} else if (a >= 1980) {
			b = "1980년대생";
		} else {
			b = "기타";
		}
		
		// 출력 단계
		System.out.printf("생년월일(년도): %d%n", a);
		System.out.printf("결과 : %s%n", b);		
		
	}

}

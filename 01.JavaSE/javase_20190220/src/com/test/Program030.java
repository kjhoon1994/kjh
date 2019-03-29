/* 
 * 프로그램명: 제어구조-if문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program030 {

	public static void main(String[] args) {
		
		//조건식의 결과가 true인 경우만 중괄호({}) 안에 있는 실행문 실행 가능
		//조건식 - 비교, 논리 연산자를 이용한 수식
		/*
		if(Boolean_expression) {
		   // Statements will execute if the Boolean expression is true
		} 
		*/
		//예를 들어, 특정 조건(점수가 60점 이상) 만족시 '합격' 메시지 출력
		
		//점수 저장용 int 자료형 변수
		int a = 50;
		
		//문자열 저장용 String 자료형 변수
		//문자열은 쌍따옴표(")로 구성된 여러개의 문자 집합
		String b = "불합격";
		
		//변수 a에 들어있는 값이 60 이상인지 확인
		if (a >= 60) {
			//기존 메시지 덮어쓰기
			b = "합격";
		}
		
		//결과 출력
		System.out.printf("점수:%d%n", a);
		System.out.printf("결과:%s%n", b);
		
		
	}

}

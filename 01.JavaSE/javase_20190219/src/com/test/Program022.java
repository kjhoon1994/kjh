/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program022 {

	public static void main(String[] args) {
		
		//문제) 가장 큰 값과 가장 작은 값 연산
		//변수 a, b, c에 임의의 값(양의 정수) 저장
		
		//입력 과정
		//변수 선언 및 초기값 할당
		int a = 20, b = 30, c = 10;
		int max = 0, min = 0;
		
		
		//처리 과정
		//변수 a, b, c의 값을 비교 연산
		//->가장 큰 값은 max 변수에 저장
		//->가장 작은 값은 min 변수에 저장
		max = (a > b) ? a : b;
		max = (max > c) ? max : c;

		min = (a < b) ? a : b;
		min = (min < c) ? min : c;
		

		//출력 과정
		System.out.println(a); //??
		System.out.println(b); //??
		System.out.println(c); //??
		System.out.println(max); //??
		System.out.println(min); //??
	}

}

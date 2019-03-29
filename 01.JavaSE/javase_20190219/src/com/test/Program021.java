/*
 * 프로그램명: 연산자
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program021 {

	public static void main(String[] args) {
		
		//문제) 몫과 나머지 연산
		//거스름돈 계산 과정을 코드로 작성
		//예를 들어, 임시변수에 1670원이 있다고 가정
		//500원, 100원, 50원, 10원으로 구분해서 출력

		//입력 과정
		//변수 선언 및 초기값 할당
		int a = 1670;
		int m500 = 0, m100 = 0 , m50 = 0, m10 = 0;
		
		//처리 과정
		//-> 500원 갯수 연산 후 m500 변수에 저장
		//-> 100원 갯수 연산 후 m100 변수에 저장
		//-> 50원 갯수 연산 후 m50 변수에 저장
		//-> 10원 갯수 연산 후 m10 변수에 저장
		m500 = a / 500;
		m100 = (a % 500) / 100;
		m50 = (a % 500 % 100) / 50;
		m10 = (a % 500 % 100 % 50) / 10;
		

		//출력 과정
		System.out.println(a);  //1670
		System.out.println(m500); //3
		System.out.println(m100); //1
		System.out.println(m50); //1
		System.out.println(m10); //2
	}

}

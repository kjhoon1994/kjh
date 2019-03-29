/* 
 * 프로그램명: 제어구조-switch문
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program040 {

	public static void main(String[] args) {
			
		// 문제)switch~case 구문만 이용합니다.
		// 생년월일의 년도를 가지고, 특정 년도 메시지 출력
		// 1980년대생, 1990년대생, 2000년대생, 2010년대생
		// 출력예)
		// 생년월일(년도): 1992
		// 메시지 : 1990년대생
		
		int a = 2017;
		String b = null;
		
		switch (a / 10) {
		case 201:
			b = "2010년대생";
			break;
		case 200:
			b = "2000년대생";
			break;
		case 199:
			b = "1990년대생";
			break;
		case 198:
			b = "1980년대생";
			break;
		default:
			b = "기타";
			break;
		}
		
		// 출력 단계
		System.out.printf("생년월일(년도): %d%n", a);
		System.out.printf("결과 : %s%n", b);	

	}

}

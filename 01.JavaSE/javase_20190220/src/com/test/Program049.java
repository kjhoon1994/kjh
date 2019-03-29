/* 
 * 프로그램명: 난수 발생
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program049 {

	public static void main(String[] args) throws InterruptedException {
		
		//난수 발생
		//Math 클래스의 random() 메소드를 이용하면 난수 발생 가능
		//난수 기본 범위 0 이상,  1 미만의 실수. 0.0부터 0.999999 까지만 발생한다.
		
		//문제) 랜덤한 길이(범위 1~50)의 랜덤한 문자(범위 a~z) 출력.
		/*
		출력예)
		출력 횟수:5
		adsfdsf
		erqwe
		cvzcvcbcxbcvb
		erqggfbsfdhgadgferwaefzxcdvdtweafzdvadf
		asfasdfdwq3rewfesafas
		*/
		
		int count = 5;
		System.out.printf("출력 횟수:%d%n", count);
		for (int a = 0; a < count; ++a) {
			int b = (int)(Math.random() * 50) + 1;
			int c = 0;
			while (c < b) {
				int d = (int)(Math.random() * 26) + 97;
				System.out.printf("%c", d);
				++c;
			}
			System.out.println();
		}
			
	}
}

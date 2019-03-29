/* 
 * 프로그램명: 난수 발생
 * 작성자 : 이민종
 * 작성일 : 20190220
 * 
 */

package com.test;

public class Program047 {

	public static void main(String[] args) {
		
		//난수 발생
		//Math 클래스의 random() 메소드를 이용하면 난수 발생 가능
		//난수 기본 범위 0 이상,  1 미만의 실수. 0.0부터 0.999999 까지만 발생한다.
		
		double a;
		
		a = Math.random();
		
		//기본 난수 범위
		System.out.println(a);
		
		//특정 범위 난수(주사위 1~6)
		//System.out.println(a * 6); //0.0 ~ 5.9
		//System.out.println((int)(a * 6)); //0 ~ 5
		//System.out.println((int)(a * 6) + 1); //1 ~ 6
		
		int b1 = (int)(Math.random() * 6) + 1;
		int b2 = (int)(Math.random() * 6) + 1;
		System.out.printf("(%d, %d)%n", b1, b2);
		
		
	}
}

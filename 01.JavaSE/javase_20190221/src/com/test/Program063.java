/* 
 * 프로그램명: 중첩 반복문
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program063 {

	public static void main(String[] args) {
		
		//문제) 숫자 피라미드 출력
		//출력예)
		/*
		
		 9 8 7 6 5 4 3 2 1 0
		 8 7 6 5 4 3 2 1 0
		 7 6 5 4 3 2 1 0
		 6 5 4 3 2 1 0
		 5 4 3 2 1 0
		 4 3 2 1 0
		 3 2 1 0
		 2 1 0
		 1 0
		 0 
		
		*/
		
		for (int a = 9; a >= 0; --a) {
			for (int b = a; b >= 0; --b) {
				System.out.printf(" %d", b);
			}
			System.out.println();
		}
		

	}

}

/* 
 * 프로그램명: 중첩 반복문
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program060 {

	public static void main(String[] args) {
		//숫자 피라미드 출력
		//출력예)
		/*
		
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		 0 1 2 3 4 5 6 7 8 9
		
		*/
		
		for (int a = 0; a < 10; ++a) {
			for (int b = 0; b < 10; ++b) {
				System.out.printf(" %d", b);
			}
			System.out.println();
		}
		

	}

}

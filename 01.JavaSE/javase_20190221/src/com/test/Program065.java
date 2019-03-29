/* 
 * 프로그램명: 중첩 반복문
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program065 {

	public static void main(String[] args) {
		
		//도전) 별 문자 출력
		//출력예)
		/*
		
		 *
		   *
		     *
		       *
		         *
		           *
		             *
		               *
		                 *
		               *
		             *
		           *
		         *
		       *
		     *
		   *
		 *
		
		*/
		
		int length = 10;

		for (int i = 1; i < length * 2; ++i) {
			for (int j = 1; j <= length; ++j) {
				if (i == j || i + j == length * 2) {
					System.out.printf("*");
				} else {
					System.out.printf("  ");
				}
			}
			System.out.println();
		}
		
	}

}

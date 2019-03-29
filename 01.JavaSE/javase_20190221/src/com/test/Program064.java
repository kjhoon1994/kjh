/* 
 * 프로그램명: 중첩 반복문
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program064 {

	public static void main(String[] args) {
		
		//문제) 별 문자 출력
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
		
		*/
		
		for (int a = 0; a < 10; ++a) {
			for (int b = 0; b < 10; ++b) {
				if (a == b) {
					System.out.printf(" *");
				} else {
					System.out.printf("  ");
				}
			}
			System.out.println();
		}
		

	}

}

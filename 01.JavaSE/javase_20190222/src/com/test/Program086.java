/* 
 * 프로그램명: 2차원 배열
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program086 {

	public static void main(String[] args) {
		
		//문제)
		//행과 열의 크기가 동일한 배열
		//예를 들어, 3x3, 4x4, 5x5, ...
		//2차원 배열 초기화
		//출력예)
		/*
		 1  2  3  4  5 
		10  9  8  7  6 
		11 12 13 14 15 
		20 19 18 17 16 
		21 22 23 24 25 
		*/
		
		
		//2차원 배열 선언
		int[][] arr = new int[5][5];
		
		
		//2차원 배열 자료 채우기
		//-> 특정 범위의 숫자(1~25)를 순서대로 채우기
		int temp = 0;
		//행 접근용 반복문
		int len = arr.length;
		for (int a = 0; a < len; ++a) {
			//열 접근용 반복문
			int len_ = arr[a].length;
			for (int b = 0; b < len_; ++b) {
				if (a % 2 == 0) {
					arr[a][b] = ++temp;
				} else {
					arr[a][len_ - 1 - b] = ++temp;
				}
			}
		}
		
		
		//2차원 배열 요소 전체 출력
		//행 접근용 반복문
		for (int a = 0; a < arr.length; ++a) {
			//열 접근용 반복문
			for (int b = 0; b < arr[a].length; ++b) {
				System.out.printf("%2d ", arr[a][b]);
			}
			System.out.println();
		}
 		
		
	}

}

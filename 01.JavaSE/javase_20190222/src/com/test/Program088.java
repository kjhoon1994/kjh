/* 
 * 프로그램명: 2차원 배열
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program088 {

	public static void main(String[] args) {
		
		//행과 열의 크기가 동일한 배열
		//예를 들어, 3x3, 4x4, 5x5, ...
		//2차원 배열 초기화
		//출력예)
		/*
		 1  2  3  4  5 
		16 17 18 19  6 
		15 24 25 20  7
		14 23 22 21  8
		13 12 11 10  9 
		*/
		
		
		//2차원 배열 선언
		int[][] arr = new int[5][5];
		int len = arr.length;

		//초기화 액션
		int y = -1;
		int x = 0;
		int d = 1;
		int cnt = 0;

		while (len >= 0) {
			for (int i = 0; i < len; i++) {
				y = y + d;
				arr[x][y] = ++cnt;
			}
			--len;
			for (int i = 0; i < len; i++) {
				x = x + d;
				arr[x][y] = ++cnt;
			}
			d = -d;
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

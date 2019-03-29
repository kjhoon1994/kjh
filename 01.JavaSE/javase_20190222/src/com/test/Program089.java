/* 
 * 프로그램명: 2차원 배열
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program089 {

	public static void main(String[] args) {
		
		//2차원 배열 -> 1차원 배열 변환
		//랜덤한 크기(~5x5)의 2차원 배열 요소(1부터 순차적으로)를 
		//1차원 배열로 변환
		
		//2차원 배열 선언
		int[][] arr = new int[5][5];
		
		
		//2차원 배열 자료 채우기
		//-> 특정 범위의 숫자(1~25)를 순서대로 채우기
		int len = arr.length;
		int temp = 0;
		//행 접근용 반복문
		for (int a = 0; a < len; ++a) {
			//열 접근용 반복문
			for (int b = 0; b < arr[a].length; ++b) {
				arr[a][b] = ++temp;
			}
		}
		
		//2차원 배열 요소 전체 출력
		//행 접근용 반복문
		for (int a = 0; a < len; ++a) {
			//열 접근용 반복문
			for (int b = 0; b < arr[a].length; ++b) {
				System.out.printf("%2d ", arr[a][b]);
			}
			System.out.println();
		}
		
		
		//1차원 배열로 변환
		//->배열은 선언시 크기 지정
		int[] arr2 = new int[len * len];
		
		//행 접근용 반복문
		int c = 0;
		for (int a = 0; a < len; ++a) {
			//열 접근용 반복문
			for (int b = 0; b < arr[a].length; ++b) {
				
				//2차원 배열의 요소를 1차원 배열의 요소로 복사
				arr2[c] = arr[a][b];
				++c;
				
			}
		}
		
		//1차원 배열 요소 출력
		System.out.println(java.util.Arrays.toString(arr2));
		

	}

}

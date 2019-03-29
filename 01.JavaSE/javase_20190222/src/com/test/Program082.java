/* 
 * 프로그램명: 2차원 배열
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program082 {

	public static void main(String[] args) {
		
		//배열
		//동일한 성격(자료형)을 가진 자료 여러개를 저장할 수 있는 저장소
		//자료형 - 기본(int, double, ...), 참조(배열, ...)
		//배열 - 1차원, 2차원, 다차원
		//1차원 배열 - 여러개의 자료가 저장된 상태.
		//2차원 배열 - 여러개의 1차원 배열의 참조주소가 저장된 상태

		//자료형[][] arr = new 자료형[크기1][크기2];
		
		//3행 2열 크기의 2차원 배열 선언시
		int[][] arr1 = new int[3][2];
		
		//2행 3열 크기의 2차원 배열 선언시
		int[][] arr2 = new int[2][3];
		
		
		//특정행 가변열 크기의 2차원 배열 선언시
		//자료형[][] arr = new 자료형[크기1][];
		
		//2행 가변열 크기의 2차원 배열 선언시
		int[][] arr3 = new int[2][];
		arr3[0] = new int[5];
		arr3[1] = new int[2];
		
		
 		
		
	}

}

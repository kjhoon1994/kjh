/* 
 * 프로그램명: 배열 복사(얕은 복사, 깊은 복사)
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program092 {

	public static void main(String[] args) {
		
		//배열 요소 복사
		//1차원 배열 -> 깊은 복사(자료가 복사된 상태)
		//2차원 배열 -> 얕은 복사(참조주소가 복사된 상태)
		
		//2차원 배열 준비
		int[][] arr = {{1, 2, 3}, {4, 5}};
		System.out.println(java.util.Arrays.toString(arr[0]));
		
	
		//사본 2차원 배열
		int[][] arr2 = java.util.Arrays.copyOf(arr, arr.length);
		System.out.println(java.util.Arrays.toString(arr2[0]));
		
		
		//원본 배열의 자료 변경
		arr[0][0] = 10;
		
		//원본 상태 확인
		System.out.println(java.util.Arrays.toString(arr[0]));
		
		//사본 상태 확인
		//->원본 상태의 변경이 사본에 영향을 준다.
		System.out.println(java.util.Arrays.toString(arr2[0]));
		
		//->2차원 배열도 깊은 복사할 수 있다.
	
		
	}

}

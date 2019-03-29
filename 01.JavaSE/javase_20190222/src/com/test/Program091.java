/* 
 * 프로그램명: 배열 복사(얕은 복사, 깊은 복사)
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program091 {

	public static void main(String[] args) {
		
		//배열 요소 복사
		//1차원 배열 -> 깊은 복사(자료가 복사된 상태)
		//2차원 배열 -> 얕은 복사(참조주소가 복사된 상태)
		
		int[] arr = {1, 2, 3, 4, 5};
		System.out.println(java.util.Arrays.toString(arr));
		
		//Arrays 클래스의 copyOf() 메소드를 이용한 배열 요소 복사
		//copyOf(원본배열, 크기)
		int[] arr2 = java.util.Arrays.copyOf(arr, arr.length);
		System.out.println(java.util.Arrays.toString(arr2));
		
		//원본 자료 변경
		arr[0] = 10;
		//원본 상태 확인
		System.out.println(java.util.Arrays.toString(arr));
		//사본 상태 확인
		//-> 원본 상태가 변경되어도 사본에는 영향이 없다
		System.out.println(java.util.Arrays.toString(arr2));
	
		
	}

}

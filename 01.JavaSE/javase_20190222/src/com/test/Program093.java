/* 
 * 프로그램명: 배열 복사(얕은 복사, 깊은 복사)
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program093 {

	public static void main(String[] args) {
		
		//Arrays 클래스의 sort() 메소드는 
		//외부에서 전달된 배열의 참조주소만 받아들여서
		//원본 배열의 요소를 정렬한다.
		
		int[] arr = {5, 3, 1, 4, 2};
		
		//정렬 전 상태
		System.out.println(java.util.Arrays.toString(arr));
		
		//1차원 배열의 참조주소를 전달한다
		//내부적으로 참조주소가 가리키는 배열 요소를 정렬한다.
		java.util.Arrays.sort(arr);
		
		
		//정렬 후 상태
		System.out.println(java.util.Arrays.toString(arr));
		
		
	}

}

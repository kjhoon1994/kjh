/* 
 * 프로그램명: 배열
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */

package com.test;

public class Program067 {

	public static void main(String[] args) {
		
		//배열(Array)
		//여러개의 자료를 하나의 저장소에 저장할 수 있는 공간
		//일반적인 저장소인 변수 공간에는 자료 한 개만 저장 가능
		//예를 들어, int a = 10; a라는 공간에 숫자 10만 저장
		//예를 들어, int[] a = {10, 20}; a라는 공간에 숫자 10, 20를 같이 저장 가능
		
		//배열은 참조형 자료형이다. 일반적인 저장소인 기본형 자료형과 다르게 운영된다.
		//참조형 자료형은 변수 선언 공간과 자료 저장 공간이 분리되어 있다. 참조주소에 의해 연결되어 있다.
		//예를 들어, 마트내의 진열대의 물건을 그대로 가져올 수 있으면 기본형.
		//예를 들어, 마트내의 진열대의 샘플만 존재. 실제 구매를 원하는 물건은 별도의 장소에 저장되어 있다. 참조형.	

		/*
		
		방법1)
		dataType[] arrayRefVar; 
		arrayRefVar = new dataType[arraySize];
		arrayRefVar[idx] = data;
		arrayRefVar[idx]
		
		방법2)
		dataType[] arrayRefVar = {data1, data2, ...};
		arrayRefVar[idx]
		
		*/
		//주의) idx는 0 부터 시작하고, 배열의 크기를 벗어날 수 없다.
		//주의) 배열 공간 자동 초기화 지원. 예를 들어, int 자료형 배열인 경우 0으로 초기화.
		
		//배열 선언 및 초기화
		int[] arr = {32, 54, 21, 67, 90};
		
		//전체 탐색
		int len = arr.length;
		for (int a = 0; a < len; ++a) {
			System.out.printf("%d ", arr[a]);
		}
		System.out.println();
		
		//특정 요소 탐색
		System.out.printf("%d ", arr[0]);
		System.out.println();
		
		
		//특정 범위 탐색
		int start = 0;
		int end = 3;
		for (int a = start; a < end; ++a) {
			System.out.printf("%d ", arr[a]);
		}
		System.out.println();
		
		//특정 값 탐색
		int value = 90;
		for (int a = 0; a < len; ++a) {
			int temp = arr[a];
			if (temp == value) {
				System.out.printf("%d ", temp);
			}
		}
		System.out.println();
		
		//정렬(오름차순 또는 내림차순) 출력
		java.util.Arrays.sort(arr);
		for (int a = 0; a < len; ++a) {
			System.out.printf("%d ", arr[a]);
		}
		System.out.println();
		
	}

}

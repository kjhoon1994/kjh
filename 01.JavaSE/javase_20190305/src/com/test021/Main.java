package com.test021;

import java.util.Arrays;

public class Main {

	public static void main(String[] args) {

		//by value 확인
		Sample s = new Sample();
		int result = s.method(10, 20);
		System.out.println(result); //30
		
		
		//by reference 확인
		Sample s2 = new Sample();
		int[] arr = {10, 20, 30, 0};
		//by reference 방식으로 매개변수 값 전달시
		//메소드 내부에서 진행된 액션의 결과를 
		//외부에서 알 수 있다
		//->결과 반환 과정이 필요없다
		s2.method(arr);
		System.out.println(arr[arr.length - 1]);
		
		
		//대표적인 by reference 
		//java.util.Arrays.sort()
		int[] arr2 = {20, 10, 40, 50, 30};
		Arrays.sort(arr2);
		System.out.println(Arrays.toString(arr2));
		

	}

}

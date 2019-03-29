package com.test027;

import java.util.Arrays;

public class Main {

	public static void main(String[] args) {

		//초기화 테스트
		//객체(instance) 생성시 생성자 호출 가능
		Sample s = new Sample();
		
		int[] arr = s.getArr();
		Arrays.sort(arr);
		System.out.println(Arrays.toString(s.getArr()));
		

	}

}

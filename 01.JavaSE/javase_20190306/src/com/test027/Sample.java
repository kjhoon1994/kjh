package com.test027;

import java.util.Random;

public class Sample {
	
	/*
	[문제]생성자에 의한 초기화 코드 작성
	클래스의 멤버로 정수형 자료를 저장하는 1차원 배열(6자리) 준비하고,
	난수(1~45)로 1차원 배열을 초기화한다
	그 결과를 출력하는 코드 작성.
	*/
	
	private int[] arr;
	
	public Sample() {
		Random r = new Random();
		this.arr = new int[6];
		int len = this.arr.length;
		for (int a = 0; a < len; ++a) {
			int temp = r.nextInt(45) + 1;
			
			//중복 제거 과정 추가
			
			this.arr[a] = temp;
		}
	}
	
	public int[] getArr() {
		return this.arr;
	}
	
}

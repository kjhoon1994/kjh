package com.test050;

public class Main {

	public static void main(String[] args) {
		
		//final 키워드 정리
		
		//final 멤버 확인
		Sample s = new Sample(20);
		System.out.println(s.getA());
		//setter 호출 불가
		
		//satatic final 멤버 확인
		System.out.println(Sample.B);

	}

}

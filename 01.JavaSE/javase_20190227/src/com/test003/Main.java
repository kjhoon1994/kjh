package com.test003;

public class Main {

	public static void main(String[] args) {
		
		//BoardMarker 클래스에 대한 인스턴스 생성
		BoardMarker bm = new BoardMarker();
		
		//인스턴스 확인
		System.out.println(bm);
		
		//메소드 호출
		System.out.println(bm.write("Hello, World!"));
		System.out.println(bm.write("Java is an Object-Oriented Language"));
		
	}

}

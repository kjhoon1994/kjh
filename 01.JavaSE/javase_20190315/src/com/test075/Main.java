package com.test075;

import java.io.ByteArrayInputStream;

public class Main {

	public static void main(String[] args) {
		
		//파일 입출력(File I/O)
		//물리적 파일 형태로 자료를 저장하고, 읽어오는 액션
		//바이트 기반, 문자 기반, 문자열 기반, 파일 기반
		
		byte[] inSrc = {1, 2, 3, 4, 5};
		
		//바이트 기반 스트림
		ByteArrayInputStream input = null;
		input = new ByteArrayInputStream(inSrc);
		
		int data = 0;
		//read() 메소드 실행시마다 1byte 단위로 입력이 진행된다
		while((data = input.read()) != -1) {
			System.out.println(data);
		}

	}

}

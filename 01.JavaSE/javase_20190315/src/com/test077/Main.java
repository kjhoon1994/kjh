package com.test077;

import java.io.IOException;

public class Main {

	public static void main(String[] args) {
		
		//파일 입출력(File I/O)
		//물리적 파일 형태로 자료를 저장하고, 읽어오는 액션
		//바이트 기반, 문자 기반, 문자열 기반, 파일 기반
		
		//System.in
		//표준입력장치(키보드)를 통한 입력 액션 처리
		
		//read() 메소드 실행시마다 1문자 단위로 입력이 진행된다
		int data = 0;
		try {
			while((data = System.in.read()) != -1) {
				System.out.printf("%d/%c%n", data, data);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}

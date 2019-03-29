package com.test080;

import java.io.File;
import java.io.IOException;

public class Main {

	public static void main(String[] args) {
		
		//파일 입출력(File I/O)
		//물리적 파일 형태로 자료를 저장하고, 읽어오는 액션
		//바이트 기반, 문자 기반, 문자열 기반, 파일 기반
		
		//디렉토리 및 파일 생성
		//File 클래스
		
		File dir = new File("/tmp/user/bin");
		System.out.println(dir.mkdirs());
		
		File file = new File(dir, "test.txt");
		try {
			System.out.println(file.createNewFile());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}

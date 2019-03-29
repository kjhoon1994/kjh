package com.test079;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		//파일 입출력(File I/O)
		//물리적 파일 형태로 자료를 저장하고, 읽어오는 액션
		//바이트 기반, 문자 기반, 문자열 기반, 파일 기반
		
		//Scanner
		//표준입력장치(키보드) 및 파일 입력 처리
		
		Scanner sc = null;
		try {
			sc = new Scanner(new File("src/com/test079/test.txt"));

			while(sc.hasNextLine()) {
				//문자열 입력후 Enter키 입력시 
				//문자열만 추출해서 반환
				String s = sc.nextLine();
				System.out.println(s);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} finally {
			sc.close();
		}

	}

}

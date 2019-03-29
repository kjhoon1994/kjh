package com.test074;

import java.io.FileInputStream;

public class Main {

	public static void main(String[] args) {
		
		//예외처리
		//예외는 처리 가능한 오류이다.
		//예외처리는 예외가 발생하더라고 프로그램에 영향을 주지 않도록 처리하는 것.
		//with resources 구문을 이용하면 객체 소멸 과정을 자동 실행해준다
		//JDK 1.7 이후
		
		try (FileInputStream fi = new FileInputStream("src/com/test074/test.txt")) {
			
			System.out.println((char)fi.read()); //H		
			System.out.println((char)fi.read()); //e		
			System.out.println((char)fi.read()); //l		
			System.out.println((char)fi.read()); //l		
			System.out.println((char)fi.read()); //o		
			
		}catch(Exception e) {
			
			//실행 예외 발생시 처리할 문장
			e.printStackTrace();
			
		}

	}

}

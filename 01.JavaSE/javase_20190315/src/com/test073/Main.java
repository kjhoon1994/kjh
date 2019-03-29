package com.test073;

import java.io.FileInputStream;
import java.io.IOException;

public class Main {

	public static void main(String[] args) {
		
		//예외처리
		//예외는 처리 가능한 오류이다.
		//예외처리는 예외가 발생하더라고 프로그램에 영향을 주지 않도록 처리하는 것.
		//try ~ catch ~ finally
		
		//finally 구문은 예외 발생 유무와 관계없이 항상 실행되는 구문
		
		FileInputStream fi = null;
		try {
			
			//객체 생성 과정
			//예외 발생 가능성이 있는 문장
			fi = new FileInputStream("src/com/test073/test.txt");
			System.out.println((char)fi.read()); //H		
			System.out.println((char)fi.read()); //e		
			System.out.println((char)fi.read()); //l		
			System.out.println((char)fi.read()); //l		
			System.out.println((char)fi.read()); //o		
			
		}catch(Exception e) {
			
			//실행 예외 발생시 처리할 문장
			e.printStackTrace();
			
		}finally {
			
			//예외 발생 유무와 관계없이 항상 실행되는 문장
			//->객체 소멸 관련 액션
			try {
				if (fi != null)
					fi.close();
				System.out.println("finally 구문 정상 실행");
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		

	}

}

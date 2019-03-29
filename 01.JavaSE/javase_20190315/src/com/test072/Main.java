package com.test072;

import java.io.FileNotFoundException;
import java.io.IOException;

public class Main {

	public static void main(String[] args) {
		
		//예외처리
		//예외는 처리 가능한 오류이다.
		//예외처리는 예외가 발생하더라고 프로그램에 영향을 주지 않도록 처리하는 것.
		//try ~ catch, throws
	
		Sample s = new Sample();
		try {
			
			s.method();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}

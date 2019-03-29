/* 
 * 프로그램명: 외부 입력 Scanner 클래스
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */

package com.test;

import java.io.IOException;

public class Program101 {

	public static void main(String[] args) throws IOException  {
		
		//외부 입력
		//프로그램 실행 후에 외부에서 자료 입력 받는 행위
		//콘솔, 윈도우, 웹, ...
		//표준 입력 장치(키보드)를 통한 입력
		//System.in.read()
		//->예외 처리 필요
		
		//단어 단위로 입력 처리
		//test, Enter
		int a = System.in.read();  
		int b = System.in.read();  
		int c = System.in.read();  
		int d = System.in.read();  
		System.out.println(a); //
		System.out.println(b); //
		System.out.println(c); //
		System.out.println(d); //
		System.out.printf("%c%c%c%c%n", a, b, c, d);  //test
		
	}

}

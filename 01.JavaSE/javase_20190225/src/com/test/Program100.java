/* 
 * 프로그램명: 외부 입력 Scanner 클래스
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */

package com.test;

import java.io.IOException;

public class Program100 {

	public static void main(String[] args) throws IOException  {
		
		//외부 입력
		//프로그램 실행 후에 외부에서 자료 입력 받는 행위
		//콘솔, 윈도우, 웹, ...
		//표준 입력 장치(키보드)를 통한 입력
		//System.in.read()
		//->예외 처리 필요
		
		//실행하게 되면 입력 대기 상태가 된다
		//사용자가 원하는 문자 입력 후 Enter키
		//read() 메소드는 문자 1개만 처리 가능
		//문자는 자료형 char형이고, int형과 호환
		int a = System.in.read();  //a, Enter
		System.out.println(a); //97
		System.out.printf("%c%n", a);  //a
		
	}

}

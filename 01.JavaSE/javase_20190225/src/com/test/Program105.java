/* 
 * 프로그램명: 외부 입력 Scanner 클래스
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */

package com.test;

import java.io.IOException;

public class Program105 {

	public static void main(String[] args) throws IOException  {
		
		//외부 입력
		//프로그램 실행 후에 외부에서 자료 입력 받는 행위
		//콘솔, 윈도우, 웹, ...
		//표준 입력 장치(키보드)를 통한 입력
		//Scanner 클래스
		//->예외 처리 필요
		
		//단어, 문장 단위로 입력 처리
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		//숫자 자료를 입력하는 과정
		//100 90 80, Enter
		int a = sc.nextInt();  
		int b = sc.nextInt();  
		int c = sc.nextInt(); 
		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		System.out.println(a + b + c);
		
		
		//Scanner 객체 사용에 대한 마무리
		sc.close();
		
	}

}

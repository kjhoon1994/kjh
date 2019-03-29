/* 
 * 프로그램명: 외부 입력 Scanner 클래스
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */

package com.test;

import java.io.IOException;

public class Program103 {

	public static void main(String[] args) throws IOException  {
		
		//외부 입력
		//프로그램 실행 후에 외부에서 자료 입력 받는 행위
		//콘솔, 윈도우, 웹, ...
		//표준 입력 장치(키보드)를 통한 입력
		//Scanner 클래스
		//->예외 처리 필요
		
		//단어, 문장 단위로 입력 처리
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		//자료 여러개를 동시 입력하는 과정
		//주의) 문장 처리는 안된다.
		//test sample, Enter
		String a = sc.next();  
		String b = sc.next();
		System.out.println(a); //test
		System.out.println(b); //sample
		
		//Scanner 객체 사용에 대한 마무리
		sc.close();
		
	}

}

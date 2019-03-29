/* 
 * 프로그램명: 외부 입력 Scanner 클래스
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */

package com.test;

import java.io.IOException;

public class Program106 {

	public static void main(String[] args) throws IOException  {
		
		//외부 입력
		//프로그램 실행 후에 외부에서 자료 입력 받는 행위
		//콘솔, 윈도우, 웹, ...
		//표준 입력 장치(키보드)를 통한 입력
		//Scanner 클래스
		//->예외 처리 필요
		
		//단어, 문장 단위로 입력 처리
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		while(true) {
			System.out.print("숫자입력:");
			int a = sc.nextInt();
			sc.nextLine();
			if (a == 0) break;
			System.out.println(a);
		}
		
		//Scanner 객체 사용에 대한 마무리
		sc.close();
		
	}

}

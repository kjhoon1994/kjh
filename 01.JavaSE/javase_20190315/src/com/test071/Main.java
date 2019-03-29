package com.test071;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		
		//예외처리
		//예외는 처리 가능한 오류이다.
		//예외처리는 예외가 발생하더라고 프로그램에 영향을 주지 않도록 처리하는 것.
		//try ~ catch, throws
		
		Scanner sc = new Scanner(System.in);
		
		try {
			
			//예외 발생 가능성이 있는 실행문
			System.out.print("자료입력(숫자)>");
			int m = sc.nextInt();
			sc.nextLine();
			
			//예외 발생되지 않는 경우 실행할 수 있는 문장
			System.out.printf("정상출력:%d%n",m);
			
		} catch(Exception e) {
			//실제 예외 발생시 실행할 문장
			//->에러 메시지 출력
			//e.printStackTrace();
			System.out.println("잘못된 입력입니다");
		}
		
		sc.close();
		System.out.println("프로그램 종료");
		
		
	}

}

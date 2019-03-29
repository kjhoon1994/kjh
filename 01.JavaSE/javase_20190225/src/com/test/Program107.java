/* 
 * 프로그램명: 구구단 출력
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program107 {

	public static void main(String[] args) {


		//구구단 출력
		//사용자가 원하는 구구단을 선택해서 출력
		//출력예)
		/*
		구구단 숫자(1~9)>5
		----- 5단 ------
		5 * 1 = 5
		5 * 2 = 10
		5 * 3 = 15
		5 * 4 = 20
		...
		5 * 9 = 45
		
		구구단 숫자(1~9)>0
		프로그램 종료
		*/
		
		//외부 입력을 받기 위한 Scanner 객체 준비
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		//무한 실행
		while(true) {
		
			//외부 입력을 통한 임의의 자료 입력
			System.out.print("구구단 숫자(1~9)>");
			int a = sc.nextInt();
			sc.nextLine();
			
			//무한 실행 중단
			if (a == 0) break;
			
			//구구단 처리+출력 과정
			System.out.printf("---- %d단 ----%n", a);
			for (int b = 1; b <= 9; ++b) {
				System.out.printf("%d * %d = %d%n"
							, a , b, (a * b));
			}
		
		}
		
		//Scanner 객체에 대한 마무리
		sc.close();
		System.out.println("프로그램 종료");

	}

}

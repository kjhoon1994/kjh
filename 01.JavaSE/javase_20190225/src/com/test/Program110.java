/* 
 * 프로그램명: 외부입력-메인메뉴 구성
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program110 {

	public static void main(String[] args) {

		//메인메뉴 구성
		//특정 범위의 메뉴를 번호로 표시하고,
		//사용자의 선택에 의해서 메뉴 실행하는 구조
		//주의) 반복 실행할 수 있다.
		//주의) 종료 메뉴(0)를 선택해서 프로그램 종료 가능
		
		java.util.Scanner sc = new java.util.Scanner(System.in);

		while (true) {
			System.out.println();
			System.out.println("--- 회원 정보 관리 ---");
			System.out.println("1.회원정보출력  2.회원정보입력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			if (m == 1) {
				System.out.println("1.회원정보출력");
				
			} else if (m == 2){
				System.out.println("2.회원정보입력");
			
			} 
		}
		
		sc.close();
		System.out.println("프로그램 종료");

	}

}

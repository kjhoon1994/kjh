/* 
 * 프로그램명: 외부입력-회원 정보 관리
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program111 {

	public static void main(String[] args) {

		//회원 정보 관리
		//회원 정보 구성 - 이름, 전화번호, 이메일
		//2차원 배열 저장소 운영
		//1차원 배열 - 개개인의 회원 정보 저장하는 저장소
		//2차원 배열 - 회원 정보 여러개를 저장하는 저장소
		//{{"hong", "010-1234-1234", "hong@naver.com"}, {"park", "010-5678-5678", "park@test.com"}, ...}
		//주의) 배열은 동일 자료형만 허용
		//주의) 휘발성 자료
		//출력 예)
		/*
		--- 회원 정보 관리 ---
		1.회원정보출력  2.회원정보입력
		선택>1
		1.회원정보출력
		------------------------
		이름 / 전화번호 / 이메일
		hong / 010-1234-1234 / hong@naver.com
		park / 010-5678-5678 / park@test.com
		choi / 010-4321-4321 / choi@sist.com
		kim / 010-5432-9876 / kim@naver.com
		
		--- 회원 정보 관리 ---
		1.회원정보출력  2.회원정보입력
		선택>0
		프로그램 종료 
		*/
		
		java.util.Scanner sc = new java.util.Scanner(System.in);

		//초기값이 들어 있는 2차원 배열 저장소 준비
		//String[][] members = new String[10][3];
		String[][] members = {{"hong", "010-1234-1234", "hong@naver.com"}
								, {"park", "010-5678-5678", "park@test.com"}
								, {"choi", "010-4321-4321", "choi@sist.com"}
								, {"kim", "010-5432-9876", "kim@naver.com"}};
		
		
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
				
				int len = members.length;
				System.out.println("------------------------");
				System.out.println("이름 / 전화번호 / 이메일");
				for (int a = 0; a < len; ++a) {
					System.out.printf("%s / %s / %s%n"
							, members[a][0]
							, members[a][1]
							, members[a][2]);
				}
				
			} else if (m == 2){
				System.out.println("2.회원정보입력");
			
			} 
		}
		
		sc.close();
		System.out.println("프로그램 종료");

	}

}

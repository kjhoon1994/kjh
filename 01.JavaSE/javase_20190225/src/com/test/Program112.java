/* 
 * 프로그램명: 외부입력-회원 정보 관리
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program112 {

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
		선택>2
		이름>hong
		전화번호>010-1234-1234
		이메일>hong@naver.com
		회원정보를 입력할까요(0/1)?1
		회원정보가 입력되었습니다.
		
		--- 회원 정보 관리 ---
		1.회원정보출력  2.회원정보입력
		선택>1
		1.회원정보출력
		------------------------
		이름 / 전화번호 / 이메일
		hong / 010-1234-1234 / hong@naver.com
		
		--- 회원 정보 관리 ---
		1.회원정보출력  2.회원정보입력
		선택>0
		프로그램 종료 
		*/
		
		
		//주의) Scanner 객체는 프로그램 전체에서 한 번만 new 요청한다
		java.util.Scanner sc = new java.util.Scanner(System.in);

		//초기값이 없는 2차원 배열 저장소 준비
		//주의) 2차원 배열 선언시 1차원 저장소의 크기 지정 생략
		String[][] members = new String[10][];
		
		//2차원 배열의 인덱싱을 위한 임시변수
		//->배열 저장소에 채워진 실제 인원수
		int cnt = 0;
		
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
				
				
				//length는 배열의 크기
				//int len = members.length;
				//cnt는 배열에 실제 채워진 인원수
				int len = cnt;
				
				System.out.println("------------------------");
				System.out.println("이름 / 전화번호 / 이메일");
				for (int a = 0; a < len; ++a) {
					//2차원 배열의 요소를 순차적 접근
					String[] member = members[a];
					//1차원 배열의 요소를 인덱스 지정 접근
					System.out.printf("%s / %s / %s%n"
							, member[0]
							, member[1]
							, member[2]);
				}
				
			} else if (m == 2){
				System.out.println("2.회원정보입력");
			
				
				//문제) 회원정보입력 코드 구현
				
				//배열 저장소 크기와 입력된 인원수 비교 과정 추가
				if (members.length > cnt) { 
				
					//이름, 전화번호, 이메일 외부 입력
					System.out.print("이름>");
					String name = sc.nextLine();
					System.out.print("전화번호>");
					String phone = sc.nextLine();
					System.out.print("이메일>");
					String email = sc.nextLine();
					
					System.out.println("회원정보를 입력할까요(0/1)?");
					int m_ = sc.nextInt();
					sc.nextLine();
					
					if (m_ == 1) {
						
						//이름, 전화번호, 이메일 항목 저장용 1차원 배열
						String[] member = new String[3];
						member[0] = name;
						member[1] = phone;
						member[2] = email;
						
						//2차원 배열에 1차원 배열 객체를 저장
						//2차원 배열의 인덱스 범위는 0 ~ (배열의 크기 - 1)
						members[cnt] = member;
						++cnt;
						
						System.out.println("회원 정보가 등록되었습니다.");
					} else {
						System.out.println("회원 정보 등록이 취소되었습니다.");
					}
				} else {
					System.out.println("더 이상의 입력은 안됩니다. 저장소가 꽉찼습니다.");
				}
				
			} 
		}
		
		//주의) Scanner 객체 사용 후 명시적인 close() 메소드 요청 필요
		sc.close();
		System.out.println("프로그램 종료");

	}

}

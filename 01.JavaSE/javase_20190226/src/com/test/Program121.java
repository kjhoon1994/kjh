/* 
 * 프로그램명: 외부입력-개인정보 + 성적 처리
 * 작성자 : 이민종
 * 작성일 : 20190226
 *  
 */

package com.test;

public class Program121 {

	public static void main(String[] args) {
		
		//성적 처리
		//성적 처리 구성 - 학번, 과목1, 과목2, 과목3, 총점, 등수
		//개인 정보 구성 추가 - 학번, 이름, 전화번호, 이메일
		//주의) int 학번과 String 학번 호환 필요
		//2차원 배열 저장소 운영
		//1차원 배열 - 개개인의 성적 정보 저장하는 저장소
		//2차원 배열 - 성적 정보 여러개를 저장하는 저장소
		//출력예)
		/*
		--- 성적 처리 ---
		1.개인정보출력 2.개인정보입력 3.성적정보출력 4.성적정보입력
		선택>2
		2.개인정보입력
		학번>100
		이름>hong
		전화>010-1234-1234
		이메일>hong@test.com
		개인정보를 입력할까요(0/1)?1
		개인정보가 입력되었습니다.	
		
		1.개인정보출력 2.개인정보입력 3.성적정보출력 4.성적정보입력
		선택>4
		4.성적정보입력
		학번>100
		과목1>100
		과목2>100
		과목3>100
		성적정보를 입력할까요(0/1)?1
		성적정보가 입력되었습니다.		
		
		--- 성적 관리 ---
		1.개인정보출력 2.개인정보입력 3.성적정보출력 4.성적정보입력
		선택>3
		3.성적정보출력
		------------------------
		학번/이름/과목1/과목2/과목3/총점/등수
		1 / hong / 100 / 100 / 100 / 300 / 1
		------
	 　 과목별반평균
	  　과목1: xxx.x
	  　과목2: xxx.x
	  　과목3: xxx.x
		
		--- 성적 관리 ---
		1.개인정보출력 2.개인정보입력 3.성적정보출력 4.성적정보입력
		선택>0
		프로그램 종료 
		
		*/

		
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		//성적 처리를 위한 총 인원수
		int cnt = 2;

		//2차원 배열 인덱스 운영용 변수
		int midx = 0;
		int sidx = 0;

		//개인정보 출력 액션 테스트용 임시 초기값 지정
		//개인정보 저장용 2차원 배열
		/*
		String[][] members = {{"100", "hong", "010-1234-1234", "hong@naver.com"}
							, {"101", "park", "010-5678-5678", "park@test.com"}};
		*/
		String[][] members = new String[cnt][];
		
		
		//2차원 배열 저장소 준비
		//성적 정보 저장용 2차원 배열
		int[][] scores = new int[cnt][];
		
		
		while (true) {
			System.out.println();
			System.out.println("--- 성적 처리 ---");
			System.out.println("1.개인정보출력 2.개인정보입력 3.성적정보출력 4.성적정보입력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
		
			if (m == 1) {
				System.out.println("1.개인정보출력");
				
				int len = midx;
				System.out.println("------------------------");
				System.out.println("학번 / 이름 / 전화번호 / 이메일");
				for (int a = 0; a < len; ++a) {
					//2차원 배열의 요소를 순차적 접근
					String[] member = members[a];
					//1차원 배열의 요소를 인덱스 지정 접근
					System.out.printf("%s / %s / %s / %s%n"
							, member[0]
							, member[1]
							, member[2]
							, member[3]);
				}
				
				
			} else if (m == 2) {
				System.out.println("2.개인정보입력");
				
				if (midx <= cnt-1) { 
					
					//학번, 이름, 전화번호, 이메일 외부 입력
					System.out.print("학번>");
					String mid = sc.nextLine();
					System.out.print("이름>");
					String name = sc.nextLine();
					System.out.print("전화번호>");
					String phone = sc.nextLine();
					System.out.print("이메일>");
					String email = sc.nextLine();
					
					System.out.println("개인정보를 입력할까요(0/1)?");
					int m_ = sc.nextInt();
					sc.nextLine();
					
					if (m_ == 1) {
						
						//학번, 이름, 전화번호, 이메일 항목 저장용 1차원 배열
						String[] member = new String[4];
						member[0] = mid;
						member[1] = name;
						member[2] = phone;
						member[3] = email;
						
						//2차원 배열에 1차원 배열 객체를 저장
						//2차원 배열의 인덱스 범위는 0 ~ (배열의 크기 - 1)
						members[midx] = member;
						++midx;
						
						System.out.println("개인 정보가 등록되었습니다.");
					} else {
						System.out.println("개인 정보 등록이 취소되었습니다.");
					}
				} else {
					System.out.println("더 이상의 입력은 안됩니다. 저장소가 꽉찼습니다.");
				}
				
			} else if (m == 3) {
			
				System.out.println("3.성적정보출력");

				//배열의 성적 정보가 저장된 실제 인원수
				int len = sidx;

				//전체 성적에 대한 총점 계산 과정 추가
				for (int a = 0; a < len; ++a) {
					int[] score = scores[a];
					score[4] = score[1] + score[2] + score[3];
				}
				
				//전체 성적에 대한 등수 계산 과정 추가
				//주의) 인원이 추가될 때마다 재계산 필요
				//등수 계산용 초기화
				for (int a = 0; a < len; ++a) {
					int[] scoreA = scores[a];
					scoreA[5] = 1;
					for (int b = 0; b < len; ++b) {
						int[] scoreB = scores[b];
						if (scoreA[4] < scoreB[4]) {
							++scoreA[5];
						}
					}
				}			
				
				//전체 성적 정보 출력 과정 추가
				System.out.println("--------------------------------");
				System.out.println("학번/이름/과목1/과목2/과목3/총점/등수");
				for (int a = 0; a < len; ++a) {
					int[] score = scores[a];
					
					//이름 검색 과정 추가
					String name = "";
					//int 자료형 학번 -> String 자료형 학번
					String num = String.valueOf(score[0]);
					//개인 정보 저장용 배열 탐색
					for (int b = 0; b < len; ++b) {
						//2차원 배열의 요소를 1차원 배열로 변환
						String[] member = members[b];
						//학번 일치하는지 비교 연산
						if (num.equals(member[0])) {
							//일치하는 학번의 자료 중에서
							//이름을 임시변수에 저장
							name = member[1];
						}
					}
					
					System.out.printf("%d / %s / %d / %d / %d / %d / %d%n"
							, score[0], name, score[1], score[2], score[3], score[4], score[5]);
				}
				
				
				//과목별반평균 계산 및 출력
				int sub1Total = 0, sub2Total = 0, sub3Total = 0;
				for (int a = 0; a < len; ++a) {
					int[] score = scores[a];
					sub1Total += score[1];
					sub2Total += score[2];
					sub3Total += score[3];
				}
				System.out.println("----------------");
				System.out.println("과목별반평균");
				System.out.printf("과목1：%.1f%n", (sub1Total / (double)len));
				System.out.printf("과목2：%.1f%n", (sub2Total / (double)len));
				System.out.printf("과목3：%.1f%n", (sub3Total / (double)len));
				
				
			} else if (m == 4){
				System.out.println("4.성적정보입력");
				
				if (sidx < midx) {
					System.out.print("학번>");
					int num = sc.nextInt();
					sc.nextLine();
					System.out.print("과목1>");
					int s1 = sc.nextInt();
					sc.nextLine();
					System.out.print("과목2>");
					int s2 = sc.nextInt();
					sc.nextLine();
					System.out.print("과목3>");
					int s3 = sc.nextInt();
					sc.nextLine();
					
					System.out.printf("성적정보를 입력할까요(0/1)?");
					int m_ = sc.nextInt();
					sc.nextLine();
					
					if (m_ == 1) {
						
						//1차원 배열에 성적 정보 저장
						int[] score = {num, s1, s2, s3, 0, 0};
						
						//2차원 배열에 성적 정보 저장
						scores[sidx] = score;
						++sidx;
						
						System.out.println("성적정보가 입력되었습니다.");
					} else {
						System.out.println("성적정보 입력이 취소되었습니다.");
					}
				} else {
					System.out.println("더 이상의 입력은 안됩니다. 저장소가 꽉찼습니다.");
				}
			
			} 
		}
		
		sc.close();
		System.out.println("프로그램 종료");
		
	}

}

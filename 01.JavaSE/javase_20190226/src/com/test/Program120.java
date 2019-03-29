/* 
 * 프로그램명: 외부입력-성적 처리
 * 작성자 : 이민종
 * 작성일 : 20190226
 *  
 */

package com.test;

public class Program120 {

	public static void main(String[] args) {
		
		//성적 처리
		//성적 처리 구성 - 학번, 과목1, 과목2, 과목3, 총점, 등수
		//2차원 배열 저장소 운영
		//1차원 배열 - 개개인의 성적 정보 저장하는 저장소
		//2차원 배열 - 성적 정보 여러개를 저장하는 저장소
		//{{1, 100, 100, 100, 300, 1}, {2, 90, 100, 80, 270, 3}, ...}
		//주의) 배열은 동일 자료형만 허용
		//주의) 휘발성 자료
		//출력예)
		/*
		--- 성적 처리 ---
		1.성적정보출력  2.성적정보입력
		선택>2
		2.성적정보입력
		학번>1
		과목1>100
		과목2>100
		과목3>100
		성적정보를 입력할까요(0/1)?1
		성적정보가 입력되었습니다.		
		
		--- 성적 관리 ---
		1.성적정보출력  2.성적정보입력
		선택>1
		1.성적정보출력
		------------------------
		학번 / 과목1 / 과목2 / 과목3 / 총점 / 등수
		1 / 100 / 100 / 100 / 300 / 1
		2 / 90 / 100 / 80 / 270 / 3
		...
		------
	 　 과목별반평균
	  　과목1: xxx.x
	  　과목2: xxx.x
	  　과목3: xxx.x
		
		--- 성적 관리 ---
		1.성적정보출력  2.성적정보입력
		선택>0
		프로그램 종료 
		
		*/

		
		java.util.Scanner sc = new java.util.Scanner(System.in);
		
		//2차원 배열 저장소 준비
		int[][] scores = new int[10][];
		
		//2차원 배열 인덱스 운영용 변수
		int cnt = 0;
		
		//출력 액션 테스트용 임시 초기값 지정
		/*
		int[] s1 = {1, 100, 100, 100, 0, 0};
		int[] s2 = {2, 90, 100, 80, 0, 0};
		int[] s3 = {3, 100, 90, 90, 0, 0};
		scores[0] = s1;
		scores[1] = s2;
		scores[2] = s3;
		cnt = 3;
		*/
		
		while (true) {
			System.out.println();
			System.out.println("--- 성적 처리 ---");
			System.out.println("1.성적정보출력  2.성적정보입력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			if (m == 1) {
				System.out.println("1.성적정보출력");

				//배열의 성적 정보가 저장된 실제 인원수
				int len = cnt;

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
				System.out.println("학번/과목1/과목2/과목3/총점/등수");
				for (int a = 0; a < len; ++a) {
					int[] score = scores[a];
					System.out.printf("%d / %d / %d / %d / %d / %d%n"
							, score[0], score[1], score[2], score[3], score[4], score[5]);
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
				
				
			} else if (m == 2){
				System.out.println("2.성적정보입력");
				
				
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
					scores[cnt] = score;
					++cnt;
					
					System.out.println("성적정보가 입력되었습니다.");
				} else {
					System.out.println("성적정보 입력이 취소되었습니다.");
				}
			
			} 
		}
		
		sc.close();
		System.out.println("프로그램 종료");
		
	}

}

/* 
 * 프로그램명: 배열(저장소)을 이용한 성적처리
 * 작성자 : 이민종
 * 작성일 : 20190221
 *  
 */
package com.test;

public class Program068 {

	public static void main(String[] args) {
		
		//특정 과목의 점수를 저장하는 배열 저장소 준비
		//특정 과목당 인원수는 10명
		//특정 과목당 총점, 평균 계산

		
		//입력 과정 ----------
		//과목1에 대한 점수
		int[] java = {100, 80, 90, 50, 60, 85, 80, 90, 100, 75, 0, 0};
	
		
		
		//처리 과정 ----------
		int len = java.length;
		
		//총점 계산
		int total = 0;
		for (int a = 0; a < (len - 2); ++a) {
			//누적 연산
			total += java[a];
		}
		java[len - 2] = total;
		
		//평균 계산
		//정수 나눗셈의 단점 
		//- 소수 이하를 버린다(절삭)
		//-> 반올림 액션 추가
		int ave = Math.round(total / (float)(len - 2));
		java[len - 1] = ave;
		
		
		
		//출력 과정 ----------
		//점수, 총점, 평균 일괄 출력
		for (int a = 0; a < (len - 2); ++a) {
			System.out.printf("%2d) %5d %5d%n", (a+1), java[a], java[a]);
		}
		System.out.println("    ------------");
		for (int a = (len - 2); a < len; ++a) {
			System.out.printf("    %5d %5d%n", java[a], java[a]);
		}

	}

}

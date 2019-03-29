/* 
 * 프로그램명: 석차 알고리즘
 * 작성자 : 이민종
 * 작성일 : 20190222
 *  
 */

package com.test;

public class Program080 {

	public static void main(String[] args) {
		
		//석차 계산
		//1. 모든 성적의 석차를 1로 설정
		//2. 특정 성적을 가지고, 나머지 성적들과 비교
		//3. 상대방 성적이 높으면, 나의 석차를 +1 연산
		
		
		//입력 과정 ----------
		//과목1에 대한 점수
		int[] sub1 = {100, 80, 90, 50, 60, 85, 80, 90, 100, 75};
		
		//석차 계산을 위한 빈 배열 준비
		//-> 1로 초기화
		//int[] rank = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
		int[] rank = new int[sub1.length];
		java.util.Arrays.fill(rank, 1);
		
		
		//처리 과정 ----------
		/*
		if (sub1[0] < sub1[1]) {
			++rank[0];
		}
		*/
		int len = sub1.length;
		//특정 성적
		for (int a = 0; a < len; ++a) {
			//나머지 성적들
			for (int b = 0; b < len; ++b) {
				//비교 대상이 자기 자신인 경우는 continue
				//if (a == b) continue;
				//상대방 점수가 높으면,
				//나의 석차 +1 연산
				if (sub1[a] < sub1[b]) {
					++rank[a];
				}
			}
		}
		
		
		
		//출력 과정 -----------
		for (int a = 0; a < len; ++a) {
			System.out.printf("%2d) %5d (%2d등)%n", (a+1), sub1[a], rank[a]);
		}

	}

}

/*
 * 프로그램명: 자료형 - 변수
 * 작성자 : 이민종
 * 작성일 : 20190219
*/

package com.test;

public class Program015 {

	public static void main(String[] args) {
		
		//----------------------
		//입력 단계
		//시험 과목들
		//시험 점수를 저장할 변수들
		//시험 성적(과목1, 과목2, 과목3) 입력
		
		//동일 자료형의 변수들은 같이 선언 가능
		//변수 선언과 초기값 할당을 같이 선언 가능
		//int 자료형은 기본 초기값 0
		//double 자료형의 기본 초기값 0.0
		int kor = 60, eng = 70, math = 80;
		int total = 0;
		double avg = 0.0;
				
		//----------------------
		//출력 단계
		//시험 성적(총점, 평균) 출력
		System.out.printf("총점:%d, 평균:%f", total, avg);
		
	}

}
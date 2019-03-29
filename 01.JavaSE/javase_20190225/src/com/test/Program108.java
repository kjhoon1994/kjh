/* 
 * 프로그램명: 외부입력-숫자맞추기
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program108 {

	public static void main(String[] args) {

		//문제)
		//숫자 맞추기(스무고개)
		//컴퓨터가 제시하는 임의의 숫자(1 ~ 50)를 특정 횟수(10번)내에서 맞춘다.
		//출력예)
		/*
		컴퓨터가 제시한 숫자:??
		입력1>50
		보다 작다
		입력2>40
		보다 크다
		입력3>45
		맞췄습니다!
		프로그램 종료
		*/
		
		//컴퓨터가 임의의 난수 발생 -> Math 클래스의 random() 메소드
		
		//사용자 외부 입력 -> Scanner 클래스의 nextInt() 메소드
		
		//임의의 난수와 사용자 입력한 수를 비교
		//보다 작다, 보다 크다, 맞췄습니다!
		//'맞췄습니다'인 경우 break
		//반복 횟수 초과시 '더 이상의 기회가 없습니다'
		
		//외부 입력을 받기 위한 Scanner 객체 준비
		java.util.Scanner sc = new java.util.Scanner(System.in);

		int comp = (int)(Math.random() * 50) + 1;
		System.out.printf("컴퓨터가 제시한 숫자:??(%d)%n",comp);
		
		//일정 횟수 반복 실행
		int a = 1;
		for (; a <= 10; ++a) {
		
			//외부 입력을 통한 임의의 자료 입력
			System.out.printf("입력%d>", a);
			int b = sc.nextInt();
			sc.nextLine();
			
			if (comp < b) {
				System.out.println("보다 작다");
			} else if (comp > b) {
				System.out.println("보다 크다");
			} else {
				System.out.println("맞췄습니다");
				break;
			}
			
		}
		
		if (a == 11) {
			System.out.println("더 이상의 기회가 없습니다");
		}
		
		//Scanner 객체에 대한 마무리
		sc.close();
		System.out.println("프로그램 종료");
		

	}

}

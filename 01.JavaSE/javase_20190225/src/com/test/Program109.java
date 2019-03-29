/* 
 * 프로그램명: 외부입력-가위, 바위, 보
 * 작성자 : 이민종
 * 작성일 : 20190225
 *  
 */
package com.test;

public class Program109 {

	public static void main(String[] args) {

		//문제)
		//가위(1), 바위(2), 보(3)
		//컴퓨터는 임의의 숫자(1 ~ 3)를 제시하고
		//사용자도 임의의 숫자(1 ~ 3)를 제시한다.
		//두 수를 비교해서 게임의 승자를 출력한다.
		//출력예)
		/*
		컴퓨터가 제시한 숫자(1 ~ 3):??
		사용자가 제시한 숫자(1 ~ 3)>1
		컴퓨터:가위(1), 사용자:가위(1) = 무승부
		컴퓨터가 제시한 숫자(1 ~ 3):??
		사용자가 제시한 숫자(1 ~ 3)>2
		컴퓨터:가위(1), 사용자:바위(2) = 사용자승!
		컴퓨터가 제시한 숫자(1 ~ 3):??
		사용자가 제시한 숫자(1 ~ 3)>3
		컴퓨터:가위(1), 사용자:보(3) = 컴퓨터승!
		컴퓨터가 제시한 숫자(1 ~ 3):??
		사용자가 제시한 숫자(1 ~ 3)>0
		프로그램 종료
		*/
		
		//컴퓨터가 임의의 난수 발생 -> Math 클래스의 random() 메소드
		//사용자 외부 입력 -> Scanner 클래스의 nextInt() 메소드
		//임의의 난수와 사용자 입력한 수를 비교
		//무승부, 사용자승!, 컴퓨터승!
		
		java.util.Scanner sc = new java.util.Scanner(System.in);

		while (true) {
			System.out.println("가위바위보 게임");
			int comNum = (int) (Math.random() * 3) + 1;
			int myNum = sc.nextInt();
			sc.nextLine();
			if (myNum == 0)
				break;
			if (comNum == myNum) {
				System.out.println("무승부");
			} else if ((comNum == 1 && myNum == 2) || (comNum == 2 && myNum == 3) || (comNum == 3 && myNum == 1)) {
				System.out.println("사용자승");
			} else {
				System.out.println("컴퓨터승");
			}
		}
		
		sc.close();
		System.out.println("프로그램 종료");

	}

}

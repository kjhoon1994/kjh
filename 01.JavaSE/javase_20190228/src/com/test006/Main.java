package com.test006;
//패키지
//-클래스 논리적 소속
//-형식 
/*
package 패키지이름;
*/
//-패키지이름의 첫 부분을 java, javax 등으로 시작하면 안된다.
//-회사명, 팀명, 프로젝트명 등을 이용한다
//-같은 패키지는 같은 소속
//-다른 패키지에 소속된 클래스 참조시 import 구문 필요
//-형식
/*
import 패키지이름.클래스이름;
*/
//import 구문 생략 가능한 유일한 패키지로 java.lang 패키지가 있습니다.

import java.util.Scanner;

//콘솔 UI 클래스
public class Main {

	public static void main(String[] args) {
		
		//콘솔 관련 액션 코드 작성
		//콘솔 입력(Scanner), 출력(System.out)
		
		//import 구문 사용 전
		java.util.Scanner sc = new java.util.Scanner(System.in);
		sc.close();
		
		//import 구문 사용 후
		Scanner sc2 = new Scanner(System.in);
		sc2.close();
		

	}

}

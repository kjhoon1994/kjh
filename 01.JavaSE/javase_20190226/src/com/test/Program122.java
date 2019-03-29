/* 
 * 프로그램명: 외부입력-형변환
 * 작성자 : 이민종
 * 작성일 : 20190226
 *  
 */

package com.test;

public class Program122 {

	public static void main(String[] args) {
		
		//형변환
		//특정 형을 가진 자료를 다른 형으로 변환
		//기본자료형 - 기본자료형, 참조 자료형 - 참조 자료형, 기본 자료형 - 참조 자료형
		//예를 들어, double -> int, int -> double, int -> String, String -> int
		
		//기본 자료형끼리의 변환시
		//(자료형)값
		//->명시적 형변환
		//->자료가 손실될 가능성이 있다
		
		//double -> int
		double a = 4.567;
		System.out.println(a);
		int b = (int)a;
		System.out.println(b);
		
		//int -> double
		int c = 123456;
		System.out.println(c);
		//암시적 형변환
		double d = c;
		System.out.println(d);
		//명시적 형변환
		double e = (double)c;
		System.out.println(e);
		
		
		//기본자료형 -> 참조자료형
		//int -> String
		//-> 전용 메소드 사용 필요
		int num = 100;
		System.out.println(num);
		System.out.println(num + 100);
		String snum = String.valueOf(num);
		System.out.println(snum);
		System.out.println(snum + 100);
		
		//String -> int
		String sub1 = "100";
		String sub2 = "90";
		System.out.println(sub1 + sub2);
		System.out.println(Integer.parseInt(sub1)
				 + Integer.parseInt(sub2));

		//int 자료형의 비교 연산
		//==, !=, >, <, >=, <=
		int e1 = 100;
		int e2 = 100;
		if (e1 == e2) {
			System.out.println("e1, e2는 같은 자료");
		} else {
			System.out.println("e1, e2는 다른 자료");
		}
		
		//String 자료형의 비교 연산
		//->비교 연산 전용 메소드 필요
		String n1 = new String("hong");
		String n2 = new String("hong");
		//메모리상의 참조주소 비교
		if (n1 == n2) {
			System.out.println("n1, n2는 같은 자료");
		} else {
			System.out.println("n1, n2는 다른 자료");
		}
		//문자열 자체 비교(대소문자 구분 하는 상태)
		if (n1.equals(n2)) {
			System.out.println("n1, n2는 같은 자료");
		} else {
			System.out.println("n1, n2는 다른 자료");
		}
		//문자열 자체 비교(대소문자 구분 없는 상태)
		if (n1.equalsIgnoreCase(n2)) {
			System.out.println("n1, n2는 같은 자료");
		} else {
			System.out.println("n1, n2는 다른 자료");
		}
		//문자열 자체 비교(대소문자 구분 하는 상태)
		if (n1.compareTo(n2) > 0) {
			System.out.println("n1이 n2보다 큰 자료");
		} else {
			System.out.println("n1이 n2보다 작거나 같은 자료");
		}
		//문자열 자체 비교(대소문자 구분 없는 상태)
		if (n1.compareToIgnoreCase(n2) > 0) {
			System.out.println("n1이 n2보다 큰 자료");
		} else {
			System.out.println("n1이 n2보다 작거나 같은 자료");
		}


	}

}

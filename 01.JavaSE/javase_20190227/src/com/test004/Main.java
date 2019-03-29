package com.test004;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
				
		java.util.Scanner sc = new Scanner(System.in);
		
		CoffeeMachine cm = new CoffeeMachine();
		
		boolean americano = true;
		boolean cappuccino = true;
		boolean cafelatte = true;
		while(true) {
			System.out.println("1.아메리카노 2.카푸치노 3.카페라테");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			if (americano && m == 1) {
				if (cm.americano()) {
					System.out.println("아메리카노 한 잔 나왔습니다.");
				} else {
					americano = false;
					System.out.println("품절 상품입니다.");
				}
			} else if (cappuccino && m == 2) {
				if (cm.cappuccino()) {
					System.out.println("카푸치노 한 잔 나왔습니다.");
				} else {
					cappuccino = false;
					System.out.println("품절 상품입니다.");
				}				
			} else if (cafelatte && m == 3) {
				if (cm.cafelatte()) {
					System.out.println("카페라테 한 잔 나왔습니다.");
				} else {
					cafelatte = false;
					System.out.println("품절 상품입니다.");
				}				
			} else {
				System.out.println("품절 상품입니다.");
			}
		}
		
		sc.close();
		System.out.println("프로그램 종료");

	}

}

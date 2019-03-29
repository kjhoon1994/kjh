package com.emp.service;

import java.util.Scanner;

public class SubMenuService {
	
	public void main(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/2. 기초 정보 관리");
			System.out.println("1. 지역 관리  2. 부서 관리  3. 직위 관리");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	new RegionService().main(sc); break;
			case 2: break;
			case 3: break;
			}

		}		
	}

}

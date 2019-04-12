package emp.service;

import java.util.Scanner;

import emp.persistance.LoginDAO;

public class MainMenuService {
	LoginDAO ldao = new LoginDAO();
	public void mainMenu(Scanner sc, String id_) {
		
		while(true) {
			System.out.println(">>직원관리 v2.0");
			System.out.println("1.직원관리 2.기초정보관리 3.관리자정보관리");
			System.out.print("선택>");
	
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			
			switch(m) {
			case 1: this.menu1(sc); break;
			case 2: this.menu2(sc); break;
			case 3: this.menu3(sc,id_); break;
			
			}
		}
	}
	private void menu1(Scanner sc) {
		while(true) {
			System.out.println(">>직원관리 v2.0 > 1. 직원관리");
			System.out.println("1.직원입력  2.직원전체출력  3.직원검색  4.직원삭제");
			System.out.print("선택>");
			

			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			
			switch(m) {
			case 1: new EmployeeService().menu1_1(sc); break;
			case 2: new EmployeeService().menu1_2(sc); break;
			case 3: new EmployeeService().menu1_3(sc); break;
			case 4: new EmployeeService().menu1_4(sc); break;
			}
		}
		
	}
	private void menu2(Scanner sc) {
	
		while(true) {
			System.out.println(">>직원관리 v2.0 > 2.기초정보관리");
			System.out.println("1. 지역 관리 2. 부서 관리 3. 직위 관리 ");
			System.out.println("선택>");
			
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0) break;
			switch(m) {
			case 1 : new RegionService().menu1(sc); break;
			case 2 : new DepartmentService().menu2(sc);break;
			case 3 : new JobService().menu3(sc); break;
			}
		}
	}
	
	private void menu3(Scanner sc,String id_) {
		while(true) {
		System.out.println("3.관리자정보 관리");
		System.out.println("1.관리자 계정 생성 2. 비밀번호 변경");
		System.out.print("선택>");
		int m = sc.nextInt();
		sc.nextLine();
		if(m == 0) break;
		switch(m) {
		case 1 : this.menu3_1(sc); break;
		case 2 : this.menu3_2(sc, id_); break;
		}
		}
	}
	
	private void menu3_1(Scanner sc) {
		System.out.println("1.관리자 계정 생성 과정");
		System.out.print("생성할 아이디를 입력하세요");
		String newId = sc.nextLine();
		System.out.print("새로운 비밀번호를 입력하세요");
		String newPw = sc.nextLine();
		int result = this.ldao.newadminId(newId, newPw);
		if(result == 1) {
			System.out.println("생성 성공");
		}
		else if(result ==0) {
			System.out.println("생성 실패");
		}
	}
	private void menu3_2(Scanner sc, String id_) {
		
		System.out.println("관리자 비밀번호 변경");
		System.out.print("현재의 비밀번호를 입력하세요");
		String pw_ = sc.nextLine();
		System.out.print("새로운 비밀번호를 입력하세요>");
		String newPw = sc.nextLine();
		
		int result = this.ldao.pwChange(newPw, id_, pw_);
		if (result == 1) {
			System.out.println("비밀번호 변경을 완료하였습니다.");
		}
		else if (result == 0) {
			System.out.println("비밀번호 변경을 실패하였습니다.");
		}
	}

}

package emp.service;

import java.util.Scanner;

import emp.persistance.LoginDAO;

public class LoginService {
	
	// 관리자 로그인 메소드
	public void login(Scanner sc) {
		// 아이디, 패스워드 질의
		// 로그인 메소드 호출
		// 결과에 따라서 
		// 직원관리 액션 진행 또는 에러 메시지 출력
		System.out.print("아이디를 입력하세요>");
		String id_ = sc.nextLine();
		System.out.print("비밀번호를 입력하세요");
		String pw_ = sc.nextLine();
		
		String result = new LoginDAO().login(id_, pw_);
		
		if (result != null) {
			// 관리자 메뉴 로그인 성공시
			System.out.println("로그인 성공");
			new MainMenuService().mainMenu(sc,id_);
			System.out.println("로그아웃");
		}
		else {
			System.out.println("당신은 관리자가 아닙니다.");
		}
	}
	
}

package com.test023;

import java.util.Scanner;

//메뉴 액션용 클래스
public class MemberService {
	
	private MemberDAO dao = new MemberDAO();
	
	//메뉴메소드 호출시 전달 받은 Scanner 객체를 이용해서
	//외부 입력 액션 처리 가능
	public void menu01(Scanner sc) {
		
		if (this.dao.getFull()) {
			System.out.println("더 이상 입력이 안됩니다. ");
		} else {

			System.out.print("회원번호>");
			String mid = sc.nextLine();
			System.out.print("이름>");
			String name = sc.nextLine();
			System.out.print("전화번호>");
			String phone = sc.nextLine();
			System.out.print("이메일>");
			String email = sc.nextLine();
			
			System.out.print("회원정보를 입력할까요(0/1)?");
	        int m_ = sc.nextInt();
	        sc.nextLine();
	    
	        if(m_ == 1){
	    		Member m1 = new Member();
	    		m1.setMid(mid);
	    		m1.setName(name);
	    		m1.setPhone(phone);
	    		m1.setEmail(email);
	    		this.dao.add(m1);
				
	            System.out.println("회원정보가 입력되었습니다.");
	        } else {
	            System.out.println("회원정보가 입력이 취소되었습니다.");
	        }
		}

	}

	public void menu02(Scanner sc) {
		System.out.println("-------------------------------------");
		System.out.println("회원번호/이름/전화번호/이메일");
		//list() 메소드 테스트
		Member[] list = this.dao.list();
		//배열 탐색을 위한 전용 for문
		//->향상된 for문
		for (Member m : list) {
			//주의) 변수 m에 null 값이 있는 경우 오류 발생
			if (m != null) {
				System.out.printf("%s / %s / %s / %s%n"
						, m.getMid(),m.getName(), m.getPhone(),m.getEmail());
			}
		}
	}

}

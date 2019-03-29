package com.test022;

public class Test {

	public static void main(String[] args) {
		
		//MemberDAO 클래스에 대한 테스트
		MemberDAO dao = new MemberDAO();
		
		//add() 메소드 테스트
		//샘플 자료 준비
		Member m1 = new Member();
		m1.setMid("M02");
		m1.setName("park");
		m1.setPhone("010-4321-7654");
		m1.setEmail("park@test.com");
		dao.add(m1);
		
		//list() 메소드 테스트
		Member[] list = dao.list();
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

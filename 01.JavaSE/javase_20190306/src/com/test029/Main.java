package com.test029;

public class Main {

	public static void main(String[] args) {
		
		//배열 저장소
		Member[] members = new Member[10];
		
		//Member 클래스에 대한 객체(instance) 생성
		//매개변수 있는 생성자에 의한 객체 초기화
		Member m1 = new Member("M01", "hong"
					, "010-1234-1234", "hong@test.com");
		members[0] = m1;
		
		//setter에 의한 객체 설정
		Member m2 = new Member();
		m2.setMid("M02");
		m2.setName("park");
		m2.setPhone("010-4321-4321");
		m2.setEmail("park@naver.com");
		members[1] = m2;
		
		//배열 저장소의 자료 탐색
		for (Member m : members) {
			if (m != null) {
				System.out.printf("%s / %s / %s / %s%n"
						, m.getMid()
						, m.getName()
						, m.getPhone()
						, m.getPhone()
						, m.getEmail());
			}
		}
		

	}

}

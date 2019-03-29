package com.test056;

import java.util.Arrays;
import java.util.Comparator;

public class Main {

	public static void main(String[] args) {

		//Member 객체들을 저장할 수 있는 배열 준비
		Member m1 = new Member("hong", "1234");
		Member m2 = new Member("park", "4567");
		Member m3 = new Member("choi", "4321");
		Member[] members = {m1, m2, m3};
		
		//정렬 전 상태 출력
		//->내부적으로 오버라이딩된 toString() 메소드 호출
		System.out.println(Arrays.toString(members));
		
		
		//정렬 액션 추가
		//기준->이름을 abc순으로 정렬
		
		//객체 단위 정렬 -> 내부적으로 comparable 필요 또는 Comparator 구현 필요
		Arrays.sort(members);
		
		//정렬 후 상태 출력
		//->내부적으로 오버라이딩된 toString() 메소드 호출
		System.out.println(Arrays.toString(members));
	

	}

}

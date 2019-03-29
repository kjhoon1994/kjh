package com.test060;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Main {

	public static void main(String[] args) {
		
		//컬렉션 프레임워크
		//다수의 자료를 저장, 운영하는 클래스 집합
		//List, Set, Map 인터페이스를 구현한 클래스
		//List - 값(value)만 저장, 인덱스 제공, 저장 순서 유지, 중복 허용, 정렬 가능. 대표적으로 ArrayList 클래스
		//Set - 값(value)만 저장, 인덱스 제공 불가, 저장 순서 유지 불가, 중복 불가, 정렬 불가. 대표적으로 HashSet 클래스
		//Map - key, value 쌍으로 저장, key가 인덱스 역할, key는 중복 불가, value는 중복 허용. 대표적으로 HashMap 클래스
		
		
		//List 인터페이스의 주요 메소드
		//void add(index, object)
		//Object get(index)
		//Object remove(index)
		//Object set(index, object)
		//void sort(Comparator)
		
		//List 인터페이스 구현 클래스 ArrayList 클래스
		List list = new ArrayList();
		//-> 저장소 크기를 명시적으로 지정하지 않아도 된다
		//-> 자동 확장 
		
		//자료 저장 -> 자료형 구분 없이 아무거나 저장 가능
		//Auto Boxing , 다형성
		list.add(10); //int -> Integer -> Object
		list.add(12.345); //double -> Double -> Object
		list.add("TEST"); //String -> Object
		
		//자료 확인
		System.out.println(list.get(0)); //10
		System.out.println(list.get(1)); //12.345
		System.out.println(list.get(2)); //TEST
	
		//순차적 접근을 통한 자료 확인
		//방법1
		for (int a = 0; a < list.size(); ++a) {
			System.out.println(list.get(a));
		}
		//방법2
		Iterator it = list.iterator();
		while(it.hasNext()) {
			Object o = it.next();
			System.out.println(o);
		}
		//방법3
		for (Object a : list) {
			System.out.println(a);
		}
		
		//자료 삭제
		//->삭제가 진행된 후 자료 이동 발생
		//->인덱스 변동 발생
		System.out.println(list.get(1)); //12.345
		list.remove(0);
		System.out.println(list.get(1)); //TEST
		
		//자료 수정
		System.out.println(list.get(1)); //TEST
		list.set(1, "SAMPLE");
		System.out.println(list.get(1)); //SAMPLE
		
	}

}

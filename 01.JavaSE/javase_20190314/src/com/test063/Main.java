package com.test063;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class Main {

	public static void main(String[] args) {

		//컬렉션 프레임워크
		//다수의 자료를 저장, 운영하는 클래스 집합
		//List, Set, Map 인터페이스를 구현한 클래스
		//List - 값(value)만 저장, 인덱스 제공, 저장 순서 유지, 중복 허용, 정렬 가능. 대표적으로 ArrayList 클래스
		//Set - 값(value)만 저장, 인덱스 제공 불가, 저장 순서 유지 불가, 중복 불가, 정렬 불가. 대표적으로 HashSet 클래스
		//Map - key, value 쌍으로 저장, key가 인덱스 역할, key는 중복 불가, value는 중복 허용. 대표적으로 HashMap 클래스

		//Set 인터페이스 주요 메소드
		//boolean add(object)
		//Iterator iterator()
		//boolean remove(object)
		//int size()
		//boolean isEmpty()

		//Set 인터페이스 구현 클래스 HashSet 클래스(제네릭 포함)
		//제네릭 - 컬렉션에 저장하는 (참조)자료형을 제한하는 기능
		Set<Integer> set = new HashSet<Integer>();
		//-> 저장소 크기를 명시적으로 지정하지 않아도 된다
		//-> 자동 확장 
		
		set.add(10); //int -> Integer
		set.add(new Integer(20)); //Integer
		set.add(30);
		
		//중복 불가
		System.out.println(set.add(10)); //false
		
		//저장소에 저장된 자료 갯수
		System.out.println(set.size());  //3
		
		//순차적 접근
		//인덱스를 지정한 특정 번째 요소 접근 불가
		//방법1
		Iterator<Integer> it = set.iterator();
		while(it.hasNext()) {
			Integer o = it.next();
			System.out.println(o);
		}
		//방법2
		for (Integer a : set) {
			System.out.println(a);
		}
		
		//자료 삭제
		//자료 비교 가능한 경우 삭제 가능
		//사용자 정의 자료형인 경우 자료 비교 가능한 액션 추가 필요
		System.out.println(set.remove(30)); //true
		System.out.println(set.size()); //2
		
		//Set -> List -> 정렬 가능
		List<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		System.out.println(list.toString());
		
	}

}

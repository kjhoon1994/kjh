package com.test061;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
		
		//List 인터페이스 구현 클래스 ArrayList 클래스(제네릭 포함)
		//제네릭 - 컬렉션에 저장하는 (참조)자료형을 제한하는 기능
		List<Integer> list = new ArrayList<Integer>();
		//-> 저장소 크기를 명시적으로 지정하지 않아도 된다
		//-> 자동 확장 
		
		//자료 저장 -> 특정 자료형만 저장 가능
		//Auto Boxing , 다형성
		list.add(10); //int -> Integer -> Object
		list.add(20); //int -> Integer -> Object
		list.add(30); //int -> Integer -> Object
		list.add(new Integer(40)); //Integer -> Object
		
		//자료 확인
		System.out.println(list.get(0)); //10
		System.out.println(list.get(1)); //20
		System.out.println(list.get(2)); //30
	
		//순차적 접근을 통한 자료 확인
		//방법1
		for (int a = 0; a < list.size(); ++a) {
			System.out.println(list.get(a));
		}
		//방법2
		Iterator<Integer> it = list.iterator();
		while(it.hasNext()) {
			Integer o = it.next();
			System.out.println(o);
		}
		//방법3
		for (Integer a : list) {
			System.out.println(a);
		}
		
		//자료 삭제
		//->삭제가 진행된 후 자료 이동 발생
		//->인덱스 변동 발생
		System.out.println(list.get(1)); //20
		list.remove(0);
		System.out.println(list.get(1)); //30
		
		//자료 수정
		System.out.println(list.get(1)); //30
		list.set(1, 50);
		System.out.println(list.get(1)); //50
		
		//자료 정렬
		//기본 자료형이라면 정렬 기준 제시 없어도 가능
		//사용자 정의 자료형을 정렬하려면 Comparable 또는 Comparator 구현 필요
		System.out.println(list.toString());
		Collections.sort(list);
		System.out.println(list.toString());
		
		
	}

}

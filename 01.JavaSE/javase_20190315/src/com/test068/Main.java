package com.test068;

import java.util.Map;
import java.util.Set;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
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

		//Map 인터페이스 주요 메소드
		//Object put(Object key, Object value)
		//Object get(key)
		//Set keySet()
		//Collection values()
		//int size()
		//boolean isEmpty()
		//Object remove(key)
		//Object replace(key, value)
		
		Map<String, String> map = new HashMap<String, String>();

		//자료 입력
		map.put("b", "TEST");
		map.put("d", "SAMPLE");
		map.put("c", "HELLO");
		map.put("a", "HI");

		
		//자료 출력
		System.out.println(map.get("b")); //TEST
		System.out.println(map.get("c")); //HELLO
		
		
		//순차적 접근
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		while(it.hasNext()) {
			String key = it.next();
			System.out.printf("%s / %s%n", key, map.get(key));
		}
		
		
		//자료 삭제
		System.out.println(map.size()); //4
		map.remove("a");
		System.out.println(map.size()); //3
		
		
		//자료 수정
		System.out.println(map.get("b")); //TEST
		map.replace("b", "!@#$");
		System.out.println(map.get("b")); //!@#$
		
		
		//정렬 출력
		//Map -> keySet -> Set -> List -> 정렬 출력
		Set<String> keys2 = map.keySet();
		List<String> keys3 = new ArrayList<String>(keys2);
		Collections.sort(keys3);
		for (String key : keys3) {
			System.out.printf("%s / %s%n", key, map.get(key));
		}
		
		
	}

}

package com.test069;

import java.util.Enumeration;
import java.util.Properties;

public class Main {

	public static void main(String[] args) {
		
		
		//컬렉션 프레임워크
		//다수의 자료를 저장, 운영하는 클래스 집합
		//List, Set, Map 인터페이스를 구현한 클래스
		//List - 값(value)만 저장, 인덱스 제공, 저장 순서 유지, 중복 허용, 정렬 가능. 대표적으로 ArrayList 클래스
		//Set - 값(value)만 저장, 인덱스 제공 불가, 저장 순서 유지 불가, 중복 불가, 정렬 불가. 대표적으로 HashSet 클래스
		//Map - key, value 쌍으로 저장, key가 인덱스 역할, key는 중복 불가, value는 중복 허용. 대표적으로 HashMap 클래스

		//Properties 자료형
		//Map 인터페이스 특성을 가지고 있다
		//key, value가 String 자료형으로 제한
		//물리적 저장이 가능하다
		//어플리케이션의 환경설정 정보 저장시 많이 사용한다
		
		Properties prop = System.getProperties();

		//순차적 접근
		Enumeration<?> e = prop.propertyNames();
		while(e.hasMoreElements()) {
			String key = (String) e.nextElement();
			System.out.printf("%s / %s%n"
					, key, prop.getProperty(key));
		}
		
	}

}

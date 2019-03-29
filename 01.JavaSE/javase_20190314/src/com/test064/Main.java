package com.test064;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class Main {

	public static void main(String[] args) {
		
		//중복되지 않은 난수 저장소
		//대표적인 예가 로또번호 
		//Set 인터페이스 저장소 이용
		
		Random random = new Random();
		Set<Integer> set = new HashSet<Integer>();
		while(true) {
			int temp = random.nextInt(45) + 1;
			set.add(temp);
			if (set.size() >= 5) break;
		}
		List<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		System.out.println(list.toString());

	}

}

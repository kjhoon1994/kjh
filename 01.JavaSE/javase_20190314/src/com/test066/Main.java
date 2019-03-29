package com.test066;

import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {

	public static void main(String[] args) {
		
		//정규표현식(Regular Expression)
		//-문자열 패턴 검색시 사용하는 전용 수식
		//-[], {}, +, -, ? , *, ...
		//예를 들어, 숫자가 4자리로 구성된 경우 검색
		
		//java.util.regex 패키지 필요
		
		Scanner sc = new Scanner(System.in);
		
		Pattern p = Pattern.compile("c[a-z]+");
		
		while(true) {
			System.out.print("임의의 문자열(단어)>");
			String word = sc.nextLine();
			if (word.equals("q") || word.equals("quit")) break;
			Matcher m = p.matcher(word);
			//true -> c, cat, cody, count, ...
			//false -> abstract, bad, c123, cat_
			System.out.println(m.matches());  //true or false
		}
		
		sc.close();
		System.out.println("프로그램 종료");

		
	}

}

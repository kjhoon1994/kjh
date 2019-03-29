package com.test018;

public class Sample {
	
	//매개 변수와 반환값이 모두 있는 경우
	//매개 변수로는 정수 자료 1개, 반환값은 문자열 자료 1개
	public String hex(int dec) {
		
		//진법 변환 액션 코드
		//16로 나눈 나머지를 문자열 처리
		//16로 나눈 몫이 0이 될 때까지 반복
		//예를 들어,
		//십진수 255인 경우
		//16으로 나눈 최초 나머지 15 -> 문자열 처리 "F"
		//16으로 나눈 최초 몫은 15 
		//16으로 나눈 나머지 15 -> 문자열 처리 "FF"

		String[] arr = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
						, "A", "B", "C", "D", "E", "F"};
		
		String result = "";
		while(true) {
			result = arr[dec % 16] + result;
			dec = dec / 16;
			if (dec == 0) break;
		}
		
		return result;
	}
	
}

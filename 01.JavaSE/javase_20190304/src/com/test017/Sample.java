package com.test017;

public class Sample {
	
	//매개 변수와 반환값이 모두 있는 경우
	//매개 변수로는 정수 자료 1개, 반환값은 문자열 자료 1개
	public String bin(int dec) {
		
		//진법 변환 액션 코드
		//2로 나눈 나머지를 문자열 처리
		//2로 나눈 몫이 0이 될 때까지 반복
		//예를 들어,
		//십진수 10인 경우
		//2로 나눈 최초 나머지 0 -> 문자열 처리 "0"
		//2로 나눈 최초 몫은 5 
		//2로 나눈 나머지 1 -> 문자열 처리 "10"
		//2로 나눈 나머지 0 -> 문자열 처리 "010"
		//2로 나눈 나머지 1 -> 문자열 처리 "1010"
		
		String result = "";
		while(true) {
			result = (dec % 2) + result;
			dec = dec / 2;
			if (dec == 0) break;
		}
		
		return result;
	}
	
}

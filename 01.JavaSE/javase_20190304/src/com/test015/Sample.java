package com.test015;

public class Sample {
	
	//문제) 네자리 년도에 해당하는 숫자를 받고, 
	//현재 년도(2019)를 기준으로 나이를 계산해서 출력하는 
	//메소드 작성
	//->매개 변수는 있고, 반환값이 없는 경우
	public void method1(int year) {
		int result = 2019 - year + 1;
		System.out.printf("%d년생은 올해(2019) 기준으로 %d살입니다.%n"
				, year, result);
	}


}

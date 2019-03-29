package com.test003;

//실생활에 존재하는 대상을 객체 지향적 표현
//->클래스
//->예를 들어, 보드마카를 표현한다면 class BoardMarker { }
public class BoardMarker {

	//state -> 프로퍼티
	String color = "black";
	String thick = "normal";

	//behavior -> 메소드
	String write(String msg) {
		//return 구문 추가시
		//메소드 실행 결과를 반환한다
		//String.format() 은 서식이 지정된 문자열을 반환한다
		return String.format("(%s,%s)%s",color, thick, msg);
	}
	
}

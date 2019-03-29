package com.test002;

//실생활에 존재하는 대상을 객체 지향적 표현
//->클래스
//->예를 들어, 프린터를 표현한다면 class Printer { }
public class Printer {

	//state -> 프로퍼티
	//behavior -> 메소드
	
	//state -> ink
	int ink = 200;
	
	//behavior -> print
	//메소드 선언시 매개변수를 이용해서
	//외부에서 자료를 받을 수 있다
	void print(String msg) {
		//잉크 양(객체의 내부적인 상태값) 확인
		if (ink >= 10) {
			//외부에서 전달될 자료를 화면에 출력
			System.out.println(msg);
			//자료 출력 진행시 잉크의 양이 일정하게 감소
			ink -= 10;
		} else {
			//부족시 미리 정해진 메시지 출력
			System.out.println("잉크 부족!");
		}
	}
	
}

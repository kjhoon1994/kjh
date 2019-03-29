package com.test004;

//실생활에 존재하는 대상을 객체 지향적 표현
//->클래스
//->예를 들어, 커피머신을 표현한다면 class CoffeeMachine { }
public class CoffeeMachine {

	//state -> 프로퍼티
	//behavior -> 메소드

	//커피 종류
	//1.아메리카노(에스프레소2 + 워터3)
	//2.카푸치노(에스프레소2 + 스팀밀크1 + 밀크폼2)
	//3.카페라테(에스프레소2 + 스팀밀크2 + 밀크폼1)
	
	//재료
	//1.에스프레소 60
	//2.스팀밀크 30
	//3.밀크폼 30
	//4.워터 30
	
	int esf = 60;
	int sm = 30;
	int mf = 30;
	int wt = 30;
	
	boolean americano() {
		int esf_ = esf - 2;
		int wt_ = wt - 3;
		if (esf_ >= 0 && wt_ >= 0) {
			esf -= 2;
			wt -= 3;
			return true;
		} else {
			return false;
		}
	}
	
	boolean cappuccino() {
		int esf_ = esf - 2;
		int sm_ = sm - 1;
		int mf_ = mf - 2;
		if (esf_ >= 0 && sm_ >= 0 && mf_ >= 0) {
			esf -= 2;
			sm -= 1;
			mf -= 2;
			return true;
		} else {
			return false;
		}
	}
	
	
	boolean cafelatte() {
		int esf_ = esf - 2;
		int sm_ = sm - 2;
		int mf_ = mf - 1;
		if (esf_ >= 0 && sm_ >= 0 && mf_ >= 0) {
			esf -= 2;
			sm -= 2;
			mf -= 1;
			return true;
		} else {
			return false;
		}
	}
	
}

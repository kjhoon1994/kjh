package com.test031;

public class Sample {
	
	//접근제한자
    //클래스, 메소드(생성자), 필드 모두 적용 가능
    //->객체 지향 특징 중 하나인 캡슐화(외부로부터의 접근 제한) 구현
    /*
    Visible to the package, the default. No modifiers are needed.
    Visible to the class only (private).
    Visible to the world (public).
    Visible to the package and all subclasses (protected).
    */

	
	//default
	//외부 노출 불가, 내부 접근 가능
	//내부 범위는 패키지 내부만 가능
	//필드(멤버변수)는 default 상황을 권장하지 않는다
	//접근 제한자 키워드 표시 없다
	
	
	//자동 초기화
	private int a;
	
	//기본 생성자
	//객체의 초기화 담당
	//public 접근제한자 사용
	//객체(instance) 생성시 호출
	public Sample() {
		//내부 private 멤버 접근
		this.a = 10;
	}
	
	
	private void method1() {
		
	}
	
	//객체(instance) 생성 후 호출 가능
	//접근제한자 생략시 default 상황 외부에서 호출 가능
	//같은 패키지 내에서만 접근 가능
	void method2() {
		System.out.println("default");
	}
	
	//타 패키지에서도 접근 가능
	public void method3() {
		System.out.println("public");
	}
	

}

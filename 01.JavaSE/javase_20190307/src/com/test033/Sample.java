package com.test033;

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

	
	//public
	//외부 노출 가능
	//타 패키지에서도 접근 가능
	//클래스, 메소드(생성자)는 기본적으로 public 접근제한자 사용
	
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
	
	//타 패키지에서도 접근 가능
	public void method() {
		System.out.println("public");
	}
	

}

package com.schedule;

//자료형 클래스
public class Schedule {
	
	//일정관리 항목 분석
	//번호(S001, S002, ...), 날짜(YYYY-MM-DD), 내용(200자 이내)

	private String sid;
	private String wdate;
	private String content;
	
	//생성자 오버로딩(Overloading)
	//->생성자 두 개 이상 선언된 상태
	public Schedule() {
		
		//super 생성자 호출
		//->부모 객체의 생성자 호출
		super();
		
		//상속 관계에 있어서 super 생성자 호출시 자동 호출
	}
	//매개변수 있는 생성자 작성시 기본 생성자 같이 작성 
	public Schedule(String wdate, String content) {
		
		//super 생성자 호출
		//->부모 객체의 생성자 호출
		super();
		
		this.wdate = wdate;
		this.content = content;
	}
	//매개변수 있는 생성자 작성시 기본 생성자 같이 작성 
	public Schedule(String sid, String wdate, String content) {
		
		//super 생성자 호출
		//->부모 객체의 생성자 호출
		super();
		
		this.sid = sid;
		this.wdate = wdate;
		this.content = content;
	}
	
	//getter, setter
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
	//toString() 오버라이딩(Overriding)
	@Override
	public String toString() {
		//객체의 상태를 원하는 포맷 문자열로 반환
		//객체의 상태 기본 문자열 -> 패키지.클래스@해쉬코드
		
		//S012 / 2018-07-19 / 일정관리 프로그램 작성
		return String.format("%s / %s / %s"
				, this.sid, this.wdate, this.content);
	}	
	
	
}

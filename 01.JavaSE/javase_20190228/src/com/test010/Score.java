package com.test010;

public class Score {
	/*
	클래스명 : Score
	구성항목 : 학번, 과목1, 과목2, 과목3
	자료형 : 학번은 String, 과목1, 과목2, 과목3은 int

	샘플자료 : 
	"S001", 100, 100, 100
	"S002" ,90, 80, 90
	*/
	
	private String sid;
	private int sub1, sub2, sub3;
	
	
	//이클립스 getter, setter 자동 완성 기능 이용
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getSub1() {
		return sub1;
	}
	public void setSub1(int sub1) {
		this.sub1 = sub1;
	}
	public int getSub2() {
		return sub2;
	}
	public void setSub2(int sub2) {
		this.sub2 = sub2;
	}
	public int getSub3() {
		return sub3;
	}
	public void setSub3(int sub3) {
		this.sub3 = sub3;
	}
	
}

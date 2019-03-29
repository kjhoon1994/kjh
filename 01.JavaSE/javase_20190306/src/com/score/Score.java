package com.score;

//성적 처리용 자료형 클래스
public class Score {
	
	//번호, 이름, 과목1, 과목2, 과목3
	//총점, 평균, 석차
	
	//항목 구성
	//자동 초기화
	private String sid, name;
	private int sub1, sub2, sub3;
	
	//total, avg_ 변수는 사용하지 않기 때문에 삭제

	//석차는 초기값 1로 설정
	//명시적 초기화
	private int rank_ = 1;
	

	//생성자 오버로딩
	//매개변수 있는 생성자
	//화면설계를 기준으로 입력 정보를 매개변수로 지정한다
	public Score() {
		
	}
	//생성자에 의한 초기화
	//객체 생성시 외부에서 전달된 자료를 가지고 프로퍼티 설정
	public Score(String sid, String name
				, int sub1, int sub2, int sub3) {
		this.sid = sid;
		this.name = name;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
	}

	//getter, setter
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getRank_() {
		return rank_;
	}
	public void setRank_(int rank_) {
		this.rank_ = rank_;
	}
	
	//getter
	public int getTotal() {
		//과목 점수들의 합산 결과를 반환
		return this.sub1 + this.sub2 + this.sub3;
	}
	public double getAvg_() {
		//과목 점수들의 평균 결과를 반환
		return (this.sub1 + this.sub2 + this.sub3) / 3.0;
	}
	
}

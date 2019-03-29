package com.score;

//(배열)저장소 운영 클래스
public class ScoreDAO {
	
	//(배열)저장소 준비
	private Score[] scores = new Score[10];
	//인덱스 운영 전용 변수
	private int idx;
	
	//생성자에 의한 초기화
	public ScoreDAO() {
		//샘플 자료 준비
		//매개변수 있는 생성자 호출
		//초기값이 채워진 객체 생성
		Score s = new Score("G001", "hong", 70, 100, 100);
		//배열 저장소에 객체 저장
		this.scores[idx] = s;
		++idx;
		
		/*
		this.scores[idx] = new Score("G002", "park", 100, 90, 100);
		++idx;
		this.scores[idx] = new Score("G003", "choi", 70, 90, 80);
		++idx;
		*/
		
	}
	
	//(배열)저장소 자료 저장 액션 메소드
	public void add(Score s) {
		
	}
	
	//(배열)저장소 자료 (전체)출력 액션 메소드
	//메소드 오버로딩
	public Score[] list() {
		
		//석차 계산 진행
		this.rank_();
		
		//사본 배열 생성
		int len = this.scores.length;
		Score[] scores_ = new Score[len];
		for (int a = 0; a < len; ++a) {
			scores_[a] = this.scores[a];
		}
		
		//사본 배열 반환
		return scores_;

	}

	//(배열)저장소 자료 (검색)출력 액션 메소드
	//메소드 오버로딩
	public Score[] list(String key, String value) {
		return null;
	}
	
	//석차 계산용 메소드
	//private 메소드 - 객체 내부에서만 호출되는 메소드
	private void rank_() {
		for (Score s1 : this.scores) {
			if (s1 == null) continue;
			int rank_ = 1;
			for (Score s2 : this.scores) {
				if (s2 == null) continue;
				if (s1.getTotal() < s2.getTotal()) {
					++rank_;
				}
			}
			s1.setRank_(rank_);
		}
	}
	
	//저장소의 여분 확인 전용 메소드
	public boolean getFull() {
		return this.idx == this.scores.length;
	}

}

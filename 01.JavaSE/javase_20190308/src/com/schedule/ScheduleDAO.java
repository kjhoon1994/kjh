package com.schedule;

//(배열)저장소 운영 클래스
public class ScheduleDAO {

	//배열 저장소 준비
	//->자동 확장 액션 추가
	private Schedule[] schedules = new Schedule[50];
	//인덱스 전용 변수
	private int idx;
	
	//생성자
	public ScheduleDAO() {
		//샘플 일정 객체 등록
		Schedule s = new Schedule("S001", "2019-03-08", "일정관리 구현중...");
		this.schedules[this.idx] = s;
		++this.idx;
	}
	
	//일정 검색 및 출력
	public Schedule[] list(String key, String value) {
		//사본 배열 준비
		Schedule[] temp = new Schedule[this.idx];
		
		//원본 배열 탐색
		int b = 0;
		for (int a = 0; a < this.idx; ++a, ++b) {
			Schedule s = this.schedules[a];
			
			//전체일정 출력인 경우
			if (key.equals("all")) temp[b] = s;
			
			//오늘일정 출력인 경우
			
			//특정일 출력인 경우
			
			//특정월 출력인 겨우
			
			//특정단어포함 출력인 경우
			
			
		}
		
		//사본 배열 반환
		return temp;
	}
	
}

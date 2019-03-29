package com.test023;


//(배열)저장소 운영 클래스
public class MemberDAO {
	
	//프로퍼티 선언
	//Member (객체)자료형을 가진 배열 저장소 선언
	//힙(heap) 공간에 Member 객체 10개까지 저장 가능한 공간 확보
	//스택(stack) 공간에 배열의 참조주소를 저장한 members 변수 확보
	private Member[] members = new Member[10];
	//인덱스 운영 전용 변수
	private int idx;
	
	//저장소의 여분 확인 전용 메소드
	public boolean getFull() {
		return this.idx == this.members.length;
	}
	
	//생성자
	public MemberDAO() {
		//샘플 자료 준비
		Member m = new Member();
		m.setMid("M01");
		m.setName("hong");
		m.setPhone("010-1234-1234");
		m.setEmail("hong@test.com");
		this.members[this.idx] = m;
		++this.idx;
	}
	
	//자료 저장소에 자료 추가
	public void add(Member m) {
		//외부에서 전달받은 Member 객체를 (배열)저장소에 저장
		this.members[this.idx] = m;
		//(배열)저장소의 인덱스 관리를 위한 +1 연산
		++this.idx;
	}
	
	//자료 저장소의 전체 자료 반환
	//->사본 배열(얕은 복사 or 깊은 복사)
	public Member[] list() {
		Member[] members_ = new Member[this.members.length];
		for (int a = 0; a < this.members.length; ++a) {
			members_[a] = this.members[a];
		}
		return members_;
	}
	
	//자료 저장소의 부분 자료 반환
	//->사본 배열(얕은 복사 or 깊은 복사)
	public Member[] list(String key, String value) {
		return null;
	}
	

}

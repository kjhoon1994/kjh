package kiosk.domain;

public class Membership {
	private String phone; // 고객의 핸드폰 번호
	private int point; // 적립된 포인트
	
	// 기본생성자
	public Membership() {}
	
	// 핸드폰 번호, 적립 포인트를 매개변수로 받는 생성자
	public Membership(String phone, int point) {
		this.phone = phone;
		this.point = point;
	}

	// 핸드폰 번호 반환
	public String getPhone() {
		return phone;
	}

	// 적립된 포인트 반환
	public int getPoint() {
		return point;
	}

	// 적립 포인트 설정
	public void setPoint(int point) {
		this.point = point;
	}
}

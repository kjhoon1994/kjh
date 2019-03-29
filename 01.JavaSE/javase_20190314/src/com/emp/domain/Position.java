package com.emp.domain;

//자료형 클래스 - 직위정보
public class Position {
	
	//직위번호(POS01, POS02, ...), 직위명, 최소기본급
	private String posId, posName;
	private int minbasicpay;

	public Position() {
	}
	public Position(String posId, String posName, int minbasicpay) {
		this.posId = posId;
		this.posName = posName;
		this.minbasicpay = minbasicpay;
	}
	
	public String getPosId() {
		return posId;
	}
	public void setPosId(String posId) {
		this.posId = posId;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public int getMinbasicpay() {
		return minbasicpay;
	}
	public void setMinbasicpay(int minbasicpay) {
		this.minbasicpay = minbasicpay;
	}
	
	@Override
	public String toString() {
		return String.format("%s-%s-%s"
					, this.posId, this.posName, this.minbasicpay);
	}

}

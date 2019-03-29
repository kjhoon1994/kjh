package com.emp.domain;

//자료형 클래스 - 지역정보
public class Region {

	//지역번호(REG01, REG02, ...), 지역명
	private String regId, regName;
	
	//생성자
	public Region() {
	}
	public Region(String regId, String regName) {
		this.regId = regId;
		this.regName = regName;
	}
	
	//getter, setter
	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	
	//toString() 오버라이딩
	@Override
	public String toString() {
		return String.format("%s-%s", this.regId, this.regName);
	}	

}

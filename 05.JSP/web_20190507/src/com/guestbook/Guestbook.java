package com.guestbook;

public class Guestbook {

	// 값을 저장하는 필드
	// 글번호(자동 번호 증가), 글쓴이 이름, 글제목, 글쓴 날짜
	// ip주소(xxx.xxx.xxx.xxx), 블라인드처리 유무(0-default 또는 1)
	private int ssn;
	private String name_, title, sdate, ipaddress;
	private int blind;
	private String pw, contents;

	// 생성자
	public Guestbook() {
		super();
		// TODO Auto-generated constructor stub
	}

	// 출력용 매개변수 생성자
	public Guestbook(int ssn, String name_, String title, String sdate, String ipaddress, int blind, String pw,
			String contents) {
		super();
		this.ssn = ssn;
		this.name_ = name_;
		this.title = title;
		this.sdate = sdate;
		this.ipaddress = ipaddress;
		this.blind = blind;
		this.pw = pw;
		this.contents = contents;
	}
	// 입력용 매개변수 생성자
	public Guestbook(int ssn, String name_,String sdate, String ipaddress,int blind, String pw, String contents) {
		super();
		this.ssn=ssn;
		this.name_ = name_;
		this.sdate = sdate;
		this.ipaddress = ipaddress;
		this.blind = blind;
		this.pw = pw;
		this.contents = contents;
	}
	
	public int getSsn() {
		return ssn;
	}


	public void setSsn(int ssn) {
		this.ssn = ssn;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public int getBlind() {
		return blind;
	}

	public void setBlind(int blind) {
		this.blind = blind;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
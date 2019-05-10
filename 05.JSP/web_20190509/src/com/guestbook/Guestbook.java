package com.guestbook;

public class Guestbook {

	// ���� �����ϴ� �ʵ�
	// �۹�ȣ(�ڵ� ��ȣ ����), �۾��� �̸�, ������, �۾� ��¥
	// ip�ּ�(xxx.xxx.xxx.xxx), ����ε�ó�� ����(0-default �Ǵ� 1)
	private int ssn;
	private String name_, sdate, ipaddress;
	private int blind;
	private String pw, contents;

	// ������
	public Guestbook() {
		super();
		// TODO Auto-generated constructor stub
	}

	// ��¿� �Ű����� ������
	public Guestbook(int ssn, String name_, String sdate, String ipaddress, int blind, String pw, String contents) {
		super();
		this.ssn = ssn;
		this.name_ = name_;

		this.sdate = sdate;
		this.ipaddress = ipaddress;
		this.blind = blind;
		this.pw = pw;
		this.contents = contents;
	}

	// �Է¿� �Ű����� ������
	public Guestbook(String name_, String pw, String contents, String ipaddress) {
		super();
		this.name_ = name_;
		this.pw = pw;
		this.contents = contents;
		this.ipaddress = ipaddress;

	}

	// ������ �Ű����� ������
	public Guestbook(int ssn, String pw) {
		super();
		this.ssn = ssn;
		this.pw = pw;

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
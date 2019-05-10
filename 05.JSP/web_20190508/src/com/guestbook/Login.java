package com.guestbook;

public class Login {
	
	// 로그인 사용자의 개인정보
	// 아이디(사번),패스워드 ,*등급(0-admin, 1, 2, 3, ...)*, 이름, 전화번호, 이메일
	
	private String id_ , pwd;
	private int grade;
	private String name_, phone ,email;
	
	
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public Login(String id_, String pwd, int grade, String name_, String phone, String email) {
		super();
		this.id_ = id_;
		this.pwd = pwd;
		this.grade = grade;
		this.name_ = name_;
		this.phone = phone;
		this.email = email;
	}



	// 관리자 로그인
	public Login(String id_, String pwd, int grade) {
		super();
		this.id_ = id_;
		this.pwd = pwd;
		this.grade = grade;
	}
	
	
	// 회원 로그인
	public Login(String id_, String pwd) {
		super();
		this.id_ = id_;
		this.pwd = pwd;
	}

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getName_() {
		return name_;
	}


	public void setName_(String name_) {
		this.name_ = name_;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

		
}

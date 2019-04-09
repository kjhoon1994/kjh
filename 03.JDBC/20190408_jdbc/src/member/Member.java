package member;

// 자료형 클래스
public class Member {
	// 멤버 구성
	// 회원번호, 이름, 전화번호, 이메일
	// 오라클 자료형 NUMBER -> 자바 자료형 int, double
	// 오라클 자료형 VARCHAR2, NVARCHAR2 -> 자바 자료형 String
	// 오라클 자료형 DATE -> 자바 자료형 String 
	private String mid;
	private String name_;
	private String phone;
	private String email;
	
	
	// 기본 생성자
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	// 매개변수 있는 생성자


	public Member(String mid, String name_, String phone, String email) {
		super();
		this.mid = mid;
		this.name_ = name_;
		this.phone = phone;
		this.email = email;
	}

	// getter, setter
	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getName_() {
		return name_;
	}


	public void setName(String name_) {
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
	
	
	
	// toString 오버라이딩
	
	//                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   toString 오버라이딩

}

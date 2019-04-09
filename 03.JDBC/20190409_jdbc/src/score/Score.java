package score;

public class Score {
	// 번호 이름 과목1 과목2 과목3
	// 총점, 평균, 석차
	
	private String sid_, name_;
	private int sub1, sub2, sub3;
	private int total_;
	private double avg_;
	private int rank_;
	
	// 기본 생성자
	public Score() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	// 매개변수 있는 생성자 -> 출력용
	public Score(String sid_, String name_, int sub1, int sub2, int sub3, int total_, double avg_, int rank_) {
		super();
		this.sid_ = sid_;
		this.name_ = name_;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
		this.total_ = total_;
		this.avg_ = avg_;
		this.rank_ = rank_;
	}


	// 매개변수 있는 생성자 -> 입력용
	public Score(String sid_, String name_, int sub1, int sub2, int sub3) {
		super();
		this.sid_ = sid_;
		this.name_ = name_;
		this.sub1 = sub1;
		this.sub2 = sub2;
		this.sub3 = sub3;
	}
		
	// getter, setter
	public String getSid_() {
		return sid_;
	}
	public void setSid_(String sid_) {
		this.sid_ = sid_;
	}
	
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	
	public int getSub1() {
		return sub1;
	}
	public void setSub1(int sub1) {
		this.sub1 = sub1;
	}
	
	public int getSub2() {
		return sub2;
	}
	public void setSub2(int sub2) {
		this.sub2 = sub2;
	}
	
	public int getSub3() {
		return sub3;
	}
	public void setSub3(int sub3) {
		this.sub3 = sub3;
	}
	
	public int getTotal_() {
		return total_;
	}
	public double getAvg_() {
		return avg_;
	}
	public int getRank_() {
		return rank_;
	}
	
	// toString
	


}

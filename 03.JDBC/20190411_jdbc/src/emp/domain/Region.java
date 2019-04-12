package emp.domain;

public class Region {
	
	private String regId, reg_name;
	private int count_;
	public Region() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Region(String regId, String reg_name, int count_) {
		super();
		this.regId = regId;
		this.reg_name = reg_name;
		this.count_ = count_;
	}
	
	public Region(String regId, String reg_name) {
		super();
		this.regId = regId;
		this.reg_name = reg_name;
	}
	
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getReg_name() {
		return reg_name;
	}
	public void setReg_name(String reg_name) {
		this.reg_name = reg_name;
	}
	public int getCount_() {
		return count_;
	}
	public void setCount_(int count_) {
		this.count_ = count_;
	}
	
	
}

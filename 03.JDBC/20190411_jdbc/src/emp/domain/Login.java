package emp.domain;

public class Login {
	
	private String id_, pw_;

	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Login(String id_, String pw_) {
		super();
		this.id_ = id_;
		this.pw_ = pw_;
	}

	public String getId_() {
		return id_;
	}

	public void setId_(String id_) {
		this.id_ = id_;
	}

	public String getPw_() {
		return pw_;
	}

	public void setPw_(String pw_) {
		this.pw_ = pw_;
	}

	@Override
	public String toString() {
		return String.format("%s / %s", id_, pw_);
	}
	
	

}

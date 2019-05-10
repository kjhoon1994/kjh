package com.guestbook;

public class Adminpicture {
	private String pid, pname, pcontents;

	public Adminpicture() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Adminpicture(String pid, String pname, String pcontents) {
		super();
		this.pid = pid;
		this.pname = pname;
		this.pcontents = pcontents;
	}
	

	public Adminpicture(String pname, String pcontents) {
		super();
		
		this.pname = pname;
		this.pcontents = pcontents;
	}


	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public String getPcontents() {
		return pcontents;
	}

	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}
	
	
}

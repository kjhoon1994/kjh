package com.emp.domain;

//자료형 클래스 - 부서정보
public class Department {
	
	//부서번호(DEPT01, DEPT02, ...), 부서명
	private String deptId, deptName;

	public Department() {
	}

	public Department(String deptId, String deptName) {
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	
	@Override
	public String toString() {
		return String.format("%s-%s"
					, this.deptId, this.deptName);
	}
	
}

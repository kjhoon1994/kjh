package emp.domain;

public class Department {
	private String deptId, dept_name;

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Department(String deptId, String dept_name) {
		super();
		this.deptId = deptId;
		this.dept_name = dept_name;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	
}

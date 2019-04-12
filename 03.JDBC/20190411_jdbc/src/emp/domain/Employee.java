package emp.domain;

public class Employee {
	private String empId, name_, ssn, hiredate, phone;
    private String regId,reg_name, deptId, dept_name, jobId, job_title;
	private int basicpay, extrapay,pay;
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Employee(String empId, String name_, String ssn, String hiredate, String phone, String regId,
			String reg_name, String deptId, String dept_name, String jobId, String job_title, int basicpay,
			int extrapay, int pay) {
		super();
		this.empId = empId;
		this.name_ = name_;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.regId = regId;
		this.reg_name = reg_name;
		this.deptId = deptId;
		this.dept_name = dept_name;
		this.jobId = jobId;
		this.job_title = job_title;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
		this.pay = pay;
	}
	
	
	
	public Employee(String name_, String ssn, String hiredate, String phone, String regId, String deptId, String jobId,
			int basicpay, int extrapay) {
		super();
		this.name_ = name_;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.regId = regId;
		this.deptId = deptId;
		this.jobId = jobId;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getName_() {
		return name_;
	}

	public void setName_(String name_) {
		this.name_ = name_;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}

	public int getBasicpay() {
		return basicpay;
	}

	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}

	public int getExtrapay() {
		return extrapay;
	}

	public void setExtrapay(int extrapay) {
		this.extrapay = extrapay;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = this.basicpay + this.extrapay;
	}
	
	
	
	
}

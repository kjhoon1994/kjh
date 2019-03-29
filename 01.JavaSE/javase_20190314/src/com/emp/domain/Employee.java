package com.emp.domain;

//자료형 클래스 - 직원정보
public class Employee {
	
	//사번(EMP001, EMP002, ...), 이름, 주민번호, 입사일, 전화번호
	//지역번호, 부서번호, 직위번호
	//지역명, 부서명, 직위명
	//기본급, 수당, 급여
	private String empId, empName, ssn, hiredate, phone;
	private String regId, deptId, posId;
	private String regName, deptName, posName;
	private int basicpay, extrapay;

	public Employee() {
	}

	public Employee(String empId, String empName, String ssn, String hiredate, String phone, String regId,
			String deptId, String posId, int basicpay, int extrapay) {
		this.empId = empId;
		this.empName = empName;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.regId = regId;
		this.deptId = deptId;
		this.posId = posId;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
	}

	public Employee(String empId, String empName, String ssn, String hiredate, String phone
			, String regId, String regName
			, String deptId, String deptName
			, String posId, String posName
			, int basicpay, int extrapay) {
		this.empId = empId;
		this.empName = empName;
		this.ssn = ssn;
		this.hiredate = hiredate;
		this.phone = phone;
		this.regId = regId;
		this.regName = regName;
		this.deptId = deptId;
		this.deptName = deptName;
		this.posId = posId;
		this.posName = posName;
		this.basicpay = basicpay;
		this.extrapay = extrapay;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
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

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public String getPosId() {
		return posId;
	}

	public void setPosId(String posId) {
		this.posId = posId;
	}

	public String getRegName() {
		return regName;
	}

	public void setRegName(String regName) {
		this.regName = regName;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
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
	
	//급여 전용 getter
	public int getPay() {
		return this.basicpay + this.extrapay;
	}

}

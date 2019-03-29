package com.emp.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.emp.domain.Employee;

public class EmployeeDAO {

	private List<Employee> employees = new ArrayList<Employee>();
	
	public EmployeeDAO() {
		//샘플 자료 준비
		//String empId, String empName, String ssn, 
		//String hiredate, String phone,
		//String regId, String deptId, String posId, 
		//int basicpay, int extrapay
		Employee e = new Employee("EMP001", "hong", "000000-0000000"
					, "2018-01-01", "010-1234-1234"
					, "REG01", "DEPT01", "POS01"
					, 3000000, 1000000);
		this.employees.add(e);
	}
	
	public List<Employee> list(String key) {
		//사번, 이름, 지역, 부서, 직위 기준 정렬 출력
		
		//사본 컬렉션 준비
		List<Employee> temp = new ArrayList<Employee>();
		
		//원본 컬렉션 탐색
		for (Employee e : this.employees) {
			temp.add(e);
		}
		
		//사본 컬렉션 정렬
		Collections.sort(temp, new Comparator<Employee>() {
			@Override
			public int compare(Employee o1, Employee o2) {
				int result = 0;
				
				if (key.equals("empId")) {
					result = o1.getEmpId().compareTo(o2.getEmpId());
				}
				if (key.equals("empName")) {
					result = o1.getEmpName().compareTo(o2.getEmpName());
				}
				if (key.equals("regId")) {
					result = o1.getRegId().compareTo(o2.getRegId());
				}
				if (key.equals("deptId")) {
					result = o1.getDeptId().compareTo(o2.getDeptId());
				}
				if (key.equals("posId")) {
					result = o1.getPosId().compareTo(o2.getPosId());
				}
				
				return result;
			}
		});
		
		//사본 컬렉션 반환
		return temp;
		
	}
	
	public List<Employee> list(String key, String value) {
		//사번, 이름, 지역, 부서, 직위 기준 검색 출력
		
		//사본 컬렉션 준비
		List<Employee> temp = new ArrayList<Employee>();
		
		//원본 컬렉션 탐색
		for (Employee e : this.employees) {
			
			if (key.equals("empId") 
					&& e.getEmpId().equals(value)) {	
				temp.add(e);
			}
		
		}
		
		//사본 컬렉션 정렬
		Collections.sort(temp, new Comparator<Employee>() {
			@Override
			public int compare(Employee o1, Employee o2) {
				int result = 0;
				result = o1.getEmpId().compareTo(o2.getEmpId());
				return result;
			}
		});
		
		//사본 컬렉션 반환
		return temp;
				
	}
	
}

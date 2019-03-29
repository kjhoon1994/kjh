package com.emp.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.emp.domain.Department;
import com.emp.domain.Employee;

public class EmployeeDAO {

	private List<Employee> employees = new ArrayList<Employee>();
	
	public EmployeeDAO() {
		//샘플 자료 준비
		//String empId, String empName, String ssn, 
		//String hiredate, String phone,
		//String regId, String regName
		//String deptId, String deptName
		//String posId, String posName
		//int basicpay, int extrapay
		Employee e = new Employee("EMP001", "hong", "000000-0000000"
					, "2018-01-01", "010-1234-1234"
					, "REG01", "서울"
					, "DEPT01", "개발부"
					, "POS01", "팀장"
					, 3000000, 1000000);
		this.employees.add(e);
	}
	
	//번호 자동 증가 메소드
	public String generateEmpId() {
		String result = null;
		int temp = this.employees.size() + 1;
		if (temp <= 999) {
			result = String.format("EMP%03d", temp);
		}
		return result; //EMP001, EMP002, ..., EMP999
	}
	
	//직원 객체 추가
	public void add(Employee e) {
		//외부에서 전달된 직원 객체 등록
		//->저장소 크기가 자동 증가
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
				if (key.equals("regName")) {
					result = o1.getRegName().compareTo(o2.getRegName());
				}
				if (key.equals("deptName")) {
					result = o1.getDeptName().compareTo(o2.getDeptName());
				}
				if (key.equals("posName")) {
					result = o1.getPosName().compareTo(o2.getPosName());
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
			if (key.equals("empName") 
					&& e.getEmpName().equals(value)) {	
				temp.add(e);
			}
			if (key.equals("regName") 
					&& e.getRegName().contains(value)) {	
				temp.add(e);
			}
			if (key.equals("deptName") 
					&& e.getDeptName().contains(value)) {	
				temp.add(e);
			}
			if (key.equals("posName") 
					&& e.getPosName().contains(value)) {	
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

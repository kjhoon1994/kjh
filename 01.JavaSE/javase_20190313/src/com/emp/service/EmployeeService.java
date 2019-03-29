package com.emp.service;

import java.util.List;
import java.util.Scanner;

import com.emp.dao.EmployeeDAO;
import com.emp.domain.Employee;

public class EmployeeService {
	
	private EmployeeDAO dao = new EmployeeDAO();
	
	public void main(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/1.직원관리");
			System.out.println("1.직원입력  2.직원출력  3.직원검색");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	this.menu1_1(sc); break;
			case 2: this.menu1_2(sc); break;
			case 3: this.menu1_3(sc); break;
			}

		}		
	}

	private void menu1_1(Scanner sc) {
		// TODO Auto-generated method stub
		
	}

	//직원 관리 v1.0/1.직원관리/2.직원출력
	private void menu1_2(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력");
			System.out.println("1.사번기준 2.이름기준 3.지역기준 4.부서기준 5.직위기준");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	this.menu1_2_1(sc); break;
			case 2: this.menu1_2_2(sc); break;
			case 3: this.menu1_2_3(sc); break;
			case 4: this.menu1_2_4(sc); break;
			case 5: this.menu1_2_5(sc); break;
			}

		}
	}

	//직원 관리 v1.0/1.직원관리/2.직원출력/1.사번기준
	private void menu1_2_1(Scanner sc) {
		List<Employee> list = this.dao.list("empId");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/1.사번기준");
		this.print(list);
	}

	private void menu1_2_2(Scanner sc) {
		List<Employee> list = this.dao.list("empName");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/2.이름기준");
		this.print(list);
	}

	private void menu1_2_3(Scanner sc) {
		List<Employee> list = this.dao.list("regId");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/3.지역기준");
		this.print(list);
	}

	private void menu1_2_4(Scanner sc) {
		List<Employee> list = this.dao.list("deptId");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/4.부서기준");
		this.print(list);	
	}

	private void menu1_2_5(Scanner sc) {
		List<Employee> list = this.dao.list("posId");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/5.직위기준");
		this.print(list);		
	}

	private void menu1_3(Scanner sc) {
		// TODO Auto-generated method stub
		
	}
	
	//출력 전용 메소드
	private void print(List<Employee> list) {
		//제목 출력
		System.out.println("--------------------------------------------------------------------------------------------");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		//내용 출력
		for (Employee e : list) {
			//주의)
			//지역명, 부서명, 직위명 출력시
			//지역번호, 부서번호, 직위번호를 가지고 
			//검색 진행 결과를 출력합니다.
			System.out.printf("%s / %s / %s / %s / %s / %s / %s / %s / %,d / %,d / %,d%n"
					, e.getEmpId(), e.getEmpName()
					, e.getSsn(), e.getHiredate()
					, e.getPhone(), e.getRegId()
					, e.getDeptId(), e.getPosId()
					, e.getBasicpay(), e.getExtrapay()
					, e.getPay());
		}
		System.out.printf("총%d명%n", list.size());
	}
	
}

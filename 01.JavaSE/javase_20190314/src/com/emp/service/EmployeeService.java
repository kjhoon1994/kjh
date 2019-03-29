package com.emp.service;

import java.util.List;
import java.util.Scanner;

import com.emp.dao.DepartmentDAO;
import com.emp.dao.EmployeeDAO;
import com.emp.dao.PositionDAO;
import com.emp.dao.RegionDAO;
import com.emp.domain.Department;
import com.emp.domain.Employee;
import com.emp.domain.Position;
import com.emp.domain.Region;

public class EmployeeService {
	
	private EmployeeDAO dao;
	private RegionDAO rdao;
	private DepartmentDAO ddao;
	private PositionDAO pdao;
	public EmployeeService(EmployeeDAO dao, RegionDAO rdao, DepartmentDAO ddao, PositionDAO pdao) {
		this.dao = dao;
		this.rdao = rdao;
		this.ddao = ddao;
		this.pdao = pdao;
	}
	
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

	//직원 관리 v1.0/1.직원관리/1.직원입력
	private void menu1_1(Scanner sc) {

		String empId = this.dao.generateEmpId();

		if (empId != null) {
			
			// 이름
			System.out.print("이름>");
			String empName = sc.nextLine();
			
			// 주민번호 - 패턴검사(정규표현식)
			System.out.print("주민번호>");
			String ssn = sc.nextLine();
			
			// 입사일
			System.out.print("입사일>");
			String hiredate = sc.nextLine();
			
			// 전화번호 - 패턴검사(정규표현식)
			System.out.print("전화번호>");
			String phone = sc.nextLine();
			
			// 지역번호 입력 및 지역명 확인
			List<Region> rlist = this.rdao.list();
			for (Region r : rlist) {
				System.out.println(r.toString());
			}
			String regId = null;
			String regName = null;
			while (true) {
				System.out.print("지역번호>");
				regId = sc.nextLine();
				regName = this.rdao.getRegName(regId);
				if (regName == null) {
					System.out.println("잘못된 입력입니다.");
				} else {
					break;
				}
			}

			// 부서번호 입력 및 지역명 확인
			List<Department> dlist = this.ddao.list();
			for (Department d : dlist) {
				System.out.println(d.toString());
			}
			String deptId = null;
			String deptName = null;
			while (true) {
				System.out.print("부서번호>");
				deptId = sc.nextLine();
				deptName = this.ddao.getDeptName(deptId);
				if (deptName == null) {
					System.out.println("잘못된 입력입니다.");
				} else {
					break;
				}
			}

			// 직위번호 입력 및 직위명 확인
			List<Position> plist = this.pdao.list();
			for (Position p : plist) {
				System.out.println(p.toString());
			}
			String posId = null;
			String posName = null;
			while (true) {
				System.out.print("직위번호>");
				posId = sc.nextLine();
				posName = this.pdao.getPosName(posId);
				if (posName == null) {
					System.out.println("잘못된 입력입니다.");
				} else {
					break;
				}
			}

			// 기본급
			System.out.print("기본급>");
			int basicpay = sc.nextInt();
			sc.nextLine();
			
			// 수당
			System.out.print("수당>");
			int extrapay = sc.nextInt();
			sc.nextLine();
			
			System.out.print("신규 직원 정보를 등록할까요(0/1)>");
			int input = sc.nextInt();
			sc.hasNextLine();
			
			if (input == 1) {
				//신규 직원 정보를 저장소에 저장 요청하는 과정
				Employee e = new Employee(empId, empName, ssn
							, hiredate, phone
							, regId, regName
							, deptId, deptName
							, posId, posName
							, basicpay, extrapay);
				this.dao.add(e);
				System.out.println("신규 직원 정보가 등록되었습니다.");
			} else {
				System.out.println("신규 직원 정보 등록이 취소되었습니다.");
			}

		} else {
			System.out.println("직원 정보 등록 불가!");
		}
	}

	//직원 관리 v1.0/1.직원관리/2.직원출력
	private void menu1_2(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력");
			System.out.println("1.사번기준 2.이름기준 3.지역명기준 4.부서명기준 5.직위명기준");
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
		List<Employee> list = this.dao.list("regName");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/3.지역명기준");
		this.print(list);
	}

	private void menu1_2_4(Scanner sc) {
		List<Employee> list = this.dao.list("deptName");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/4.부서명기준");
		this.print(list);	
	}

	private void menu1_2_5(Scanner sc) {
		List<Employee> list = this.dao.list("posName");
		System.out.println("직원 관리 v1.0/1.직원관리/2.직원출력/5.직위명기준");
		this.print(list);		
	}

	private void menu1_3(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색");
			System.out.println("1.사번기준 2.이름기준 3.지역명기준 4.부서명기준 5.직위명기준");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	this.menu1_3_1(sc); break;
			case 2: this.menu1_3_2(sc); break;
			case 3: this.menu1_3_3(sc); break;
			case 4: this.menu1_3_4(sc); break;
			case 5: this.menu1_3_5(sc); break;
			}

		}
	}
	
	//직원 관리 v1.0/1.직원관리/3.직원검색/1.사번기준
	private void menu1_3_1(Scanner sc) {
		System.out.print("검색>");
		String value = sc.nextLine();
		List<Employee> list = this.dao.list("empId", value);
		System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색/1.사번기준");
		this.print(list);
	}

	private void menu1_3_2(Scanner sc) {
		System.out.print("검색>");
		String value = sc.nextLine();
		List<Employee> list = this.dao.list("empName", value);
		System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색/2.이름기준");
		this.print(list);
	}

	private void menu1_3_3(Scanner sc) {
		System.out.print("검색>");
		String value = sc.nextLine();
		List<Employee> list = this.dao.list("regName", value);
		System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색/3.지역명기준");
		this.print(list);
	}

	private void menu1_3_4(Scanner sc) {
		System.out.print("검색>");
		String value = sc.nextLine();
		List<Employee> list = this.dao.list("deptName", value);
		System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색/4.부서명기준");
		this.print(list);
	}

	private void menu1_3_5(Scanner sc) {
		System.out.print("검색>");
		String value = sc.nextLine();
		List<Employee> list = this.dao.list("posName", value);
		System.out.println("직원 관리 v1.0/1.직원관리/3.직원검색/5.직위명기준");
		this.print(list);
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
					, e.getPhone(), e.getRegName()
					, e.getDeptName(), e.getPosName()
					, e.getBasicpay(), e.getExtrapay()
					, e.getPay());
		}
		System.out.printf("총%d명%n", list.size());
	}
	
}

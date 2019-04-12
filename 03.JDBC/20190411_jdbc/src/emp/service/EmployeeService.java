package emp.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Scanner;

import emp.domain.Department;
import emp.domain.Employee;
import emp.domain.Job;
import emp.domain.Region;
import emp.persistance.DepartmentDAO;
import emp.persistance.EmployeeDAO;
import emp.persistance.JobDAO;
import emp.persistance.RegionDAO;

public class EmployeeService {
	EmployeeDAO edao = new EmployeeDAO();
	JobDAO jdao = new JobDAO();
	DepartmentDAO ddao = new DepartmentDAO();
	RegionDAO rdao = new RegionDAO();

	public void menu1_1(Scanner sc) {

		System.out.println("직원 정보 입력 과정입니다.");
		System.out.print("이름>");
		String name_ = sc.nextLine();
		System.out.print("주민번호>");
		String ssn = sc.nextLine();

		String hiredate;
		while (true) {
			System.out.print("입사일(YYYY-MM-DD)");
			hiredate = sc.nextLine(); // 2020-02-29
			if (this.dateCheck(hiredate))
				break;
			System.out.println("잘못된 입사일 날짜입니다.");
		}
		System.out.print("전화번호(000-0000-0000)>");
		String phone = sc.nextLine();

		String regId;
		while (true) {
			List<Region> list1 = this.rdao.regionList("all", "");
			for (Region r : list1) {
				System.out.printf("%s / %s%n", r.getRegId(), r.getReg_name());
			}
			System.out.print("지역 ID>");
			regId = sc.nextLine();
			if (this.regIdCheck(list1, regId))
				break;
			System.out.println("잘못된 지역ID 입니다.");
		}

		String deptId;
		while (true) {
			List<Department> list2 = this.ddao.departmentlist("all", "");
			for (Department d : list2) {
				System.out.printf("%s / %s%n", d.getDeptId(), d.getDept_name());
			}
			System.out.print("부서 ID>");
			deptId = sc.nextLine();
			if (this.deptIdCheck(list2, deptId))
				break;
			System.out.println("잘못된 부서 ID입니다.");
		}
		String jobId;
		while (true) {
			List<Job> list3 = this.jdao.joblist("all", "");
			for (Job j : list3) {
				System.out.printf("%s / %s%n", j.getJobId(), j.getJob_title());
			}
			System.out.print("직급 ID>");
			jobId = sc.nextLine();
			if (this.jobIdCheck(list3, jobId))
				break;
			System.out.println("잘못된 직급ID입니다.");
		}

		int basicPay;
		while (true) {
			List<Job> list = this.jdao.joblist("all", "");
			System.out.print("기본금>");
			basicPay = sc.nextInt();
			sc.nextLine();
			if (this.basicPayCheck(list, jobId, basicPay))
				break;
			System.out.println("기본금이 적습니다.");
		}
		sc.nextLine();
		System.out.print("수당>");
		int extrapay = sc.nextInt();
		sc.nextLine();
		System.out.println("직원 등록을 할까요?(1/0)");

		int m = sc.nextInt();
		sc.nextLine();

		if (m == 1) {
			Employee e = new Employee(name_, ssn, hiredate, phone, regId, deptId, jobId, basicPay, extrapay);
			int result = this.edao.empAdd(e);
			if (result == 1) {
				System.out.println("직원 등록을 하였습니다.");
			} else if (result == 0) {
				System.out.println("직원 등록을 실패 하였습니다.");
			}
		} else if (m == 0) {
			System.out.println("직원 등록을 취소하였습니다.");
		}
	}

	// 직원 전체 출력
	public void menu1_2(Scanner sc) {
		while (true) {
			System.out.println(">>직원 관리 v2.0 > 1.직원 관리 > 2.직원 전체 출력");
			System.out.println("1.사번정렬  2.이름정렬  3.지역명정렬  4.부서명정렬  5.직위명정렬");
			System.out.print("선택>");

			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0)
				break;

			switch (m) {
			case 1:
				this.menu1_2_1(sc);
				break;
			case 2:
				this.menu1_2_2(sc);
				break;
			case 3:
				this.menu1_2_3(sc);
				break;
			case 4:
				this.menu1_2_4(sc);
				break;
			case 5:
				this.menu1_2_5(sc);
				break;
			}
		}
	}

	public void menu1_2_1(Scanner sc) {
		System.out.println("1.직원 전체 출력 사번 정렬입니다.");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		List<Employee> list = this.edao.empList("sort", "empId");
		this.print(list);
	}

	public void menu1_2_2(Scanner sc) {
		System.out.println("2.직원 전체 출력 이름 정렬입니다.");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		List<Employee> list = this.edao.empList("sort", "name_");
		this.print(list);
	}

	public void menu1_2_3(Scanner sc) {
		System.out.println("3.직원 전체 출력 지역명정렬입니다.");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		List<Employee> list = this.edao.empList("sort", "reg_name");
		this.print(list);
	}

	public void menu1_2_4(Scanner sc) {
		System.out.println("4.직원 전체 출력 부서명 정렬입니다.");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		List<Employee> list = this.edao.empList("sort", "dept_name");
		this.print(list);
	}

	public void menu1_2_5(Scanner sc) {
		System.out.println("5.직원 전체 출력 직위명 정렬입니다.");
		System.out.println("사번 / 이름 / 주민번호 / 입사일 / 전화번호 / 지역명 / 부서명 / 직위명 / 기본급 / 수당 / 급여");
		List<Employee> list = this.edao.empList("sort", "job_title");
		this.print(list);
	}

	public void print(List<Employee> list) {
		for (Employee e : list) {
			System.out.printf("%s / %s / %s / %s / %s / %s / %s / %s / %d / %d / %d%n", e.getEmpId(), e.getName_(),
					e.getSsn(), e.getHiredate(), e.getPhone(), e.getReg_name(), e.getDept_name(), e.getJob_title(),
					e.getBasicpay(), e.getExtrapay(), e.getPay());
		}
	}

	public void menu1_3(Scanner sc) {
		while (true) {
			System.out.println(">>직원 관리 v2.0 > 1.직원 관리 > 3.직원 검색");
			System.out.println("1.사번기준 2.이름기준 3.지역명기준 4.부서명기준 5.직위명기준");
			System.out.print("선택>");

			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0)
				break;

			switch (m) {
			case 1:
				this.menu1_3_1(sc);
				break;
			case 2:
				this.menu1_3_2(sc);
				break;
			case 3:
				this.menu1_3_3(sc);
				break;
			case 4:
				this.menu1_3_4(sc);
				break;
			case 5:
				this.menu1_3_5(sc);
				break;
			}
		}

	}

	// 사번 검색
	private void menu1_3_1(Scanner sc) {
		System.out.println("1.사번 검색입니다.");
		System.out.print("검색 단어");
		String value = sc.nextLine();
		List<Employee> list = this.edao.empList("empId", value);
		this.print(list);
	}

	// 이름 검색
	private void menu1_3_2(Scanner sc) {
		System.out.println("2.이름 검색입니다.");
		System.out.print("검색 단어");
		String value = sc.nextLine();
		List<Employee> list = this.edao.empList("name_", value);
		this.print(list);
	}

	// 지역 검색
	private void menu1_3_3(Scanner sc) {
		System.out.println("3.지역 검색입니다.");
		System.out.print("검색 단어");
		String value = sc.nextLine();
		List<Employee> list = this.edao.empList("reg_name", value);
		this.print(list);
	}

	// 부서 검색
	private void menu1_3_4(Scanner sc) {
		System.out.println("4.부서 검색입니다.");
		System.out.print("검색 단어");
		String value = sc.nextLine();
		List<Employee> list = this.edao.empList("dept_name", value);
		this.print(list);
	}

	// 직위 검색
	private void menu1_3_5(Scanner sc) {
		System.out.println("5.직위 검색입니다.");
		System.out.print("검색 단어");
		String value = sc.nextLine();
		List<Employee> list = this.edao.empList("job_title", value);
		this.print(list);

	}

	// 직원 삭제
	public void menu1_4(Scanner sc) {
		System.out.println(">>직원 관리 v2.0 > 1.직원 관리 > 3.삭제");
		List<Employee> list = this.edao.empList("sort", "empId");

		this.print(list);

		System.out.print("삭제할 직원ID를 입력해 주세요");
		String empId = sc.nextLine();
		
		System.out.print("삭제하시겠습니까?(1/0)");
		int m = sc.nextInt();
		sc.nextLine();

		if (m == 1) {
			int result = this.edao.empRemove(empId);
			if (result == 1) {
				System.out.println("직원 정보가 삭제되었습니다.");
			} else if (result == 0) {
				System.out.println("직원 정보 삭제가 실패했습니다.");
			}
		} else if (m == 0) {
			System.out.println("직원 정보 삭제를 취소하였습니다.");
		}
	}

	private boolean dateCheck(String date_) {
		boolean result = false;
		try {
			String[] temp = date_.split("-");
			int year = Integer.parseInt(temp[0]);
			int month = Integer.parseInt(temp[1]);
			int day = Integer.parseInt(temp[2]);
			LocalDate ld = LocalDate.of(year, month, day);

			result = true;
		} catch (Exception e) {
		}
		return result;
	}

	private boolean basicPayCheck(List<Job> list, String jobId, int basicPay) {
		boolean result = false;

		for (Job j : list) {
			if (j.getJobId().equals(jobId) && j.getBasicpay() <= basicPay) {
				result = true;
			}
		}
		return result;
	}

	private boolean regIdCheck(List<Region> list, String regId) {
		boolean result = false;

		for (Region r : list) {
			if (r.getRegId().equals(regId)) {
				result = true;
			}
		}

		return result;
	}

	private boolean deptIdCheck(List<Department> list, String deptId) {
		boolean result = false;

		for (Department d : list) {
			if (d.getDeptId().equals(deptId)) {
				result = true;
			}
		}

		return result;
	}

	private boolean jobIdCheck(List<Job> list, String jobId) {
		boolean result = false;

		for (Job j : list) {
			if (j.getJobId().equals(jobId)) {
				result = true;
			}
		}

		return result;
	}

}
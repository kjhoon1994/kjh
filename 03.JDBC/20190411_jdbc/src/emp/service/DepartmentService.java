package emp.service;

import java.util.List;
import java.util.Scanner;

import emp.domain.Department;
import emp.persistance.DepartmentDAO;

public class DepartmentService {
	
	private DepartmentDAO ddao = new DepartmentDAO();
	
	public void menu2(Scanner sc) {
		while(true) {
			System.out.println(">>직원관리 v2.0 > 2.기초정보관리 > 2.부서 관리");
			System.out.println("1.부서 입력 2.부서 출력 3.부서 삭제");
			System.out.print("선택 >");
			
			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0)break;
			switch(m) {
				case 1 : this.menu2_1(sc); break;
				case 2 : this.menu2_2(sc); break;
				case 3 : this.menu2_3(sc); break;
			}
		}
	}
	
	// 입력 메소드
	public void menu2_1(Scanner sc) {
		System.out.println("부서 정보 입력 과정입니다.");
		List<Department> list =this.ddao.departmentlist("all","");
		System.out.println("부서번호 / 부서명");
		for (Department d : list) {
			System.out.printf("%s / %s%n", d.getDeptId(), d.getDept_name());
		}
		System.out.print("신규 부서명 >");
		String newdept_name = sc.nextLine();
		System.out.println("신규 부서를 입력할까요?(1/0)");
		int m = sc.nextInt();
		sc.nextLine();
		if( m == 1) {
			int result =this.ddao.deptAdd(newdept_name);
			if(result == 1) {
				System.out.println("신규 부서 정보를 입력하였습니다.");
			}
			if(result ==0 ) {
				System.out.println("신규 부서 정보 입력을 실패 하였습니다.");
			}
		}
		else if(m == 0) {
			System.out.println("신규 부서 정보 입력을 취소하였습니다.");
		}
	}
	
	// 출력 메소드
	public void menu2_2(Scanner sc) {
		System.out.println("부서 정보 출력 과정입니다.");
		List<Department> list =this.ddao.departmentlist("all","");
		System.out.println("-------------------");
		System.out.println("부서번호 / 부서명");
		for (Department d : list) {
			System.out.printf("%s / %s%n", d.getDeptId(), d.getDept_name());
		}
	}
	
	// 삭제 메소드
	public void menu2_3(Scanner sc) {
		System.out.println("부서 정보 삭제 과정입니다.");
		List<Department> list =this.ddao.departmentlist("all","");
		System.out.println("-------------------");
		System.out.println("부서번호 / 부서명");
		for (Department d : list) {
			System.out.printf("%s / %s%n", d.getDeptId(), d.getDept_name());
		}
		System.out.println("-------------------");
		String deptId;
		
		while(true) {
		System.out.print("삭제할 부서 번호");
		deptId = sc.nextLine();
		if(this.deptIdCheck(list,deptId)) break;
		System.out.println("삭제할수 없는 부서 번호 입니다.");
		}
		System.out.println("삭제하시겠습니까?(1/0)");
		int m = sc.nextInt();
		sc.nextLine();
		if (m == 1) {
			int result = this.ddao.deptRemove(deptId);
			if (result == 1) {
				System.out.println("부서가 삭제되었습니다.");
			}
			else if(result == 0) {
				System.out.println("부서 삭제가 실패되었습니다.");
			}
		}
		else if(m == 0) {
			System.out.println("부서 삭제가 취소되었습니다.");
		}
	}

	private boolean deptIdCheck(List<Department> list, String deptId) {
		boolean result = false;
		
		for (Department d : list) {
			if(d.getDeptId().equals(deptId)) {
				result = true;
			}
		}
		return result;
	}
}

package emp.service;

import java.util.List;
import java.util.Scanner;

import emp.domain.Region;
import emp.persistance.RegionDAO;

public class RegionService {

	private RegionDAO rdao = new RegionDAO();

	public void menu1(Scanner sc) {
		while (true) {
			System.out.println(">>직원관리 v2.0 > 2. 기초정보관리 > 1. 지역관리");
			System.out.println("1.지역입력  2.지역출력  3.지역삭제");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)
				break;

			switch (m) {
			case 1:
				menu1_1(sc);
				break;
			case 2:
				menu1_2(sc);
				break;
			case 3:
				menu1_3(sc);
				break;
			}
		}

	}

	// 지역 입력
	private void menu1_1(Scanner sc) {
		System.out.println("지역 정보 입력 과정입니다.");
		List<Region> list = this.rdao.regionList("all", "");
		System.out.println("지역번호 / 지역명 ");
		for (Region r : list) {
			System.out.printf("%s / %s%n", r.getRegId(), r.getReg_name());
		}
		System.out.print("신규 지역 이름>");
		String newreg_name = sc.nextLine();
		System.out.print("신규 지역을 입력할까요?(1/0)");
		int m = sc.nextInt();
		sc.nextLine();
		if (m == 1) {
			int result = this.rdao.regionAdd(newreg_name);

			if (result == 1) {
				System.out.println("신규 지역을 입력 하였습니다.");
			} else {
				System.out.println("신규 지역 입력을 실패하였습니다.");
			}
		} else if (m == 0) {
			System.out.println("신규 지역 입력을 취소하였습니다.");
		}
	}

	// 지역 출력
	private void menu1_2(Scanner sc) {
		System.out.println("지역 정보 출력 과정입니다.");
		List<Region> list = this.rdao.regionList("all", "");
		System.out.println("-------------------");
		System.out.println("지역번호 / 지역명 ");
		for (Region r : list) {
			System.out.printf("%s / %s%n", r.getRegId(), r.getReg_name());
		}

	}

	// 지역 삭제
	private void menu1_3(Scanner sc) {
		System.out.println("지역 정보 삭제 과정입니다.");
		List<Region> list = this.rdao.regionList("all", "");
		System.out.println("-------------------");
		System.out.println("지역번호 / 지역명 / 삭제가능여부");
		for (Region r : list) {
			System.out.printf("%s / %s / %s%n", r.getRegId(), r.getReg_name(), (r.getCount_()==0)? "O":"X");
		}
		System.out.println("-------------------");
		String regId;
		while(true) {
			System.out.print("지역번호>");
			regId = sc.nextLine();
			if(this.regIdCheck(list,regId)) break;
			System.out.println("삭제할 수 없는 지역번호 입니다.");
		}
		
		System.out.print("선택한 지역을 삭제할까요? (1/0)>");
		int m = sc.nextInt();
		sc.nextLine();
		if (m == 1) {
			int result = this.rdao.regionRemove(regId);
			if (result == 1) {
				System.out.println("선택된 지역이 삭제되었습니다.");
			}
			else if(result == 0) {
				System.out.println("선택된 지역 삭제를 실패하였습니다");
			}
		} else if (m == 0) {
			System.out.println("선택된 지역 삭제를 취소하였습니다.");
		}
	}
	// regId 체크 (없는 번호이거나 삭제가능한 번호일 경우 false 반환 / 반대의 경우 true 반환
	private boolean regIdCheck(List<Region> list, String regId) {
		boolean result = false;
		
		for (Region r : list) {
			if(r.getRegId().equals(regId) && r.getCount_() == 0) {
				result = true;
			}
		}
		
		return result;
	}
}

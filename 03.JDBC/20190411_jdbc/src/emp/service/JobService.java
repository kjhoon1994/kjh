package emp.service;

import java.util.List;
import java.util.Scanner;

import emp.domain.Job;
import emp.domain.Region;
import emp.persistance.JobDAO;

public class JobService {

	private JobDAO jdao = new JobDAO();

	public void menu3(Scanner sc) {
		while (true) {
			System.out.println(">>직원관리 v2.0 > 2.기초정보관리 >3.부서 관리");
			System.out.println("1.부서 생성 2.부서 출력 3.부서 삭제");
			System.out.print("선택>");

			int m = sc.nextInt();
			sc.nextLine();
			if (m == 0)
				break;

			switch (m) {
			case 1:
				this.menu3_1(sc);
				break;
			case 2:
				this.menu3_2(sc);
				break;
			case 3:
				this.menu3_3(sc);
				break;
			}
		}
	}

	private void menu3_1(Scanner sc) {
		System.out.println("직위 생성 과정 입니다.");

		List<Job> list = this.jdao.joblist("all", "");
		System.out.println("직위 번호 / 직위명 / 기본지급금 ");
		for (Job j : list) {
			System.out.printf("%s / %s / %d%n", j.getJobId(), j.getJob_title(), j.getBasicpay());
		}
		System.out.print("신규 직위 이름>");
		String newjob_title = sc.nextLine();
		System.out.print("신규 직위의 기본 지급금");
		int min_basicPay = sc.nextInt();
		sc.nextLine();
		System.out.print("신규 직위를 입력할까요?(1/0)");
		int m = sc.nextInt();
		sc.nextLine();
		if (m == 1) {
			int result = this.jdao.jobAdd(newjob_title,min_basicPay);

			if (result == 1) {
				System.out.println("신규 직위를 입력 하였습니다.");
			} else {
				System.out.println("신규 직위 입력을 실패하였습니다.");
			}
		} else if (m == 0) {
			System.out.println("신규 직위 입력을 취소하였습니다.");
		}
	}

	

	private void menu3_2(Scanner sc) {
		// TODO Auto-generated method stub

	}

	private void menu3_3(Scanner sc) {
		// TODO Auto-generated method stub

	}
}

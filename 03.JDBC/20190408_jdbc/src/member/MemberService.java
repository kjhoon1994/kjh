package member;

import java.util.List;
import java.util.Scanner;

public class MemberService {
	private MemberDAO mdao = new MemberDAO();

	// 입력
	public void menu01(Scanner sc) {
		System.out.print("회원번호>");
		String mid = sc.nextLine();
		System.out.print("이름>");
		String name_ = sc.nextLine();
		System.out.print("전화번호>");
		String phone = sc.nextLine();
		System.out.print("이메일>");
		String email = sc.nextLine();

		System.out.println("정보를 입력할까요?(1/0)");
		int a = sc.nextInt();
		sc.nextLine();

		if (a == 1) {
			Member m = new Member(mid, name_, phone, email);
			int re = this.mdao.add(m);
			if(re==1) {
				System.out.printf("%d건 입력되었습니다.%n",re);
			}
			if (re==0) {
				System.out.println("입력실패");
			}

		}
		else if (a == 0) {
			System.out.println("입력이 취소되었습니다.");
		}
	}

	// 출력
	public void menu02(Scanner sc) {
		List<Member> list = mdao.list();
		for (Member m : list) {
			System.out.printf("%s / %s / %s / %s%n", m.getMid(), m.getName_(), m.getPhone(), m.getEmail());
		}
		System.out.printf("총 %d명%n", list.size());

	}
}

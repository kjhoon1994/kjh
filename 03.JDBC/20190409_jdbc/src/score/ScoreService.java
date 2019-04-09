package score;

import java.util.List;
import java.util.Scanner;

//주메뉴당 메뉴별 액션
public class ScoreService {

	// HAS-A 관계 (강한 결합)
	private ScoreDAO dao;

	public ScoreService() {
		this.dao = new ScoreDAO();
	}

	// 1.성적입력 메소드
	public void menu1(Scanner sc) {
		System.out.println("1.성적 입력");
		String sid_ = this.dao.newSid();
		System.out.println(sid_);

		System.out.print("이름>");
		String name_ = sc.nextLine();

		int sub1;
		while (true) {
			System.out.print("과목1>");
			sub1 = sc.nextInt();
			sc.nextLine();
			if (sub1 >= 0 && sub1 <= 100) break;
			System.out.print("입력불가");
		}
		int sub2;
		while (true) {

			System.out.print("과목2>");

			sub2 = sc.nextInt();

			sc.nextLine();

			if (sub2 >= 0 && sub2 <= 100)
				break;

			System.out.print("과목 점수 오류");
		}
		int sub3;
		while (true) {
			System.out.print("과목3>");
			sub3 = sc.nextInt();
			sc.nextLine();
			if (sub3 >= 0 && sub3 <= 100)
				break;
			
			System.out.print("과목 점수 오류");
		
		}
		System.out.print("점수 입력을 하시겠습니까? (1/0)");
		
		int z =sc.nextInt();
		sc.nextLine();
		
		if(z==1) {
			Score s = new Score(sid_, name_, sub1, sub2, sub3);
			int a = this.dao.add(s);
			
			if(a == 1) {
				System.out.println("입력성공");
			}
			if(a == 0){
				System.out.println("입력 실패");
			}
		}
		if(z==0) {
			System.out.println("입력 취소");
		}
	}

	// 2.성적출력 메소드
	public void menu2(Scanner sc) {
		System.out.println("2.성적 정보 출력");
		List<Score> list = dao.list("all", "");
		this.print_(list);
	}

	// 3.성적검색 메소드
	// ->서브메뉴
	public void menu3(Scanner sc) {
		while (true) {

			System.out.println("3.성적정보검색");
			System.out.println("---------------------------------------------");
			System.out.println("1.번호기준  2.이름기준");
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
			}

		}
	}

	// 3.성적검색 /1.번호기준 메소드
	public void menu3_1(Scanner sc) {
		String key = "sid_";
		String value = null;

		System.out.println("3.성적정보 검색/ 1. 번호기준");
		System.out.println("검색>");
		value = sc.nextLine();

		List<Score> list = this.dao.list(key, value);
		this.print_(list);
	}

	// 3.성적검색/2.이름기준 메소드
	public void menu3_2(Scanner sc) {
		String key = "name_";
		String value = null;

		System.out.println("3.성적정보 검색/ 2. 이름기준");
		System.out.println("검색>");
		value = sc.nextLine();

		List<Score> list = this.dao.list(key, value);
		this.print_(list);
	}

	// 출력 전용 메소드
	private void print_(List<Score> list) {

		System.out.println("--------------------------------");
		System.out.println("번호 / 이름 / 과목1 / 과목2 / 과목3 / 총점 / 평균 / 석차");
		for (Score s : list) {
			System.out.printf("%s / %s / %d / %d / %d / %d / %.1f / %d%n", s.getSid_(), s.getName_(), s.getSub1(),
					s.getSub2(), s.getSub3(), s.getTotal_(), s.getAvg_(), s.getRank_());

		}
		if (list.size() == 0) {
			System.out.println("출력 결과가 없습니다.");
		} else {
			System.out.printf("총 %d명 %n", list.size());
		}

	}

}
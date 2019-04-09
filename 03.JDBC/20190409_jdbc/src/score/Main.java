package score;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		ScoreService ss = new ScoreService();
		while(true) {
			System.out.println("**성적관리 v1.0**");
			System.out.println("1.성적정보입력 2.성적정보출력 3.성적정보검색");
			System.out.print("선택>");
			int ch = sc.nextInt();
			sc.nextLine();
			if(ch==0) break;
		
			switch(ch) {
				case 1:ss.menu1(sc); break;
				case 2:ss.menu2(sc); break;
				case 3:ss.menu3(sc); break;
			}
		
		}
		sc.close();
		System.out.println("시스템 종료");
		
	}

}

package account;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		AccountService as = new AccountService();
		while(true) {
			System.out.println("**계좌관리 v1.0**");
			System.out.println("1.계좌조회 2.계좌입금 3.계좌출금 4.종료");
			System.out.print("선택>");
			int ch = sc.nextInt();
			sc.nextLine();
			if (ch==4)break;
			switch(ch) {
			case 1 : as.menu01(sc); break;
			case 2 : as.menu02(sc); break;
			case 3 : as.menu03(sc); break;
			
			// 관리자 전용 메뉴
			case 99: as.adminCheck(sc); break;
			}
		}
		sc.close();
		System.out.println("시스템 종료");
	}

}

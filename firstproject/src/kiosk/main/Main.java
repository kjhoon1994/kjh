package kiosk.main;

import java.util.Scanner;

import kiosk.service.AdminService;
import kiosk.service.CartService;
import kiosk.service.SandwitchService;
import kiosk.service.SideDishService;
import kiosk.dao.KioskDAO;;

public class Main {

	public static void main(String[] args) {
		KioskDAO dao = new KioskDAO();
		SandwitchService sandwitch = new SandwitchService(dao);
		SideDishService sideDish = new SideDishService(dao);
		CartService cart = new CartService(dao);
		AdminService admin = new AdminService(dao);
		Scanner sc = new Scanner(System.in);
 
		while (true) {
 
			System.out.println();
			System.out.println("===================================");
			System.out.println("        서브웨이 무인 주문기       ");
			System.out.println("===================================");
			System.out.println("1 샌드위치 주문");
			System.out.println("2 사이드 주문 ");
			System.out.println("3 장바구니(결제)");
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)
				break;

			switch (m) {
			case 1: sandwitch.menu1(sc); break;
			case 2: sideDish.menu2(sc); break;
			case 3: cart.menu3(sc); break;
			case 99:
				System.out.print("비밀번호 : ");
				String pwd = sc.nextLine();
				if(pwd.equals(admin.getpwd())) {
					admin.menu99(sc);
					break;
				}else {
					System.out.println("비밀번호가 틀렸습니다.");
					break;
				}
					
			}

		}
		sc.close();
		System.out.println("프로그램 종료");
	}

}



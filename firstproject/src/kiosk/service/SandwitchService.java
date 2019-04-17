package kiosk.service;

import kiosk.domain.Item;
import kiosk.domain.SubOrder;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import kiosk.dao.KioskDAO;

public class SandwitchService {

	private KioskDAO dao = null;

	// 기본생성자
	public SandwitchService() {

	}

	// dao 초기화 생성자
	public SandwitchService(KioskDAO dao) {
		this.dao = dao;
	}
 
	// 메인메뉴 주문
	public void menu1(Scanner sc) {
		List<Item> item = new ArrayList<Item>();
		Item temp = this.sandwitch(sc);
		if (temp == null)
			return;
		item.add(temp);

		Item tempb = this.bread(sc);
		if (tempb == null)
			return;
		item.add(tempb);

		List<Item> tempv = this.vegetable(sc);
		if (tempv == null)
			return;
		for (Item i : tempv) {
			item.add(i);
		}

		List<Item> temps = this.sauce(sc);
		if (temps == null)
			return;
		for(Item i : temps) {
			item.add(i); 
		}

		System.out.print("샌드위치 수량 : ");
		int countchoice = sc.nextInt();
		sc.nextLine();
		SubOrder sub = new SubOrder(item, countchoice);
		this.dao.addToCart(sub);
		
		List<String> carts = this.dao.getCart().listSubOrders();
		
		System.out.println("장바구니에 추가되었습니다.");
		System.out.println("");
		System.out.println("--- 현재 장바구니에 추가된 메뉴 ---");
		for (int a = 0; a < carts.size(); ++a) {
			System.out.printf("%d %s%n", a + 1, carts.get(a));
		}
		System.out.println("-----------------------------------");
	}

	// 샌드위치 선택
	private Item sandwitch(Scanner sc) {
		List<Item> item = new ArrayList<Item>();
		Item items = new Item();
		
		System.out.println();
		System.out.println("뒤로가기 = 0");
		System.out.println("===================================");
		System.out.println("           샌드위치 선택           ");
		System.out.println("===================================");
		System.out.println(" 품목번호  품목명   가격");
		item = this.dao.listItem("SA");
		int i;
		for (i = 0; i < item.size(); ++i) {
			System.out.printf("%3d  %3s  %3d%n", i + 1, item.get(i).getName(), item.get(i).getPrice());
		}

		System.out.println("-----------------------------------");
		System.out.print("선택 : ");
		int sandchoice = sc.nextInt();
		sc.nextLine();
		if (sandchoice == 0)
			return null;
		items = item.get(sandchoice - 1);

		return items;
	}

	private Item bread(Scanner sc) {
		List<Item> item = new ArrayList<Item>();
		Item items = new Item();
		
		System.out.println();
		System.out.println("뒤로가기 = 0");
		System.out.println("===================================");
		System.out.println("              빵 선택              ");
		System.out.println("===================================");
		System.out.println("번호  이름");
		item = this.dao.listItem("BR");
		int i;
		for (i = 0; i < item.size(); ++i) {
			System.out.printf("%3d  %3s%n", i + 1, item.get(i).getName());
		}

		System.out.println("----------------------------------");
		System.out.print("선택 : ");
		int breadchoice = sc.nextInt();
		sc.nextLine();
		if (breadchoice == 0)
			return null;
		items = item.get(breadchoice - 1);

		return items;
	}

	// 야채선택
	private List<Item> vegetable(Scanner sc) {
		List<Item> item = new ArrayList<Item>();
		List<Item> vegetables = new ArrayList<Item>();
		String vcheck = "V";
		String vcheckx = "";

		while (true) {
			System.out.println();
			System.out.println("뒤로가기 = 0");
			System.out.println("===================================");
			System.out.println("             야채 선택             ");
			System.out.println("===================================");
			item = this.dao.listItem("VE");

			int i;

			for (i = 0; i < item.size(); ++i) {
				if (vegetables.indexOf(item.get(i)) >= 0) {

					System.out.printf("%3d  %3s  %3s%n", i + 1, item.get(i).getName(), vcheck);
				} else {
					System.out.printf("%3d  %3s  %3s%n", i + 1, item.get(i).getName(), vcheckx);
				}
			}

			System.out.printf("%3d 선택완료%n", i + 1);
			System.out.println("-----------------------------------");
			System.out.println("야채의 번호를 선택해주세요");
			System.out.print("선택 : ");
			int vegechoice = sc.nextInt();
			sc.nextLine();
			if (vegechoice == 0)
				return null;
			if (vegechoice == i + 1) {
				return vegetables;

			} else {
				int idx = vegetables.indexOf(item.get(vegechoice - 1));
				if (idx >= 0) {
					vegetables.remove(idx);
				} else {
					vegetables.add(item.get(vegechoice - 1));
				}
			}
			
		}
		

	}

	// 소스선택
	private List<Item> sauce(Scanner sc) { 

		List<Item> item = new ArrayList<Item>();
		List<Item> sauces = new ArrayList<Item>();
		String scheck = "V";
		String scheckx = "";
		while (true) {
			System.out.println();
			System.out.println("뒤로가기 = 0");
			System.out.println("===================================");
			System.out.println("              소스 선택                         ");
			System.out.println("===================================");
			System.out.println("번호  이름");
			item = this.dao.listItem("SO");
			int i;
			for (i = 0; i < item.size(); ++i) {

				if (sauces.indexOf(item.get(i)) >= 0) {
					System.out.printf("%3d  %3s  %3s%n", i + 1, item.get(i).getName(), scheck);
				} else {
					System.out.printf("%3d  %3s  %3s%n", i + 1, item.get(i).getName(), scheckx);
				}
			}

			System.out.printf("%3d 선택완료%n", i + 1);
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");

			int saucechoice = sc.nextInt();
			sc.nextLine();
			if (saucechoice == 0)
				return null;
			if (saucechoice == i + 1) {
				return sauces;

			} else {
				int idx = sauces.indexOf(item.get(saucechoice - 1));
				if (idx >= 0) {
					sauces.remove(idx);
				} else {
					sauces.add(item.get(saucechoice - 1));
				}
			}
		}

	}
}
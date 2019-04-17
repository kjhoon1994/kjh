package kiosk.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


import kiosk.dao.KioskDAO;
import kiosk.domain.Item;
import kiosk.domain.Order;
import kiosk.domain.SubOrder;

public class AdminService {
	
	KioskDAO dao = null;
	String pwd = null;
	
	//기본생성자
	public AdminService() {
		
	}
	
	//dao, pwd 초기화 생성자
	//저장소 및 비밀번호 지정 생성자
	public AdminService(KioskDAO dao) {
		this.dao = dao;
		this.pwd = "123456";
	}

	
	//관리자 로그인 암호 
	//입력받은 비밀번호의 확인을 위해 비밀번호를 반환하는 메소드
	public String getpwd() {
		return this.pwd;
	}
	
	//99.관리자 메뉴
	//관리자 메뉴들에 접근하기 위한 메소드
	public void menu99(Scanner sc) {
		while(true) {
			System.out.println("뒤로가기  = 0");
			System.out.println("===================================");
			System.out.println("             관리자 메뉴                       ");
			System.out.println("===================================");
			System.out.println("1. 메뉴 관리                                           ");
			System.out.println("2. 일일 결산                                           ");
			System.out.println("3. 월말 결산                                           ");
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");
			int choice = sc.nextInt();
			sc.nextLine();
			
			if(choice == 0) break;
			
			switch(choice) {
			case 1: this.itemEdit(sc); break;
			case 2: this.daily(sc); break;
			case 3: this.monthly(sc); break;
			}
		}
	}
	
	//99.관리자메뉴 - 1.메뉴 관리
	//판매하는 메뉴들의 추가, 수정(가격), 삭제에 접근하기 위한 메소드
	private void itemEdit(Scanner sc) {
		while(true) {
			System.out.println("뒤로가기  = 0");
			System.out.println("===================================");
			System.out.println("              메뉴 관리                        ");
			System.out.println("===================================");
			System.out.println("1. 신 메뉴 추가                                        ");
			System.out.println("2. 기존 메뉴 삭제                                     ");
			System.out.println("3. 기존 메뉴 가격 변경                               ");
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");
			int choice = sc.nextInt();
			sc.nextLine();
			
			if(choice == 0) break;
			
			switch(choice) {
			case 1: this.itemAdd(sc); break;
			case 2: this.itemDelete(sc); break;
			case 3: this.changeItemPrice(sc); break;
			}
		}
	}
	
	//99.관리자메뉴 - 1.메뉴 관리 - 1.신 메뉴 추가
	//신 메뉴 추가를 위한 메소드
	private void itemAdd(Scanner sc) {
		List<Item> tmp = null;
		Item item = null;
		int category = 0;
		String categoryId = "";
		String categoryName = "";
		
		System.out.println("카테고리 종류 중 하나를 선택하세요");
		System.out.println("-> 1.샌드위치, 2.빵, 3.야채, 4.소스, 5.사이드");
		System.out.print("선택 : ");
		category = sc.nextInt();
		sc.nextLine();
		
		switch(category) {
		case 1: categoryName = "샌드위치"; categoryId = "SA"; break;
		case 2: categoryName = "빵"; categoryId = "BR"; break;
		case 3: categoryName = "야채"; categoryId = "VE"; break;
		case 4: categoryName = "소스"; categoryId = "SO"; break;
		case 5: categoryName = "사이드"; categoryId = "SI"; break;
		default: System.out.println("잘못된 입력입니다."); return;
		}
		
		System.out.printf("현재 등록된 %s의 종류", categoryName);
		System.out.println();
		System.out.print("-> ");
		
		tmp = this.dao.listItem(categoryId);
		for(Item l : tmp) {
			System.out.printf("%s ",l.getName());
		}
		System.out.println();
		
		System.out.print("추가할 메뉴 이름 : ");
		String name = sc.nextLine();
		System.out.print("가격 : ");
		int price = sc.nextInt();
		sc.nextLine();
		
		item = new Item(categoryId, name, price);
		this.dao.addItem(item);
		
		System.out.println("메뉴가 추가되었습니다.");
	}
	
	//99.관리자메뉴 - 1.메뉴 관리 - 2.기존 메뉴 삭제
	//기존 메뉴 삭제를 위한 메소드
	private void itemDelete(Scanner sc) {
		List<Item> tmp = null;
		int category = 0;
		String categoryId = "";
		String categoryName = "";
		
		System.out.println("카테고리 종류 중 하나를 선택하세요");
		System.out.println("-> 1.샌드위치, 2.빵, 3.야채, 4.소스, 5.사이드");
		System.out.print("선택 : ");
		category = sc.nextInt();
		sc.nextLine();
		
		switch(category) {
		case 1: categoryName = "샌드위치"; categoryId = "SA"; break;
		case 2: categoryName = "빵"; categoryId = "BR"; break;
		case 3: categoryName = "야채"; categoryId = "VE"; break;
		case 4: categoryName = "소스"; categoryId = "SO"; break;
		case 5: categoryName = "사이드"; categoryId = "SI"; break;
		default: System.out.println("잘못된 입력입니다."); return;
		}
		
		System.out.printf("현재 등록된 %s의 종류", categoryName);
		System.out.println();
		System.out.print("-> ");
		
		tmp = this.dao.listItem(categoryId);
		for(Item l : tmp) {
			System.out.printf("%s ",l.getName());
		}
		System.out.println();
		
		System.out.print("삭제할 메뉴 이름 : ");
		String name = sc.nextLine();
		
		this.dao.deleteItem(categoryId, name);
	}
	
	//99.관리자메뉴 - 1.메뉴 관리 - 3.기존 메뉴 가격 변경
	//기존 메뉴의 가격을 수정하기 위한 메소드
	private void changeItemPrice(Scanner sc) {
		List<Item> tmp = null;
		Map<String, String> remember1 = new HashMap<String, String>();
		Map<String, String> remember2 = new HashMap<String, String>();
		int category = 0;
		String categoryId = "";
		String categoryName = "";
		int count = 0;
		
		System.out.println("카테고리 종류 중 하나를 선택하세요");
		System.out.println("-> 1.샌드위치, 2.빵, 3.야채, 4.소스, 5.사이드");
		System.out.print("선택 : ");
		category = sc.nextInt();
		sc.nextLine();
		
		switch(category) {
		case 1: categoryName = "샌드위치"; categoryId = "SA"; break;
		case 2: categoryName = "빵"; categoryId = "BR"; break;
		case 3: categoryName = "야채"; categoryId = "VE"; break;
		case 4: categoryName = "소스"; categoryId = "SO"; break;
		case 5: categoryName = "사이드"; categoryId = "SI"; break;
		default: System.out.println("잘못된 입력입니다."); return;
		}
		
		while(true) {
			System.out.printf("현재 등록된 %s의 종류", categoryName);
			System.out.println();
			System.out.println("번호 이름 가격");
			
			tmp = this.dao.listItem(categoryId);
			for(Item l : tmp) {
				System.out.printf("%2d %s %d",++count, l.getName(), l.getPrice());
				System.out.println();
				remember1.put(String.valueOf(count), l.getName());
				remember2.put(String.valueOf(count), String.valueOf(l.getPrice()));
			}
			System.out.printf("%2d 선택완료", ++count);
			System.out.println();
			
			System.out.print("메뉴 번호 : ");
			String idx = sc.nextLine();
			
			if(idx.equals(String.valueOf(count))) break;
			
			System.out.printf("기존가격 %s",remember2.get(idx));
			System.out.println();
			
			System.out.print("번경할 가격 : ");
			int changePrice = sc.nextInt();
			sc.nextLine();
			
			this.dao.changePrice(categoryId, remember1.get(idx), changePrice);
			
			System.out.println("가격이 변경되었습니다.");
			
			count = 0;
			remember1.clear();
			remember2.clear();
		}
	}
	
	//99.관리자메뉴 - 2.일일결산
	//금일 및 전일 결산에 접근하기 위한 메소드
	private void daily(Scanner sc) {
		while(true) {
			System.out.println("뒤로가기  = 0");
			System.out.println("===================================");
			System.out.println("              일일 결산                        ");
			System.out.println("===================================");
			System.out.println("1. 전일 결산                                           ");
			System.out.println("2. 금일 결산                                           ");
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");
			int choice = sc.nextInt();
			sc.nextLine();
			
			if(choice == 0) break;
			
			switch(choice) {
			case 1: this.yesterday(); break;
			case 2: this.today(); break;
			}
		}
	}
	
	//99.관리자메뉴 - 2.일일결산 - 1.전일 결산
	//전일 결산을 위한 메소드
	private void yesterday() {
		String date = LocalDate.now().minusDays(1).format(DateTimeFormatter.ISO_LOCAL_DATE); 
		List<Order> list = dao.listOrder(date);
		List<Item> list3 = new ArrayList<Item>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", "start");
		
		int sum = 0;
		boolean switch_ = false;
		
		System.out.println("-----------------------------------");
		System.out.printf("%s 주문 건수 %d", date, list.size());
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.println("품목별 판매량");
		
		for(int i = 0; i < list.size(); ++i) {
			List<SubOrder> sub = list.get(i).getItem();
			for(int j = 0; j < sub.size(); ++j) {
				List<Item> item = sub.get(j).getItem();
				for(Item it : item) {
					Set<String> keys = map.keySet();
					Iterator<String> ite = keys.iterator();
					while(ite.hasNext()) {
						String key = ite.next();
						if(map.get(it.getName()) == null) {
							switch_ = true;
							break;
						}else if(it.getName() == key){
							int count = Integer.parseInt(map.get(it.getName())) + sub.get(j).getCount();
							map.replace(it.getName(), String.valueOf(count));
						}	
					}
					if(switch_ == true) {
						list3.add(it);
						map.put(it.getName(), String.valueOf(sub.get(j).getCount()));
						switch_ = false;
					}
				}
			}
		}
		
		for(Item i : list3) {
			String name =  i.getName();
			int count = Integer.parseInt(map.get(i.getName()));
			int price = i.getPrice() * count;
			sum += price;
			System.out.printf("%s %s %s",name ,count ,price);
			System.out.println();
		}
		
		System.out.println("-----------------------------------");
		System.out.printf("총 매출액 %d원", sum);
		System.out.println();
	}
	
	//99.관리자메뉴 - 2.일일결산 - 2.금일 결산
	//금일 결산을 위한 메소드
	private void today() {
		String date = LocalDate.now().format(DateTimeFormatter.ISO_LOCAL_DATE); 
		List<Order> list = dao.listOrder(date);
		List<Item> list3 = new ArrayList<Item>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", "start");
		
		int sum = 0;
		boolean switch_ = false;
		
		System.out.println("-----------------------------------");
		System.out.printf("%s 주문 건수 %d", date, list.size());
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.println("품목별 판매량");
		
		for(int i = 0; i < list.size(); ++i) {
			List<SubOrder> sub = list.get(i).getItem();
			for(int j = 0; j < sub.size(); ++j) {
				List<Item> item = sub.get(j).getItem();
				for(Item it : item) {
					Set<String> keys = map.keySet();
					Iterator<String> ite = keys.iterator();
					while(ite.hasNext()) {
						String key = ite.next();
						if(map.get(it.getName()) == null) {
							switch_ = true;
							break;
						}else if(it.getName() == key){
							int count = Integer.parseInt(map.get(it.getName())) + sub.get(j).getCount();
							map.replace(it.getName(), String.valueOf(count));
						}	
					}
					if(switch_ == true) {
						list3.add(it);
						map.put(it.getName(), String.valueOf(sub.get(j).getCount()));
						switch_ = false;
					}
				}
			}
		}
		
		for(Item i : list3) {
			String name =  i.getName();
			int count = Integer.parseInt(map.get(i.getName()));
			int price = i.getPrice() * count;
			sum += price;
			System.out.printf("%s %s %s",name ,count ,price);
			System.out.println();
		}
		
		System.out.println("-----------------------------------");
		System.out.printf("총 매출액 %d원", sum);
		System.out.println();
	}
	
	//99.관리자메뉴 - 3.월말결산
	//월말 결산할 달을 선택하기 위한 메소드
	private void monthly(Scanner sc) {
		while(true) {
			Map<String, Integer> list = this.dao.listMonthly();
			Map<Integer, String> list2 = new HashMap<Integer, String>();
			Set<String> keys = list.keySet();
			Iterator<String> ite = keys.iterator();
			int count = 0;
		
		
			System.out.println("뒤로가기  = 0");
			System.out.println("===================================");
			System.out.println("            월별 매출액                      ");
			System.out.println("===================================");
			while(ite.hasNext()) {
				String key = ite.next();
				System.out.printf("%d %s %s",++count, key, list.get(key));
				list2.put(count, key);
				System.out.println();
			}
			System.out.println("-----------------------------------");
			System.out.print("선택 : ");
			int choice = sc.nextInt();
			sc.nextLine();
			
			
			
			
			if(choice == 0) {
				break;
			}
			else {
				this.oneMonth(sc, list2.get(choice));
			}
		}
	}
	
	//99.관리자메뉴 - 3.월말결산 - 선택한 달 결산
	//월말 결산을 하기 위한 메소드
	private void oneMonth(Scanner sc, String date) {
		List<Order> list = dao.listOrder(date);
		List<Item> list3 = new ArrayList<Item>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", "start");
		
		int sum = 0;
		boolean switch_ = false;
		
		System.out.println("-----------------------------------");
		System.out.printf("%s 주문 건수 %d", date, list.size());
		System.out.println();
		System.out.println("-----------------------------------");
		System.out.println("품목별 판매량");
		
		for(int i = 0; i < list.size(); ++i) {
			List<SubOrder> sub = list.get(i).getItem();
			for(int j = 0; j < sub.size(); ++j) {
				List<Item> item = sub.get(j).getItem();
				for(Item it : item) {
					Set<String> keys = map.keySet();
					Iterator<String> ite = keys.iterator();
					while(ite.hasNext()) {
						String key = ite.next();
						if(map.get(it.getName()) == null) {
							switch_ = true;
							break;
						}else if(it.getName() == key){
							int count = Integer.parseInt(map.get(it.getName())) + sub.get(j).getCount();
							map.replace(it.getName(), String.valueOf(count));
						}	
					}
					if(switch_ == true) {
						list3.add(it);
						map.put(it.getName(), String.valueOf(sub.get(j).getCount()));
						switch_ = false;
					}
				}
			}
		}
		
		for(Item i : list3) {
			String name =  i.getName();
			int count = Integer.parseInt(map.get(i.getName()));
			int price = i.getPrice() * count;
			sum += price;
			System.out.printf("%s %s %s",name ,count ,price);
			System.out.println();
		}
		
		System.out.println("-----------------------------------");
		System.out.printf("총 매출액 %d원", sum);
		System.out.println();
		System.out.println();
		System.out.println("이 달의 결산 내역을 삭제하시겠습니까?");
		System.out.println("1.삭제 2.보관");
		System.out.print("선택 : ");
		int choice = sc.nextInt();
		sc.nextLine();
		
		if(choice == 1) {
			this.dao.deleteOrder(date);
		}
	}
}

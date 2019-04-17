package kiosk.service;

import java.util.List;
import java.util.Scanner;

import kiosk.dao.KioskDAO;
import kiosk.domain.Membership;
import kiosk.domain.Order;
import kiosk.domain.SubOrder;

public class CartService {
	private KioskDAO dao;
	
	public CartService() {
		
	}
	
	public CartService(KioskDAO dao) {
		this.dao = dao;
	}
	
	//장바구니(결제) 메뉴
	public void menu3(Scanner sc) {
		
		while(true) {
			//총 결제 금액
			int total = 0;
			
			System.out.println();
			System.out.println("뒤로가기 = 0");
			System.out.println("===================================");
			System.out.println("           장바구니 (결제)"         );
			System.out.println("===================================");
			
			//장바구니에 저장된 내역 출력
			//oredr.listSubOrder()를 이용해 List<String>을 반환받아 출력
			Order order = dao.getCart();
			
			for(int i = 0; i < order.getItem().size(); ++i) {
				System.out.printf("%d %s %n", i + 1, order.listSubOrders().get(i));
			}
			
			//총 결제 금액 반환
			List<SubOrder> subOrder = order.getItem();
			
			for(int i = 0; i < subOrder.size(); ++i) {
				total += subOrder.get(i).getPrice();
			}
			
			//결제할 사항이 없는 경우와 있는 경우를 나눠서 출력
			if(total == 0) {
				System.out.println("주문 내역이 없습니다.");
				break;
			} else {
				System.out.println("-----------------------------------");
				System.out.printf("총 금액 : %d원\n", total);
				System.out.println("-----------------------------------");
				System.out.println("1. 결제하기");
				System.out.println("2. 삭제하기");
				System.out.println("-----------------------------------");
				System.out.print("선택 : ");
			}
			
			int input = sc.nextInt();
			sc.nextLine();
			
			//결제하기 또는 삭제하기 메뉴로 이동
			if(input == 0) {
				return;
			} else if(input == 1) {
				System.out.println();
				System.out.println("뒤로가기 = 0");
				System.out.println("===================================");
				System.out.println("           결제 방법 선택          ");
				System.out.println("===================================");
				System.out.println("1. 일반 카드 결제");
				System.out.println("2. 포인트 적립 결제");
				System.out.println("3. 포인트 사용 결제");
				System.out.println("-----------------------------------");
				System.out.print("선택 : ");
				int payInput = sc.nextInt();
				sc.nextLine();
				
				if(payInput == 0) {
					break;   
				}else if(payInput == 1) {
					this.pay1(sc, total);
					break;
				}else if(payInput == 2) {
					this.pay2(sc, total);
					break;
				}else if(payInput == 3) {
					this.pay3(sc, total);
					break;
				}else {
					System.out.println("잘못된 입력입니다.");
				}
			} else if(input == 2) {
				this.deleteOrder(sc, order, subOrder);
			} else {
				System.out.println("잘못된 입력입니다.");
			}
		}
	}
	
	
	//일반 카드 결제
	private void pay1(Scanner sc, int total) {
		
		//카드번호 유효성 검사
		while(true) {
			System.out.println();
			System.out.println("카드번호 (0000 0000 0000 0000): ");
			String cardNum = sc.nextLine();
			
			if(cardNum.length() != 19) {
				System.out.println("유효하지 않은 카드 번호입니다.");
			}else {
				System.out.printf("총 %d원 결제되었습니다. %n", total);
				this.bill(0, total, 0);
				break;  
			}
		}
	}
	
	//포인트 적립 결제 
	private void pay2(Scanner sc, int total) {
		Membership membership;
		int point; 
		
		//카드번호 유효성 검사
		while(true) {
			System.out.println();
			System.out.println("카드번호 (0000 0000 0000 0000): ");
			String cardNum = sc.nextLine();
			
			if(cardNum.length() != 19) {
				System.out.println("유효하지 않은 카드 번호입니다.");
			}else {
				break;
			}
		}
		
		//핸드폰 번호 유효성 검사
		while(true) {
			System.out.println("핸드폰 번호 (000 0000 0000): ");
			String phoneNum = sc.nextLine();
			
			if(phoneNum.length() != 13) {
				System.out.println();
				System.out.println("유효하지 않은 핸드폰 번호입니다.");
			}else {
				point = (int)(total * 0.1); 
				
				//핸드폰번호로 회원 객체 반환
				membership = dao.getMembership(phoneNum);
				
				//포인트 적립
				dao.addPoint(membership, point);
				
				System.out.println();
				System.out.printf("총 %d원 결제되었습니다. %n", total);
				System.out.printf("%d 포인트 적립 %n", point);
				
				//영수증 출력
				this.bill(point, total, 0);
				break;
			}
		}
	}
	
	//포인트 사용 결제
	private void pay3(Scanner sc, int total) {
		int usePoint = 0;
		
		//핸드폰 번호 유효성 검사
		while(true) {
			System.out.println();
			System.out.println("핸드폰 번호 (000 0000 0000): ");
			String phoneNum = sc.nextLine();
			
			//핸드폰번호로 회원 객체 반환
			Membership membership = dao.getMembership(phoneNum);
			
			if(phoneNum.length() != 13) {
				System.out.println();
				System.out.println("유효하지 않은 핸드폰 번호입니다.");
			}else {
				System.out.println();
				System.out.printf("적립된 포인트 %d원 %n", membership.getPoint());
			}
			
			//사용할 포인트 유효성 검사
			while(true) {
				System.out.print("사용할 포인트 : ");
				usePoint = sc.nextInt();
				sc.nextLine();
				
				if(usePoint > membership.getPoint()) {
					System.out.println();
					System.out.println("적립된 포인트 범위를 벗어났습니다.");
				}else if(usePoint > total) {
					System.out.println();
					System.out.println("결제 금액을 초과하였습니다.");
				}else {
					dao.usePoint(membership, usePoint);
					System.out.println();
					System.out.printf("남은 결제 금액 %d원 %n", total - usePoint);
					break;
				}
			}
			
			//남은 결제 금액이 0원인 경우와 아닌 경우를 나눠서 출력
			while(true) {
				if(total - usePoint == 0) {
					//영수증 출력
					this.bill(0, total, usePoint);
					break;
				}
				
				System.out.println();
				System.out.println("카드번호 (0000 0000 0000 0000): ");
				String cardNum = sc.nextLine();
				
				if(cardNum.length() != 19) {
					System.out.println();
					System.out.println("유효하지 않은 카드 번호입니다.");
				}else {
					System.out.println();
					System.out.printf("총 %d원 결제되었습니다. %n", total);
					
					//영수증 출력
					this.bill(0, total, usePoint);
					break;
				}
			}
			break;
		}
	}  
	
	// 영수증 출력
	private void bill(int point, int total, int usePoint) {
		Order order = dao.getCart();
		dao.addToOrder();
		System.out.println();
		System.out.println("===================================");
		System.out.println("               영수증              ");
		System.out.println("===================================");
		System.out.printf("날    짜 : %s %n", order.getDate());
		System.out.println("-----------------------------------");
		for(int i = 0; i < order.getItem().size(); ++i) {
			System.out.printf("%d %s %n", i + 1, order.listSubOrders().get(i));
		}
		System.out.println("-----------------------------------");
		System.out.printf("총    액 : %d원 %n", total);
		System.out.printf("포인트 사용 : -%d %n", usePoint);
		System.out.println("-----------------------------------");
		System.out.printf("결제금액 : %d원 %n", total - usePoint);
		System.out.println("-----------------------------------");
		System.out.printf("적 립 금 : %d %n", point);	
	}
	
	// 주문 삭제 메소드
	private void deleteOrder(Scanner sc, Order order, List<SubOrder> subOrder) {
		int orderId;
		int count;
		
		while(true) {
			System.out.println();
			System.out.println("삭제할 메뉴의 번호를 입력하세요.");
			System.out.print("선택 : ");
			orderId = sc.nextInt();
			sc.nextLine();
			
			//List<String>(주문내역)의 개수를 초과하지 않도록 확인
			//0을 입력할 경우 menu3으로 돌아감
			if(orderId > order.listSubOrders().size()) {
				System.out.println();
				System.out.println("메뉴 번호를 다시 확인해주세요.");
			} else if(orderId == 0){
				return;
			} else
				break;
			}
		
		while(true) {
			System.out.println();
			System.out.println("삭제할 수량을 입력하세요.");
			System.out.print("선택 : ");
			count = sc.nextInt();
			sc.nextLine();
			
			//특정 메뉴의 개수를 초과하지 않도록 확인
			//0을 입력할 경우 menu3으로 돌아감
			if(count > subOrder.get(orderId - 1).getCount()) {
				System.out.println();
				System.out.println("수량을 다시 확인해주세요");
			} else if(orderId == 0){
				return;
			} else {
				break;
			}
		}
					
		while(true) {
			System.out.println();
			System.out.println("정말 삭제하시겠습니까? (YES : 1 / NO : 0)");
			System.out.print("선택 : ");
			int input2 = sc.nextInt();
			sc.nextLine();
							
			if(input2 == 1) {
				//장바구니에 저장된 내역 삭제
				dao.deleteFromCart(orderId - 1, count);
				System.out.println();
				System.out.println("선택한 메뉴가 장바구니에서 삭제되었습니다.");
				break;
			}else if(input2 == 0){
				System.out.println();
				System.out.println("취소되었습니다.");
				break;
			}else {
				System.out.println();
				System.out.println("잘못된 입력입니다.");
			}
		}
	}
}


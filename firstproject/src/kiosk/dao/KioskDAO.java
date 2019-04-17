package kiosk.dao;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.time.format.DateTimeFormatter;
import java.time.LocalDate;

import kiosk.domain.*;

public class KioskDAO {
	private List<Item> item = new ArrayList<Item>(); // 판매 품목 저장
	private List<Membership> mem = new ArrayList<Membership>(); // 포인트 적립 저장
	private Order cart = new Order(); // 장바구니에 들어있는 품목 저장
	private List<Order> order = new ArrayList<Order>(); // 실제 결제된 주문들 저장
	
	// 테스트를 위한 초기 데이터 설정을 위해 기본 생성자 정의
	public KioskDAO() {
		Item item = new Item("SA","에그마요",5000);//0
		this.item.add(item);
		item = new Item("SA","폴드포크",4000);//1
		this.item.add(item);
		item = new Item("SA","터키",5500);//2
		this.item.add(item);
		item = new Item("SA","쉬림프",6000);//3
		this.item.add(item);
		
		item = new Item("BR", "플랫", 0);//4
		this.item.add(item);
		item = new Item("BR", "화이트", 0);//5
		this.item.add(item);
		item = new Item("BR", "허니오트", 0);//6
		this.item.add(item);
		item = new Item("BR", "파마산", 0);//7
		this.item.add(item);
		
		item = new Item("VE", "피망", 0);//8
		this.item.add(item);
		item = new Item("VE", "양파", 0);//9
		this.item.add(item);
		item = new Item("VE", "올리브", 0);//10
		this.item.add(item);
		item = new Item("VE", "할라피뇨", 0);//11
		this.item.add(item);
		item = new Item("VE", "양상추", 0);//12
		this.item.add(item);
		
		item = new Item("SO", "핫칠리", 0);//13
		this.item.add(item);
		item = new Item("SO", "랜치", 0);//14
		this.item.add(item);
		item = new Item("SO", "스위트어니언", 0);//15
		this.item.add(item);
		item = new Item("SO", "스위트칠리", 0);//16
		this.item.add(item);
		item = new Item("SO", "바베큐", 0);//17
		this.item.add(item);
		item = new Item("SO", "머스타드", 0);//18
		this.item.add(item);
		
		item = new Item("SI", "음료", 1000);//19
		this.item.add(item);
		item = new Item("SI", "음료&쿠키", 1500);//20
		this.item.add(item);
		item = new Item("SI", "쿠키", 1000);//21
		this.item.add(item);
		item = new Item("SI", "과자", 1000);//22
		this.item.add(item);
		item = new Item("SI", "더블미트", 1500);//23
		this.item.add(item);
		item = new Item("SI", "웨지감자", 3000);//24
		this.item.add(item);
		
		List<Item> itemlist = new ArrayList<Item>();
		itemlist.add(this.item.get(1));
		itemlist.add(this.item.get(5));
		itemlist.add(this.item.get(8));
		itemlist.add(this.item.get(13));
		List<SubOrder> solist = new ArrayList<SubOrder>();
		solist.add(new SubOrder(itemlist, 2));
		Order o = new Order();
		o.setItem(solist);
		o.setDate("2019-03-26");
		order.add(o);
		itemlist = new ArrayList<Item>();
		solist = new ArrayList<SubOrder>();
		o = new Order();
		itemlist.add(this.item.get(0));
		itemlist.add(this.item.get(4));
		itemlist.add(this.item.get(11));
		itemlist.add(this.item.get(17));
		solist.add(new SubOrder(itemlist, 3));
		itemlist = new ArrayList<Item>(); 
		itemlist.add(this.item.get(22));
		solist.add(new SubOrder(itemlist, 7));
		o.setItem(solist);
		o.setDate("2019-03-28");
		order.add(o);
		itemlist = new ArrayList<Item>();
		solist = new ArrayList<SubOrder>();
		o = new Order();
		itemlist.add(this.item.get(0));
		itemlist.add(this.item.get(4));
		itemlist.add(this.item.get(11));
		itemlist.add(this.item.get(17));
		solist.add(new SubOrder(itemlist, 3));
		itemlist = new ArrayList<Item>();
		itemlist.add(this.item.get(22));
		solist.add(new SubOrder(itemlist, 7));
		o.setItem(solist);
		o.setDate("2019-02-26");
		order.add(o);
		itemlist = new ArrayList<Item>();
		solist = new ArrayList<SubOrder>();
		o = new Order();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.now();
		itemlist.add(this.item.get(3));
		itemlist.add(this.item.get(4));
		itemlist.add(this.item.get(9));
		itemlist.add(this.item.get(18));
		solist.add(new SubOrder(itemlist, 6));
		itemlist = new ArrayList<Item>();
		itemlist.add(this.item.get(21));
		solist.add(new SubOrder(itemlist, 5));
		o.setItem(solist);
		o.setDate(dtf.format(date));
		order.add(o);
		itemlist = new ArrayList<Item>();
		solist = new ArrayList<SubOrder>();
		o = new Order();
		itemlist.add(this.item.get(2));
		itemlist.add(this.item.get(6));
		itemlist.add(this.item.get(9));
		itemlist.add(this.item.get(16));
		solist.add(new SubOrder(itemlist, 11));
		itemlist = new ArrayList<Item>();
		itemlist.add(this.item.get(24));
		solist.add(new SubOrder(itemlist, 7));
		o.setItem(solist);
		o.setDate(dtf.format(date));
		order.add(o);
		itemlist = new ArrayList<Item>();
		solist = new ArrayList<SubOrder>();
		o = new Order();
		itemlist.add(this.item.get(0));
		itemlist.add(this.item.get(4));
		itemlist.add(this.item.get(11));
		itemlist.add(this.item.get(17));
		solist.add(new SubOrder(itemlist, 3));
		itemlist = new ArrayList<Item>();
		itemlist.add(this.item.get(22));
		solist.add(new SubOrder(itemlist, 7));
		o.setItem(solist);
		o.setDate(dtf.format(date));
		order.add(o);
	} 
	
	// 카테고리를 매개변수로 받아 해당 카테고리에 해당하는 판매 품목들의 리스트를 반환
	public List<Item> listItem(String category) {
		List<Item> tmp = new ArrayList<Item>();
		for (Item i : item) {
			if(i.getCategory().equals(category)) {
				tmp.add(i);
			} 
		}
		return tmp;
	}
	
	// 결제된 주문 내역들을 가지고 달별로 매출액 계산해서 반환
	public Map<String, Integer> listMonthly() {
		Map<String, Integer> tmp = new HashMap<String, Integer>();
		for(Order o : order) {
			int money = 0;
			for (SubOrder so : o.getItem()) {
				money += so.getPrice();
			}
			String month = o.getDate().substring(0, 7);
			if (tmp.containsKey(month)) {
				tmp.replace(month, tmp.get(month) + money);
			}
			else {
				tmp.put(month, money);
			}
		}
		return tmp;
	}
	
	// 결제된 주문 내역 중 특정 날짜 (yyyy-MM-dd || yyyy-MM)에 해당하는 리스트 반환
	public List<Order> listOrder(String date) {
		List<Order> tmp = new ArrayList<Order>();
		for(Order o : order) {
			if(o.getDate().contains(date)) {
				tmp.add(o);
			}
		}
		return tmp;
	}
	
	// 장바구니에 담겨있는 내역을 반환
	public Order getCart() {
		return cart;
	}
	
	// 장바구니에 선택된 품목을 저장
	public void addToCart(SubOrder suborder) {
		this.cart.getItem().add(suborder);
	}
	
	// 장바구니에서 삭제하기 실행하는 경우 해당 품목의 번호와 삭제할 수량을 입력받아 삭제
	public void deleteFromCart(int index, int count) {
		SubOrder so = this.cart.getItem().get(index);
		if(so.getCount() == count) {
			this.cart.getItem().remove(so);
		}
		else {
			so.setCount(so.getCount() - count);
		}
	}
	
	// 판매 품목 추가
	public void addItem(Item item) {
		this.item.add(item);
	}
	
	// 카테고리와 품목 이름을 매개변수로 받아 판매 품목 삭제
	public void deleteItem(String category, String itemName) {
		for(Item i : item) {
			if(i.getCategory().equals(category) && i.getName().equals(itemName)) {
				item.remove(i);
				return;
			}
		}
	}
	
	// 이미 있는 품목의 가격을 변경하는 메소드
	// 가격이 바뀌었을 때 이미 결제된 주문들의 품목까지 같이 바뀌지 않도록 삭제 후 재등록으로 진행
	public void changePrice(String category, String itemName, int price) {
		for(Item i : item) {
			if(i.getName().equals(itemName)) {
				int index = item.indexOf(i);
				item.remove(index);
				item.add(new Item(category, itemName, price));
				return;
			}
		}
	}
	
	// 장바구니에서 결제 진행한 후에 결제된 주문 내역으로 옮겨주는 메소드
	// 결제 당시의 날짜 정보를 입력받아서 저장
	public void addToOrder() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.now();
		cart.setDate(dtf.format(date));
		order.add(cart);
		cart = new Order();
	}
	
	// 월말결산 진행 후 삭제하기를 선택하는 경우 호출
	// 특정 월에 해당하는 주문 내역을 검색해서 삭제
	public void deleteOrder(String date) {
		for(int i = order.size()-1; i >= 0; --i) {
			if(order.get(i).getDate().contains(date)) {
				order.remove(i);
			}
		}
	}
	
	// 포인트를 적립하거나 사용하려는 경우 저장된 포인트 관련 정보 반환
	// 정보가 존재하지 않는 경우 새로 객체 생성한 후 반환
	public Membership getMembership(String phone) {
		Membership tmp = null;
		
		for (Membership m : mem) {
			if (m.getPhone().equals(phone)) {
				tmp = m;
			}
		}
		if (tmp == null) {
			tmp = new Membership(phone, 0);
			mem.add(tmp);
		}
		return tmp;
	}
	
	// 포인트 적립
	public void addPoint(Membership m, int addingPoint) {
		m.setPoint(m.getPoint() + addingPoint);
	}
	
	// 포인트 사용
	public void usePoint(Membership m, int usingPoint) {
		m.setPoint(m.getPoint() - usingPoint);
	}
}

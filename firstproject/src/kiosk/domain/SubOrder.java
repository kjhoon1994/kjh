package kiosk.domain;
import java.util.List;

public class SubOrder {
	private List<Item> item; // 주문 품목 리스트 (샌드위치, 빵, 야채, 소스.. 또는 사이드)
	private int count; // 주문 수량
	private int price; // 전체 가격
	
	// 기본생성자
	public SubOrder() {}
	
	// 고객이 선택한 품목의 리스트와 해당 품목들의 수량을 매개변수로 받는 생성자
	public SubOrder(List<Item> item, int count) {
		this.item = item;
		this.count = count;
		this.calculatePrice();
	}

	// 주문 품목의 리스트를 반환
	public List<Item> getItem() {
		return item;
	}

	// 주문 품목의 수량을 반환
	public int getCount() {
		return count;
	}

	// 주문 품목의 수량을 설정
	public void setCount(int count) {
		this.count = count;
		this.calculatePrice();
	}
	
	// 주문 품목의 가격을 반환
	public int getPrice() {
		return price;
	}
	
	// 주문 품목들의 총 가격을 계산
	private void calculatePrice() {
		int tmp = 0;
		for (Item i : item) {
			tmp += i.getPrice();
		}
		tmp = tmp * count;
		this.price = tmp;
	}
	
	// 품목이름 품목이름 ... 품목이름 수량 가격 형식으로 문자열 반환
	@Override
	public String toString() {
		String tmp = new String();
		for(Item i : item) {
			tmp = tmp.concat(i.getName() + " ");
		}
		tmp = tmp.concat(this.count + " ");
		tmp = tmp.concat(this.price + "원");
		return tmp;
	}
}

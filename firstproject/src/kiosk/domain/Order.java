package kiosk.domain;

import java.util.ArrayList;
import java.util.List;

public class Order {
	private String date; // 주문 결제 완료된 날짜
	private List<SubOrder> item; // 서브 주문 리스트 (샌드위치, 쿠키, 웨지감자 ...)
	
	// 기본 생성자
	public Order() {
		item = new ArrayList<SubOrder>();
	}

	// 주문 날짜 반환
	public String getDate() {
		return date;
	}

	// 주문 날짜 설정
	public void setDate(String date) {
		this.date = date;
	}

	// 해당 주문의 상세 내역 반환
	public List<SubOrder> getItem()                {
		return item;
	}

	// 해당 주문의 상세 내역 설정
	public void setItem(List<SubOrder> item) {
		this.item = item;
	}
	
	// SubOrder의 toString을 호출해서 장바구니에 들어있는 주문 목록을 문자열 리스트로 받아온다
	public List<String> listSubOrders() {
		List<String> tmp = new ArrayList<String>();
		for(SubOrder so : item) {
			tmp.add(so.toString());
		}
		return tmp;
	}
}

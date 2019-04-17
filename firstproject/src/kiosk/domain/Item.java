package kiosk.domain;

public class Item {
	private String category; // 카테고리 이름
	private String name; // 품목 이름
	private int price; // 품목 가격
	
	// 기본생성자
	public Item() {}
	
	// 카테고리 이름, 품목 이름, 품목의 가격을 매개변수로 받는 생성자
	public Item(String category, String name, int price) {
		this.category = category;
		this.name = name;
		this.price = price;
	}

	// 카테고리 이름 반환
	public String getCategory() {
		return category;
	}

	// 품목 이름 반환
	public String getName() {
		return name;
	}

	// 품목의 가격 반환
	public int getPrice() {
		return price;
	}
}

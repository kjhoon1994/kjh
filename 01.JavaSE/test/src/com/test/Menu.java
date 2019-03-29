package com.test;

public class Menu {
	
	private int kind;
	private String menu;
	private int price;
	

	public Menu() {

	}
	public Menu(int kind, String menu, int price) {

		this.kind = kind;
		this.menu = menu;
		this.price = price;
	}
	
	public int getKind() {
		return kind;
	}
	public void setKind(int kind) {
		this.kind = kind;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return String.format("%s(%,d원)", this.menu, this.price);
		
	}
	
	@Override
	public boolean equals(Object obj) {
		Menu m = (Menu)obj;
		return this.menu.equals(m.getMenu());
	}
	
}

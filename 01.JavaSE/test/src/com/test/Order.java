package com.test;

public class Order {
	
	private Menu menu;
	private int count;
	
	public Order() {
	}

	public Order(Menu menu, int count) {
		this.menu = menu;
		this.count = count;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return String.format("%s / %s개", this.menu, this.count);
	}
	

}

package com.test;

import java.util.List;

public class Orders {
	
	private String date;
	private List<Order> orders;
	
	public Orders() {
	}

	public Orders(List<Order> orders, String date) {
		this.orders = orders;
		this.date = date;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

}

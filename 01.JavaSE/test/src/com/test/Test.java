package com.test;

import java.util.List;
import java.util.Map;

public class Test {

	public static void main(String[] args) {
		
		OrdersDAO odao = new OrdersDAO();
		
		String date = "2019-03-25";
		List<Orders> temp = odao.list("", date);
		for (Orders oo : temp) {
			System.out.printf("%s%n", oo.getDate());
			for (Order o : oo.getOrders()) {
				System.out.println(o.toString());
			}
		}

		System.out.println("--------------------");
		System.out.printf("일일결산(%s)%n", date);
		Map<String, Order> ordersSum = odao.ordersSum("", date);
		for (String m : ordersSum.keySet()) {
			System.out.printf("%s%n", ordersSum.get(m));
		}

	}

}

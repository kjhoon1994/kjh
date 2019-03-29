package com.test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrdersDAO {
	
	private List<Orders> ordersList = new ArrayList<Orders>();

	private List<Order> orderList;

	public OrdersDAO() {
		
		//홍길동 주문내역
		this.orderList = new ArrayList<Order>();
		Menu m1 = new Menu(1, "새우버거세트", 5000);
		Order o1 = new Order(m1, 1);
		this.orderList.add(o1);
		Menu m2 = new Menu(1, "불고기버거세트", 5000);
		Order o2 = new Order(m2, 2);
		this.orderList.add(o2);
		this.ordersList.add(new Orders(this.orderList, "2019-03-24"));
		
		//박길동 주문내역
		this.orderList = new ArrayList<Order>();
		Menu m3 = new Menu(1, "새우버거세트", 5000);
		Order o3 = new Order(m3, 3);
		this.orderList.add(o3);
		Menu m4 = new Menu(1, "불고기버거세트", 5000);
		Order o4 = new Order(m4, 4);
		this.orderList.add(o4);
		this.ordersList.add(new Orders(this.orderList, "2019-03-25"));
		
		//강길동 주문내역
		this.orderList = new ArrayList<Order>();
		Menu m5 = new Menu(1, "새우버거세트", 5000);
		Order o5 = new Order(m5, 1);
		this.orderList.add(o5);
		this.ordersList.add(new Orders(this.orderList, "2019-03-25"));

	}
	
	//주문내역 전체 출력
	public List<Orders> list(String key, String value) {
		//key->특정일
		//value->2019-03-25
		List<Orders> temp = new ArrayList<Orders>();
		for (Orders oo : this.ordersList) {
			if (oo.getDate().equals(value)) {
				temp.add(oo);
			}
		}
		return temp;
	}
	
	//일일결산
	public Map<String, Order> ordersSum(String key, String value) {
		//key->특정일
		//value->2019-03-25
		Map<String, Order> temp = new HashMap<String, Order>();
		
		for (Orders oo : this.ordersList) {
			if (oo.getDate().contains(value)) {
				for (Order o : oo.getOrders()) {
					Menu m = o.getMenu();
					String menu = m.getMenu();
					int count = o.getCount();
					if (temp.containsKey(menu)) {
						Order o_ = temp.get(menu);
						o_.setCount(o_.getCount() + count);
					} else {
						Order o_ = new Order(o.getMenu(), count);
						temp.put(menu, o_);
					}
				}
			}
		}
		
		return temp;
	}	

}

package com.test062;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Main {
	
	public static void main(String[] args) {

		//Stack, Queue
		//Stack - 한 쪽에서만 입력, 출력이 가능한 저장소. Last In First Out(LIFO) 구조
		//Queue - 한 쪽에서는 입력만, 다른 쪽에서는 출력만 가능한 저장소. First In First Out(FIFO) 구조
		
		Stack<Integer> stack = new Stack<Integer>();
		
		stack.push(10);
		stack.push(20);
		stack.push(30);
		
		System.out.println(stack.pop()); //30
		System.out.println(stack.pop()); //20
		System.out.println(stack.pop()); //10
		
		Queue<Integer> queue = new LinkedList<Integer>();
		
		queue.offer(10);
		queue.offer(20);
		queue.offer(30);
		
		System.out.println(queue.poll()); //10
		System.out.println(queue.poll()); //20
		System.out.println(queue.poll()); //30

	}

}

package com.test081;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.List;

public class Main {

	public static void main(String[] args) {

		//직렬화
		//객체(instance)를 물리적 저장할 수 있는 방법
		//ObjectOutputStream, FileOutputStream
		
		//역직렬화
		//물리적 저장된 객체(instance)를 환원하는 방법
		//FileInputStream, ObjectInputStream
		
		//직렬화 지원 클래스(implements Serializable)인 경우만 직렬화 가능
		List<String> list = new ArrayList<String>();
		
		list.add("HONG");
		list.add("PARK");
		list.add("CHOI");
		list.add("KIM");
		
		System.out.println(list.toString());
		
		try {
			FileOutputStream fo = new FileOutputStream("src/com/test081/test.ser");
			ObjectOutputStream oo = new ObjectOutputStream(fo);
			
			oo.writeObject(list);
			System.out.println("직렬화 완료!");
			
			oo.close();
			fo.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}

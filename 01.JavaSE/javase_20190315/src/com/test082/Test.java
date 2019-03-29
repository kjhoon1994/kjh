package com.test082;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.util.ArrayList;
import java.util.List;

public class Test {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

		//역직렬화 테스트
		List<Member> list = new ArrayList<Member>();

		try {
			FileInputStream fo = new FileInputStream("src/com/test082/test.ser");
			ObjectInputStream oo = new ObjectInputStream(fo);
			
			list = (List<Member>) oo.readObject();
			System.out.println(list.toString());
			System.out.println("역직렬화 완료!");
			
			oo.close();
			fo.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
	}

}

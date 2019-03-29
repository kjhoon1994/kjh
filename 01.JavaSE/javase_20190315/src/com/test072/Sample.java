package com.test072;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

public class Sample {
	
	public void method() throws FileNotFoundException, IOException {
		
		//예외 발생 가능성이 있는 문장
		//->예외 내보내기
		//->throws 
		//->예외 종류를 정확하게 알려줄 필요가 있다
		
		//외부 파일 읽어오는 과정에서 예외 발생 가능성 존재한다
		Properties prop = new Properties();
		prop.load(new FileInputStream("src/com/test072/test.properties"));
		
		//순차적 접근
		Enumeration<?> e = prop.propertyNames();
		while(e.hasMoreElements()) {
			String key = (String) e.nextElement();
			System.out.printf("%s / %s%n"
					, key, prop.getProperty(key));
		}
		
	}

}

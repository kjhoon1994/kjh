package com.test065;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

//서비스 운영 클래스
public class LottoService {
	
	//판매소 고유번호는 멤버변수 또는 상수
	public static final String LOTTONUM = "L001";
	
	private LottoDAO dao = new LottoDAO();
	
	//자동 번호 서비스
	//->매수 입력
	public void menu1(Scanner sc) {
		System.out.print("매수>");
		int count = sc.nextInt();
		sc.nextLine();
		
		System.out.printf("판매소번호:%s%n", LOTTONUM);
		System.out.printf("날짜:%s%n", LocalDate.now().format(DateTimeFormatter.ISO_DATE));
		for (int a = 0; a < count; ++a) {
			//로또 번호 자동 생성 -> auto() 메소드
			List<Integer> lotto = this.auto();
			
			//저장소에 저장
			this.dao.add(new Lotto(LOTTONUM, lotto));
			
			//발행된 로또 번호 출력
			System.out.println(lotto.toString());
		}
		
	}
	
	private List<Integer> auto() {
		Random random = new Random();
		Set<Integer> set = new HashSet<Integer>();
		while(true) {
			int temp = random.nextInt(45) + 1;
			set.add(temp);
			if (set.size() >= 6) break;
		}
		List<Integer> list = new ArrayList<Integer>(set);
		Collections.sort(list);
		return list;
	}
	
	//수동 번호 서비스
	//1~45 범위 내의 6개의 숫자 입력
	public void menu2(Scanner sc) {
		
		List<Integer> temp = new ArrayList<Integer>();
		System.out.print("수동 번호 입력(n1 n2 n3 n4 n5 n6)>");
		for (int a = 0; a < 6; ++a) {
			int b = sc.nextInt();
			temp.add(b);
		}
		sc.nextLine();
		
		System.out.printf("판매소번호:%s%n", LOTTONUM);
		System.out.printf("날짜:%s%n", LocalDate.now().format(DateTimeFormatter.ISO_DATE));
		this.dao.add(new Lotto(LOTTONUM, temp));
		System.out.println(temp.toString());
		
	}
	
	//당첨자 검색
	//->당첨번호(5 13 17 29 34 39) 필요
	//->당첨번호 3개 숫자일치 = 5등
	public void menu3(Scanner sc) {
		List<Integer> temp = new ArrayList<Integer>();
		System.out.print("당첨번호(n1 n2 n3 n4 n5 n6)>");
		for (int a = 0; a < 6; ++a) {
			int b = sc.nextInt();
			temp.add(b);
		}
		sc.nextLine();
		
		System.out.print("당첨확인 등수(1~5>");
		int m = sc.nextInt();
		sc.nextLine();
		if (m == 5) {
			List<Lotto> list = this.dao.list(3, temp);
			for (Lotto l : list) {
				System.out.println(l.toString());
			}
			System.out.printf("총 %d건%n", list.size());
		}
	}
	
	//히든 메뉴
	public void hidden() {
		List<Lotto> list = this.dao.list();
		for (Lotto l : list) {
			System.out.println(l.toString());
		}
	}
	
}

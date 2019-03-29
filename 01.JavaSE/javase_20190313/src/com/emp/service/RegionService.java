package com.emp.service;

import java.util.List;
import java.util.Scanner;

import com.emp.dao.RegionDAO;
import com.emp.domain.Region;

public class RegionService {
	
	private RegionDAO dao;
	public RegionService() {
		this.dao = new RegionDAO();
	}
	
	public void main(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("---------------------------------------------");
			System.out.println("직원 관리 v1.0/2. 기초 정보 관리/1. 지역 관리");
			System.out.println("1. 지역 입력  2. 지역 출력");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	this.menu1(sc); break;
			case 2:	this.menu2(); break;
			}

		}		
	}
	
	
	//직원 관리 v1.0/2. 기초 정보 관리/1. 지역 관리/1. 지역 입력
	private void menu1(Scanner sc) {
		
		//외부 입력 항목 결정
		//지역명만 입력 받는다
		//번호(REG01, REG02, ...)는 자동 증가 액션 처리 
		//-> generateRegId() 메소드 호출
		
		System.out.println("----------------------------------------------------------");
		System.out.println("직원 관리 v1.0/2. 기초 정보 관리/1. 지역 관리/1. 지역 입력");
		List<Region> list = this.dao.list();
		this.print(list);

		//자동 증가된 지역번호 얻는 과정 
		String regId = this.dao.generateRegId();

		if (regId != null) {

			//신규 지역 이름을 외부 입력 받는 과정
			System.out.print("신규 지역 이름>");
			String regName = sc.nextLine();

			System.out.print("신규 지역 정보를 등록할까요(0/1)>");
			int input = sc.nextInt();
			sc.nextLine();

			if (input == 1) {
				//신규 지역 정보를 저장소에 저장 요청하는 과정
				Region r = new Region(regId, regName);
				this.dao.add(r);
				System.out.println("신규 지역 정보가 등록되었습니다.");
			} else {
				System.out.println("신규 지역 정보 등록이 취소되었습니다.");
			}
		} else {
			System.out.println("지역 정보 등록 불가!");
		}
		
	}
	
	//직원 관리 v1.0/2. 기초 정보 관리/1. 지역 관리/2. 지역 출력
	private void menu2() {

		//제목 출력
		System.out.println("--------------------------------------------");
		System.out.println("직원 관리 v1.0/2. 기초 정보 관리/1. 지역 관리/2. 지역 출력");
		List<Region> list = this.dao.list();

		//출력 전용 메소드 호출
		this.print(list);
		
	}

	//출력 전용 메소드
	private void print(List<Region> list) {
		System.out.println("---------------------");
		System.out.println("지역번호/지역명");
		//사본 컬렉션의 전체 자료 출력
		for (Region r : list) {
			//toString() 메소드 호출
			System.out.println(r.toString());
		}
		//출력 건수가 없는 경우 전용 메시지
		if (list.size() == 0) System.out.println("출력 결과가 없습니다");
	}

}

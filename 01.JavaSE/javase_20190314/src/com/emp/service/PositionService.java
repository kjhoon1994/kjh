package com.emp.service;

import java.util.List;
import java.util.Scanner;

import com.emp.dao.PositionDAO;
import com.emp.domain.Position;

public class PositionService {
	
	private PositionDAO dao;
	public PositionService(PositionDAO pdao) {
		this.dao = pdao;
	}
	
	public void main(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("---------------------------------------------");
			System.out.println("직원 관리 v1.0/2.기초정보관리/3.직위관리");
			System.out.println("1.직위입력  2.직위출력");
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
	
	
	//직원 관리 v1.0/2.기초정보관리/3.직위관리/1.직위입력
	private void menu1(Scanner sc) {
		
		//외부 입력 항목 결정
		//직위명만 입력 받는다
		//번호(POS01, POS02, ...)는 자동 증가 액션 처리 
		//-> generatePosId() 메소드 호출
		
		System.out.println("----------------------------------------------------------");
		System.out.println("직원 관리 v1.0/2.기초정보관리/3.직위관리/1.직위입력");
		List<Position> list = this.dao.list();
		this.print(list);

		//자동 증가된 직위번호 얻는 과정 
		String posId = this.dao.generatePosId();

		if (posId != null) {

			//신규 직위 이름을 외부 입력 받는 과정
			System.out.print("신규 직위 이름>");
			String posName = sc.nextLine();

			//신규 최소기본급을 외부 입력 받는 과정
			System.out.print("신규 최소기본급>");
			int minbasicpay = sc.nextInt();
			sc.nextLine();
			
			System.out.print("신규 직위 정보를 등록할까요(0/1)>");
			int input = sc.nextInt();
			sc.nextLine();

			if (input == 1) {
				//신규 직위 정보를 저장소에 저장 요청하는 과정
				Position p = new Position(posId, posName, minbasicpay);
				this.dao.add(p);
				System.out.println("신규 직위 정보가 등록되었습니다.");
			} else {
				System.out.println("신규 직위 정보 등록이 취소되었습니다.");
			}
		} else {
			System.out.println("직위 정보 등록 불가!");
		}
		
	}
	
	//직원 관리 v1.0/2.기초정보관리/3.직위관리/2.직위출력
	private void menu2() {

		//제목 출력
		System.out.println("--------------------------------------------");
		System.out.println("직원 관리 v1.0/2.기초정보관리/3.직위관리/2.직위출력");
		List<Position> list = this.dao.list();

		//출력 전용 메소드 호출
		this.print(list);
		
	}

	//출력 전용 메소드
	private void print(List<Position> list) {
		System.out.println("---------------------");
		System.out.println("직위번호/직위명/최소기본급");
		//사본 컬렉션의 전체 자료 출력
		for (Position p : list) {
			System.out.printf("%s/%s/%s%n", p.getPosId(), p.getPosName(), p.getMinbasicpay());
		}
		//출력 건수가 없는 경우 전용 메시지
		if (list.size() == 0) System.out.println("출력 결과가 없습니다");
	}

}

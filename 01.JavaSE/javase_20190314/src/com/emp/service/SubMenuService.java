package com.emp.service;

import java.util.Scanner;

import com.emp.dao.DepartmentDAO;
import com.emp.dao.PositionDAO;
import com.emp.dao.RegionDAO;

public class SubMenuService {
	
	private RegionDAO rdao;
	private DepartmentDAO ddao;
	private PositionDAO pdao;
	public SubMenuService(RegionDAO rdao, DepartmentDAO ddao, PositionDAO pdao) {
		this.rdao = rdao;
		this.ddao = ddao;
		this.pdao = pdao;
	}
	
	public void main(Scanner sc) {
		while (true) {

			System.out.println();
			System.out.println("--------------------------------");
			System.out.println("직원 관리 v1.0/2.기초정보관리");
			System.out.println("1.지역 관리  2.부서관리  3.직위관리");
			System.out.print("선택>");
			int m = sc.nextInt();
			sc.nextLine();

			if (m == 0)	break;

			switch (m) {
			case 1:	new RegionService(rdao).main(sc); break;
			case 2: new DepartmentService(ddao).main(sc); break;
			case 3: new PositionService(pdao).main(sc); break;
			}

		}		
	}

}

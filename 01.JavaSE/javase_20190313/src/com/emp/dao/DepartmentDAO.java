package com.emp.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.emp.domain.Department;

public class DepartmentDAO {
	
	//List 컬렉션 저장소 준비
	//-> 저장소 크기, 인덱스 자동 관리
	//-> 휘발성 저장소
	//-> 물리적 저장(직렬화)은 가능하다
	private List<Department> departments = new ArrayList<Department>();
	
	//생성자
	public DepartmentDAO() {
		//샘플 부서 객체 등록
		Department d = new Department("DEPT01", "개발부");
		this.departments.add(d);
	}
	
	//번호 자동 증가 메소드
	public String generateDeptId() {
		String result = null;
		int temp = this.departments.size() + 1;
		if (temp <= 99) {
			result = String.format("DEPT%02d", temp);
		}
		return result; //DEPT01, DEPT02, ..., DEPT99
	}
	
	//부서 객체 추가
	public void add(Department d) {
		//외부에서 전달된 부서 객체 등록
		//->저장소 크기가 자동 증가
		this.departments.add(d);
	}
	
	//지역 객체 출력
	public List<Department> list() {
		
		//사본 컬렉션 준비
		List<Department> temp = new ArrayList<Department>();
		
		//원본 컬렉션 탐색
		for (Department d : this.departments) {
			temp.add(d);
		}
		
		//정렬 메소드 호출
		Collections.sort(temp, new Comparator<Department>() {
			@Override
			public int compare(Department o1, Department o2) {
				//null 확인 절차가 필요 없다
				return o1.getDeptId().compareTo(o2.getDeptId());
			}
		});

		//사본 컬렉션 반환
		return temp;
	}
	
	
}

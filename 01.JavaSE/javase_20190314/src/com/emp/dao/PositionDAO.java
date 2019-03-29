package com.emp.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.emp.domain.Department;
import com.emp.domain.Position;

public class PositionDAO {
	
	//List 컬렉션 저장소 준비
	//-> 저장소 크기, 인덱스 자동 관리
	//-> 휘발성 저장소
	//-> 물리적 저장(직렬화)은 가능하다
	private List<Position> positions = new ArrayList<Position>();
	
	//생성자
	public PositionDAO() {
		//샘플 직위 객체 등록
		this.positions.add(new Position("POS01", "팀장", 3000000));
		this.positions.add(new Position("POS02", "사원", 2000000));
	}
	
	//번호 자동 증가 메소드
	public String generatePosId() {
		String result = null;
		int temp = this.positions.size() + 1;
		if (temp <= 99) {
			result = String.format("POS%02d", temp);
		}
		return result; //POS01, POS02, ..., POS99
	}
	
	//직위 객체 추가
	public void add(Position p) {
		//외부에서 전달된 직위 객체 등록
		//->저장소 크기가 자동 증가
		this.positions.add(p);
	}
	
	//지역 객체 출력
	public List<Position> list() {
		
		//사본 컬렉션 준비
		List<Position> temp = new ArrayList<Position>();
		
		//원본 컬렉션 탐색
		for (Position p : this.positions) {
			temp.add(p);
		}
		
		//정렬 메소드 호출
		Collections.sort(temp, new Comparator<Position>() {
			@Override
			public int compare(Position o1, Position o2) {
				//null 확인 절차가 필요 없다
				return o1.getPosId().compareTo(o2.getPosId());
			}
		});

		//사본 컬렉션 반환
		return temp;
	}
	
	//직위명 검색 메소드
	//직위번호 제공 -> 직위명 반환
	public String getPosName(String posId) {
		String posName = null;
		for (Position p : this.positions) {
			if (p.getPosId().equals(posId)) {
				posName = p.getPosName();
			}
		}
		return posName;
	}
}

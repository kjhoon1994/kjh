package com.emp.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.emp.domain.Region;

public class RegionDAO {
	
	//List 컬렉션 저장소 준비
	//-> 저장소 크기, 인덱스 자동 관리
	//-> 휘발성 저장소
	//-> 물리적 저장(직렬화)은 가능하다
	private List<Region> regions = new ArrayList<Region>();
	
	//생성자
	public RegionDAO() {
		//샘플 지역 객체 등록
		Region r = new Region("REG01", "서울");
		this.regions.add(r);
	}
	
	//번호 자동 증가 메소드
	public String generateRegId() {
		String result = null;
		int temp = this.regions.size() + 1;
		if (temp <= 99) {
			result = String.format("REG%02d", temp);
		}
		return result; //REG01, REG02, ..., REG99
	}
	
	//지역 객체 추가
	public void add(Region r) {
		//외부에서 전달된 지역 객체 등록
		//->저장소 크기가 자동 증가
		this.regions.add(r);
	}
	
	//지역 객체 출력
	public List<Region> list() {
		
		//사본 컬렉션 준비
		List<Region> temp = new ArrayList<Region>();
		
		//원본 컬렉션 탐색
		for (Region r : this.regions) {
			temp.add(r);
		}
		
		//정렬 메소드 호출
		Collections.sort(temp, new Comparator<Region>() {
			@Override
			public int compare(Region o1, Region o2) {
				//null 확인 절차가 필요 없다
				return o1.getRegId().compareTo(o2.getRegId());
			}
		});

		//사본 컬렉션 반환
		return temp;
	}
	
	
}

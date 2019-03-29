package com.emp.dao;

import java.util.Arrays;
import java.util.Comparator;

import com.emp.domain.Region;

public class RegionDAO {
	
	//배열 저장소 준비
	//->자동 확장 액션 추가
	private Region[] regions = new Region[10];
	//인덱스 전용 변수
	private int idx;
	
	//생성자
	public RegionDAO() {
		//샘플 지역 객체 등록
		Region r = new Region("REG01", "서울");
		this.regions[this.idx] = r;
		++this.idx;
	}
	
	//번호 자동 증가 메소드
	public String generateRegId() {
		//this.idx + 1; //1, 2, 3, ..., 99
		String result = null;
		int temp = this.idx + 1;
		if (temp <= 99) {
			result = String.format("REG%02d", temp);
		}
		return result; //REG01, REG02, ..., REG99
	}
	
	//지역 객체 추가
	public void add(Region s) {
		//외부에서 전달된 지역 객체 등록
		this.regions[this.idx] = s;
		++this.idx;
	}
	
	//지역 객체 출력
	public Region[] list() {
		
		//정렬 메소드 호출
		this.sort();
		
		//사본 배열 준비
		Region[] temp = new Region[this.idx];
		
		//원본 배열 탐색
		int b = 0;
		for (int a = 0; a < this.idx; ++a, ++b) {
			Region r = this.regions[a];
			temp[b] = r;
		}
		
		//사본 배열 반환
		return temp;
	}
	
	
	//정렬 액션 -> private 메소드
	private void sort() {
		//객체 단위 정렬 -> 내부적으로 Comparable 필요 또는 Comparator 구현 필요
		Arrays.sort(this.regions, new Comparator<Region>() {
			@Override
			public int compare(Region o1, Region o2) {
				if (o1 == null || o2 == null) return 0;
				return o1.getRegId().compareTo(o2.getRegId());
			}
		});		
	}
	
}

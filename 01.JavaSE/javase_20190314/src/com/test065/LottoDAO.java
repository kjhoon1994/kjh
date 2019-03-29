package com.test065;

import java.util.ArrayList;
import java.util.List;

public class LottoDAO {
	
	//로또 번호 저장소
	private List<Lotto> list = new ArrayList<Lotto>();
	
	//로또 번호 저장
	public void add(Lotto lotto) {
		//저장소 크기, 인덱스 자동 관리
		this.list.add(lotto);
	}
	
	//로또 번호 전체 출력
	public List<Lotto> list() {
		//사본 컬렉션 준비
		List<Lotto> temp = new ArrayList<Lotto>();
		//원본 컬렉션 탐색
		for (Lotto l : this.list) {
			temp.add(l);
		}
		//사본 컬렉션 반환
		return temp;
	}
	
	//당첨번호 확인 메소드
	public List<Lotto> list(int key, List<Integer> value) {
		
		//사본 컬렉션 준비
		List<Lotto> temp = new ArrayList<Lotto>();
		
		//원본 컬렉션 탐색
		for (Lotto l : this.list) {
			//당첨번호와 일치하는 자료 탐색
			List<Integer> lotto = l.getLotto();
			int count = this.lottoCheck(lotto, value);
			if (count == key) {
				temp.add(l);
			}
		}
		
		//사본 컬렉션 반환
		return temp;
	}
	
	//당첨번호 확인 서브 메소드
	private int lottoCheck(List<Integer> l1, List<Integer> l2) {
		int count = 0;
		for (int i : l1) {
			for (int j : l2) {
				if (i == j) ++count;
			}
		}
		return count;
	}

}

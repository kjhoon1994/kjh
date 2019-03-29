package com.test065;

import java.util.List;

//자료형 클래스
public class Lotto {
	
	//판매소 고유번호(L001, L002, ...)
	//로또번호 세트(5개 번호 1 세트)
	
	private String lid;
	private List<Integer> lotto;
	
	public Lotto() {
	}
	public Lotto(String lid, List<Integer> lotto) {
		this.lid = lid;
		this.lotto = lotto;
	}
	
	public String getLid() {
		return lid;
	}
	public List<Integer> getLotto() {
		return lotto;
	}
	
	@Override
	public String toString() {
		return "Lotto [lid=" + lid + ", lotto=" + lotto.toString() + "]";
	}

}

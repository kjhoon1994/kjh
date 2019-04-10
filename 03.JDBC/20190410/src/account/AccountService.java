package account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class AccountService {

	private AccountDAO adao = new AccountDAO();
	
	// 1. 계좌조회 
	public void menu01(Scanner sc) {
		String key = "accountId";
		Map<String, String> value = new HashMap<String, String>();
		
		System.out.print("계좌번호 입력 : ");
		String acId = sc.nextLine();
		value.put("1", acId);
		List<AccountList> list = this.adao.accountList(key,value);
		this.AccountListPrint(list);
	}
	public void menu02(Scanner sc) {}
	public void menu03(Scanner sc) {}
	private void AccountListPrint(List<AccountList> list) {
		System.out.println("--------------------------");
		System.out.println("계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호");
		for (AccountList a : list) {
			System.out.printf(a.toString());
		}
		if(list.size()==0) {
			System.out.println("출력 결과가 없습니다.");
		}else {
			System.out.printf("총 %d 건 있습니다.%n" ,list.size());
		}	
	}
}


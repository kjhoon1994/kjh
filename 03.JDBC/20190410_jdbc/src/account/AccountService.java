package account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class AccountService {

	// 관리자 암호 상수 선언
	private String adminPW = "1111";

	private AccountDAO adao = new AccountDAO();

	// 1. 계좌조회
	public void menu01(Scanner sc) {
		String key = "accountId";
		Map<String, String> value = new HashMap<String, String>();

		System.out.print("계좌번호 입력 : ");
		String acId = sc.nextLine();
		value.put("accountId", acId);
		List<AccountList> list = this.adao.accountList(key, value);
		this.AccountListPrint(list);
	}

	public void menu02(Scanner sc) {
		System.out.println("계좌입금 작업을 진행합니다");
		System.out.print("계좌번호 > ");
		String accountId = sc.nextLine();
		System.out.print("입금액>");
		int money = sc.nextInt();
		sc.nextLine();

		int balance = this.adao.getBalance(accountId);

		int result = this.adao.deposit(new AccountHistory(accountId, money, balance));

		if (result >= 0) {
			System.out.println("입금되었습니다.");
		} else {
			System.out.println("입금을 실패하였습니다.");
		}

	}

	public void menu03(Scanner sc) {
		System.out.println("계좌출금 작업을 진행합니다");
		System.out.println("계좌번호를  입력해 주세요");
		String accountId = sc.nextLine();

		System.out.println("비밀번호를  입력해 주세요");
		String pw = sc.nextLine();
		System.out.print("출금액>");
		int money = sc.nextInt();
		sc.nextLine();
		int balance = this.adao.getBalance(accountId);

		if (this.adao.getPw(accountId, pw)) {

			if (balance >= money) {
				int result = this.adao.withdraw(new AccountHistory(accountId, money, balance));

				if (result < 0) {
					System.out.println("출금을 실패하였습니다.");
				} else {
					System.out.println("출금하였습니다.");
					System.out.printf("잔액 : %d%n", result);

				}
			} else {
				System.out.println("잔액이 부족합니다.");
			}
		} else {
			System.out.println("비밀번호를 틀렸습니다.");
		}
	}

	private void AccountListPrint(List<AccountList> list) {
		System.out.println("--------------------------");
		System.out.println("계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호");
		for (AccountList a : list) {
			System.out.printf(a.toString());
		}
		if (list.size() == 0) {
			System.out.println("출력 결과가 없습니다.");
		} else {
			System.out.printf("총 %d 건 있습니다.%n", list.size());
		}
	}

	public void adminCheck(Scanner sc) {
		// 관리자 암호 확인
		// -> 암호가 맞는 경우만 관리자 메뉴 출력
		System.out.print("관리자 모드 암호를 입력하세요");
		String pw = sc.nextLine();
		if (pw.equals(adminPW))
			this.adminMenu(sc);

	}

	private void adminMenu(Scanner sc) {
		while (true) {
			System.out.println("**계좌관리 v1.1_관리자**");
			System.out.println("1.계좌생성 2.계좌조회 3.계좌입출금내역 ");

			int ad = sc.nextInt();
			sc.nextLine();
			if (ad == 0)
				break;

			switch (ad) {
			case 1:
				this.adminMenu_1(sc);
				break;
			case 2:
				this.adminMenu_2(sc);
				break;
			case 3:
				this.adminMenu_3(sc);
				break;
			}

		}
	}

	// 계좌 생성
	private void adminMenu_1(Scanner sc) {
		List<AccountList> result;
	
	

		System.out.println("1.신규계좌 생성");
		System.out.println("신규계좌 생성위한 계좌조회를 먼저 진행합니다.");

		System.out.print("이름> ");
		String accountOwnerName = sc.nextLine();
		System.out.print("번호> ");
		String accountOwnerPhone = sc.nextLine();

		Map<String, String> value = new HashMap<String, String>();
		value.put("name", accountOwnerName);
		value.put("phone", accountOwnerPhone);

		List<AccountList> list = this.adao.accountList("namephone", value);
		this.AccountListPrint(list);

		System.out.println("계좌를 생성하시겠습니까?");
		System.out.print("선택(1/0) > ");
		int ch = sc.nextInt();
		sc.nextLine();
		
		
		if (ch == 1) {
			String accountId = this.adao.newAccountId();
			System.out.printf("당신의 계좌번호는 %s입니다 %n", accountId);
			String accountOwnerId = null;
			if (list.size() == 0) {
				
			accountOwnerId = this.adao.newAccountOwnerId();
			System.out.printf("당신의 번호는 %s입니다 %n", accountOwnerId);
			System.out.println("계좌 비밀번호를 지정해주세요(번호 4자리)");
			String pw = sc.nextLine();
			
			AccountOwner ao = new AccountOwner(accountOwnerId, accountOwnerName, accountOwnerPhone);
			Account a = new Account(accountId, accountOwnerId, 0, "", pw, "");

			boolean na = this.adao.newAccount(ao, a);
			if (na) {
				System.out.println("계좌 생성을 성공하였습니다.");
			} else {
				System.out.println("계좌 생성을 실패 하였습니다.");
			}

		} else {
			accountOwnerId = list.get(0).getAccountOwnerId();
			
			System.out.printf("기존회원번호 :%s%n" ,accountOwnerId);
			System.out.println("계좌 비밀번호를 지정해주세요(번호 4자리)");
			String pw = sc.nextLine();
			
			Account aa = new Account(accountId, accountOwnerId,0,"",pw,"");
			AccountOwner ao = new AccountOwner(accountOwnerId, accountOwnerName, accountOwnerPhone);
			boolean naa = this.adao.newAccount(ao, aa);
		}

	}
	}
	// 계좌 조회
	private void adminMenu_2(Scanner sc) {
		while (true) {
			System.out.println("2.계좌조회");
			System.out.println("1.전체계좌 2.계좌번호 3.계좌주");
			int ad = sc.nextInt();
			sc.nextLine();
			if (ad == 0)
				break;

			switch (ad) {
			case 1:
				this.adminMenu_2_1(sc);
				break;
			case 2:
				this.adminMenu_2_2(sc);
				break;
			case 3:
				this.adminMenu_2_3(sc);
				break;
			}
		}
	}

	// 계좌입출금 내역
	private void adminMenu_3(Scanner sc) {

	}

	private void adminMenu_2_1(Scanner sc) {
		System.out.println("**2.계좌조회 / 1.전체 조회");
		String key = "";
		Map<String, String> admin = new HashMap<String, String>();
		List<AccountList> list = this.adao.accountList(key, admin);
		this.AccountListPrint(list);
	}

	private void adminMenu_2_2(Scanner sc) {
		System.out.println("**2.계좌조회 / 2.계좌번호조회");
		String key = "accountId";
		Map<String, String> value = new HashMap<String, String>();

		System.out.print("계좌번호를 입력해 주세요> ");
		String acId = sc.nextLine();
		value.put("accountId", acId);

		List<AccountList> list = this.adao.accountList(key, value);
		this.AccountListPrint(list);

	}

	private void adminMenu_2_3(Scanner sc) {
		System.out.println("**2.계좌조회 / 3.이름/전화번호조회");
		String key = "name/phone";
		Map<String, String> value = new HashMap<String, String>();

		System.out.print("계좌주를 입력해 주세요> ");
		String acowname = sc.nextLine();
		value.put("name", acowname);

		System.out.print("계좌주 번호를 입력해 주세요>");
		String acowph = sc.nextLine();
		value.put("phone", acowph);

		List<AccountList> list = this.adao.accountList(key, value);
		this.AccountListPrint(list);
	}
}

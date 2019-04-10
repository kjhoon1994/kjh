package account;

public class AccountHistory {
	//계좌번호, 입출금액, 입출금일, 입출금구분, 잔액
		private String accountId;
		private int money;
		private String inoutdate;
		private String gubun;
		private int balance;
		
		public AccountHistory() {
			super();
			// TODO Auto-generated constructor stub
		}
		public AccountHistory(String accountId, int money, String inoutdate, String gubun, int balance) {
			super();
			this.accountId = accountId;
			this.money = money;
			this.inoutdate = inoutdate;
			this.gubun = gubun;
			this.balance = balance;
		}
		public String getAccountId() {
			return accountId;
		}
		public void setAccountId(String accountId) {
			this.accountId = accountId;
		}
		public int getMoney() {
			return money;
		}
		public void setMoney(int money) {
			this.money = money;
		}
		public String getInoutdate() {
			return inoutdate;
		}
		public void setInoutdate(String inoutdate) {
			this.inoutdate = inoutdate;
		}
		public String getGubun() {
			return gubun;
		}
		public void setGubun(String gubun) {
			this.gubun = gubun;
		}
		public int getBalance() {
			return balance;
		}
		public void setBalance(int balance) {
			this.balance = balance;
		}
		@Override
		public String toString() {
			return String.format("%s / %d / %s / %s / %d ", accountId, money , inoutdate, gubun, balance);
		}
		
		
		
}

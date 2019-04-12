package account;

public class Account {

	//계좌번호, 계좌주고유번호, 현재잔액, 계좌생성일, 비밀번호, 마지막거래일
		private String accountId;
		private String accountOwnerId;
		private int balance;
		private String accountCreateDate;
		private String pw;
		private String lastUpdateDate;
		
		public Account() {
			super();
			// TODO Auto-generated constructor stub
		}

		public Account(String accountId, String accountOwnerId, int balance, String accountCreateDate, String pw,
				String lastUpdateDate) {
			super();
			this.accountId = accountId;
			this.accountOwnerId = accountOwnerId;
			this.balance = balance;
			this.accountCreateDate = accountCreateDate;
			this.pw = pw;
			this.lastUpdateDate = lastUpdateDate;
		}

		public String getAccountId() {
			return accountId;
		}

		public void setAccountId(String accountId) {
			this.accountId = accountId;
		}

		public String getAccountOwnerId() {
			return accountOwnerId;
		}

		public void setAccountOwnerId(String accountOwnerId) {
			this.accountOwnerId = accountOwnerId;
		}

		public int getBalance() {
			return balance;
		}

		public void setBalance(int balance) {
			this.balance = balance;
		}

		public String getAccountCreateDate() {
			return accountCreateDate;
		}

		public void setAccountCreateDate(String accountCreateDate) {
			this.accountCreateDate = accountCreateDate;
		}

		public String getPw() {
			return pw;
		}

		public void setPw(String pw) {
			this.pw = pw;
		}

		public String getLastUpdateDate() {
			return lastUpdateDate;
		}

		public void setLastUpdateDate(String lastUpdateDate) {
			this.lastUpdateDate = lastUpdateDate;
		}

		@Override
		public String toString() {
			return String.format("%s / %s / %d / %s / %s / %s%n  ", accountId, accountOwnerId, balance, accountCreateDate, pw, lastUpdateDate);
		}
		
		
		
	
}

package account;

public class AccountOwner {
	//계좌주고유번호, 이름, 전화번호
		private String accountOwnerId;
		private String accountOwnerName;
		private String accountOwnerPhone;
		public AccountOwner() {
			super();
			// TODO Auto-generated constructor stub
		}
		public AccountOwner(String accountOwnerId, String accountOwnerName, String accountOwnerPhone) {
			super();
			this.accountOwnerId = accountOwnerId;
			this.accountOwnerName = accountOwnerName;
			this.accountOwnerPhone = accountOwnerPhone;
		}
		public String getAccountOwnerId() {
			return accountOwnerId;
		}
		public void setAccountOwnerId(String accountOwnerId) {
			this.accountOwnerId = accountOwnerId;
		}
		public String getAccountOwnerName() {
			return accountOwnerName;
		}
		public void setAccountOwnerName(String accountOwnerName) {
			this.accountOwnerName = accountOwnerName;
		}
		public String getAccountOwnerPhone() {
			return accountOwnerPhone;
		}
		public void setAccountOwnerPhone(String accountOwnerPhone) {
			this.accountOwnerPhone = accountOwnerPhone;
		}
		@Override
		public String toString() {
			return String.format("%s / %s / %s ", accountOwnerId, accountOwnerName, accountOwnerPhone);
		}
		
		
		
		
}

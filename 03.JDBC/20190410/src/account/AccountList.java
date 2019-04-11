package account;

//출력 서식 자료형 클래스
public class AccountList {

	//계좌번호 / 잔액 / 계좌생성일 / 마지막거래일 / 계좌주 / 전화번호
	private String accountId;
	private int balance;
	private String accountCreateDate;
	private String lastUpdateDate;
	private String accountOwnerName;
	private String accountOwnerPhone;
	public AccountList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AccountList(String accountId, int balance, String accountCreateDate, String lastUpdateDate,
			String accountOwnerName, String accountOwnerPhone) {
		super();
		this.accountId = accountId;
		this.balance = balance;
		this.accountCreateDate = accountCreateDate;
		this.lastUpdateDate = lastUpdateDate;
		this.accountOwnerName = accountOwnerName;
		this.accountOwnerPhone = accountOwnerPhone;
	}
	public AccountList(String accountOwnerName, String accountOwnerPhone) {
		this.accountOwnerName = accountOwnerName;
		this.accountOwnerPhone = accountOwnerPhone;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
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
	public String getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(String lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
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
		return String.format("%s / %d / %s / %s / %s / %s%n ", accountId, balance, accountCreateDate, lastUpdateDate,
				accountOwnerName, accountOwnerPhone);
	}
	
	

}

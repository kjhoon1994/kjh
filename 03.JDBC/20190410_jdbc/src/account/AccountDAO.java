package account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import connection.OracleConnection;

public class AccountDAO {

	// 계좌정보 조회 메소드
	public List<AccountList> accountList(String key, Map<String, String> value) {

		List<AccountList> result = new ArrayList<AccountList>();

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = OracleConnection.connect();

			String sql = "SELECT a.accountId,a.accountOwnerId,a.balance, a.accountCreateDate,a.pw,a.lastUpdateDate,ao.accountOwnerId\r\n" + 
					"    FROM account_ a , accountOwner_ ao\r\n" + 
					"    WHERE a.accountOwnerId= ao.accountOwnerId";

			// 계좌번호 기준, 이름/전화번호 기준
			if (key.equals("accountId")) {
				sql += " AND a.accountId = ? ";
			} else if (key.equals("namephone")) {
				sql += " AND accountOwnerName = ? AND accountOwnerPhone = ? ";
			} 
			
			sql += " ORDER BY accountId";
			stmt = conn.prepareStatement(sql);

			if (key.equals("accountId")) {
				stmt.setString(1, value.get("accountId"));
			}
			if (key.equals("namephone")) {
				stmt.setString(1, value.get("name"));
				stmt.setString(2, value.get("phone"));
			}
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String accountId = rs.getString("accountId");
				String accountCreateDate = rs.getString("accountCreateDate");
				int balance = rs.getInt("balance");
				String lastUpdateDate = rs.getString("lastUpdateDate");
				String accountOwnerName = rs.getString("accountOwnerName");
				String accountOwnerPhone = rs.getString("accountOwnerPhone");
				String accountOwnerId = rs.getString("accountOwnerId");

				result.add(new AccountList(accountId, balance, accountCreateDate, lastUpdateDate, accountOwnerName,
						accountOwnerPhone,accountOwnerId));
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;
	}

	// 계좌 비밀번호 확인용 메소드
	public boolean getPw(String accountId, String pw) {
		boolean result = false;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = OracleConnection.connect();

			String sql = "SELECT accountId, pw" + " FROM account_ a , accountowner_ ao"
					+ " WHERE a.accountownerid = ao.accountownerid" + " AND a.accountId = ?" + " AND pw = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, accountId);
			stmt.setString(2, pw);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				result = true;
			}
			rs.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}

	// 현재 잔액 확인용 메소드
	public int getBalance(String accountId) {
		int result = 0;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = OracleConnection.connect();

			String sql = "SELECT balance\r\n" + "FROM account_\r\n" + "  WHERE accountId= ?";

			stmt = conn.prepareStatement(sql);
			stmt.setString(1, accountId);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				result = rs.getInt("balance");
			}
			rs.close();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
			// SELECT

		}
		return result;
	}

	// 입금 액션 메소드 -> 성공할수 도 실패할수도 있다. -> 둘다 성공해야한다.
	public int deposit(AccountHistory ah) {
		int result = -1;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// INSERT + UPDATE

			conn = OracleConnection.connect();

			// 자동 퍼밋 x
			conn.setAutoCommit(false);

			int newBalance = ah.getBalance() + ah.getMoney();

			String sql1 = " INSERT INTO AccountHistory_ (accountId, money, inoutdate,gubun, balance) \r\n"
					+ "    VALUES(?,?, SYSDATE, '입금', ?) ";

			stmt = conn.prepareStatement(sql1);

			stmt.setString(1, ah.getAccountId());
			stmt.setInt(2, ah.getMoney());
			stmt.setInt(3, newBalance);

			stmt.executeUpdate();
			stmt.close();

			String sql2 = "UPDATE Account_\r\n" + "    SET balance = ? , " + " lastupdatedate =SYSDATE\r\n"
					+ "    WHERE accountId = ?";
			stmt = conn.prepareStatement(sql2);
			stmt.setInt(1, newBalance);
			stmt.setString(2, ah.getAccountId());

			stmt.executeUpdate();

			stmt.close();
			// 커밋 액션 진행
			conn.commit();
			// 입금후 잔액 변동
			result = newBalance;
		}

		catch (ClassNotFoundException | SQLException e) {

			try {
				// 롤백 액션 진행
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();

		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}

	// 출금 액션 메소드
	public int withdraw(AccountHistory ah) {
		int result = -1;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// INSERT + UPDATE

			conn = OracleConnection.connect();

			conn.setAutoCommit(false);

			int newBalance = (ah.getBalance() - ah.getMoney());

			String sql1 = "INSERT INTO AccountHistory_ (accountId, money, inoutdate,gubun, balance)\r\n"
					+ "    VALUES(?,?, SYSDATE, '출금', ?)";
			stmt = conn.prepareStatement(sql1);

			stmt.setString(1, ah.getAccountId());
			stmt.setInt(2, ah.getMoney());
			stmt.setInt(3, newBalance);

			stmt.executeUpdate();
			stmt.close();

			String sql2 = "UPDATE Account_\r\n" + "    SET balance = ? , " + " lastupdatedate =SYSDATE\r\n"
					+ "    WHERE accountId = ?";
			stmt = conn.prepareStatement(sql2);
			stmt.setInt(1, newBalance);
			stmt.setString(2, ah.getAccountId());

			stmt.executeUpdate();

			stmt.close();
			// 커밋 액션 진행
			conn.commit();
			// 입금후 잔액 변동
			result = newBalance;
		}

		catch (ClassNotFoundException | SQLException e) {
			try {
				// 롤백 액션 진행
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();

		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;

	}

	// 계좌 생성시 번호 자동 생성
	public String newAccountId() {
		String result = "000-0000-0";

		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql2 = "SELECT CONCAT('111-',SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),1,4)||'-'||SUBSTR((REPLACE(SUBSTR(MAX(accountId),5),'-')+1),5)) newaccountId\r\n"
					+ "    FROM account_";
			stmt = conn.prepareStatement(sql2);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("newAccountId");
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}

	// 신규 사용자 번호 자동 생성 메소드
	public String newAccountOwnerId() {
		String result = "A000";

		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql2 = "SELECT CONCAT('A',TRIM(TO_CHAR(SUBSTR(MAX(accountOwnerId),2)+1,'000'))) newAccountOwnerId\r\n"
					+ "    FROM AccountOwner_     ";
			stmt = conn.prepareStatement(sql2);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				result = rs.getString("newAccountOwnerId");
			}
			rs.close();
		}

		catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;
	}

	public boolean newAccount(AccountOwner ao, Account a) {
		boolean result = false;
	
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			conn = OracleConnection.connect();
			
			// 트랜잭션 처리
			conn.setAutoCommit(false);
			if (ao != null) {
				// 계좌주 정보 생성
				String sql = "INSERT INTO AccountOwner_(accountOwnerId, accountOwnerName, accountOwnerPhone)\r\n"+
				"VALUES (?,?,?)";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, ao.getAccountOwnerId());
				stmt.setString(2, ao.getAccountOwnerName());
				stmt.setString(3, ao.getAccountOwnerPhone());
				
				stmt.executeUpdate();
				stmt.close();
				
			}
			String sql2 = " INSERT INTO Account_(accountId,accountOwnerId ,balance ,accountCreateDate ,pw ,lastUpdateDate) " +
					"VALUES( ?, ?, 0, SYSDATE, ?, SYSDATE) ";
			stmt = conn.prepareStatement(sql2);

			stmt.setString(1, a.getAccountId());
			stmt.setString(2, a.getAccountOwnerId());
			stmt.setString(3, a.getPw());
			
			stmt.executeUpdate();
			stmt.close();
			//트랜잭션 처리
			conn.commit();
			
			// 계좌정보 
			//계좌주 정보 ,계좌정보 생성 성공 메시지
			result = true;
		


		}catch (ClassNotFoundException | SQLException e) {
			try {
				// 롤백 액션 진행
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}

			e.printStackTrace();

		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				OracleConnection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return result;

	}

	
}
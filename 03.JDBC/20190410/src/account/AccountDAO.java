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
			
			String sql = "SELECT accountId, balance, accountCreateDate, lastUpdateDate, accountOwnerName, accountOwnerPhone\r\n" + 
					"    FROM account_ a , accountowner_ ao\r\n "
					+ "WHERE a.accountownerid = ao.accountownerid " ;
			
		// 계좌번호 기준, 이름/전화번호 기준
		if (key.equals("accountId")) {
			 sql += "AND a.accountId = ? ";
		}
		stmt = conn.prepareStatement(sql);
		
		
		if (key.equals("accountId")) {
			stmt.setString(1,value.get("1"));
		}
		if (key.equals("accountOwnerName")||key.equals("accountOwnerPhone")){
			stmt.setString(1,value.get("2"));
			stmt.setString(1,value.get("3"));
		}
		
		ResultSet rs = stmt.executeQuery();		
		
		while(rs.next()) {
			String accountId = rs.getString("accountId");
			String accountCreateDate = rs.getString("accountCreateDate");
			int balance = rs.getInt("balance");
			String lastUpdateDate = rs.getString("lastUpdateDate");
			String accountOwnerName = rs.getString("accountOwnerName");
			String accountOwnerPhone = rs.getString("accountOwnerPhone");
			
			result.add(new AccountList(accountId ,  balance,accountCreateDate,lastUpdateDate, accountOwnerName, accountOwnerPhone));
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
}
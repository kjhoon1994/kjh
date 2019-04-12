package emp.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;
import emp.domain.Region;


public class RegionDAO {
	// 출력 메소드
	public List<Region> regionList(String key, String value) {
		List<Region> result = new ArrayList<Region>();

		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
		String sql = "SELECT regId, reg_name \r\n "
				+ ", (SELECT COUNT(*) FROM employees WHERE regId = r.regId) count_\r\n" + "    FROM regions r\r\n";

		sql += " ORDER BY regId";
		stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();

		while (rs.next()) {
			String regId = rs.getString("regId");
			String reg_name = rs.getString("reg_name");
			int count_ = rs.getInt("count_");
			
			result.add(new Region(regId, reg_name, count_));
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

	// 입력 메소드
	public int regionAdd(String reg_name) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "INSERT INTO regions (regId, reg_name)\r\n"
					+ "    VALUES ((SELECT CONCAT('REG', LPAD(NVL(SUBSTR(MAX(regId), 4), 0) + 1, 2, 0)) \r\n"
					+ "	AS newId FROM regions), ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, reg_name);

			result = stmt.executeUpdate();
			stmt.close();

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

	// 삭제 메소드
	public int regionRemove(String regId) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "DELETE FROM regions WHERE regId = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, regId);
			
			result = stmt.executeUpdate();
			stmt.close();

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

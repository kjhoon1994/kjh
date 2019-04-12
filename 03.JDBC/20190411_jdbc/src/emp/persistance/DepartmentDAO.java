package emp.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;
import emp.domain.Department;


public class DepartmentDAO {
	// 입력 메소드

	public int deptAdd(String dept_name) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "INSERT INTO departments (deptId, dept_name)\r\n"
					+ "    VALUES ((SELECT CONCAT('DEPT', LPAD(NVL(SUBSTR(MAX(deptId), 5), 0) + 1, 2, 0)) \r\n"
					+ "	AS newId FROM departments), ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, dept_name);

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

	public int deptRemove(String deptId) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "DELETE FROM departments WHERE deptId = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, deptId);

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

	public List<Department> departmentlist(String key, String value) {
		List<Department> result = new ArrayList<Department>();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "SELECT deptId, dept_name \r\n " + "FROM departments r\r\n";

			sql += " ORDER BY deptId";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String deptId = rs.getString("deptId");
				String dept_name = rs.getString("dept_name");

				result.add(new Department(deptId, dept_name));
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

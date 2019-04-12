package emp.persistance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;
import emp.domain.Job;

public class JobDAO {
	
	// 직위 추가
	public int jobAdd(String job_title,int min_basicPay) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "INSERT INTO jobs (jobId, job_title, min_basicPay)\r\n" + 
					"    VALUES ((SELECT CONCAT('JOB', LPAD(NVL(SUBSTR(MAX(jobId), 4), 0) + 1, 2, 0)) \r\n" + 
					"        AS newId FROM jobs), ?, ?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, job_title);
			stmt.setInt(2,min_basicPay);
			

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
	
	// 직위 제거
	public int jobRemove(String jobId) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "DELETE FROM jobs WHERE jobId = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, jobId);

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
	// 출력검색
	public List<Job> joblist(String key, String value) {
		List<Job> result = new ArrayList<Job>();
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql = "SELECT jobId, job_title  \r\n " + "FROM jobs r\r\n";

			sql += " ORDER BY jobId";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String jobId = rs.getString("jobId");
				String job_title = rs.getString("job_title");


				result.add(new Job(jobId, job_title));
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

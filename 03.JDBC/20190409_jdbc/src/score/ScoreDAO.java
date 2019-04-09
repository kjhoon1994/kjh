package score;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;

public class ScoreDAO {
	public List<Score> list(String key, String value) {

		List<Score> result = new ArrayList<Score>();

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = OracleConnection.connect();

			/*
			 * CREATE OR REPLACE VIEW scoresView AS SELECT sid_, name_, sub1, sub2, sub3,
			 * (sub1 + sub2 + sub3) total_," +
			 * " ROUND((sub1 + sub2 + sub3)/3, 2) avg_, RANK() OVER(ORDER BY (sub1+sub2+sub3) DESC) rank_"
			 * + "   FROM scores" + "   ORDER BY sid_";
			 */

			String sql = " SELECT sid_, name_, sub1, sub2, sub3 " + " , total_, avg_, rank_\r\n "
					+ "    FROM scoresView\r\n ";

			// 검색 진행시 WHERE 조건절 추가
			if (key.equals("sid_")) {
				sql += " WHERE sid_ = ? ";
			}
			if (key.equals("name_")) {
				sql += " WHERE INSTR(LOWER(name_), LOWER(?)) >0 ";
			}
			sql += " ORDER BY sid_";

			stmt = conn.prepareStatement(sql);

			// 검색 진행 시 데이터바인딩 추가
			if (key.equals("sid_") || key.equals("name_")) {
				stmt.setString(1, value);
			}

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				String sid_ = rs.getString("sid_");
				String name_ = rs.getString("name_");
				int sub1 = rs.getInt("sub1");
				int sub2 = rs.getInt("sub2");
				int sub3 = rs.getInt("sub3");
				int total_ = rs.getInt("total_");
				double avg_ = rs.getDouble("avg_");
				int rank_ = rs.getInt("rank_");
				result.add(new Score(sid_, name_, sub1, sub2, sub3, total_, avg_, rank_));
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
	// 메소드별로 독립적인 데이터베이스 커넥션 연결 및 쿼리 실행 과정 추가
	public int add(Score s) {
		int result = 0;
		
		// 데이터베이스에 자료 입력 후 반환된 행의 결과값을 숫자로 반환

		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();

			String sql2 = "INSERT INTO scores (sid_, name_, sub1, sub2, sub3) " + "VALUES (?,?,?,?,?) ";
			stmt = conn.prepareStatement(sql2);

			stmt.setString(1, s.getSid_());
			stmt.setString(2, s.getName_());
			stmt.setInt(3, s.getSub1());
			stmt.setInt(4, s.getSub2());
			stmt.setInt(5, s.getSub3());

			result = stmt.executeUpdate(); // 정상실행 1반환 / 비정상 실행 0반환

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

	// 신규 번호 자동 생성 메소드
	public String newSid() {
		String result = "G000";

		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			String sql2 = "SELECT CONCAT('G',TRIM(TO_CHAR(SUBSTR(MAX(sid_),2)+1,'000'))) newSid_\r\n" + 
					"    FROM scores     ";
			stmt = conn.prepareStatement(sql2);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {
				result= rs.getString("newSid_");
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
}
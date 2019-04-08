package jdbc006;

//1 단계 : Import required packages	
import java.sql.*;

public class Main {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			// 2 단계 : Register JDBC driver
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 3 단계 :
			conn = DriverManager.getConnection("jdbc:oracle:thin:@211.238.142.52:1521:xe", "rlawogns", "1111");

			// 4 단계 :

			String sql = "INSERT INTO Employees (id_ ,age, first_, last_)" + "VALUES (?,?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, 105);
			stmt.setInt(2, 25);
			stmt.setString(3, "park");
			stmt.setString(4, "gildong");

			// 5 단계 : 쿼리 실행 결과 분석 및 출력
			// 주의) executeUpdate() 메소드 안에 sql 구문 없습니다.
			int result = stmt.executeUpdate();
			System.out.printf("%d개의 행이 삽입되었습니다.%n",result);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			// 6 단계 : Clean-up environment
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}

			try {
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

	}

}

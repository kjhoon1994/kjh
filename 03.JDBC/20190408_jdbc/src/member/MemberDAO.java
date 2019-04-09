package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.OracleConnection;

//자료저장소 운영 클래스
public class MemberDAO {
	
	//주의) 데이터베이스 이용하는 경우 별도의 저장소 객체(배열, 컬렉션 등)를 준비하지 않는다.

	//출력 메소드
	//메소드별로 독립적인 데이터베이스 커넥션 연결 및 쿼리 실행 과정 추가
	public List<Member> list() {
		List<Member> result = new ArrayList<Member>();
		
		//데이터베이스에서 읽어온 자료 집합(ResultSet)을 컬렉션(List)에 저장 및 반환
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			
			
			String sql = "SELECT mid, name_, phone, email\r\n" + 
					"    FROM members\r\n" + 
					"    ORDER BY mid";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()) {
				String mid = rs.getString("mid");
				String name_ = rs.getString("name_");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				result.add(new Member(mid, name_, phone, email));
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
	
	
	//입력 메소드
	//메소드별로 독립적인 데이터베이스 커넥션 연결 및 쿼리 실행 과정 추가
	public int add(Member m) {
		int result = 0;
		
		//데이터베이스에 자료 입력 후 반환된 행의 결과값을 숫자로 반환
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = OracleConnection.connect();
			
			String sql2 = "INSERT INTO members (mid, name_, phone, email)"
					+ "VALUES (?,?,?,?)";
			stmt = conn.prepareStatement(sql2);
					
			stmt.setString(1,m.getMid());
			stmt.setString(2,m.getName_());
			stmt.setString(3,m.getPhone());
			stmt.setString(4,m.getEmail());
		
			result = stmt.executeUpdate();		// 정상실행 1반환 비정상 실행0반환
						
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

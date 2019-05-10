package com.guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.connection.MySQLConnection80;

public class LoginDAO {
	
	public Login adminLogin(String id, String pw, int grade){
		
		Login result = null;
		
		//아이디, 패스워드 등급을 동시에 확인하는 쿼리
		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = MySQLConnection80.connect();

			// SELECT -> 최초 실행시
			String sql = "SELECT  * FROM (SELECT l.id_ ,l.pw, l.grade, m.name_, m.phone, m.email  \r\n" + 
					"	FROM login l , members m\r\n" + 
					"    WHERE l.id_ = m.id\r\n" + 
					"    AND l.id_ = ?\r\n" + 
					"    AND l.pw = ?\r\n" + 
					"    AND l.grade= ?) login";
		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,id);
			stmt.setString(2, pw);
			stmt.setInt(3, grade);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				String name_ = rs.getString("name_");
				String phone = rs.getString("phone");
				String email = rs.getString("email");

				result = new Login(id, pw, grade, name_, phone, email);
			}

			rs.close();

		} catch (Exception e) {

		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (SQLException se2) {
			}
			try {
				MySQLConnection80.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		return result;

	}
	
	
	public Login login(String id, String pw, int grade){
		Login result = null;
		
		//아이디, 패스워드, 등급을 동시에 확인하는 쿼리
		
		
		
		return result;
	}
}

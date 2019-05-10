package com.guestbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.connection.MySQLConnection80;

public class AdminpictureDAO {

	public List<Adminpicture> plist() {
		
		List<Adminpicture> result = new ArrayList<Adminpicture>();

		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT pname, pcontents\r\n" + 
					"	FROM picture";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				String pname = rs.getString("pname");
				String pcontents = rs.getString("pcontents");

				result.add(new Adminpicture(pname, pcontents));

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
	
	public int addpicture(String pname, String pcontents) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = MySQLConnection80.connect();

			String sql = "INSERT INTO picture(pid, pname, pcontents) VALUES(?,?,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, newpid());
			stmt.setString(2, pname);
			stmt.setString(3, pcontents);
			result = stmt.executeUpdate();
			
			stmt.close();

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
	
	// 자동 사진 번호 생성
	public String newpid() {
		String result = "";
		
		Connection conn = null;
		PreparedStatement stmt = null;
		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT CONCAT('P',LPAD((SUBSTR(MAX(pid),2,4)+1),3,0)) AS pid\r\n" + 
					"	FROM picture";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while(rs.next()) {
				result = rs.getString("pid");
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

}

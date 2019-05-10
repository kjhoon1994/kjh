package com.guestbook;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.connection.MySQLConnection80;

public class GuestbookDAO {

	// 전체 출력 메소드 작성
	public List<Guestbook> glist(String offset, String count) {
		
		List<Guestbook> result = new ArrayList<Guestbook>();

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = MySQLConnection80.connect();

			// SELECT -> 최초 실행시
			String sql = "SELECT ssn, name_, sdate, ipaddress, blind, pw, contents FROM Guestbook "
					+ "WHERE blind = 0 ORDER BY ssn LIMIT ?,?" ;
			stmt = conn.prepareStatement(sql);
			int pageoffset = Integer.parseInt(offset);
			int pagecount = Integer.parseInt(count);
			
			stmt.setInt(1, (pageoffset-1)*pagecount);
			stmt.setInt(2,pagecount);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				int ssn = rs.getInt("ssn");
				String name_ = rs.getString("name_");
				String sdate = rs.getString("sdate");
				String ipaddress = rs.getString("ipaddress");
				int blind = rs.getInt("blind");
				String pw = rs.getString("pw");
				String contents = rs.getString("contents");

				result.add(new Guestbook(ssn, name_, sdate, ipaddress, blind, pw, contents));

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

	public int newSsn() {
		int result = 0;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = MySQLConnection80.connect();

			String sql = "SELECT (MAX(ssn) + 1) AS newSsn FROM Guestbook";
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				result = rs.getInt("newSsn");

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

	public int addguestbook(Guestbook gb) {

		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = MySQLConnection80.connect();

			// INSERT만 존재
			String sql = "INSERT INTO Guestbook (ssn, name_, sdate, ipaddress, blind, pw, contents) \r\n"
					+ "   VALUES (?, ?, SYSDATE(), ?, 0, ?, ?)";
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, newSsn());
			stmt.setString(2, gb.getName_());
			stmt.setString(3, gb.getIpaddress());
			stmt.setString(4, gb.getPw());
			stmt.setString(5, gb.getContents());

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

	public int removeguestbook(String ssn, String pw) {
		int result = 0;
		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			conn = MySQLConnection80.connect();
			String sql = "DELETE FROM guestbook WHERE ssn = ? AND pw = ? ";
			stmt = conn.prepareStatement(sql);

			stmt.setInt(1, Integer.parseInt(ssn));
			stmt.setString(2, pw);
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
	
	// 게시물 전체수 카운트
	public int totalcount() {
        int result = 0;
 
        Connection conn = null;
        PreparedStatement stmt = null;
 
        try {
 
            conn = MySQLConnection80.connect();
 
            
            String sql = "SELECT COUNT(ssn) count_ FROM guestbook";
            stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
 
            while (rs.next()) {
 
                result = rs.getInt("count_");
                
 
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
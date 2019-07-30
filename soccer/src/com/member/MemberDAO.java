package com.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.DBConn;

public class MemberDAO {

	private Connection conn = DBConn.getConnection();

	// 회원가입
	public void insertmember(MemberDTO dto) {

		String sql;
		PreparedStatement pstmt = null;
		try {
			sql = "INSERT INTO member(UserId, pwd, UserName, phone, email, grade) VALUES(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getGrade());
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
				}
			}
		}
	}

	public MemberDTO checkMember(String UserId) {
		MemberDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT UserId, UserName,pwd, phone, email, grade FROM member WHERE UserId = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, UserId);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto=new MemberDTO();
				dto.setUserId(rs.getString("UserId"));
				dto.setUserName(rs.getString("UserName"));
				dto.setPwd(rs.getString("pwd"));
				dto.setPhone(rs.getString("phone"));
				dto.setEmail(rs.getString("email"));
				dto.setGrade(rs.getString("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {

				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {

				}
			}
		}
		return dto;
	}
}

package com.record;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class RecordDAO {

	Connection conn = DBConn.getConnection();

	public List<RecordDTO> recordlist(int leagueId) {
		List<RecordDTO> recordlist = new ArrayList<RecordDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql = "SELECT ROWNUM,teamname, win, draw,lose,(win*3+draw)point FROM(SELECT teamid, teamName,win,draw,lose,(win*3+draw) point "
					+ " FROM team  WHERE leagueId=? ORDER BY POINT DESC)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, leagueId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecordDTO dto = new RecordDTO();
				dto.setRownum(rs.getInt("ROWNUM"));
				dto.setTeamname(rs.getString("teamname"));
				dto.setWin(rs.getInt("win"));
				dto.setDraw(rs.getInt("draw"));
				dto.setLose(rs.getInt("lose"));
				dto.setPoint(rs.getInt("point"));
				recordlist.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return recordlist;
	}

	public List<RecordDTO> playerrecordlist(int leagueId,String mode) {
		List<RecordDTO> recordlist = new ArrayList<RecordDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs = null;
		try {
			sql = "SELECT ROWNUM, playername,teamname,goal,assist,mvp FROM(SELECT p.playername,t.teamname,p.goal,p.assist,p.mvp " 
					+ " FROM player p, team t " + 
					" WHERE p.leagueId= ? " + 
					" AND p.leagueId=t.leagueId " + 
					" AND p.teamId = t.teamId " + 
					" ORDER BY "+mode+" DESC) WHERE ROWNUM <= 5 ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, leagueId);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecordDTO dto = new RecordDTO();
				dto.setRownum(rs.getInt("ROWNUM"));
				dto.setPlayername(rs.getString("playername"));
				dto.setTeamname(rs.getString("teamname"));
				dto.setGoal(rs.getInt("goal"));
				dto.setAssist(rs.getInt("assist"));
				dto.setMvp(rs.getInt("mvp"));
				
				recordlist.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return recordlist;
	}
}

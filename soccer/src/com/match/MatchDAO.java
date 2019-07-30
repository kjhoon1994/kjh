package com.match;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class MatchDAO {
	private Connection conn = DBConn.getConnection();

	public List<MatchDTO> matchlist(int leagueId) {
		List<MatchDTO> matchlist = new ArrayList<MatchDTO>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = " SELECT m.matchId, t1.teamname hometeam, t2.teamname awayteam, to_char(m.matchdate,'YYYY-MM-DD') matchdate, m.stadium, l.leaguename  "
					+ " FROM matchinfo m, team t1, team t2, league l "
					+ " WHERE t1.teamId = hometeam AND t2.teamId= awayteam AND l.leagueId = m.leagueId AND m.leagueId = ? ORDER BY matchid DESC ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, leagueId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MatchDTO dto = new MatchDTO();
				dto.setMatchId(rs.getInt("matchId"));
				dto.setHometeam(rs.getString("hometeam"));
				dto.setAwayteam(rs.getString("awayteam"));
				dto.setMatchdate(rs.getString("matchdate"));
				dto.setStadium(rs.getString("stadium"));
				dto.setLeaguename(rs.getString("leaguename"));

				matchlist.add(dto);
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
		return matchlist;
	}

	public void addmatch(int homeId, int awayId, String matchdate, String stadium, int leagueId) {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = " INSERT INTO matchinfo(matchId, hometeam, awayteam, matchdate, stadium,leagueId)\r\n"
					+ "    VALUES(match_seq.NEXTVAL,?, ?,?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, homeId);
			pstmt.setInt(2, awayId);
			pstmt.setString(3, matchdate);
			pstmt.setString(4, stadium);
			pstmt.setInt(5, leagueId);
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

	public List<MatchDTO> article(int matchId, int leagueId) {
		List<MatchDTO> articleList = new ArrayList<MatchDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "SELECT t1.teamName hometeam,r.hometeam_score,t2.teamname awayteam,r.awayteam_score,TO_CHAR(matchdate,'YYYY-MM-DD') matchdate ,stadium\r\n"
					+ "FROM matchinfo m, team t1, team t2, results r " + "WHERE r.matchid=m.matchid "
					+ "and m.hometeam=t1.teamId " + "and m.awayteam=t2.teamId " + "AND m.matchId= ? "
					+ "AND m.leagueId= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, matchId);
			pstmt.setInt(2, leagueId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MatchDTO dto = new MatchDTO();
				dto.setHometeam(rs.getString("hometeam"));
				dto.setHomescore(rs.getInt("hometeam_score"));
				dto.setAwayteam(rs.getString("awayteam"));
				dto.setAwayscore(rs.getInt("awayteam_score"));
				dto.setMatchdate(rs.getString("matchdate"));
				dto.setStadium(rs.getString("stadium"));

				articleList.add(dto);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e2) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}
		}
		return articleList;
	}

	public void insertdetail(int matchId,int homescore, int awayscore) {
		PreparedStatement pstmt = null;

		String sql;
		try {
			sql = " INSERT INTO results(matchId, hometeam_score, awayteam_score) VALUES (?,?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, matchId);
			pstmt.setInt(2, homescore);
			pstmt.setInt(3, awayscore);
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
}

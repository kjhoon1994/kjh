package com.team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class TeamDAO {
	private Connection conn = DBConn.getConnection();

	public List<TeamDTO> list(int leagueId) {
		List<TeamDTO> list = new ArrayList<TeamDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT ROWNUM newteamId, teamId,teamname,coach,leagueName,leagueId "
					+ "FROM(SELECT teamId, teamName, coach, leagueName,t.leagueId FROM team t, league l "
					+ "WHERE t.leagueId = l.leagueId AND l.leagueId = ? ORDER BY teamname)     ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, leagueId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				TeamDTO dto = new TeamDTO();

				dto.setRownum(rs.getInt("newteamId"));
				dto.setTeamId(rs.getInt("teamId"));
				dto.setTeamName(rs.getString("teamName"));
				dto.setCoach(rs.getString("coach"));
				dto.setLeagueName(rs.getString("leagueName"));
				dto.setLeagueId(rs.getInt("leagueId"));
				list.add(dto);
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
		return list;
	}

	public void insertteam(TeamDTO dto) {
		PreparedStatement pstmt = null;
		String sql = null;

		try {
			sql = " INSERT INTO team(teamId ,teamName, leagueId, coach)  VALUES (team_seq.NEXTVAL,? , ?, ?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTeamName());
			pstmt.setInt(2, dto.getLeagueId());
			pstmt.setString(3, dto.getCoach());
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

	public void deleteteam(int[] nums) {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = "DELETE FROM team WHERE teamId=? ";
			pstmt = conn.prepareStatement(sql);
			for (int i = 0; i < nums.length; i++) {
				pstmt.setInt(i + 1, nums[i]);
			}
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
					// TODO: handle exception
				}
			}
		}
	}

	public List<TeamDTO> showteamlist(int leagueId) {
		List<TeamDTO> list = new ArrayList<TeamDTO>();

		String sql;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			sql = "SELECT teamId, teamName FROM team WHERE leagueId=? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, leagueId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeamDTO dto = new TeamDTO();
				dto.setTeamId(rs.getInt("teamId"));
				dto.setTeamName(rs.getString("teamName"));
				list.add(dto);

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
		return list;
	}

	public void updateteam(TeamDTO dto) {
		PreparedStatement pstmt = null;
		String sql;

		try {
			sql = " UPDATE team SET teamName= ? , leagueid= ?, coach=? , win=win+? , lose=lose +?, draw=draw+? WHERE teamid= ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTeamName());
			pstmt.setInt(2, dto.getLeagueId());
			pstmt.setString(3, dto.getCoach());
			pstmt.setInt(4, dto.getWin());
			pstmt.setInt(5, dto.getLose());
			pstmt.setInt(6, dto.getDraw());
			pstmt.setInt(7, dto.getTeamId());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e2) {
				}
			}

		}
	}
}

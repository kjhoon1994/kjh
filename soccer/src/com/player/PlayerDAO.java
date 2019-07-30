package com.player;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConn;

public class PlayerDAO {
	private Connection conn = DBConn.getConnection();

	// 선수 리스트
	public List<PlayerDTO> list(int teamId, int leagueId) {
		List<PlayerDTO> list = new ArrayList<PlayerDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {
			sql = "SELECT p.leagueId, p.playerId, p.playerName, p.PlayerBackNum, t.teamName,p.goal,p.assist,p.mvp,p.country   "
					+ "FROM player p, team t  WHERE p.teamId = t.teamId AND p.teamId =? AND p.leagueId=? ORDER BY p.PlayerBackNum ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, teamId);
			pstmt.setInt(2, leagueId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PlayerDTO dto = new PlayerDTO();
				dto.setLeagueId(rs.getInt("leagueId"));
				dto.setPlayerId(rs.getInt("playerId"));
				dto.setPlayerName(rs.getString("playerName"));
				dto.setPlayerBackNum(rs.getInt("PlayerBackNum"));
				dto.setTeamName(rs.getString("teamName"));
				dto.setGoal(rs.getInt("goal"));
				dto.setAssist(rs.getInt("assist"));
				dto.setMvp(rs.getInt("mvp"));
				dto.setCountry(rs.getString("country"));

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

	public void insertplayer(PlayerDTO dto) {
		PreparedStatement pstmt = null;

		String sql;

		try {
			sql = "INSERT INTO player(playerid, teamId,leagueId, playerName, PlayerBackNum, goal, assist, mvp, country) VALUES(player_seq.NEXTVAL, ?, ?, ?, ?, 0, 0, 0,?) ";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, dto.getTeamId());
			pstmt.setInt(2, dto.getLeagueId());
			pstmt.setString(3, dto.getPlayerName());
			pstmt.setInt(4, dto.getPlayerBackNum());
			pstmt.setString(5, dto.getCountry());

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

	public void deleteplayer(int[] nums) {
		PreparedStatement pstmt = null;

		String sql;
		try {
			sql = " DELETE FROM player WHERE playerId=? ";
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

				}

			}
		}

	}

	public void updateplayer(int goal, int assist, int mvp, int playerId) {
		PreparedStatement pstmt = null;

		String sql;
		try {
			sql = " UPDATE player SET goal=goal+? ,assist=assist+?, mvp=mvp+? WHERE playerId = ?  ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, goal);
			pstmt.setInt(2, assist);
			pstmt.setInt(3, mvp);
			pstmt.setInt(4, playerId);
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

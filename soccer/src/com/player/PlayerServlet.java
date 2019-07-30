package com.player;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/player/*")
public class PlayerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PlayerDAO dao = new PlayerDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		process(req, resp);
	}

	protected void forward(HttpServletRequest req, HttpServletResponse resp, String path)
			throws ServletException, IOException {
		// 포워딩을 위한 메소드
		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}

	protected void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();

		if (uri.indexOf("list.do") != -1) {
			list(req, resp);
		} else if (uri.indexOf("created.do") != -1) {
			createdForm(req, resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			createdSubmit(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<PlayerDTO> list;

		int teamId = Integer.parseInt(req.getParameter("teamId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		list = dao.list(teamId, leagueId);

		req.setAttribute("list", list);
		req.setAttribute("teamId", teamId);
		req.setAttribute("leagueId", leagueId);
		forward(req, resp, "/WEB-INF/view/team/teamarticle.jsp");

	}

	private void createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int leagueId=Integer.parseInt(req.getParameter("leagueId"));
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		
		req.setAttribute("leagueId", leagueId);
		req.setAttribute("teamId", teamId);
		forward(req, resp, "/WEB-INF/view/team/playercreate.jsp");
	}

	private void createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		
		PlayerDTO dto = new PlayerDTO();
		PlayerDAO dao = new PlayerDAO();
		
		String pname = req.getParameter("pname");
		int pnumber = Integer.parseInt(req.getParameter("pnumber"));
		int tnumber = Integer.parseInt(req.getParameter("tnumber"));
		String country = req.getParameter("country");
		
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		
		dto.setLeagueId(leagueId);
		dto.setTeamId(teamId);
		dto.setPlayerName(pname);
		dto.setPlayerBackNum(pnumber);
		dto.setTeamId(tnumber);
		dto.setCountry(country);
		
		
		dao.insertplayer(dto);
		
		resp.sendRedirect(cp+"/player/list.do?teamId="+teamId+"&leagueId="+leagueId);
	}

	private void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] check =req.getParameterValues("check");
		int nums[]=null;
		nums=new int[check.length];
		for (int i=0; i<check.length; i++)
			nums[i]=Integer.parseInt(check[i]);
		req.setAttribute("playerId", nums[0]);
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		req.setAttribute("teamId", teamId);
		req.setAttribute("leagueId", leagueId);
		forward(req, resp, "/WEB-INF/view/team/playerinfo.jsp");
		
	}

	private void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		PlayerDAO dao = new PlayerDAO();
		
		int playerId = Integer.parseInt(req.getParameter("playerId"));
		int goal = Integer.parseInt(req.getParameter("goal"));
		int assist = Integer.parseInt(req.getParameter("assist"));
		int mvp = Integer.parseInt(req.getParameter("mvp"));
		dao.updateplayer(goal, assist, mvp, playerId);
		
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		req.setAttribute("teamId", teamId);
		req.setAttribute("leagueId", leagueId);
		
		resp.sendRedirect(cp+"/player/list.do?teamId="+teamId+"&leagueId="+leagueId);
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp = req.getContextPath();
		PlayerDAO dao = new PlayerDAO();
		String[] check = req.getParameterValues("check");
		int nums[]=null;
		nums=new int[check.length];
		for (int i=0; i<check.length; i++)
			nums[i]=Integer.parseInt(check[i]);
		dao.deleteplayer(nums);
		
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		req.setAttribute("teamId", teamId);
		req.setAttribute("leagueId", leagueId);
		
		resp.sendRedirect(cp+"/player/list.do?teamId="+teamId+"&leagueId="+leagueId);
	}
}

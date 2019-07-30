package com.team;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.player.PlayerDAO;
import com.player.PlayerDTO;

@WebServlet("/team/*")
public class TeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TeamDAO dao = new TeamDAO();
	private PlayerDAO pdao = new PlayerDAO();
	
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
		} else if (uri.indexOf("teamarticle.do") != -1) {
			article(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		}  else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 팀 리스트 
				
		List<TeamDTO> list = null;
		int leagueId=1;
		if(req.getParameter("leagueId")!=null) {
			leagueId=Integer.parseInt(req.getParameter("leagueId"));
		}
		list= dao.list(leagueId);

		req.setAttribute("list", list);
		req.setAttribute("leagueId", leagueId);
		
		forward(req, resp, "/WEB-INF/view/team/list.jsp");
	}
	
	private void createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int leagueId=Integer.parseInt(req.getParameter("leagueId"));
		req.setAttribute("leagueId", leagueId);
		forward(req, resp, "/WEB-INF/view/team/teamcreate.jsp");
		
	}
	
	private void createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cp =req.getContextPath();
		
		TeamDTO dto = new TeamDTO();
		TeamDAO dao = new TeamDAO();
		
		int leagueId=Integer.parseInt(req.getParameter("leagueId"));
		
		dto.setLeagueId(Integer.parseInt(req.getParameter("leagueId")));
		dto.setCoach(req.getParameter("coach"));
		dto.setTeamName(req.getParameter("teamName"));
		
		dao.insertteam(dto);
		
		resp.sendRedirect(cp+"/team/list.do?leagueId="+leagueId);

	}

	private void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 선수 리스트
		List<PlayerDTO> list = null;
		
		int teamId = Integer.parseInt(req.getParameter("teamId"));
		int leagueId =Integer.parseInt(req.getParameter("leagueId"));
		list = pdao.list(teamId,leagueId);
		
		req.setAttribute("list", list);
		req.setAttribute("teamId", teamId);
		req.setAttribute("leagueId", leagueId);

		forward(req, resp, "/WEB-INF/view/team/teamarticle.jsp");
				

	}

	private void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int leagueId =Integer.parseInt(req.getParameter("leagueId"));
		String[] check =req.getParameterValues("check");
		int nums[]=null;
		nums=new int[check.length];
		int teamId = nums[0];
	
		req.setAttribute("leagueId", leagueId);
		req.setAttribute("teamId", teamId);
		forward(req, resp, "/WEB-INF/view/team/teamupdate.jsp");
		
	}

	private void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cp =req.getContextPath();
		
		TeamDTO dto = new TeamDTO();
		TeamDAO dao = new TeamDAO();
		dto.setTeamId(Integer.parseInt(req.getParameter("teamId")));
		dto.setLeagueId(Integer.parseInt(req.getParameter("leagueId")));
		dto.setTeamName(req.getParameter("teamname"));
		dto.setCoach(req.getParameter("coach"));
		dto.setWin(Integer.parseInt(req.getParameter("win")));
		dto.setLose(Integer.parseInt(req.getParameter("lose")));
		dto.setDraw(Integer.parseInt(req.getParameter("draw")));
		dao.updateteam(dto);
		
	
		int leagueId =Integer.parseInt(req.getParameter("leagueId"));
		
		resp.sendRedirect(cp+"/team/list.do?leagueId="+leagueId);
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cp =req.getContextPath();
		TeamDAO dao= new TeamDAO();
		String[] check =req.getParameterValues("check");
		int nums[]=null;
		nums=new int[check.length];
		for (int i=0; i<check.length; i++)
			nums[i]=Integer.parseInt(check[i]);
		dao.deleteteam(nums);
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		resp.sendRedirect(cp+"/team/list.do?leagueId="+leagueId);
	}

}

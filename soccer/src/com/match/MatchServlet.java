package com.match;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.team.TeamDAO;
import com.team.TeamDTO;

@WebServlet("/match/*")
public class MatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MatchDAO mdao = new MatchDAO();
	TeamDAO tdao = new TeamDAO();
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
		} else if (uri.indexOf("article.do") != -1) {
			article(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			updateSubmit(req, resp);
		}  else if (uri.indexOf("delete.do") != -1) {
			delete(req, resp);
		}  else if (uri.indexOf("add.do") != -1) {
			adddetail(req, resp);
		}  else if (uri.indexOf("add_ok.do") != -1) {
			addsubmitdetail(req, resp);
		}
	}

	private void addsubmitdetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		String cp =req.getContextPath();
		int matchId =Integer.parseInt(req.getParameter("matchId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		int homescore = Integer.parseInt(req.getParameter("homegoal"));
		int awayscore = Integer.parseInt(req.getParameter("awaygoal"));
			
		mdao.insertdetail(matchId, homescore, awayscore);
		resp.sendRedirect(cp+"/match/list.do?leagueId="+leagueId+"&matchId="+matchId);
	}

	private void adddetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		
		
		int matchId =Integer.parseInt(req.getParameter("matchId"));
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		
		req.setAttribute("matchId", matchId);
		req.setAttribute("leagueId", leagueId);
		
		forward(req, resp, "/WEB-INF/view/match/addmatchdetail.jsp");
		
	}

	private void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		List<MatchDTO> matchlist = null;
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		matchlist=mdao.matchlist(leagueId);
		req.setAttribute("matchlist", matchlist);
		req.setAttribute("leagueId", leagueId);
		
		forward(req, resp, "/WEB-INF/view/match/matchlist.jsp");
		
	}

	private void createdForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		req.getParameter("leagueId");
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		List<TeamDTO> list = null;
		list = tdao.showteamlist(leagueId);
		req.setAttribute("leagueId", leagueId);
		req.setAttribute("list", list);
		forward(req,resp,"/WEB-INF/view/match/matchmake.jsp");
	}

	private void createdSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String cp =req.getContextPath();
		
		int leagueId = Integer.parseInt(req.getParameter("leagueId"));
		int homeId =Integer.parseInt(req.getParameter("homeId"));
		int awayId= Integer.parseInt(req.getParameter("awayId"));
		String matchdate=req.getParameter("matchdate");
		String stadium= req.getParameter("stadium");
		mdao.addmatch(homeId, awayId, matchdate, stadium,leagueId);
		resp.sendRedirect(cp+"/match/list.do?leagueId="+leagueId);
	}

	private void article(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int matchId=Integer.parseInt(req.getParameter("matchId"));
		int leagueId=Integer.parseInt(req.getParameter("leagueId"));
		List<MatchDTO> matcharticle = null;
		
		matcharticle=mdao.article(matchId,leagueId);
		req.setAttribute("matchId", matchId);
		req.setAttribute("leagueId", leagueId);
		req.setAttribute("list", matcharticle);
		forward(req,resp,"/WEB-INF/view/match/matcharticle.jsp");
	}

	private void updateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
	}

	private void updateSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
	}

	private void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		// TODO Auto-generated method stub
		
	}
}

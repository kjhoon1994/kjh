package com.record;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/record/*")
public class RecordServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private RecordDAO rdao = new RecordDAO();

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
			//createdForm(req, resp);
		} else if (uri.indexOf("created_ok.do") != -1) {
			//createdSubmit(req, resp);
		} else if (uri.indexOf("update.do") != -1) {
			//updateForm(req, resp);
		} else if (uri.indexOf("update_ok.do") != -1) {
			//updateSubmit(req, resp);
		} else if (uri.indexOf("delete.do") != -1) {
			//delete(req, resp);
		}
	}


	private void list(HttpServletRequest req, HttpServletResponse resp)  throws ServletException, IOException {
		int leagueId=Integer.parseInt(req.getParameter("leagueId"));
		String mode = req.getParameter("mode");
		List<RecordDTO> list = null;
		List<RecordDTO> plist = null;
		
		list = rdao.recordlist(leagueId);
		plist=rdao.playerrecordlist(leagueId,mode);
		
		
		req.setAttribute("leagueId", leagueId);
		req.setAttribute("plist", plist);
		req.setAttribute("list", list);
		forward(req, resp, "/WEB-INF/view/record/list.jsp");
		
	}
}
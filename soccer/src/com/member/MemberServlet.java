package com.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/member/*")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		
		if (uri.indexOf("member.do") != -1) {
			memberForm(req, resp);
		} else if (uri.indexOf("member_ok.do") != -1) {
			memberFormSubmit(req, resp);
		} else if (uri.indexOf("login.do") != -1) {
			loginForm(req, resp);
		} else if (uri.indexOf("login_ok.do")!=-1) {
			loginFormSubmit(req, resp);
		} else if (uri.indexOf("logout.do")!=-1) {
			logoutForm(req,resp);
		}
	}

	private void logoutForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		String cp=req.getContextPath();

		session.removeAttribute("member");
		
		session.invalidate();
		
		resp.sendRedirect(cp);	
	}

	private void memberForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("title", "회원가입 입니다.");
		forward(req, resp, "/WEB-INF/view/member/member.jsp");
	}

	private void memberFormSubmit(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	}

	private void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("title", "정확하게 입력해 주세요");
		forward(req, resp, "/WEB-INF/view/member/login.jsp");
	}

	private void loginFormSubmit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		String cp =req.getContextPath();
		
		String UserId=req.getParameter("UserId");
		String UserPwd =req.getParameter("UserPwd");
		
		MemberDTO dto = dao.checkMember(UserId);
		if(dto!=null) {
			if(UserPwd.equals(dto.getPwd())) {
				session.setMaxInactiveInterval(20*60);
				
				SessionInfo info = new SessionInfo();
				info.setUserId(dto.getUserId());
				info.setUserName(dto.getUserName());
				
				session.setAttribute("member", info);
				
				resp.sendRedirect(cp);
				return;
			}
		}
		String msg = "아이디와 비밀번호를 확인해 주세요";
		req.setAttribute("check", msg);
		
		forward(req, resp, "/WEB-INF/view/member/login.jsp");
		
	}
}

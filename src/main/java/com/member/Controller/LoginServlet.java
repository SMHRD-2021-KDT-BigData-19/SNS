package com.member.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.Model.MemberDAO;
import com.member.Model.MemberVO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		String url = "memberLogin.jsp";
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") != null) {// 이미 로그인 된 사용자이면
			url = "boardList.jsp"; // 메인 페이지로 이동한다.
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String url = "boardList.jsp";
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.login(id, pw);
		if (result == 1) {
			MemberVO vo = dao.getMember(id);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", vo); //로그인 유지
			request.setAttribute("message", "로그인에 성공했습니다.");
			url = "boardList.jsp";
		} else if (result == 0) {
			request.setAttribute("message", "비밀번호가 맞지 않습니다.");
		} else if (result == -1) {
			request.setAttribute("message", "존재하지 않는 회원입니다.");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		System.out.println("디스패치 성공");
		dispatcher.forward(request, response);
	}

}

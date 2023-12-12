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

@WebServlet("/join")
public class JoinServlet extends HttpServlet {

	public JoinServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("memberJoin.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPw(pw);
		vo.setEmail(email);
		MemberDAO dao = MemberDAO.getInstance();
		int result = dao.insertMember(vo); // 회원 데이터를 데이터베이스에 삽입
		HttpSession session = request.getSession();
		if (result == 1) {
			session.setAttribute("id", vo.getId()); // 회원 가입이 성공했을 경우 세션에 아이디를 저장하여 로그인 유지
			request.setAttribute("message", "회원 가입에 성공했습니다.");
		} else {
			request.setAttribute("message", "회원 가입에 실패했습니다.");
		}
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("memberLogin.jsp");
		dispatcher.forward(request, response);
	}

}

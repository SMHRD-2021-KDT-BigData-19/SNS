package com.member.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.Model.MemberDAO;
import com.member.Model.MemberVO;

@WebServlet("/memberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	public MemberUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDAO mDao = MemberDAO.getInstance();
		MemberVO mVo = mDao.getMember(id);
		request.setAttribute("mVo", mVo);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("memberUpdate.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 한글 깨짐을 방지
		// 폼에서 입력한 회원 정보 얻어오기
		
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String id = request.getParameter("id");
		System.out.println(id);
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		// 회원 정보를 저장할 객체 생성
		MemberVO mVo = new MemberVO();
		mVo.setName(name);
		mVo.setNick(nick);
		mVo.setId(id);
		mVo.setPw(pw);
		mVo.setEmail(email);
		mVo.setPhone(phone);
		MemberDAO mDao = MemberDAO.getInstance();
		mDao.updateMember(mVo);
		response.sendRedirect("login");
	}

}

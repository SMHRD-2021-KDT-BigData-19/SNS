package com.member.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.Model.MemberDAO;

@WebServlet("/idCheck")
public class IdCheckServlet extends HttpServlet {
	public IdCheckServlet() {
		super();
	
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.confirmID(id);
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("idcheck.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}

}

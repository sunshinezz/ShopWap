package com.notice.web;
import com.notice.dao.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowNoticeServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String id = request.getParameter("id");
		Notice notice = new Notice();
		NoticeDao dao = new NoticeDao();
		notice = dao.QueryById(id);
		request.setAttribute("notice", notice);
		request.getRequestDispatcher("../notice/notice.jsp").forward(request,
				response);
	}


}

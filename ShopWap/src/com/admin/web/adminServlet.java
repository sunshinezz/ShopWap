package com.admin.web;


import java.io.IOException;


import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.admin.dao.Admin;
import com.admin.dao.AdminDao;


public class adminServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html");
		this.doPost(request, response);
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String account=request.getParameter("loginaccount");
		String password = request.getParameter("nloginpwd");
		String action=request.getParameter("action");
		if(action.equals("login")){
			if (account.length() != 0 && password.length() != 0) {
			AdminDao aDao=new AdminDao();
			try {
				Admin ad=aDao.queryByAccount(account);
				if (ad.getPassword().equals(password))
					{
					account=URLEncoder.encode(account,"utf-8");
					Cookie accountCookie = new Cookie("admin",account);
					System.out.println(accountCookie.getValue());
					accountCookie.setPath("/");
					response.addCookie(accountCookie);
					// ��������ҳ�棬�����д���ʱ�������ֹ���������ҳ������
					response.sendRedirect("adminManage.do?action=welcome");
				} else {
					request.setAttribute("Error", "�û������������!");
					request.getRequestDispatcher(
							"../login/login3.jsp")
							.forward(request, response);
				}
			}  catch (Exception e) {
				request.setAttribute("Error", "�û������������!");
				request.getRequestDispatcher(
						"../login/login3.jsp")
						.forward(request, response);
				// TODO: handle exception
			}
		}
			else {
				request.setAttribute("Error", "�������û���������!");
				request.getRequestDispatcher(
						"../login/login3.jsp")
						.forward(request, response);
			}
		}
		else if(action.equals("logout"))
		{
			if(request.getCookies() != null){					// ���Cookie��Ϊ��
				for(Cookie cookie : request.getCookies()){		// ����Cookie
					if(cookie.getName().equals("admin"))
					{	// ���Cookie��Ϊaccount
								account = cookie.getValue();		// ����account����
								Cookie accountCookie = new Cookie("admin",account);
								accountCookie.setPath("/");
								accountCookie.setMaxAge(0);
								response.addCookie(accountCookie);
								response.sendRedirect("../login/login3.jsp");
					}
				}
			}
		          
		}
		out.flush();
		out.close();
	}
}

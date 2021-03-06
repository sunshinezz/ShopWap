package com.logistic.web;


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

import com.logistic.dao.Logistic;
import com.logistic.dao.LogisticDao;

public class logisticServlet extends HttpServlet {
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
			LogisticDao lDao=new LogisticDao();
			try {
				Logistic log=lDao.queryByAccount(account);
				if (log.getPassword().equals(password))
					{
					account=URLEncoder.encode(account,"utf-8");
					Cookie accountCookie = new Cookie("logistic",account);
					System.out.println(accountCookie.getValue());
					accountCookie.setPath("/");
					response.addCookie(accountCookie);
					// 重新请求本页面，参数中带有时间戳，禁止浏览器缓存页面内容
					response.sendRedirect("logManage.do?action=welcome");
				} else {
					request.setAttribute("Error", "用户名或密码错误!");
					request.getRequestDispatcher(
							"../login/login2.jsp")
							.forward(request, response);
				}
			}  catch (Exception e) {
				request.setAttribute("Error", "用户名或密码错误!");
				request.getRequestDispatcher(
						"../login/login2.jsp")
						.forward(request, response);
				// TODO: handle exception
			}
		}
			else {
				request.setAttribute("Error", "请输入用户名或密码!");
				request.getRequestDispatcher(
						"../login/login2.jsp")
						.forward(request, response);
			}
		}
		else if(action.equals("logout"))
		{
			if(request.getCookies() != null){					// 如果Cookie不为空
				for(Cookie cookie : request.getCookies()){		// 遍历Cookie
					if(cookie.getName().equals("logistic"))
					{	// 如果Cookie名为account
								account = cookie.getValue();		// 保存account内容
								Cookie accountCookie = new Cookie("logistic",account);
								accountCookie.setPath("/");
								accountCookie.setMaxAge(0);
								response.addCookie(accountCookie);
								response.sendRedirect("../login/login.jsp");
					}
				}
			}
		          
		}
		out.flush();
		out.close();
	}
}

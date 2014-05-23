package com.login.web;


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

import com.login.dao.User;
import com.login.dao.userDao;

public class loginServlet extends HttpServlet {
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
			userDao uDao=new userDao();
			try {
				User user=uDao.queryByAccount(account);
				if (user.getPassword().equals(password))
					{
					account=URLEncoder.encode(account,"utf-8");
					Cookie accountCookie = new Cookie("account",account);
					System.out.println(accountCookie.getValue());
					accountCookie.setPath("/");
					response.addCookie(accountCookie);
					// 重新请求本页面，参数中带有时间戳，禁止浏览器缓存页面内容
					response.sendRedirect("../index.do");
				} else {
					request.setAttribute("Error", "用户名或密码错误!");
					request.getRequestDispatcher(
							"/login/login.jsp")
							.forward(request, response);
				}
			}  catch (Exception e) {
				request.setAttribute("Error", "用户名或密码错误!");
				request.getRequestDispatcher(
						"/login/login.jsp")
						.forward(request, response);
				// TODO: handle exception
			}
		}
			else {
				request.setAttribute("Error", "请输入用户名或密码!");
				request.getRequestDispatcher(
						"/login/login.jsp")
						.forward(request, response);
			}
		}
		if(action.equals("logout"))
		{
			if(request.getCookies() != null){					// 如果Cookie不为空
				for(Cookie cookie : request.getCookies()){		// 遍历Cookie
					if(cookie.getName().equals("account"))
					{	// 如果Cookie名为account
								account = cookie.getValue();		// 保存account内容
								Cookie accountCookie = new Cookie("account",account);
								accountCookie.setPath("/");
								accountCookie.setMaxAge(0);
								response.addCookie(accountCookie);
								response.sendRedirect("login.jsp");
					}
				}
			}
		          
		}
		if(action.equals("register"))
		{
			User user=new User();
			String newaccount=request.getParameter("regName");
			String phone=request.getParameter("regPhone");
			String email=request.getParameter("regEmail");
			String passW=request.getParameter("pwd1");
			java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
			userDao userDao=new userDao();
			int id=userDao.getNewId();
			user.setId(id);
			user.setAccount(newaccount);
			user.setPassword(passW);
			user.setGerder(0);
			user.setName("unKnow");
			user.setPhone(phone);
			user.setEmail(email);
			user.setRegisterDate(currentDate);
			if(userDao.register(user))
			{
				request.getRequestDispatcher(
						"registerOk.jsp")
						.forward(request, response);
			}
			else {
				request.getRequestDispatcher(
						"register.jsp")
						.forward(request, response);
			}
		}
		if(action.equals("changePasswd")){
			String newPasswd = request.getParameter("newPasswd");
			String oldPasswd = request.getParameter("oldPasswd");
			for(Cookie cookie:request.getCookies()){
				if(cookie.getName().equals("account")){
					account = cookie.getValue();
				}
			}
			userDao usrDao = new userDao();
			User user=usrDao.queryByAccount(account);
			if(user.getPassword().equals(oldPasswd)){
				if(usrDao.changePasswd(account, newPasswd)){
					request.getRequestDispatcher("changePasswdOk.jsp").forward(request,response);
				} else{
					request.setAttribute("Error", "修改失败");
					request.getRequestDispatcher("changePasswd.jsp").forward(request, response);
				}
			} else{
				request.setAttribute("Error", "密码错误");
				request.getRequestDispatcher("changePasswd.jsp").forward(request, response);
			}
			
		}
		out.flush();
		out.close();
	}
}

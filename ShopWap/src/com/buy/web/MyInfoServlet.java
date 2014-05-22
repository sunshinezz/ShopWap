package com.buy.web;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.login.dao.User;
import com.login.dao.userDao;
import com.shopcar.dao.ShopCarDao;

public class MyInfoServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String account = null;
		if(request.getCookies() != null){					// ���Cookie��Ϊ��
			for(Cookie cookie : request.getCookies()){		// ����Cookie
				if(cookie.getName().equals("account"))	// ���Cookie��Ϊname
					account = cookie.getValue();		// ����account����
				//System.out.println("coming:"+account);
			}
		}
		String action=request.getParameter("action");
		
		if(account!=null)
		{
			userDao uDao=new userDao();
			ShopCarDao shopdao=new ShopCarDao();
			com.login.dao.User user=new com.login.dao.User();
			user=uDao.queryByAccount(account);
			int userId;
			int size=0;
			userId=uDao.queryByAccount(account).getId();
			size=shopdao.getSize(userId);
			request.setAttribute("size", size);
			
			if(action.equals("showInfo"));
			{
				
				request.setAttribute("user", user);
				request.getRequestDispatcher("myinfo.jsp").forward(request,
						response);
			}
		}
		else {
			request.setAttribute("loginFirst", "���ȵ�¼");
			request.getRequestDispatcher("/login/login.jsp").forward(request,
					response);
			//response.sendRedirect("/shop/login/login.jsp");
		}
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		this.doGet(request, response);
	}

}
